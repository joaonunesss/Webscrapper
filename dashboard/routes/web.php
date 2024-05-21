<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProductPublic;
use App\Http\Controllers\StoreController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return to_route('products.index');
    /* return Inertia::render('Products/Index', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]); */
});

Route::prefix('admin')->group(function() {
    Route::resource('/products', ProductController::class)
            ->only(['index', 'create', 'show', 'edit', 'update', 'store', 'destroy'])
            ->middleware(['auth', 'verified'])->names([
                'index' => 'admin.products.index',
                'create' => 'admin.products.create',
                // 'show' => 'admin.products.show',
                'edit' => 'admin.products.edit',
                'update' => 'admin.products.update',
                'store' => 'admin.products.store',
                'destroy' => 'admin.products.destroy',
            ]);
    Route::resource('/stores', StoreController::class)
            ->only(['index', 'create', 'show', 'edit', 'update', 'store', 'destroy'])
            ->middleware(['auth', 'verified'])->names([
                'index' => 'admin.stores.index',
                'create' => 'admin.stores.create',
                // 'show' => 'admin.stores.show',
                'edit' => 'admin.stores.edit',
                'update' => 'admin.stores.update',
                'store' => 'admin.stores.store',
                'destroy' => 'admin.stores.destroy',
            ]);
    });

Route::resource('products', ProductPublic::class)
    ->only(['index', 'show'])
    ->middleware(['auth', 'verified']);

Route::get('/dashboard', function () {
    return to_route('products.index');
    // return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';