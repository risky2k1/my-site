<?php

namespace Theme\TestVue\Http\Controllers;

use Botble\Theme\Facades\Theme;
use Botble\Theme\Http\Controllers\PublicController;
use Illuminate\Http\Request;

class TestVueController extends PublicController
{
    public function custom(Request $request)
    {
        dd(1123);
        return Theme::scope('date-idea')->render();
    }
}
