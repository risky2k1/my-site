<?php

return [
    [
        'name' => 'Favorite items',
        'flag' => 'favorite-items.index',
    ],
    [
        'name' => 'Create',
        'flag' => 'favorite-items.create',
        'parent_flag' => 'favorite-items.index',
    ],
    [
        'name' => 'Edit',
        'flag' => 'favorite-items.edit',
        'parent_flag' => 'favorite-items.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'favorite-items.destroy',
        'parent_flag' => 'favorite-items.index',
    ],
];
