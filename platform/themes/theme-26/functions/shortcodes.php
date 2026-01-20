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
        __('Homepage Component'),
        __('Homepage Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage', compact('shortcode'));
        }
    );

    Shortcode::register(
        'timeline',
        __('Timeline Component'),
        __('Timeline Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.timeline', compact('shortcode'));
        }
    );

    Shortcode::register(
        'date-ideas',
        __('Date Ideas Component'),
        __('Date Ideas Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.date-ideas', compact('shortcode'));
        }
    );

    Shortcode::register(
        'portfolio-contact',
        __('Portfolio Contact Component'),
        __('Portfolio Contact Component'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.portfolio-contact', compact('shortcode'));
        }
    );

});
