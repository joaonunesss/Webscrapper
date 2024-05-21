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
            $table->string('id')->primary();
            $table->timestamps();

            $table->string('name');
            $table->string('img');
            $table->string('brand');
            $table->string('sub_brand')->nullable();
            $table->integer('capacity');
            $table->integer('harvest_year')->nullable();

            // TODO Brand relation
            // TODO Sub brand relation
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