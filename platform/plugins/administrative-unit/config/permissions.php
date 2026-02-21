<?php

return [
    [
        'name' => 'Administrative units',
        'flag' => 'administrative-unit.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'administrative-unit.create',
        'parent_flag' => 'administrative-unit.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'administrative-unit.edit',
        'parent_flag' => 'administrative-unit.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'administrative-unit.destroy',
        'parent_flag' => 'administrative-unit.index',
    ],
];
