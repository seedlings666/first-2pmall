<?php

namespace App\Http\Middleware;

use Closure;
use App;
use Session;
use App\Providers\Wx\WxModule;
use App\Providers\Wx\Helper;
use Illuminate\Http\RedirectResponse;

/**
 * 登录过滤
 * @author chentengfeng @create_at 2016-09-03  21:50:53
 */
class WxLogin
{
	/**
     * 返回请求过滤器
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->has('code')) {
            $module = App::make(App\Providers\Wx\WxModule::class);
            $rs = $module->saveUserInfo($request->get('code'));
            if ($rs instanceof RedirectResponse) {
                return $rs;
            }
            return $next($request);
        }

        //重定向到微信授权
        if (!Session::has('user')) {
            Session::put('redirect_url', url()->getRequest()->getRequestUri());
            return redirect(Helper::wechatUrl());
        }

        return $next($request);
    }
}
