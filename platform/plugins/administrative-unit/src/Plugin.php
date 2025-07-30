<?php

namespace Botble\AdministrativeUnit;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Administrative Units');
        Schema::dropIfExists('Administrative Units_translations');
    }
}
