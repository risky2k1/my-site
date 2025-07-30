<?php

namespace Botble\AdministrativeUnit\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class Ward extends BaseModel
{
    protected $table = 'au_wards';

    protected $fillable = [
        'code',
        'name',
        'type',
        'district_id',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];
}
