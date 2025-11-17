<?php

use Botble\Base\Facades\AdminHelper;
use Botble\Timetable\Http\Controllers\TimetableController;
use Illuminate\Support\Facades\Route;
use Botble\Theme\Facades\Theme;

AdminHelper::registerRoutes(function () {
//    Route::group(['prefix' => 'timetables', 'as' => 'timetable.'], function () {
//        Route::resource('', TimetableController::class)->parameters(['' => 'timetable']);
//    });


});
if (defined('THEME_MODULE_SCREEN_NAME')) {
    Theme::registerRoutes(function (): void {
        Route::group(['prefix' => 'timetable', 'as' => 'timetable.'], function () {
            Route::get('events', [TimetableController::class, 'index'])->name('events');
            Route::post('store', [TimetableController::class, 'store'])->name('store');
        });
    });
}
