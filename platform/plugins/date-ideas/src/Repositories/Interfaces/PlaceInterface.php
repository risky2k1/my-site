<?php

namespace Botble\DateIdeas\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;

interface PlaceInterface extends RepositoryInterface
{
    public function getAllPlaces(int $perPage = 12, bool $active = true, array $with = ['slugable']): Collection|LengthAwarePaginator;
    
    public function filterPlaces(array $data): Collection|LengthAwarePaginator;
}
