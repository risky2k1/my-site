<?php

use Botble\Base\Facades\AdminHelper;
use Botble\Timeline\Http\Controllers\TimelineCategoryController;
use Botble\Timeline\Http\Controllers\TimelineController;
use Botble\Timeline\Http\Controllers\TimelineItemController;
use Botble\Theme\Facades\Theme;
use Botble\Timeline\Http\Controllers\Ajax\PublicController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'timelines', 'as' => 'timeline.'], function () {
        Route::resource('', TimelineController::class)->parameters(['' => 'timeline']);
    });

    Route::group(['prefix' => 'timeline-categories', 'as' => 'timeline-category.'], function () {
        Route::resource('', TimelineCategoryController::class)->parameters(['' => 'timeline-category']);
    });

    Route::group(['prefix' => 'timeline-items', 'as' => 'timeline-item.'], function () {
        Route::resource('', TimelineItemController::class)->parameters(['' => 'timeline-item']);
    });
});
if (defined('THEME_MODULE_SCREEN_NAME')) {
    Theme::registerRoutes(function (): void {
        Route::group([
            'prefix' => 'ajax', 
            'as' => 'ajax.'
        ], function () {
            Route::get('timeline-items', [PublicController::class, 'getTimelines'])->name('timeline-items');
        });
    });
}