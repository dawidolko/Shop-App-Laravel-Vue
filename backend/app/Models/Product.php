<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\User;

class Product extends Model
{
    use HasFactory;

    /**
     * Mass assignment – pola, które mogą być wypełniane masowo.
     */
    protected $fillable = [
        'title',
        'description',
        'price',
        'discount_percentage',
        'rating',
        'stock',
        'brand',
        'category',
        'thumbnail',
        'images',
    ];

    /**
     * Rzutowanie kolumn do typów – 'images' jest JSON-em w bazie.
     */
    protected $casts = [
        'images' => 'array',
    ];

    /**
     * Relacja wiele-do-wielu z modelem User (tabela pivot 'user_product').
     */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_product')
                    ->withPivot('quantity')
                    ->withTimestamps();
    }
    
    public function purchases()
    {
        return $this->hasMany(Purchase::class);
    }
    

}
