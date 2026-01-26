<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\Widget\Forms\WidgetForm;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;

class PlacesFilterMoodsWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterMoods'),
            'description' => __('Widget to filter places by moods'),
            'mood_ids' => [],
        ]);
    }

    protected function data(): array|Collection
    {
        $config = $this->getConfig();
        $moodIds = Arr::get($config, 'mood_ids', []);

        $moods = PlaceMood::query()
            ->select(['id', 'name'])
            ->wherePublished()
            ->when($moodIds, function ($query) use ($moodIds) {
                return $query->whereIn('id', $moodIds);
            })
            ->orderByDesc('created_at')
            ->get();

        return compact('moods');
    }

    protected function settingForm(): WidgetForm|string|null
    {
        $data = $this->getConfig();
        $moodIds = Arr::get($data, 'mood_ids', []);

        if (! is_array($moodIds)) {
            $moodIds = $moodIds ? explode(',', $moodIds) : null;
        }

        return WidgetForm::createFromArray($data)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add('mood_ids', SelectField::class, SelectFieldOption::make()
                ->label(__('Moods'))
                ->choices(PlaceMood::query()->pluck('name', 'id')->all())
                ->selected($moodIds)
                ->multiple());
    }

    protected function requiredPlugins(): array
    {
        return ['date-ideas'];
    }
}
