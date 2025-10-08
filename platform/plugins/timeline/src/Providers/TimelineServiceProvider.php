<?php

namespace Botble\Timeline\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\Timeline\Models\Timeline;

class TimelineServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/timeline')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations();

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(Timeline::class, [
                'name',
            ]);
        }

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::registerItem([
                'id' => 'cms-plugins-timeline',
                'priority' => 5,
                'parent_id' => null,
                'name' => 'plugins/timeline::timeline.name',
                'icon' => 'ti ti-box',
                'url' => route('timeline.index'),
                'permissions' => ['timeline.index'],
            ]);
        });

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-timeline')
                        ->priority(5)
                        ->name('plugins/timeline::timeline.name')
                        ->icon('ti ti-box')
                        ->route('timeline.index')
                        ->permissions(['timeline.index'])
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-timeline-categories')
                        ->priority(10)
                        ->parentId('cms-plugins-timeline')
                        ->name('plugins/timeline::timeline.categories')
                        ->icon('ti ti-file-text')
                        ->route('date-ideas.place.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-timeline-items')
                        ->priority(10)
                        ->parentId('cms-plugins-timeline')
                        ->name('plugins/timeline::timeline.name')
                        ->icon('ti ti-file-text')
                        ->route('timeline.index')
                )
                ;
        });

    }
}
