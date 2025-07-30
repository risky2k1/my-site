<?php

use Botble\Base\Facades\AdminHelper;
use Botble\DateIdeas\Http\Controllers\DateIdeasController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'date-ideas', 'as' => 'date-ideas.'], function () {
        Route::resource('', DateIdeasController::class)->parameters(['' => 'date-ideas']);
    });
});
