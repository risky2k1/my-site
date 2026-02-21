<?php

namespace Botble\FavoriteItems\Providers;

use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\FavoriteItems\Models\FavoriteItems;

class FavoriteItemsServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/favorite-items')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations();

            if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
                \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(FavoriteItems::class, [
                    'name',
                ]);
            }

            DashboardMenu::default()->beforeRetrieving(function () {
                DashboardMenu::registerItem([
                    'id' => 'cms-plugins-favorite-items',
                    'priority' => 5,
                    'parent_id' => null,
                    'name' => 'plugins/favorite-items::favorite items.name',
                    'icon' => 'ti ti-box',
                    'url' => route('favorite-items.index'),
                    'permissions' => ['favorite-items.index'],
                ]);
            });
    }
}
