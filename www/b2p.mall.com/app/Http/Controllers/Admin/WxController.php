<?php

namespace App\Http\Controllers\Admin;

use EasyWeChat\Foundation\Application;
use App\Http\Controllers\Controller;

/**
 * Class WxController
 * @author chentengfeng @create_at 2016-09-11  11:13:04
 */
class WxController extends Controller
{
    /**
     * 设置菜单
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-11  11:13:04
     */
    public function getSetMenu(Application $wechat_app)
    {
        $uri = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=[APPID]&redirect_uri=[redirect]&response_type=code&scope=snsapi_base&state=menu#wechat_redirect';
        $buttons = [];

        //拼团
        $buttons[] = [
            'name' => '拼团',
            'type' => 'scancode_push',
            'key'  => 'menu_scancode_push',
        ];

        //个人中心
        $buttons[] = [
            'name' => '个人中心',
            'type' => 'view',
            'url'  => str_replace(
                ['[APPID]', '[redirect]'], 
                [config('wechat.app_id'), urlencode(action('Wap\UserController@getShow'))], 
                $uri
            ),
        ];

        //订单详情
        $buttons[] = [
            'name' => '订单详情',
            'type' => 'view',
            'url'  => str_replace(
                ['[APPID]', '[redirect]'], 
                [config('wechat.app_id'), urlencode(action('Wap\UserController@getShow'))], 
                $uri
            ),
        ];

        $wechat_app->menu->add($buttons);
        return '菜单生成成功';
    }
}
