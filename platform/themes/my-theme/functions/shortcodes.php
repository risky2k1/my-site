<?php

use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Models\BaseQueryBuilder;
use Botble\Blog\Models\Category;
use Botble\Shortcode\Compilers\Shortcode as ShortcodeCompiler;
use Botble\Shortcode\Facades\Shortcode;
use Botble\Shortcode\Forms\ShortcodeForm;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Supports\ThemeSupport;
use Botble\Timeline\Models\Timeline;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;

app()->booted(function () {
    ThemeSupport::registerGoogleMapsShortcode();
    ThemeSupport::registerYoutubeShortcode();

    Shortcode::register(
        'home-hero-section',
        __('Home hero section'),
        __('Home hero section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.home-hero-section', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('home-hero-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
            ->add('description', TextField::class, TextFieldOption::make()->label(__('Description')))
            ->withHtmlAttributes('#ecf0f1', '#666');
    });

    Shortcode::register(
        'home-services-section',
        __('Home services section'),
        __('Home services section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.home-services-section', compact('shortcode'));
        }
    );

    Shortcode::setAdminConfig('home-services-section', function (array $attributes) {
        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add('title', TextField::class, TextFieldOption::make()->label(__('Title')))
            ->add('description', TextField::class, TextFieldOption::make()->label(__('Description')))
            ->withHtmlAttributes('#ecf0f1', '#666');
    });

    Shortcode::register(
        'home-featured-works-section',
        __('Home featured works section'),
        __('Home featured works section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.home-featured-works-section', compact('shortcode'));
        }
    );

    Shortcode::register(
        'home-about-section',
        __('Home about section'),
        __('Home about section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.home-about-section', compact('shortcode'));
        }
    );

    Shortcode::register(
        'home-contact-section',
        __('Home contact section'),
        __('Home contact section'),
        function (ShortcodeCompiler $shortcode) {
            return Theme::partial('shortcodes.homepage.home-contact-section', compact('shortcode'));
        }
    );

    Shortcode::register(
        'timeline',
        __('Timeline'),
        __('Timeline'),
        function (ShortcodeCompiler $shortcode) {
            Theme::asset()->usePath()->add('timeline-style', 'css/timeline.css');
            Theme::asset()->container('footer')->usePath()->add('timeline-js', 'js/timeline.js');

            $timeline = Timeline::query()
                ->with([
                    'items.category',
                    'items.place',
                ])
                ->wherePublished()
                ->first();

            $categoryCounts = $timeline->items
                ->groupBy('category_id')
                ->map(fn($group) => [
                    'category' => $group->first()->category,
                    'count' => $group->count(),
                ])
                ->sortByDesc('count')
                ->values();

            return Theme::partial('shortcodes.timeline.timeline', compact('shortcode', 'timeline', 'categoryCounts'));
        }
    );
});
