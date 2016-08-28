<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePaySnTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zo_pay_sn', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('group_rp')
                ->unsigned()
                ->default(0)
                ->comment('拼团顺序：1拼团第一单,2为拼团第二单');
            $table->tinyInteger('status')
                ->unsigned()
                ->default(0)
                ->comment('订单编号状态:0初始,1该编号已被订单使用');
            $table->integer('user_id')->unsigned()->default(0)->comment('用户id');
            $table->integer('group_id')->unsigned()->default(0)->comment('拼团id,使用拼团第一单的order_id');
            $table->integer('order_id')->unsigned()->default(0)->comment('订单id');
            $table->bigInteger('pay_sn')
                ->unsigned()
                ->default(0)
                ->comment('支付编号,用于订单支付时所用编号');
            $table->softDeletes();
            $table->timestamps();
            $table->text('attach')->default('')->comment('支付编号,附属数据');

            $table->unique('pay_sn');
            $table->index('group_rp');
            $table->index('status');
            $table->index('user_id');
            $table->index('group_id');
            $table->index('order_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('zo_pay_sn');
    }
}
