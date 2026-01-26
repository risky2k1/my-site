<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;
use Illuminate\Support\Arr;
use Botble\DateIdeas\Enums\PlacePriceRangeEnum;
class PlacesFilterPriceWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('PlacesFilterPrice'),
            'description' => __('Widget to filter places by price'),
            'price_ids' => [],
        ]);
    }

    protected function data(): array|Collection
    {
        $config = $this->getConfig();
        $priceIds = Arr::get($config, 'price_ids', []);

        $prices = PlacePriceRangeEnum::toArray();
        $prices = array_map(function ($price) {
            return [
                'id' => $price,
                'name' => PlacePriceRangeEnum::getLabel($price),
            ];
        }, $prices);

        return compact('prices');
    }
}
