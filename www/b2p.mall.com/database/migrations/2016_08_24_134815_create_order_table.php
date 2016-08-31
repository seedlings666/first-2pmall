<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zo_orders', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('group_rp')
                ->unsigned()
                ->default(0)
                ->comment('拼团顺序：1拼团第一单,2为拼团第二单');
            $table->tinyInteger('order_status')
                ->default(0)
                ->comment('订单状态:0初始,1创建订单成功,2拼团成功');
            $table->tinyInteger('pay_status')
                ->default(0)
                ->comment('支付状态:0初始,1支付中,2支付成功,3返还现金');
            $table->integer('group_id')->unsigned()->default(0)->comment('拼团id,使用拼团第一单的order_id');
            $table->integer('user_id')->unsigned()->default(0)->comment('用户id');
            $table->bigInteger('order_sn')->unsigned()->default(0)->comment('订单编号');
            $table->bigInteger('pay_sn')
                ->unsigned()
                ->default(0)
                ->comment('支付编号,用于订单支付时所用编号');
            $table->decimal('order_amount', 10, 2)->default(0.00)->comment('订单金额,实际支付金额');
            $table->decimal('preferential_amount', 10, 2)->default(0.00)->comment('订单实际优惠金额');
            $table->decimal('group_preferential_amount', 10, 2)
                ->default(0.00)
                ->comment('订单拼团优惠金额，拼团成功后该金额才会给定到coupon_amount');
            $table->char('order_subject', 168)->default('')->comment('订单标题');
            // $table->text('order_descript')->default('')->comment('订单描述');
            $table->softDeletes();
            $table->timestamps();

            $table->unique('order_sn');
            $table->index('group_rp');
            $table->index('order_status');
            $table->index('pay_status');
            $table->index('group_id');
            $table->index('user_id');
            $table->index('order_sn');
            $table->index('pay_sn');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('zo_orders');
    }
}
