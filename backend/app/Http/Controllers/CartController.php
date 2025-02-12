<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddToCartRequest;
use App\Http\Requests\UpdateCartQuantityRequest;
use App\Http\Requests\RemoveFromCartRequest;
use App\Http\Requests\BuyCartRequest;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Purchase;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class CartController extends Controller
{
    use AuthorizesRequests;

    public function index(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Not authenticated'], 401);
        }
        $cartItems = $user->products()->withPivot('quantity')->get();
        return response()->json($cartItems, 200);
    }

    public function add(AddToCartRequest $request)
    {
        $user = $request->user();
        $data = $request->validated();

        $productId = $data['product_id'];
        $product = Product::find($productId);

        if ($product->stock == 0) {
            return response()->json(['message' => 'Product out of stock'], 400);
        }

        $existing = $user->products()->where('product_id', $productId)->first();
        if ($existing) {
            if ($existing->pivot->quantity < $product->stock) {
                $quantity = $existing->pivot->quantity + 1;
                $user->products()->updateExistingPivot($productId, ['quantity' => $quantity]);
            } else {
                return response()->json(['message' => 'Cannot add more, stock limit reached'], 400);
            }
        } else {
            $user->products()->attach($productId, ['quantity' => 1]);
        }
        return response()->json(['message' => 'Added successfully'], 200);
    }

    public function updateQuantity(UpdateCartQuantityRequest $request)
    {
        $user = $request->user();
        $data = $request->validated();

        $productId = $data['product_id'];
        $quantity  = $data['quantity'];
        $product   = Product::find($productId);

        if ($product->stock == 0) {
            return response()->json(['message' => 'Product out of stock'], 400);
        }

        if ($quantity > $product->stock) {
            return response()->json(['message' => 'Cannot exceed available stock'], 400);
        }

        $existing = $user->products()->where('product_id', $productId)->first();
        if (!$existing) {
            return response()->json(['message' => 'Product not in cart'], 404);
        }

        $user->products()->updateExistingPivot($productId, ['quantity' => $quantity]);
        return response()->json(['message' => 'Quantity updated'], 200);
    }

    public function remove(RemoveFromCartRequest $request)
    {
        $user = $request->user();
        $data = $request->validated();
    
        $id = $data['product_id'];
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }
    
        $user->products()->detach($id);
    
        return response()->json(['message' => 'Item removed successfully'], 200);
    }      

    public function buy(BuyCartRequest $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Not authenticated'], 401);
        }
        $cartItems = $user->products()->withPivot('quantity')->get();

        if ($cartItems->isEmpty()) {
            return response()->json(['message' => 'Cart is empty'], 400);
        }

        foreach ($cartItems as $item) {
            if ($item->stock < $item->pivot->quantity) {
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

        $user->products()->detach();

        return response()->json(['message' => 'Purchase successful'], 200);
    }
}
