<?php

namespace Botble\DateIdeas\Repositories\Eloquent;

use Botble\Base\Models\BaseQueryBuilder;
use Botble\Blog\Models\Post;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\DateIdeas\Repositories\Interfaces\PlaceInterface;
use Botble\Language\Facades\Language;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Exception;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class PlaceRepository extends RepositoriesAbstract implements PlaceInterface
{
   
    public function getAllPlaces(
        int $perPage = 12,
        bool $active = true,
        array $with = ['slugable']
    ): Collection|LengthAwarePaginator {
        $data = $this->model
            ->with($with)
            ->orderByDesc('created_at');

        if ($active) {
            $data = $data->wherePublished();
        }

        return $this->applyBeforeExecuteQuery($data)->paginate($perPage);
    }

    public function filterPlaces(array $filters): Collection|LengthAwarePaginator
    {
        $data = $this->originalModel;

        if ($filters['categories'] !== null) {
            $categories = array_filter((array) $filters['categories']);

            $data = $data->whereHas('categories', function (Builder $query) use ($categories): void {
                $query->whereIn('id', $categories);
            });
        }

        if ($filters['categories_exclude'] !== null) {
            $data = $data
                ->whereHas('categories', function (Builder $query) use ($filters): void {
                    $query->whereNotIn('id', array_filter((array) $filters['categories_exclude']));
                });
        }

        if ($filters['exclude'] !== null) {
            $data = $data->whereNotIn('id', array_filter((array) $filters['exclude']));
        }

        if ($filters['include'] !== null) {
            $data = $data->whereNotIn('id', array_filter((array) $filters['include']));
        }   

        if ($filters['moods'] !== null) {
            $moods = array_filter((array) $filters['moods']);

            $data = $data->whereHas('moods', function (Builder $query) use ($moods): void {
                $query->whereIn('id', $moods);
            });
        }

        if ($filters['moods_exclude'] !== null) {
            $moods = array_filter((array) $filters['moods_exclude']);

            $data = $data->whereHas('moods', function (Builder $query) use ($moods): void {
                $query->whereNotIn('id', $moods);
            });
        }

        if ($filters['price_range'] !== null) {
            $data = $data->whereIn('price_range', $filters['price_range']);
        }

        if ($filters['price_range_exclude'] !== null) {
            $data = $data->whereNotIn('price_range', $filters['price_range_exclude']);
        }

        if ($filters['city'] !== null) {
            $cities = array_filter((array) $filters['city']);
            $data = $data->whereIn('au_city_id', $cities);
        }

        // if ($filters['rating'] !== null) {
        //     $ratings = array_filter((array) $filters['rating']);
        //     $data = $data->whereIn('rating', $ratings);
        // }

        $orderBy = Arr::get($filters, 'order_by', 'created_at');

        $data = $data
            ->wherePublished()
            ->orderBy($orderBy);

        return $this->applyBeforeExecuteQuery($data)->paginate((int) $filters['per_page']);
    }
}
