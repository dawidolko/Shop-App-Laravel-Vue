<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'company_name',
        'tax_id',
        'address',
        'city',
        'state',
        'postal_code',
        'country'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
