<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;
use App\Providers\Wx\UserModule;
use EasyWeChat\Foundation\Application;
use View;
use Session;

/**
 * 用户
 * @author chentengfeng @create_at 2016-09-03  21:09:40
 */
class UserController extends Controller
{
    /**
     * 用户详细页面
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-03  21:09:40
     */
    public function getShow(UserModule $module, Application $wechat_app)
    {
        Session::put('user', [
            'id'        => 1,
            'avatar'    => '123',
            'nick_name' => '123'
        ]);
        $user = $module->userInfo(Session::get('user.id'));
        $js = $wechat_app->js;

        return view('wap.userInfo')->with(compact('user', 'js'));
    }
}
