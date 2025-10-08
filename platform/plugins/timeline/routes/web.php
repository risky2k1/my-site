<?php

use Botble\Base\Facades\AdminHelper;
use Botble\Timeline\Http\Controllers\TimelineCategoryController;
use Botble\Timeline\Http\Controllers\TimelineController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'timelines', 'as' => 'timeline.'], function () {
        Route::resource('', TimelineController::class)->parameters(['' => 'timeline']);
    });

    Route::group(['prefix' => 'timeline-categories', 'as' => 'timeline-category.'], function () {
        Route::resource('', TimelineCategoryController::class)->parameters(['' => 'timeline-category']);
    });
});
