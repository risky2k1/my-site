<?php

use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Theme\Supports\ThemeSupport;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();
    ThemeSupport::registerSocialLinks();

    Shortcode::register(
        'homepage-banner',
        __('Homepage banner'),
        __('Homepage banner'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-banner', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('homepage-banner', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'banner_image',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(__('Image'))
                    ->toArray()
            );
    });

    Shortcode::register(
        'homepage-about-section',
        __('Homepage about section'),
        __('Homepage about section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-about-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-service-section',
        __('Homepage service section'),
        __('Homepage service section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-service-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-stat-section',
        __('Homepage stat section'),
        __('Homepage stat section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-stat-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-portfolio-section',
        __('Homepage portfolio section'),
        __('Homepage portfolio section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-portfolio-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-blog-section',
        __('Homepage blog section'),
        __('Homepage blog section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-blog-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-testimonials-section',
        __('Homepage testimonials section'),
        __('Homepage testimonials section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-testimonials-section', compact('shortcode'));
        }
    );
    Shortcode::register(
        'homepage-contact-section',
        __('Homepage contact section'),
        __('Homepage contact section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.homepage-contact-section', compact('shortcode'));
        }
    );
});
