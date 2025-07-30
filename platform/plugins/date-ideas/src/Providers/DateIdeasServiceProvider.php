<?php

namespace Botble\DateIdeas\Providers;

use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\DateIdeas\Models\DateIdeas;

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
            
            if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
                \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(DateIdeas::class, [
                    'name',
                ]);
            }
            
            DashboardMenu::default()->beforeRetrieving(function () {
                DashboardMenu::registerItem([
                    'id' => 'cms-plugins-date ideas',
                    'priority' => 5,
                    'parent_id' => null,
                    'name' => 'plugins/date ideas::date ideas.name',
                    'icon' => 'ti ti-box',
                    'url' => route('date ideas.index'),
                    'permissions' => ['date ideas.index'],
                ]);
            });
    }
}
