<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\User;

class Product extends Model
{
    use HasFactory;

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
     * Column casts - 'images' is stored as JSON in the database.
     */
    protected $casts = [
        'images' => 'array',
    ];

    /**
     * Many-to-many relation with the User model (pivot table 'user_product').
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
