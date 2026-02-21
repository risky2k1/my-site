<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (!Schema::hasTable('timetable_events')) {
            Schema::create('timetable_events', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->string('title');
                $table->string('room', 120)->nullable();
                $table->string('teacher', 120)->nullable();
                $table->date('start_date');
                $table->date('end_date')->nullable();
                $table->tinyInteger('weekday')->default(1);
                $table->time('start_time');
                $table->time('end_time');
                $table->string('color', 10)->nullable()->default('#667eea');
                $table->text('note')->nullable();
                $table->boolean('is_recurring')->default(false);
                $table->timestamps();
            });
        }

        if (!Schema::hasTable('timetable_events_translations')) {
            Schema::create('timetable_events_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('timetable_events_id');
                $table->string('title', 255)->nullable();

                $table->primary(['lang_code', 'timetable_events_id'], 'timetable_events_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('timetable_events');
        Schema::dropIfExists('timetables_translations');
    }
};
