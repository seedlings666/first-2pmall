<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesResources;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, AuthorizesResources, DispatchesJobs, ValidatesRequests;

    /**
     * 判断是否管理员
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-09-19
     * @return boolean    [description]
     */
    protected function isAdmin()
    {
        return \Entrust::ability('admin,owner', '');
    }

    /**
     * 使用seesion里面is_system的状态判断是否系统用户判断
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-09-20
     * @return boolean    [description]
     */
    protected function isSystem()
    {
        return \Session::get('is_system') == 1;
    }
}
