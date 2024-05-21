<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Product;
use App\Models\ProductEntry;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class ProductPublic extends Controller
{
    public function index(Request $request)
    {
        $query = "";
        $capacity = [];
        if ($request->has('query'))
            $query = $request['query'];

        $products = Product::where('name', 'like', '%'.$query.'%')->orWhere('id', 'like', $query.'%')->get();
        
        return Inertia::render('Products/Index', [
            'products' => $products,
            'admin' => false,
            'query' => $query,
            'capacity' => $capacity,
        ]);
    }

    public function show(Request $request, Product $product)
    {
        $entries = ProductEntry::where('product_id', $product->id)->get();

        $available_years = array();
        foreach($entries as $entry)
        {
            if(!in_array($entry['year'], $available_years) && $entry['year'] != NULL)
                $available_years[] = $entry['year'];
        }
        // dd($available_years);
        
        if ($request->has('year')) {
            $year = $request['year'];
            if ($year) {
                return Inertia::render('Products/Show', [
                    'product' => $product,
                    'today' => ProductEntry::with('store')->where('year', $year)->where('product_id', $product->id)->whereDate('updated_at', Carbon::today())->orderBy('price', 'ASC')->get(),
                    'yesterday' => ProductEntry::with('store')->where('year', $year)->where('product_id', $product->id)->whereDate('updated_at', Carbon::yesterday())->orderBy('price', 'ASC')->get(),
                    'history' => ProductEntry::with('store')->where('year', $year)->where('product_id', $product->id)->get(),
                    'years' => $available_years
                ]);
            }
        }

        return Inertia::render('Products/Show', [
            'product' => $product,
            'today' => ProductEntry::with('store')->where('product_id', $product->id)->whereDate('updated_at', Carbon::today())->orderBy('price', 'ASC')->get(),
            'yesterday' => ProductEntry::with('store')->where('product_id', $product->id)->whereDate('updated_at', Carbon::yesterday())->orderBy('price', 'ASC')->get(),
            'history' => ProductEntry::with('store')->where('product_id', $product->id)->get(),
            'years' => $available_years
        ]);
    }
}