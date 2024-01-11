<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use Laravel\Fortify\Http\Controllers\AuthenticatedSessionController;
use App\Http\Controllers\DocumentController;
use App\Http\Controllers\ReportController;
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

// ###############################################################################################

Route::get('/run-command/{name_of_command}', \App\Http\Controllers\ExecuteArtisanCommandController::class);

Route::get('/', function () {
    return view('welcome');
});

Route::get('/pages', function () {
    return view('test.pages');
});

// Blog
Route::get('/blog', [BlogController::class, 'index']);
Route::get('/blog/{slug}', [BlogController::class, 'post']);

// Document

Route::controller(DocumentController::class)->group(function () {
    // Convert Word to PDF (Dynamic)
    Route::get('/document/convert-word-to-pdf', 'convertWordToPDF')->name('document.wordtopdf');

    // Generate Word file using PHPWord with Template
    Route::get('/document', DocumentController::class)->name('document'); // Working. Preferred

    // Convert Word to PDF (Convert Only)
    Route::get('/document/convert-doc-to-pdf', 'convertDocToPDF');
});

// Reports
Route::prefix('reports')->group(function () {
    Route::get('/', function () {
        return view('report.report');
    });
    Route::get('/action-plans', [ReportController::class, 'generate'])->name('reports.print-monitoring');
});
