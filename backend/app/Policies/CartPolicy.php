<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Product;

class CartPolicy
{

    public function before(User $user, $ability)
    {
        if ($ability === 'remove') {
            return true;
        }
    }

    public function remove(User $user, Product $product): bool
    {
        return true;
    }
}
