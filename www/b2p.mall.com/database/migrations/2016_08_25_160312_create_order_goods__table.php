<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrderGoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('zo_order_goods', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id')->unsigned()->default(0)->comment('订单id');
            $table->integer('goods_id')->unsigned()->default(0)->comment('商品id');
            $table->integer('sku_id')->unsigned()->default(0)->comment('skuid');
            $table->integer('goods_number')->unsigned()->default(0)->comment('商品购买数量');
            $table->decimal('sale_price', 10, 2)->default(0.00)->comment('商品销售价格');
            $table->decimal('buy_price', 10, 2)->default(0.00)->comment('商品实际购买价格');
            $table->string('goods_title')->default('')->comment('商品名称');
            $table->text('goods_spec')->default('')->comment('商品规格');
            $table->text('goods_img')->default('')->comment('商品显示图片');
            $table->softDeletes();
            $table->timestamps();
            
            $table->index('order_id');
            $table->index('goods_id');
            $table->index('sku_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('zo_order_goods');
    }
}
