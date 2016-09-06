<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //商品模型
        $this->app->bind('GoodsModel','App\Goods');
        //图片模型,仅仅用于商品图片
        $this->app->bind('GoodsImagesModel','App\GoodsImages');
        //商品 sku 模型
        $this->app->bind('GoodsSkuModel','App\GoodsSku');
        //商品属性模型
        $this->app->bind('GoodsAttrModel','App\GoodsAttr');
        //商品属性模型
        $this->app->bind('GoodsAttrValueModel','App\GoodsAttrValue');


        $this->app->bind('ManageModel', 'App\Providers\Manage\Models\Manage');
        $this->app->bind('ManageShopRelationModel', 'App\Providers\Manage\Models\ManageShopRelation');
        $this->app->bind('ShopModel', 'App\Providers\Manage\Models\Shop');
    }
}
