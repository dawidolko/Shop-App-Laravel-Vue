<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShippingDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'first_name',
        'last_name',
        'address',
        'city',
        'state',
        'postal_code',
        'country',
        'phone'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
