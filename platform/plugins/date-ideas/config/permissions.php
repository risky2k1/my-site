<?php

return [
    [
        'name' => 'Date ideas',
        'flag' => 'date-ideas.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'date-ideas.create',
        'parent_flag' => 'date-ideas.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'date-ideas.edit',
        'parent_flag' => 'date-ideas.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'date-ideas.destroy',
        'parent_flag' => 'date-ideas.index',
    ],
];
