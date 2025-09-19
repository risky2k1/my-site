<?php

namespace Botble\DateIdeas\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\Place;
use Botble\Gallery\Facades\Gallery;

class DateIdeasServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/date-ideas')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations();

        $this->app->booted(function () {
            if (is_plugin_active('gallery')) {
                Gallery::registerModule(Place::class);
            }
        });

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(DateIdeas::class, [
                'name',
            ]);
        }

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-date-ideas')
                        ->priority(5)
                        ->name('plugins/date-ideas::date-ideas.name')
                        ->icon('ti ti-box')
                        ->route('date-ideas.place.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-date-ideas-place')
                        ->priority(10)
                        ->parentId('cms-plugins-date-ideas')
                        ->name('plugins/date-ideas::date-ideas.places')
                        ->icon('ti ti-file-text')
                        ->route('date-ideas.place.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-date-ideas-place-category')
                        ->priority(10)
                        ->parentId('cms-plugins-date-ideas')
                        ->name('plugins/date-ideas::date-ideas.place_category')
                        ->icon('ti ti-file-text')
                        ->route('date-ideas.place-category.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-date-ideas-mood')
                        ->priority(10)
                        ->parentId('cms-plugins-date-ideas')
                        ->name('plugins/date-ideas::date-ideas.moods')
                        ->icon('ti ti-file-text')
                        ->route('date-ideas.place-mood.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-date-ideas-review')
                        ->priority(10)
                        ->parentId('cms-plugins-date-ideas')
                        ->name('plugins/date-ideas::date-ideas.reviews')
                        ->icon('ti ti-file-text')
                        ->route('date-ideas.place-review.index')
                )
            ;
        });
    }
}
