<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;

class PlacesFilterRegionWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterRegion'),
            'description' => __('Widget to filter places by region'),
            'region_ids' => [],
        ]);
    }

    protected function data(): array|Collection
    {
        return [];
    }

    protected function requiredPlugins(): array
    {
        return ['date-ideas'];
    }
}
