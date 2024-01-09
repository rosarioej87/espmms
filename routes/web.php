<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use App\Http\Controllers\DocumentController;

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
    return view('welcome');
});

Route::get('/pages', function () {
    return view('pages');
});

Route::get('/dump', function () {
    Spatie\DbDumper\Databases\MySql::create()
        ->setDbName('laravel')
        ->setUserName('root')
        ->setPassword('')
        ->dumpToFile('dump.sql');
});

Route::get('/blog', [BlogController::class, 'index']);
Route::get('/blog/{slug}', [BlogController::class, 'post']);

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->name('logout');
});


Route::controller(DocumentController::class)->group(function () {
    // Convert Word to PDF (Dynamic)
    Route::get('/document/convert-word-to-pdf', 'convertWordToPDF')->name('document.wordtopdf');

    // Generate Word file using PHPWord with Template
    Route::get('/document', DocumentController::class)->name('document'); // Working. Preferred

    // Convert Word to PDF (Convert Only)
    Route::get('/document/convert-doc-to-pdf', 'convertDocToPDF');
});




