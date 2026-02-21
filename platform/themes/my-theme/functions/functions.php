<?php

use Botble\Media\Facades\RvMedia;
use Botble\Menu\Facades\Menu;
use Botble\Theme\Supports\ThemeSupport;

register_page_template([
    'default' => __('Default'),
    'timeline' => __('Timeline'),
]);

app()->booted(function () {
    RvMedia::addSize('medium', 800, 800)
        ->addSize('thumb', 400, 400);

    register_sidebar([
        'id' => 'footer_sidebar',
        'name' => __('Footer sidebar'),
        'description' => __('Footer sidebar'),
    ]);

    ThemeSupport::registerSocialLinks();
    ThemeSupport::registerToastNotification();
    ThemeSupport::registerPreloader();
    ThemeSupport::registerSiteCopyright();
    ThemeSupport::registerDateFormatOption();
    ThemeSupport::registerLazyLoadImages();
    ThemeSupport::registerSiteLogoHeight();
});
