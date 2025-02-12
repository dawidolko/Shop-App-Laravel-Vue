<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UserProduct extends Pivot
{
    use HasFactory;

    protected $table = 'user_product';

    protected $fillable = [
        'user_id',
        'product_id',
        'quantity',
    ];
}
