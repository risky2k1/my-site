<?php

namespace Botble\Timeline\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\Gallery\Facades\Gallery;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Models\TimelineItem;
use Botble\Timeline\Repositories\Interfaces\TimelineInterface;
use Botble\Timeline\Repositories\Eloquent\TimelineRepository;

class TimelineServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(TimelineInterface::class, function () {
            return new TimelineRepository(new Timeline());
        });

    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/timeline')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets()
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

        $this->app->booted(function () {
            if (is_plugin_active('gallery')) {
                Gallery::registerModule(TimelineItem::class);
            }
            $this->app->register(HookServiceProvider::class);
        });

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
