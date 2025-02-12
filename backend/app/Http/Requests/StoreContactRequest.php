<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreContactRequest extends FormRequest
{
    public function authorize()
    {
        return $this->user() !== null;
    }

    public function rules()
    {
        return [
            'name'    => 'required|max:255',
            'email'   => 'required|email',
            'subject' => 'required',
            'message' => 'required',
        ];
    }
}
