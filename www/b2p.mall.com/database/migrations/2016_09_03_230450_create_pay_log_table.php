<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePayLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pay_log', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('status')
                ->unsigned()
                ->default(0)
                ->comment('支付:0初始,1支付成功');
            $table->integer('user_id')->unsigned()->default(0)->comment('用户id');
            $table->integer('order_id')->unsigned()->default(0)->comment('订单id');
            $table->bigInteger('pay_sn')
                ->unsigned()
                ->default(0)
                ->comment('支付编号,用于订单支付时所用编号');
            $table->char('pay_code', 16)->default('')->comment('支付方式代码');
            $table->text('data')->default('')->comment('记录数据');
            $table->softDeletes();
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
        Schema::drop('pay_log');
    }
}
