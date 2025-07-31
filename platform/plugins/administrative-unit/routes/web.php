<?php

use Botble\AdministrativeUnit\Http\Controllers\DistrictController;
use Botble\AdministrativeUnit\Http\Controllers\ProvinceController;
use Botble\AdministrativeUnit\Http\Controllers\WardController;
use Botble\AdministrativeUnit\Models\District;
use Botble\AdministrativeUnit\Models\Province;
use Botble\AdministrativeUnit\Models\Ward;
use Botble\Base\Facades\AdminHelper;
use Botble\AdministrativeUnit\Http\Controllers\AdministrativeUnitController;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

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

if (defined('THEME_MODULE_SCREEN_NAME')) {
    Theme::registerRoutes(function (): void {
        Route::group([
            'prefix' => 'administrative-unit',
            'as' => 'administrative-unit.'
        ], function () {
            Route::get('/ajax/provinces', function () {
                return Province::pluck('name','id')->toArray();
            })->name('ajax.provinces');

            Route::get('/ajax/districts', function (Request $request) {
                return District::where('province_id', $request->get('province_id'))
                    ->select('id as id', 'name as text')->get();
            })->name('ajax.districts');

            Route::get('/ajax/wards', function (Request $request) {
                return Ward::where('district_id', $request->get('district_id'))
                    ->select('id as id', 'name as text')->get();
            })->name('ajax.wards');
        });
    });
}
