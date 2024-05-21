<?php

namespace App\Http\Controllers;

use App\Models\Store;
use Inertia\Inertia;
use Inertia\Response;
use Illuminate\Http\Request;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        if ($request->user()->hasRole('root')) {
            return Inertia::render('Admin/Stores/Index', [
                'stores' => Store::all(),
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
        if ($request->user()->hasRole('root')) {
            return Inertia::render('Admin/Stores/Create');
        }
        return redirect()->back();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if ($request->user()->hasRole('root')) {

            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'search_url' => 'required|string',
                'logo_url' => 'string|nullable',
            ]);

            Store::create($validated);
    
            return redirect('/admin/stores');
        }
        
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     */
    public function show(Store $store)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Store $store)
    {
        if ($request->user()->hasRole('root')) {
            return Inertia::render('Admin/Stores/Edit', [
                'store' => $store,
            ]);
        }

        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Store $store)
    {
        if ($request->user()->hasRole('root')) {

            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'search_url' => 'required|string',
                'logo_url' => 'string|nullable',
            ]);

            $store->update($validated);
    
            return redirect('/admin/stores');
        }
        
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, Store $store)
    {
        if ($request->user()->hasRole('root')) {
            $store->delete();

            return redirect(route('admin.stores.index'));
        }

        return redirect()->back();
    }
}