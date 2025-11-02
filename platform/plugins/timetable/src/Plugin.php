<?php

namespace Botble\Timetable;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Timetables');
        Schema::dropIfExists('Timetables_translations');
    }
}
