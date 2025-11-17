<?php

use Botble\Base\Facades\AdminHelper;
use Botble\FavoriteItems\Http\Controllers\FavoriteItemsController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'favorite-items', 'as' => 'favorite-items.'], function () {
        Route::resource('', FavoriteItemsController::class)->parameters(['' => 'favorite-items']);
    });
});
