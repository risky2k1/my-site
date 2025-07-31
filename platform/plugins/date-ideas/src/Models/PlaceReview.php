<?php

namespace Botble\DateIdeas\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class PlaceReview extends BaseModel
{
    protected $table = 'di_place_reviews';

    protected $fillable = [
        'place_id',
        'user_id',
        'rating',
        'comment',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];
}
