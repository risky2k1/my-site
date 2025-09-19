<?php

namespace Botble\AdministrativeUnit\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class City extends BaseModel
{
    protected $table = 'au_cities';

    protected $fillable = [
        'code',
        'name',
        'type',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];
}
