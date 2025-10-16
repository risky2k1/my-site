<?php

namespace Botble\Timeline\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class Timeline extends BaseModel
{
    protected $table = 'timelines';

    protected $fillable = [
        'name',
        'description',
        'image',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    public function category(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(TimelineCategory::class, 'category_id');
    }
}
