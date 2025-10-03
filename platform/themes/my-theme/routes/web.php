<?php

use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

// Custom routes
// You can delete this route group if you don't need to add your custom routes.
Theme::registerRoutes(function (): void {
    // Add your custom route here
    // Ex: Route::get('hello', 'getHello');
    Route::get('timeline', function () {
        return view(Theme::getThemeNamespace() . '::views.timeline');
    });
});

Theme::routes();
