<?php

namespace Botble\AdministrativeUnit\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class Commune extends BaseModel
{
    protected $table = 'au_communes';

    protected $fillable = [
        'code',
        'name',
        'type',
        'city_id',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];

    public function city(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(City::class, 'city_id', 'id');
    }
}
