<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id(); // Możesz użyć $table->bigInteger('id')->unsigned()->primary(); jeśli chcesz wstawiać własne ID
            $table->string('title', 255);
            $table->text('description');
            $table->decimal('price', 10, 2);
            $table->decimal('discount_percentage', 5, 2); 
            $table->decimal('rating', 3, 2);
            $table->integer('stock');
            $table->string('brand', 255);
            $table->string('category', 255);
            $table->string('thumbnail', 255);
            // Pole na wiele obrazków: zapisane jako JSON
            $table->json('images')->nullable();
            
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
