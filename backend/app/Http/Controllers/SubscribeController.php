<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreSubscribeRequest;
use Illuminate\Http\Request;
use App\Models\Subscribe;

class SubscribeController extends Controller
{
    public function store(StoreSubscribeRequest $request)
    {
        $user = $request->user();
        $data = $request->validated();

        Subscribe::create([
            'user_id' => $user->id,
            'email'   => $data['email'],
        ]);

        return response()->json(['message' => 'Subscribed successfully'], 200);
    }
}
