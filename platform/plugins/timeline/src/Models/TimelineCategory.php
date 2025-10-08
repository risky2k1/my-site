<?php

namespace Botble\Timeline\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class TimelineCategory extends BaseModel
{
    protected $table = 'timeline_categories';

    protected $fillable = [
        'name',
        'description',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'title' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    public function timelines()
    {
        return $this->hasMany(Timeline::class);
    }
}
