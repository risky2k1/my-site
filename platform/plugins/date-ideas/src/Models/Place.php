<?php

namespace Botble\DateIdeas\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;
use Botble\DateIdeas\Enums\PlacePriceRangeEnum;

class Place extends BaseModel
{
    protected $table = 'di_places';

    protected $fillable = [
        'name',
        'description',
        'address',
        'latitude',
        'longitude',
        'price_range',
        'image',
        'status',
        'au_city_id',
        'au_commune_id',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'price_range' => PlacePriceRangeEnum::class,
        'name' => SafeContent::class,
    ];

    public function categories(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(
            PlaceCategory::class,
            'di_place_category_place',
            'place_id',
            'category_id'
        );
    }

    public function moods(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(
            PlaceMood::class,
            'di_place_mood_place',
            'place_id',
            'mood_id'
        );
    }
}
