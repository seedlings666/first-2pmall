<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaySnTmpTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zo_pay_sn_tmp', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pay_sn_id')->unsigned()->default(0)->comment('支付编号');
            $table->integer('user_id')->unsigned()->default(0)->comment('用户id');
            $table->softDeletes();
            $table->timestamps();
            $table->text('attach')
                ->default('')
                ->comment('临时支付编号,附属数据，用于多用于对一个支付编号所用');

            $table->index('pay_sn_id');
            $table->index('user_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('zo_pay_sn_tmp');
    }
}
