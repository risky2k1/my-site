<?php

namespace Botble\DateIdeas\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class PlaceCategory extends BaseModel
{
    protected $table = 'di_place_categories';

    protected $fillable = [
        'name',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];

    public function places(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Place::class, 'di_place_category_place', 'category_id', 'place_id');
    }
}
