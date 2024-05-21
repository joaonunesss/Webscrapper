<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use Inertia\Response;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->user()->hasRole('admin')) {
            return Inertia::render('Admin/Products/Index', [
                'products' => Product::all(),
                'admin' => true,
            ]);
        }
        return redirect()->back();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->user()->hasRole('admin')) {
            return Inertia::render('Admin/Products/Create');
        }
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): RedirectResponse
    {

        if ($request->user()->hasRole('admin')) {

            $validated = $request->validate([
                'id' => 'string|max:255',
                'img' => 'string',
                'name' => 'required|string|max:255',
                'capacity' => 'integer|min:0',
                'harvest_year' => 'integer|nullable',
                'brand' => 'string|max:255',
                'sub_brand' => 'string|max:255|nullable'
            ]);

            Product::create($validated);
    
            return redirect('/admin/products');
        }
        
        return redirect()->back();
    }


    /**
     * Display the specified resource.
     */
    public function show(Request $request, Product $product)
    {
        // if ($request->user()->hasRole('admin')) {
        //     return Inertia::render('Admin/Products/Show', [
        //         'product' => $product->load('product_entries'),
        //     ]);
        //  }

        //  return redirect()->back();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Product $product)
    {
        if ($request->user()->hasRole('admin')) {
            return Inertia::render('Admin/Products/Edit', [
                'product' => $product,
            ]);
        }

        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {

        if ($request->user()->hasRole('admin')) {
            $validated = $request->validate([
                'id' => 'string|max:255',
                'img' => 'string',
                'name' => 'required|string|max:255',
                'region' => 'string|max:255',
                'capacity' => 'integer|min:0',
                'harvest_year' => 'integer|min:0|nullable',
                'brand' => 'string|max:255',
                'sub_brand' => 'string|max:255|nullable',
            ]);
    
            $product->update($validated);
    
            return redirect("/admin/products");
        }

        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, Product $product)
    {
        if ($request->user()->hasRole('admin')) {
            $product->delete();

            return redirect(route('admin.products.index'));
        }

        return redirect()->back();
    }
}