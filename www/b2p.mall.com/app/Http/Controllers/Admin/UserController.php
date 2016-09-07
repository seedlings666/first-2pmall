<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Manage\UserModule;
use \Illuminate\Http\Request;

/**
 * Class UserController
 * @author chentengfeng @create_at 2016-09-06  23:41:55
 */
class UserController extends Controller
{
    /**
     *  用户列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  23:41:55
     */
    public function getIndex(UserModule $module, Request $request)
    {
        $condition = [
            'page' => $request->get('page', 1),
            'page_number' => $request->get('page_number', 15),
        ];
        $list = $module->index($condition);
        return view('admin.user')->with(compact('list'));
    }
}
