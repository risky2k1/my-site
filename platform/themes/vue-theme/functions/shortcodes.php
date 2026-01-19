<?php

use Botble\Theme\Supports\ThemeSupport;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    Shortcode::register(
        'homepage',
        __('Homepage Vue Component'),
        __('Homepage Vue Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage', compact('shortcode'));
        }
    );

    Shortcode::register(
        'timeline',
        __('Timeline Vue Component'),
        __('Timeline Vue Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.timeline', compact('shortcode'));
        }
    );

    Shortcode::register(
        'date-ideas',
        __('Date Ideas Vue Component'),
        __('Date Ideas Vue Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.date-ideas', compact('shortcode'));
        }
    );

    Shortcode::register(
        'portfolio-contact',
        __('Portfolio Contact Vue Component'),
        __('Portfolio Contact Vue Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.portfolio-contact', compact('shortcode'));
        }
    );
});
