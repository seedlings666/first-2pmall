<?php

namespace App\Http\Middleware;

use Closure;
use App;
use Session;

/**
 * Class AdminLogin
 * @author chentengfeng @create_at 2016-09-07  21:53:27
 */
class AdminLogin
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
        if (!Session::has('user')) {
            return redirect()->route('login');
        }

        return $next($request);
    }
}
