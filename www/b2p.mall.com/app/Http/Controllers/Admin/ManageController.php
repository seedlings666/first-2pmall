<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Manage\ManageModule;
use App\Providers\Manage\ShopModule;
use \Illuminate\Http\Request;

/**
 * 员工
 * @author chentengfeng @create_at 2016-09-07  08:31:58
 */
class ManageController
{
    /**
     * 员工列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function getIndex(Request $request, ManageModule $module)
    {
        $condition = [
            'page' => $request->get('page', 1),
            'page_number' => $request->get('page_number', 15),
        ];

        $list = $module->index($condition);

        return view('')->with(compact('list'));
    }

    /**
     * 保存
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function getStore(ShopModule $module_shop)
    {
        $shop_list = $module_shop->simpleList();
        return view('')->with(compact('shop_list'));
    }

    /**
     * undocumented function
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function postStore(Request $request, ManageModule $module)
    {
        $params = [
            'work_number'  => $request->get('work_number'),
            'user_name'    => $request->get('user_name'),
            'password'     => $request->get('password'),
            'nick_name'    => $request->get('nick_name'),
            'mobile_phone' => $request->get('mobile_phone'),
            'role_id'      => $request->get('role_id'),
            'status'       => $request->get('status')
        ];

        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            return back();
        }

        return redirect()->action('Manage\ManageController@getIndex');
    }

    /**
     * 编辑
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function getEdit(Request $request, ManageModule $module, $manage_id)
    {
        $shop_list = $module_shop->simpleList();
        $show = $module_shop->show($manage_id);
        return view('')->with(compact('shop_list'));
    }

    /**
     * undocumented function
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function postEdit()
    {
        $params = [
            'id'           => $request->get('id'),
            'work_number'  => $request->get('work_number'),
            'user_name'    => $request->get('user_name'),
            'nick_name'    => $request->get('nick_name'),
            'mobile_phone' => $request->get('mobile_phone'),
            'role_id'      => $request->get('role_id'),
            'status'       => $request->get('status')
        ];
        if (!empty($request->get('password'))) {
            $params['password'] = $request->get('password');
        }

        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            return back();
        }

        return redirect()->action('Manage\ManageController@getIndex');
    }
}
