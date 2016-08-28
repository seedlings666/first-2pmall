<?php

namespace App\Http\Controllers\Wap;
use App\Http\Controllers\Controller;
use App\Providers\Wx\WxModule;
use Request;
use Config;

/**
 * 微信相关接口
 * @author chentengfeng @create_at 2016-08-27  23:34:22
 */
class WxController extends Controller
{
    /**
     * 用户信息
     * wap/wx/user-info/{controller}/{fun}
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-27  23:34:22
     */
    public function getUserInfo(Request $request,WxModule $module, $controller='', $fun='')
    {
        $redirect_url = $module->redirectUrl($controller, $fun);

        $code  = $request->code;
        $state = $request->state;

        return redirect($redirect_url);
    }
}
