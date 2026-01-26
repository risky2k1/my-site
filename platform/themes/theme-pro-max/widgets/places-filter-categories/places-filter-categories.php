<?php

use Botble\DateIdeas\Models\PlaceCategory;
use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Botble\Widget\Forms\WidgetForm;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;

class PlacesFilterCategoriesWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterCategories'),
            'description' => __('Widget to filter places by categories'),
            'category_ids' => [],
        ]);
    }

    protected function data(): array|Collection
    {
        $config = $this->getConfig();
        $categoryIds = Arr::get($config, 'category_ids', []);

        $categories = PlaceCategory::query()
            ->select(['id', 'name'])
            ->wherePublished()
            ->when($categoryIds, function ($query) use ($categoryIds) {
                return $query->whereIn('id', $categoryIds);
            }, function ($query) {
                return $query
                    ->take(5)
                    ->where(fn ($query) => $query->whereNull('parent_id')->orWhere('parent_id', 0));
            })
            ->orderByDesc('created_at')
            ->get();
        return [
            'categories' => $categories,
        ];
    }

    protected function settingForm(): WidgetForm|string|null
    {
        $data = $this->getConfig();

        $categories = PlaceCategory::query()->pluck('name', 'id')->all();
        $categoryIds = Arr::get($data, 'category_ids', []);

        if (! is_array($categoryIds)) {
            $categoryIds = $categoryIds ? explode(',', $categoryIds) : null;
        }

        return WidgetForm::createFromArray($data)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'category_ids',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/blog::base.choose_categories'))
                    ->choices($categories)
                    ->selected($categoryIds)
                    ->searchable()
                    ->multiple()
            );
    }

    protected function requiredPlugins(): array
    {
        return ['date-ideas'];
    }
}
