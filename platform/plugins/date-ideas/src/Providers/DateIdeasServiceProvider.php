<?php

namespace Botble\DateIdeas\Providers;

use Botble\Base\Supports\DashboardMenuItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Base\Facades\DashboardMenu;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Repositories\Eloquent\DateIdeasRepository;
use Botble\DateIdeas\Repositories\Interfaces\DateIdeasInterface;
use Botble\Gallery\Facades\Gallery;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Slug\Facades\SlugHelper;

class DateIdeasServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

     public function register(): void
    {
        $this->app->bind(DateIdeasInterface::class, function () {
            return new DateIdeasRepository(new Place());
        });
    }
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

        $this->loadRoutes(['api']);

        /*$this->app->register(EventServiceProvider::class);

        $this->app['events']->listen(ThemeRoutingBeforeEvent::class, function (): void {
            SiteMapManager::registerKey([
                'blog-categories',
                'blog-tags',
                'blog-posts',
            ]);

            SiteMapManager::registerMonthlyArchives('blog-posts');
        });
*/
        SlugHelper::registering(function (): void {
            SlugHelper::registerModule(Place::class, fn () => trans('plugins/date-ideas::date-ideas.name'));

            SlugHelper::setPrefix(Place::class, null, true);
        });

        $this->app->booted(function () {
            if (is_plugin_active('gallery')) {
                Gallery::registerModule(Place::class);
            }

//            SeoHelper::registerModule([Post::class, Category::class, Tag::class]);

            $this->app->register(HookServiceProvider::class);
        });

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(PlaceCategory::class, [
                'name',
            ]);
            LanguageAdvancedManager::registerModule(PlaceMood::class, [
                'name',
            ]);
            LanguageAdvancedManager::registerModule(Place::class, [
                'name',
                'description',
                'address',
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
