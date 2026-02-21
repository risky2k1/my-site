<?php

namespace Botble\Timetable\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Models\BaseModel;

class TimetableEvent extends BaseModel
{
    protected $table = 'timetable_events';

    protected $fillable = [
        'title',
        'room',
        'teacher',
        'start_date',
        'end_date',
        'weekday',
        'start_time',
        'end_time',
        'color',
        'note',
        'is_recurring',
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'is_recurring' => 'boolean',
    ];
}
