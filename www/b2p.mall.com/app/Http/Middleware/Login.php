<?php

namespace App\Http\Middleware;

use Closure;

/**
 * 登录过滤
 * @author chentengfeng @create_at 2016-09-03  21:50:53
 */
class Login
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
        //重定向到微信授权
        if (!Session::has('user')) {
            $call = (url()->getRequest()->getRouteResolver());
            $route_path = $call()->getActionName();
            $info = explode('@', last(explode('\\', $route_path)));
            $controller = lcfirst(str_replace('Controller', '',  $info[0]));
            $fun = lcfirst(str_replace(['get', 'post'], '',  $info[1]));

            return redirect();
        }

        return $next($request);
    }
}
