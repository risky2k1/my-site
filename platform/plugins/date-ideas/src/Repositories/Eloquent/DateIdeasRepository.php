<?php

namespace Botble\DateIdeas\Repositories\Eloquent;

use Botble\Base\Models\BaseQueryBuilder;
use Botble\DateIdeas\Repositories\Interfaces\DateIdeasInterface;
use Botble\Language\Facades\Language;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Exception;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class DateIdeasRepository extends RepositoriesAbstract implements DateIdeasInterface
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
}
