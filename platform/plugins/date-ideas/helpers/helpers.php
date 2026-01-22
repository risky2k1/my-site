<?php

use Botble\DateIdeas\Repositories\Interfaces\PlaceInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

function get_all_places(bool $active = true, int $perPage = 12): Collection|LengthAwarePaginator
{
    return app(PlaceInterface::class)->getAllPlaces($perPage, $active);
}