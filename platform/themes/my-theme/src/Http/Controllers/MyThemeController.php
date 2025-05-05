<?php

namespace Theme\MyTheme\Http\Controllers;

use Botble\Theme\Http\Controllers\PublicController;

class MyThemeController extends PublicController
{
    public function getIndex()
    {
        return parent::getIndex();
    }

    public function getView(?string $key = null, string $prefix = '')
    {
        return parent::getView($key);
    }

    public function getSiteMapIndex(string $key = null, string $extension = 'xml')
    {
        return parent::getSiteMapIndex();
    }
}
