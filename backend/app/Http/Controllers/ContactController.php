<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreContactRequest;
use Illuminate\Http\Request;
use App\Models\Contact;

class ContactController extends Controller
{
    public function store(StoreContactRequest $request)
    {
        $user = $request->user();
        $data = $request->validated();

        Contact::create([
            'user_id' => $user->id,
            'name'    => $data['name'],
            'email'   => $data['email'],
            'subject' => $data['subject'],
            'message' => $data['message'],
        ]);

        return response()->json(['message' => 'Message sent successfully'], 200);
    }
}
