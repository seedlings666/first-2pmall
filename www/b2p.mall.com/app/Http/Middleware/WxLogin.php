<?php

namespace App\Http\Middleware;

use Closure;
use App;
use App\Providers\Wx\WxModule;

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
            $module->saveUserInfo($request->get('code'));
            return $next($request);
        }
        ////重定向到微信授权
        //if (!Session::has('user')) {
            //$call = url()->getRequest()->getRouteResolver();
            //$route = $call();
            //$info = explode('@', last(explode('\\', $route_path->getActionName())));
            //$controller = lcfirst(str_replace('Controller', '',  $info[0]));
            //$fun = lcfirst(str_replace(['get', 'post'], '',  $info[1]));
            //$params = $route->parameters();
            //dd($params);
            //dd($route);

            //return redirect();
        //}

        return $next($request);
    }
}
