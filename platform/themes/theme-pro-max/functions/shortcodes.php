<?php

use Botble\Theme\Supports\ThemeSupport;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Theme\Facades\Theme;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    Shortcode::register('homepage-hero-section', __('Homepage hero section'), __('Homepage hero section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-hero-section', compact('shortcode'));
    });

    Shortcode::register('homepage-skills-section', __('Homepage skills section'), __('Homepage skills section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-skills-section', compact('shortcode'));
    });

    Shortcode::register('homepage-projects-section', __('Homepage projects section'), __('Homepage projects section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-projects-section', compact('shortcode'));
    });

    Shortcode::register('homepage-contact-section', __('Homepage contact section'), __('Homepage contact section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-contact-section', compact('shortcode'));
    });
});
