<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\SubscribeController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\CheckoutController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Rejestracja, logowanie, wylogowanie
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/user/update', [AuthController::class, 'updateUser'])->middleware('auth:sanctum');

// Produkty
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/categories', [ProductController::class, 'categories']);
Route::get('/products/brands/{category}', [ProductController::class, 'brands']);
Route::get('/products/category/{category}', [ProductController::class, 'productsByCategory']);
Route::get('/products/brand/{brand}', [ProductController::class, 'productsByBrand']);
Route::get('/products/{id}', [ProductController::class, 'show']);
Route::get('/products/search', [ProductController::class, 'search']);

// Koszyk (wymaga auth)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/cart', [CartController::class, 'index']);
    Route::post('/cart/add', [CartController::class, 'add']);
    Route::post('/cart/update-quantity', [CartController::class, 'updateQuantity']);
    Route::delete('/cart/{id}', [CartController::class, 'remove']);
    Route::post('/cart/buy', [CartController::class, 'buy']);
    Route::get('/purchases', [PurchaseController::class, 'userPurchases']);

    Route::post('/checkout', [CheckoutController::class, 'processCheckout']);
    
    Route::post('/subscribe', [SubscribeController::class, 'store']);
    Route::post('/contact', [ContactController::class, 'store']);
});
