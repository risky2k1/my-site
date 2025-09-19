<?php

namespace Botble\AdministrativeUnit;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('au_communes');
        Schema::dropIfExists('au_cities');
    }
}
