<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('di_places', function (Blueprint $table) {
            $table->foreignId('province_id')->nullable();
            $table->foreignId('district_id')->nullable();
            $table->foreignId('ward_id')->nullable();
        });
    }

    public function down(): void
    {
        Schema::table('di_places', function (Blueprint $table) {
            $table->dropColumn('province_id');
            $table->dropColumn('district_id');
            $table->dropColumn('ward_id');
        });
    }
};
