<?php

use Botble\AdministrativeUnit\Http\Controllers\DistrictController;
use Botble\AdministrativeUnit\Http\Controllers\ProvinceController;
use Botble\AdministrativeUnit\Http\Controllers\WardController;
use Botble\Base\Facades\AdminHelper;
use Botble\AdministrativeUnit\Http\Controllers\AdministrativeUnitController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'administrative-units', 'as' => 'administrative-unit.'], function () {
        Route::group(['prefix' => 'provinces', 'as' => 'province.'], function () {
            Route::resource('', ProvinceController::class)->parameters(['' => 'province']);
        });

        Route::group(['prefix' => 'districts', 'as' => 'district.'], function () {
            Route::resource('', DistrictController::class)->parameters(['' => 'district']);
        });

        Route::group(['prefix' => 'wards', 'as' => 'ward.'], function () {
            Route::resource('', WardController::class)->parameters(['' => 'ward']);
        });
    });
});
