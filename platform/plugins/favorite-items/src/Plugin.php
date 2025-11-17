<?php

namespace Botble\FavoriteItems;

use Illuminate\Support\Facades\Schema;
use Botble\PluginManagement\Abstracts\PluginOperationAbstract;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('Favorite Items');
        Schema::dropIfExists('Favorite Items_translations');
    }
}
