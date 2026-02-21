<?php

namespace Botble\Timeline\Repositories\Eloquent;

use Botble\Base\Models\BaseQueryBuilder;
use Botble\Blog\Models\Post;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Repositories\Interfaces\TimelineInterface;
use Botble\Language\Facades\Language;
use Botble\Support\Repositories\Eloquent\RepositoriesAbstract;
use Exception;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Botble\Timeline\Models\TimelineItem;

class TimelineRepository extends RepositoriesAbstract implements TimelineInterface
{
    public function getMyTimeline(bool $active = true, array $with = ['items']): Timeline|null
    {
        return $this->model
        ->with($with)
        ->first();
    }

    public function getMyTimelineItems(Timeline $timeline, array $with = [], int $page = 1): LengthAwarePaginator
    {
        return TimelineItem::query()
        ->wherePublished()
        ->with($with)
        ->where('timeline_id', $timeline->id)
        ->orderByRaw('CASE WHEN `order` > 0 THEN 0 ELSE 1 END')
        ->orderBy('order', 'asc')
        ->orderBy('date', 'asc')
        ->orderBy('id', 'asc')
        ->toArray();
        // ->paginate(5, ['*'], 'page', $page);
    }
}
