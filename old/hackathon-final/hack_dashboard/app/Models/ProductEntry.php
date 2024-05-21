<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProductEntry extends Model
{
    use HasFactory;

    protected $fillable = [
        'price',
        'url',
        'discount',
        'product_id',
        'store_name',
        'product_name',
        'currency',
        'location',
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
}