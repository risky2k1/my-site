<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('di_place_categories', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('di_place_categories_translations', function (Blueprint $table) {
            $table->string('lang_code', 20);
            $table->foreignId('di_place_categories_id');
            $table->string('name', 255)->nullable();
            $table->primary(['lang_code', 'di_place_categories_id'], 'di_place_category_translations_primary');
        });

        Schema::create('di_places', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->text('description')->nullable();
            $table->string('address', 255)->nullable();
            $table->decimal('latitude', 20, 8)->nullable();
            $table->decimal('longitude', 20, 8)->nullable();
            $table->string('price_range', 50)->nullable();
            $table->string('image')->nullable();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('di_places_translations', function (Blueprint $table) {
            $table->string('lang_code', 10);
            $table->foreignId('di_places_id');
            $table->string('name', 255)->nullable();
            $table->text('description')->nullable();
            $table->string('address', 255)->nullable();
            $table->primary(['lang_code', 'di_places_id'], 'di_places_translations_primary');
        });

        Schema::create('di_place_category_place', function (Blueprint $table) {
            $table->foreignId('place_id');
            $table->foreignId('category_id');
        });

        Schema::create('di_place_reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('place_id');
            $table->foreignId('user_id');
            $table->tinyInteger('rating')->default(5);
            $table->text('comment')->nullable();
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('di_place_favorites', function (Blueprint $table) {
            $table->id();
            $table->foreignId('place_id');
            $table->foreignId('user_id');
            $table->timestamps();
        });

        Schema::create('di_place_moods', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });

        Schema::create('di_place_moods_translations', function (Blueprint $table) {
            $table->string('lang_code', 10);
            $table->foreignId('di_place_moods_id');
            $table->string('name', 255)->nullable();
            $table->primary(['lang_code', 'di_place_moods_id'], 'di_place_moods_translations_primary');
        });

        Schema::create('di_place_mood_place', function (Blueprint $table) {
            $table->foreignId('place_id');
            $table->foreignId('mood_id');
        });

    }

    public function down(): void
    {
        Schema::dropIfExists('date_ideas');
        Schema::dropIfExists('date_ideas_translations');
    }
};
