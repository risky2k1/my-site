<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (Schema::hasTable('blocks_translations')) {
            return;
        }

        Schema::create('blocks_translations', function (Blueprint $table): void {
            $table->string('lang_code', 20);
            $table->foreignId('blocks_id');
            $table->string('name')->nullable();
            $table->string('description', 400)->nullable();
            $table->longText('content')->nullable();

            $table->primary(['lang_code', 'blocks_id'], 'blocks_translations_primary');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('blocks_translations');
    }
};
