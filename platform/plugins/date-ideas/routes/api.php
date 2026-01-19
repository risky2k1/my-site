<?php

use Botble\DateIdeas\Http\Controllers\DateIdeaPublicController;
use Illuminate\Support\Facades\Route;
use Botble\Theme\Facades\Theme;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api/v1/date-ideas',
], function (): void {
    Route::get('/', [DateIdeaPublicController::class, 'index'])->name('index');
    Route::get('{slug}', [DateIdeaPublicController::class, 'show'])->name('show');
});
