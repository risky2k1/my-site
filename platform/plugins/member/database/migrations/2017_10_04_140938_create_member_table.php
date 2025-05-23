<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('members', function (Blueprint $table): void {
            $table->id();
            $table->string('first_name', 120);
            $table->string('last_name', 120);
            $table->text('description')->nullable();
            $table->string('gender', 20)->nullable();
            $table->string('email')->unique();
            $table->string('password');
            $table->foreignId('avatar_id')->nullable();
            $table->date('dob')->nullable();
            $table->string('phone', 25)->nullable();
            $table->dateTime('confirmed_at')->nullable();
            $table->string('email_verify_token', 120)->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        Schema::create('member_password_resets', function (Blueprint $table): void {
            $table->string('email')->index();
            $table->string('token')->index();
            $table->timestamp('created_at')->nullable();
        });

        Schema::create('member_activity_logs', function (Blueprint $table): void {
            $table->id();
            $table->string('action', 120);
            $table->text('user_agent')->nullable();
            $table->string('reference_url')->nullable();
            $table->string('reference_name')->nullable();
            $table->ipAddress()->nullable();
            $table->foreignId('member_id')->index();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('member_activity_logs');
        Schema::dropIfExists('member_password_resets');
        Schema::dropIfExists('members');
    }
};
