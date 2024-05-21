<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Store extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'search_url',
        'logo_url',
    ];

    public function product_entries(): HasMany
    {
        return $this->hasMany(ProductEntry::class);
    }
}