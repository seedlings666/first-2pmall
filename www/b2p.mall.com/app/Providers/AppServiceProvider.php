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
    }
}
