<?php

namespace Botble\Timeline\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Models\TimelineItem;

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
            LanguageAdvancedManager::registerModule(Timeline::class, [
                'name',
                'description',
            ]);
            LanguageAdvancedManager::registerModule(TimelineItem::class, [
                'title',
                'description',
                'content'
            ]);
            LanguageAdvancedManager::registerModule(TimelineCategory::class, [
                'name',
                'description',
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
                        ->route('timeline-category.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-timelines')
                        ->priority(10)
                        ->parentId('cms-plugins-timeline')
                        ->name('plugins/timeline::timeline.name')
                        ->icon('ti ti-file-text')
                        ->route('timeline.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-timeline-items')
                        ->priority(10)
                        ->parentId('cms-plugins-timeline')
                        ->name('plugins/timeline::timeline.items')
                        ->icon('ti ti-file-text')
                        ->route('timeline-item.index')
                );
        });

    }
}
