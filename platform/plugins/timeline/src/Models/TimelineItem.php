<?php

namespace Botble\Timeline\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class TimelineItem extends BaseModel
{
    protected $table = 'timeline_items';

    protected $fillable = [
        'title',
        'description',
        'content',
        'timeline_id',
        'category_id',
        'place_id',
        'date',
        'image',
        'icon',
        'icon2',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'title' => SafeContent::class,
        'description' => SafeContent::class,
        'content' => SafeContent::class,
    ];

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(TimelineCategory::class, 'category_id');
    }

    public function timeline(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Timeline::class, 'timeline_id');
    }
}
