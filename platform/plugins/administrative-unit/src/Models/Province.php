<?php

namespace Botble\AdministrativeUnit\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class Province extends BaseModel
{
    protected $table = 'au_provinces';

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
