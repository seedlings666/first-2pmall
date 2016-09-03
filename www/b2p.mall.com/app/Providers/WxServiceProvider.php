<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Providers\Wx\WxModule;

/**
 * 微信服务
 * @author chentengfeng @create_at 2016-09-03  20:09:33
 */
class WxServiceProvider extends ServiceProvider
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
        $this->app->bind('App\Providers\Wx\WxModule', function () {
            return new WxModule([
                'user' => 'zo_users',
                'user_wx' => 'zo_user_weixin'
            ]);
        });
    }
}
