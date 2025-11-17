<?php

namespace Botble\Timetable\Providers;

use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\Timetable\Models\TimetableEvent;
use Botble\Timetable\Repositories\Eloquent\TimetableEventRepository;
use Botble\Timetable\Repositories\Interfaces\TimetableEventInterface;

class TimetableServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(TimetableEventInterface::class, function () {
            return new TimetableEventRepository(new TimetableEvent());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/timetable')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadMigrations();

            if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
                \Botble\LanguageAdvanced\Supports\LanguageAdvancedManager::registerModule(TimetableEvent::class, [
                    'title',
                ]);
            }

            /*DashboardMenu::default()->beforeRetrieving(function () {
                DashboardMenu::registerItem([
                    'id' => 'cms-plugins-timetable',
                    'priority' => 5,
                    'parent_id' => null,
                    'name' => 'plugins/timetable::timetable.name',
                    'icon' => 'ti ti-box',
                    'url' => route('timetable.index'),
                    'permissions' => ['timetable.index'],
                ]);
            });*/
    }
}
