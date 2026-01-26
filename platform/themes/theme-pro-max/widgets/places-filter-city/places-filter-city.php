<?php

use Botble\AdministrativeUnit\Models\City;
use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Botble\Base\Enums\BaseStatusEnum;

class PlacesFilterCityWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterCity'),
            'description' => __('Widget to filter places by city'),
            'city_ids' => [],
        ]);
    }

    protected function data(): array|Collection
    {
        $config = $this->getConfig();
        $cityIds = Arr::get($config, 'city_ids', []);

        $cities = City::query()
            ->select(['id', 'name'])
            ->withCount([
                'places as places_count' => function ($query) {
                    $query->where('status', BaseStatusEnum::PUBLISHED);
                }
            ])
            ->when($cityIds, function ($query) use ($cityIds) {
                $query->whereIn('id', $cityIds);
            })
            ->orderByDesc('places_count')
            ->limit(5)
            ->get();

        return compact('cities');
    }

    protected function requiredPlugins(): array
    {
        return ['date-ideas', 'administrative-unit'];
    }
}