<?php

namespace Botble\DateIdeas\Models;

use Botble\ACL\Models\User;
use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\Member\Models\Member;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

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
        'comment' => SafeContent::class,
    ];

    public function place(): BelongsTo
    {
        return $this->belongsTo(Place::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(Member::class, 'user_id');
    }
}
