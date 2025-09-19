<?php

use Botble\AdministrativeUnit\Http\Controllers\DistrictController;
use Botble\AdministrativeUnit\Http\Controllers\CityController;
use Botble\AdministrativeUnit\Http\Controllers\CommuneController;
use Botble\AdministrativeUnit\Models\District;
use Botble\AdministrativeUnit\Models\City;
use Botble\AdministrativeUnit\Models\Commune;
use Botble\Base\Facades\AdminHelper;
use Botble\AdministrativeUnit\Http\Controllers\AdministrativeUnitController;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

AdminHelper::registerRoutes(function () {
    Route::group(['prefix' => 'administrative-units', 'as' => 'administrative-unit.'], function () {
        Route::group(['prefix' => 'cities', 'as' => 'city.'], function () {
            Route::resource('', CityController::class)->parameters(['' => 'city']);
        });

        Route::group(['prefix' => 'districts', 'as' => 'district.'], function () {
            Route::resource('', DistrictController::class)->parameters(['' => 'district']);
        });

        Route::group(['prefix' => 'communes', 'as' => 'commune.'], function () {
            Route::resource('', CommuneController::class)->parameters(['' => 'commune']);
        });
    });
});

if (defined('THEME_MODULE_SCREEN_NAME')) {
    Theme::registerRoutes(function (): void {
        Route::group([
            'prefix' => 'administrative-unit',
            'as' => 'administrative-unit.'
        ], function () {
            Route::get('/ajax/cities', function () {
                return City::pluck('name','id')->toArray();
            })->name('ajax.cities');

            /*Route::get('/ajax/districts', function (Request $request) {
                return District::where('province_id', $request->get('province_id'))
                    ->select('id as id', 'name as text')->get();
            })->name('ajax.districts');*/

            Route::get('/ajax/communes', function (Request $request) {
                return Commune::where('city_id', $request->get('city_id'))
                    ->select('id as id', 'name as text')->get();
            })->name('ajax.communes');
        });
    });
}
