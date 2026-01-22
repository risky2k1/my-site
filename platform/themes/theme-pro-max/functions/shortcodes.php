<?php

use Botble\Theme\Supports\ThemeSupport;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\Fields\CheckboxField;
use Botble\Base\Forms\FieldOptions\CheckboxFieldOption;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\FieldOptions\EditorFieldOption;
use Botble\Base\Forms\Fields\RepeaterField;
use Botble\Base\Forms\FieldOptions\RepeaterFieldOption;
use Botble\Base\Forms\FieldOptions\CoreIconFieldOption;
use Botble\Base\Forms\Fields\CoreIconField;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    Shortcode::register('homepage-hero-section', __('Homepage hero section'), __('Homepage hero section'), function (ShortcodeCompiler $shortcode) {
        $skills = explode(',', $shortcode->skills);
        return Theme::partial('shortcodes.homepage.homepage-hero-section', compact('shortcode', 'skills'));
    });

    Shortcode::setAdminConfig('homepage-hero-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add('is_working', CheckboxField::class, CheckboxFieldOption::make()->label(__('Is working'))->value(true))
            ->add('title_left', TextareaField::class, TextareaFieldOption::make()->label(__('Title left')))
            ->add('title_highlight', TextareaField::class, TextareaFieldOption::make()->label(__('Title highlight')))
            ->add('title_right', TextareaField::class, TextareaFieldOption::make()->label(__('Title right')))
            ->add('subtitle', TextField::class, TextFieldOption::make()->label(__('Subtitle')))
            ->add('name', TextField::class, TextFieldOption::make()->label(__('Name')))
            ->add('role', TextareaField::class, TextareaFieldOption::make()->label(__('Role')))
            ->add('skills', TextareaField::class, TextareaFieldOption::make()->label(__('Skills')))
            ->add('return_text', TextareaField::class, TextareaFieldOption::make()->label(__('Return text')))
            ->add('github_url', TextField::class, TextFieldOption::make()->label(__('GitHub URL')))
            ->withHtmlAttributes('#ecf0f1', '#666');
    });

    Shortcode::register('homepage-skills-section', __('Homepage skills section'), __('Homepage skills section'), function (ShortcodeCompiler $shortcode) {
        $skills = theme_option('your_skills', []);
        $skillData = json_decode($skills, true);
        return Theme::partial('shortcodes.homepage.homepage-skills-section', compact('shortcode', 'skillData'));
    });

    Shortcode::setAdminConfig('homepage-skills-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->add('title', TextareaField::class, TextareaFieldOption::make()->label(__('Title')));
    });

    Shortcode::register('homepage-projects-section', __('Homepage projects section'), __('Homepage projects section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-projects-section', compact('shortcode'));
    });

    Shortcode::setAdminConfig('homepage-projects-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->add('title', TextareaField::class, TextareaFieldOption::make()->label(__('Title')));
    });

    Shortcode::register('homepage-contact-section', __('Homepage contact section'), __('Homepage contact section'), function (ShortcodeCompiler $shortcode) {
        return Theme::partial('shortcodes.homepage.homepage-contact-section', compact('shortcode'));
    });

    Shortcode::setAdminConfig('homepage-contact-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->add('title', TextareaField::class, TextareaFieldOption::make()->label(__('Title')))
            ->add('description', TextareaField::class, TextareaFieldOption::make()->label(__('Description')));
    });
});
