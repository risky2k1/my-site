<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (!Schema::hasTable('timeline_categories')) {
            Schema::create('timeline_categories', function (Blueprint $table) {
                $table->id();
                $table->string('name', 255);
                $table->text('description')->nullable();
                $table->tinyInteger('order')->default(0);
                $table->string('status', 60)->default('published');
                $table->timestamps();
            });
        }

        if (!Schema::hasTable('timelines')) {
            Schema::create('timelines', function (Blueprint $table) {
                $table->id();
                $table->string('name', 255)->nullable();
                $table->text('description')->nullable();
                $table->string('image')->nullable();
                $table->tinyInteger('order')->default(0);
                $table->string('status', 60)->default('published');
                $table->timestamps();
            });
        }

        if (!Schema::hasTable('timeline_members')) {
            Schema::create('timeline_members', function (Blueprint $table) {
                $table->id();
                $table->foreignId('timeline_id')->constrained('timelines')->cascadeOnDelete();

                $table->foreignId('user_id')->nullable()->constrained('members')->nullOnDelete();

                $table->string('name', 255)->nullable();
                $table->string('phone', 255)->nullable();
                $table->string('email', 255)->nullable();
                $table->string('avatar')->nullable();
                $table->string('role', 100)->nullable();

                $table->timestamps();
            });
        }

        if (!Schema::hasTable('timeline_items')) {
            Schema::create('timeline_items', function (Blueprint $table) {
                $table->id();
                $table->string('title', 255);
                $table->text('description')->nullable();

                $table->longText('content')->nullable();

                $table->foreignId('category_id')->nullable();
                $table->foreignId('place_id')->nullable();

                $table->date('date')->nullable();
                $table->string('image')->nullable();
                $table->string('icon', 60)->nullable();
                $table->string('icon2', 60)->nullable();
                $table->tinyInteger('order')->default(0);
                $table->string('status', 60)->default('published');


                $table->timestamps();
            });
        }

        if (!Schema::hasTable('timelines_translations')) {
            Schema::create('timelines_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('timelines_id');

                $table->string('name', 255)->nullable();
                $table->text('description')->nullable();

                $table->primary(['lang_code', 'timelines_id'], 'timelines_translations_primary');
            });
        }

        if (!Schema::hasTable('timeline_items_translations')) {
            Schema::create('timeline_items_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('timeline_items_id');

                $table->string('title', 255)->nullable();
                $table->text('description')->nullable();
                $table->longText('content')->nullable();

                $table->primary(['lang_code', 'timeline_items_id'], 'timeline_items_translations_primary');
            });
        }

        if (!Schema::hasTable('timeline_categories_translations')) {
            Schema::create('timeline_categories_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('timeline_categories_id');

                $table->string('name', 255)->nullable();
                $table->text('description')->nullable();

                $table->primary(['lang_code', 'timeline_categories_id'], 'timeline_categories_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('timelines');
        Schema::dropIfExists('timeline_items');
        Schema::dropIfExists('timelines_translations');
    }
};
