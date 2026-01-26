<?php

use Botble\Base\Facades\AdminHelper;
use Botble\DateIdeas\Http\Controllers\DateIdeasController;
use Botble\DateIdeas\Http\Controllers\PlaceCategoryController;
use Botble\DateIdeas\Http\Controllers\PlaceController;
use Botble\DateIdeas\Http\Controllers\PlaceMoodController;
use Botble\DateIdeas\Http\Controllers\PlaceReviewController;
use Botble\DateIdeas\Models\PlaceReview;
use Illuminate\Support\Facades\Route;
use Botble\Theme\Facades\Theme;
use Botble\DateIdeas\Http\Controllers\Ajax\PublicController;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'date-ideas', 'as' => 'date-ideas.'], function () {
        Route::group(['prefix' => 'place', 'as' => 'place.'], function () {
            Route::resource('', PlaceController::class)->parameters(['' => 'place']);
        });
        Route::group(['prefix' => 'place-category', 'as' => 'place-category.'], function () {
            Route::resource('', PlaceCategoryController::class)->parameters(['' => 'place-category']);
        });
        Route::group(['prefix' => 'place-mood', 'as' => 'place-mood.'], function () {
            Route::resource('', PlaceMoodController::class)->parameters(['' => 'place-mood']);
        });
        Route::group(['prefix' => 'place-review', 'as' => 'place-review.'], function () {
            Route::resource('', PlaceReviewController::class)->parameters(['' => 'place-review']);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Theme::registerRoutes(function (): void {
            Route::group([
                'prefix' => 'ajax', 
                'as' => 'ajax.'
            ], function () {
                Route::get('filter-places', [PublicController::class, 'filterPlaces'])->name('filter-places');
                Route::get('place-detail', [PublicController::class, 'placeDetail'])->name('place-detail');
            });
        });
    }
});


