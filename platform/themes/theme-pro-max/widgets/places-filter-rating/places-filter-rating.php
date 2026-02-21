<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;

class PlacesFilterRatingWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterRating'),
            'description' => __('Widget to filter places by rating'),
            'rating_ids' => [],
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
