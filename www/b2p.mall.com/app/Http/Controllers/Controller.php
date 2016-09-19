<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesResources;

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
}
