<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('di_places', function (Blueprint $table) {
            $table->foreignId('au_city_id')->nullable();
            $table->foreignId('au_commune_id')->nullable();
        });
    }

    public function down(): void
    {
        Schema::table('di_places', function (Blueprint $table) {
            $table->dropColumn('au_city_id');
            $table->dropColumn('au_commune_id');
        });
    }
};
