<?php

namespace Botble\DateIdeas;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Date Ideas');
        Schema::dropIfExists('Date Ideas_translations');
    }
}
