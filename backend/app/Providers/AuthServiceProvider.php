<?php

namespace App\Providers;

use App\Models\Product;
use App\Policies\CartPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    // protected $policies = [
    //     Product::class => CartPolicy::class,
    // ];

    public function boot()
    {
        $this->registerPolicies();
    }
}
