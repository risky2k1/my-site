<?php

namespace Botble\Timeline;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Timelines');
        Schema::dropIfExists('Timelines_translations');
    }
}
