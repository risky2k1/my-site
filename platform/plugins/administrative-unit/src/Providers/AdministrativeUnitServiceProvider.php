<?php

namespace Botble\AdministrativeUnit\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\AdministrativeUnit\Models\AdministrativeUnit;

class AdministrativeUnitServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/administrative-unit')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->publishAssets()
            ->loadMigrations();

            if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
                \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(AdministrativeUnit::class, [
                    'name',
                ]);
            }

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-administrative-unit')
                        ->priority(5)
                        ->name('plugins/administrative-unit::administrative-unit.name')
                        ->icon('ti ti-box')
                        ->route('posts.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-administrative-unit-provinces')
                        ->priority(10)
                        ->parentId('cms-plugins-administrative-unit')
                        ->name('plugins/administrative-unit::administrative-unit.provinces')
                        ->icon('ti ti-file-text')
                        ->route('administrative-unit.province.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-administrative-unit-districts')
                        ->priority(10)
                        ->parentId('cms-plugins-administrative-unit')
                        ->name('plugins/administrative-unit::administrative-unit.districts')
                        ->icon('ti ti-file-text')
                        ->route('administrative-unit.district.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-administrative-unit-wards')
                        ->priority(10)
                        ->parentId('cms-plugins-administrative-unit')
                        ->name('plugins/administrative-unit::administrative-unit.wards')
                        ->icon('ti ti-file-text')
                        ->route('administrative-unit.ward.index')
                )
                ;
        });

    }
}
