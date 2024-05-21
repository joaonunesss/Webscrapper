<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;

class ProductPublic extends Controller
{
    public function index(Request $request)
    {
        $query = "";
        $capacity = [];
        if ($request->has('query')) $query = $request['query'];

      
         $products = Product::where('name', 'like', '%'.$query.'%')->orWhere('id', $query)->get();

        
        return Inertia::render('Products/Index', [
            'products' => $products,
            'admin' => false,
            'query' => $query,
            'capacity' => $capacity,
        ]);
    }

    public function show(Product $product)
    {
        return Inertia::render('Products/Show', [
            //'product' => $product->load('product_entries'),

            'product' => $product->load(['product_entries' => function ($query) {
                $query->whereDate('created_at', today(Auth::user()->timezone))->orderBy('created_at', 'DESC');
            } ]),

            'history' => $product->load('product_entries'),

        ]);
    }
}