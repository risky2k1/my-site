<?php

namespace Botble\AdministrativeUnit\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class District extends BaseModel
{
    protected $table = 'au_districts';

    protected $fillable = [
        'code',
        'name',
        'type',
        'province_id',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];
}
