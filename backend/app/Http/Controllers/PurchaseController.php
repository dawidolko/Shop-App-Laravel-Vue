<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Purchase;

class PurchaseController extends Controller
{
    public function userPurchases(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Not authenticated'], 401);
        }
        $purchases = Purchase::where('user_id', $user->id)
                    ->with(['product', 'shipping'])
                    ->orderBy('created_at', 'desc')
                    ->get();
        return response()->json($purchases, 200);
    }
}
