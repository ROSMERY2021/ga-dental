<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');

            $table->string('dui')->nullable();
            $table->string('edad')->nullable();
            $table->string('licencia')->nullable();
            $table->string('address')->nullable();
            $table->string('phone')->nullable();
            $table->string('imagen')->nullable();
            $table->string('whatsapp')->nullable();
            $table->string('red_social')->nullable();
            $table->string('musica')->nullable();
            $table->string('profesion')->nullable();
            $table->text('alteraciones')->nullable();
            $table->string('como_conocio')->nullable();
            $table->text('historial')->nullable();
            $table->string('role');

            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
