<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('au_cities', function (Blueprint $table) {
            $table->id();
            $table->string('code', 10)->unique();
            $table->string('name', 255);
            $table->string('type', 50);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        /*Schema::create('au_districts', function (Blueprint $table) {
            $table->id();
            $table->string('code', 10)->unique();
            $table->string('name', 255);
            $table->string('type', 50);
            $table->foreignId('province_id')->constrained('au_provinces')->cascadeOnDelete();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });*/

        Schema::create('au_communes', function (Blueprint $table) {
            $table->id();
            $table->string('code', 15)->unique();
            $table->string('name', 255);
            $table->string('type', 50);
            $table->foreignId('city_id')->constrained('au_cities')->cascadeOnDelete();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('au_communes');
        Schema::dropIfExists('au_cities');
    }
};
