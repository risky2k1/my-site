<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasTable('favorite_items')) {
            Schema::create('favorite_items', function (Blueprint $table) {
                $table->id();
                $table->string('name', 255);
                $table->string('status', 60)->default('published');
                $table->timestamps();
            });
        }

        if (! Schema::hasTable('favorite_items_translations')) {
            Schema::create('favorite_items_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('favorite_items_id');
                $table->string('name', 255)->nullable();

                $table->primary(['lang_code', 'favorite_items_id'], 'favorite_items_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('favorite_items');
        Schema::dropIfExists('favorite_items_translations');
    }
};
