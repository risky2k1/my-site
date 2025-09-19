<?php

use Botble\Base\Facades\AdminHelper;
use Botble\DateIdeas\Http\Controllers\DateIdeasController;
use Botble\DateIdeas\Http\Controllers\PlaceCategoryController;
use Botble\DateIdeas\Http\Controllers\PlaceController;
use Botble\DateIdeas\Http\Controllers\PlaceMoodController;
use Botble\DateIdeas\Http\Controllers\PlaceReviewController;
use Botble\DateIdeas\Models\PlaceReview;
use Illuminate\Support\Facades\Route;

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
});
