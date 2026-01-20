<?php

use Botble\DateIdeas\Repositories\Interfaces\DateIdeasInterface;
use Illuminate\Support\Collection;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;

if (!function_exists('get_all_date_places')) {
    function get_all_date_places(
        bool  $active = true,
        int   $perPage = 12,
        array $with = ['slugable', 'categories']
    ): Collection|LengthAwarePaginator
    {
        return app(DateIdeasInterface::class)->getAllPlaces($perPage, $active, $with);
    }
}
