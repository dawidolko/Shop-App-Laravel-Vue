<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\ShippingDetail;
use App\Models\InvoiceDetail;
use App\Models\PaymentDetail;

class CheckoutController extends Controller
{
    public function processCheckout(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Not authenticated'], 401);
        }

        $data = $request->validate([
            // Dane wysyłki
            'shipping.first_name'    => 'required|string|max:255',
            'shipping.last_name'     => 'required|string|max:255',
            'shipping.address'       => 'required|string|max:500',
            'shipping.city'          => 'required|string|max:255',
            'shipping.state'         => 'required|string|max:255',
            'shipping.postal_code'   => ['required', 'regex:/^\d{2}-\d{3}$/'],
            'shipping.country'       => 'required|string|max:255',
            'shipping.phone'         => 'required|digits:9',
            'invoice.company_name'   => 'required|string|max:255',
            'invoice.tax_id'         => 'required|string|max:100',
            'invoice.address'        => 'required|string|max:500',
            'invoice.city'           => 'required|string|max:255',
            'invoice.state'          => 'required|string|max:255',
            'invoice.postal_code'    => ['required', 'regex:/^\d{2}-\d{3}$/'],
            'invoice.country'        => 'required|string|max:255',
            'payment.card_number'    => ['required', 'regex:/^\d{16}$/'],
            'payment.card_holder'    => 'required|string|max:255',
            'payment.expiration_date'=> [
                'required',
                'date_format:m/y',
                function ($attribute, $value, $fail) {
                    $parts = explode('/', $value);
                    if (count($parts) !== 2) {
                        return $fail('The expiration date format is invalid. Use MM/YY.');
                    }
                    [$month, $year] = $parts;
                    $month = (int)$month;
                    $year = (int)$year;
                    $currentYear = (int)date('y');
                    $currentMonth = (int)date('n');
                    if ($year < $currentYear || ($year === $currentYear && $month < $currentMonth)) {
                        return $fail('The expiration date cannot be in the past.');
                    }
                }
            ],
            'payment.ccv'            => 'required|digits:3',
        ]);

        DB::beginTransaction();
        try {
            $cartItems = $user->products()->withPivot('quantity')->get();
            if ($cartItems->isEmpty()) {
                return response()->json(['message' => 'Cart is empty'], 400);
            }

            foreach ($cartItems as $item) {
                if ($item->stock < $item->pivot->quantity) {
                    DB::rollBack();
                    return response()->json([
                        'message' => "Not enough stock for product {$item->title}"
                    ], 400);
                }
            }

            foreach ($cartItems as $item) {
                Purchase::create([
                    'user_id'    => $user->id,
                    'product_id' => $item->id,
                    'quantity'   => $item->pivot->quantity,
                    'price'      => $item->price,
                ]);
                $item->stock -= $item->pivot->quantity;
                $item->save();
            }

            ShippingDetail::create([
                'user_id'    => $user->id,
                'first_name' => $data['shipping']['first_name'],
                'last_name'  => $data['shipping']['last_name'],
                'address'    => $data['shipping']['address'],
                'city'       => $data['shipping']['city'],
                'state'      => $data['shipping']['state'],
                'postal_code'=> $data['shipping']['postal_code'],
                'country'    => $data['shipping']['country'],
                'phone'      => $data['shipping']['phone'],
            ]);

            InvoiceDetail::create([
                'user_id'      => $user->id,
                'company_name' => $data['invoice']['company_name'],
                'tax_id'       => $data['invoice']['tax_id'],
                'address'      => $data['invoice']['address'],
                'city'         => $data['invoice']['city'],
                'state'        => $data['invoice']['state'],
                'postal_code'  => $data['invoice']['postal_code'],
                'country'      => $data['invoice']['country'],
            ]);

            PaymentDetail::create([
                'user_id'         => $user->id,
                'card_number'     => $data['payment']['card_number'],
                'card_holder'     => $data['payment']['card_holder'],
                'expiration_date' => $data['payment']['expiration_date'],
                'ccv'             => $data['payment']['ccv'],
            ]);

            $user->products()->detach();

            DB::commit();
            return response()->json(['message' => 'Purchase successful'], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Error processing checkout'], 500);
        }
    }
}
