<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    use HasFactory;

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'name',
        'capacity',
        'harvest_year',
        'brand',
        'sub_brand',
        'img',
    ];

    public function product_entries(): HasMany
    {
        return $this->hasMany(ProductEntry::class);
    }
}