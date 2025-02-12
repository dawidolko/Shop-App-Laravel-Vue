<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index() {
        return Product::all();
    }

    public function show($id) {
        $product = Product::find($id);
        if (!$product) {
            return response()->json(['message' => 'Product not found'], 404);
        }
        return response()->json($product, 200);
    }

    public function categories() {
        $categories = Product::distinct()->pluck('category');
        return response()->json($categories);
    }

    public function brands($category) {
        $brands = Product::where('category', $category)
                         ->distinct()
                         ->pluck('brand');
        return response()->json($brands);
    }

    public function productsByCategory($category) {
        $products = Product::where('category', $category)->get();
        return response()->json($products, 200);
    }

    public function productsByBrand($brand) {
        $products = Product::where('brand', $brand)->get();
        return response()->json($products, 200);
    }

    public function search(Request $request) {
        $query = $request->input('query', '');
        if (empty($query)) {
            return response()->json(Product::all(), 200);
        }
        $products = Product::where('title', 'like', "%{$query}%")
                           ->orWhere('description', 'like', "%{$query}%")
                           ->orWhere('category', 'like', "%{$query}%")
                           ->orWhere('brand', 'like', "%{$query}%")
                           ->get();
        return response()->json($products, 200);
    }
}
