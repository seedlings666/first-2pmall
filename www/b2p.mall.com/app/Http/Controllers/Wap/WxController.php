<?php

namespace App\Http\Controllers\Wap;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Controller;
use App\Providers\Wx\WxModule;
use App\Providers\Wx\Helper;
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
    public function getUserInfo(Input $input,WxModule $module)
    {
        dd(Session::get("redirect_url"));
        return redirect($redirect_url);

        /*
        $redirect_url = $module->redirectUrl($controller, $fun);

        $code  = $input->get('code');
        $state = $input->get('state');
        $module->saveUserInfo($code);

        //参数
        if (func_num_args() > 4) {
            $args = func_get_args();
            $args = array_splice($args, 4);
            $redirect_url .= '/' . implode($args, '/');
        }

        return redirect($redirect_url);
         */
    }


    /**
     * 获取url
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-04  00:21:14
     */
    public function getUrl()
    {
        return Helper::wechatUrl();
    }
}
