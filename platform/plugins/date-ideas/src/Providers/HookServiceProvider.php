<?php

namespace Botble\DateIdeas\Providers;

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
        add_filter(BASE_FILTER_PUBLIC_SINGLE_DATA, [$this, 'handleSingleView'], 2);

        if (defined('PAGE_MODULE_SCREEN_NAME')) {
            add_filter(PAGE_FILTER_FRONT_PAGE_CONTENT, [$this, 'renderDateIdeasPage'], 2, 2);
        }

        PageTable::beforeRendering(function (): void {
            add_filter(PAGE_FILTER_PAGE_NAME_IN_ADMIN_LIST, [$this, 'addAdditionNameToPageName'], 147, 2);
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
                'title' => trans('plugins/date-ideas::date-ideas.name'),
                'id' => 'opt-text-subsection-date-ideas',
                'subsection' => true,
                'icon' => 'ti ti-edit',
                'fields' => [
                    [
                        'id' => 'date_ideas_page_id',
                        'type' => 'customSelect',
                        'label' => trans('plugins/date-ideas::date-ideas.name'),
                        'attributes' => [
                            'name' => 'date_ideas_page_id',
                            'list' => [0 => trans('plugins/blog::base.select')] + $pages,
                            'value' => '',
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_places_in_a_category',
                        'type' => 'number',
                        'label' => trans('plugins/date-ideas::date-ideas.number_places_per_page_in_category'),
                        'attributes' => [
                                'name' => 'number_of_places_in_a_category',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                    [
                        'id' => 'number_of_places_in_a_tag',
                        'type' => 'number',
                        'label' => trans('plugins/date-ideas::date-ideas.number_places_per_page_in_tag'),
                        'attributes' => [
                            'name' => 'number_of_places_in_a_tag',
                            'value' => 12,
                            'options' => [
                                'class' => 'form-control',
                            ],
                        ],
                    ],
                ],
            ]);
    }


    public function handleSingleView(Slug|array $slug): Slug|array
    {
        return (new PlaceService())->handleFrontRoutes($slug);
    }


    public function renderDateIdeasPage(?string $content, Page $page): ?string
    {
        if ($page->getKey() == $this->getDateIdeasPageId()) {
            $view = 'plugins/date-ideas::themes.loop';

            if (view()->exists($viewPath = Theme::getThemeNamespace() . '::views.date-ideas.index')) {
                $view = $viewPath;
            }

            $places = get_all_places(true, (int) theme_option('number_of_places_in_a_category', 12));
            if (!view()->exists($paginationView = Theme::getThemeNamespace('partials.paginate'))) {
                $paginationView = 'pagination::bootstrap-5';
            }

            return view($view, [
                'places' => $places,
                'paginationView' => $paginationView,
            ])->render();
        }

        return $content;
    }

    public function addAdditionNameToPageName(?string $name, Page $page): ?string
    {
        if ($page->getKey() == $this->getDateIdeasPageId()) {
            $subTitle = Html::tag('span', trans('plugins/date-ideas::date-ideas.name'), ['class' => 'additional-page-name'])
                ->toHtml();

            if (Str::contains($name, ' —')) {
                return $name . ', ' . $subTitle;
            }

            return $name . ' —' . $subTitle;
        }

        return $name;
    }

    protected function getDateIdeasPageId(): int|string|null
    {
        return theme_option('date_ideas_page_id', setting('date_ideas_page_id'));
    }

}
