<?php

return [
    [
        'name' => 'Timetables',
        'flag' => 'timetable.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'timetable.create',
        'parent_flag' => 'timetable.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'timetable.edit',
        'parent_flag' => 'timetable.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'timetable.destroy',
        'parent_flag' => 'timetable.index',
    ],
];
