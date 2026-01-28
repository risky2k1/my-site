<?php

namespace Botble\Timeline\Providers;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\ServiceProvider;
use Botble\DateIdeas\Services\PlaceService;
use Botble\Page\Models\Page;
use Botble\Page\Tables\PageTable;
use Botble\Slug\Models\Slug;
use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Str;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        // add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 2);

        if (defined('PAGE_MODULE_SCREEN_NAME')) {
            add_filter(PAGE_FILTER_FRONT_PAGE_CONTENT, [$this, 'renderTimelinePage'], 2, 2);
        }

        PageTable::beforeRendering(function (): void {
            add_filter(PAGE_FILTER_PAGE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToTimelinePageName'], 147, 2);
        });

        $this->app['events']->listen(RenderingThemeOptionSettings::class, function (): void {
            add_action(RENDERING_THEME_OPTIONS_PAGE, [$this, 'addThemeOptions'], 35);
        });
    }

    public function addThemeOptions(): void
    {
        $pages = Page::query()
            ->wherePublished()
            ->pluck('name', 'id')
            ->all();

        theme_option()
            ->setSection([
                'title' => trans('plugins/timeline::timeline.name'),
                'id' => 'opt-text-subsection-timeline',
                'subsection' => true,
                'icon' => 'ti ti-edit',
                'fields' => [
                    [
                        'id' => 'timeline_page_id',
                        'type' => 'customSelect',
                        'label' => trans('plugins/timeline::timeline.name'),
                        'attributes' => [
                            'name' => 'timeline_page_id',
                            'list' => [0 => trans('plugins/blog::base.select')] + $pages,
                            'value' => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ]);
    }


    // public function handleSingleView(Slug|array $slug): Slug|array
    // {
    //     return (new PlaceService())->handleFrontRoutes($slug);
    // }


    public function renderTimelinePage(?string $content, Page $page): ?string
    {
        if ($page->getKey() == $this->getTimelinePageId()) {
            $view = 'plugins/timeline::themes.loop';

            if (view()->exists($viewPath = Theme::getThemeNamespace() . '::views.timeline.index')) {
                $view = $viewPath;
            }

            Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add('lightgallery2.css', 'https://cdn.jsdelivr.net/npm/lightgallery@2.9.0/css/lightgallery-bundle.min.css')
            ->add('lightgallery2.js', 'https://cdn.jsdelivr.net/npm/lightgallery@2.9.0/lightgallery.umd.min.js')
            ->add('lightgallery2.init', asset('vendor/core/plugins/timeline/js/lightgallery.js'));

            Theme::asset()
            ->container('footer')
            ->usePath()
            ->add('timeline-js', 'js/timeline.js', [], ['defer'], version: get_cms_version());

            return view($view, [
                // 'places' => $places,
                // 'paginationView' => $paginationView,
            ])->render();
        }

        return $content;
    }

    public function addAdditionNameToTimelinePageName(?string $name, Page $page): ?string
    {
        if ($page->getKey() == $this->getTimelinePageId()) {
            $subTitle = Html::tag('span', trans('plugins/timeline::timeline.name'), ['class' => 'additional-page-name'])
                ->toHtml();

            if (Str::contains($name, ' —')) {
                return $name . ', ' . $subTitle;
            }

            return $name . ' —' . $subTitle;
        }

        return $name;
    }

    protected function getTimelinePageId(): int|string|null
    {
        return theme_option('timeline_page_id', setting('timeline_page_id'));
    }

}
