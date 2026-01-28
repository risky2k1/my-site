<?php

namespace Botble\Timeline\Repositories\Interfaces;

use Botble\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Botble\Timeline\Models\Timeline;
interface TimelineInterface extends RepositoryInterface
{
    public function getMyTimeline(bool $active = true, array $with = []): Timeline|null;

    public function getMyTimelineItems(Timeline $timeline, array $with = [], int $page = 1): LengthAwarePaginator;
}
