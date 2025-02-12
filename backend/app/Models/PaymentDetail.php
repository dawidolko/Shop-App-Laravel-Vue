<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'card_number',
        'card_holder',
        'expiration_date',
        'ccv'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
