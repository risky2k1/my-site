<?php

use Botble\Theme\Supports\ThemeSupport;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    Shortcode::register(
        'timeline',
        __('123'),
        __('123123'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.timeline', compact('shortcode'));
        }
    );
});
