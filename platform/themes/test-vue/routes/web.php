<?php

use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;
use Theme\TestVue\Http\Controllers\TestVueController;

// Custom routes
// You can delete this route group if you don't need to add your custom routes.
Theme::registerRoutes(function (): void {
    // Date Ideas page
    Route::get('custom-date-idea', function () {
        return Theme::scope('date-idea')->render();
    });

    // Timeline page
    Route::get('custom-timeline', function () {
        return Theme::scope('timeline')->render();
    });

    // Contact page
    Route::get('custom-contact', function () {
        return Theme::scope('contact')->render();
    });
});

Theme::routes();
