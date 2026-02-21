<?php

use Botble\Widget\AbstractWidget;
use Illuminate\Support\Collection;

class FooterContactWidget extends AbstractWidget
{
    public function __construct()
    {
        parent::__construct([
            'name' => __('FooterContact'),
            'description' => __('Widget description'),
        ]);
    }

    protected function data(): array|Collection
    {
        return [];
    }
}
