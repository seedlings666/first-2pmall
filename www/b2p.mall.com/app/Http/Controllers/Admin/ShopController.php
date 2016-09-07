<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Manage\ManageModule;
use App\Providers\Manage\ShopModule;
use \Illuminate\Http\Request;
use Session;

/**
 * 店铺
 * @author chentengfeng @create_at 2016-09-06  00:23:57
 */
class ShopController  extends Controller
{
    /**
     * 店铺展示
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  00:23:57
     */
    public function getIndex(ShopModule $module, Request $request)
    {
        $condition = [
            'page'        => $request->get('page', 1),
            'page_number' => $request->get('page_number', 15),
        ];
        $list = $module->index($condition);
        return view('admin.shop')->with(compact('list'));
    }

    /**
     * 店铺提交
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  00:23:57
     */
    public function getStore()
    {
        return view('admin.shop_create');
    }


    /**
     * 店铺保存
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function postStore(Request $request, ShopModule $module)
    {
        $params = [
            'address'       => $request->get('address'),
            'name'          => $request->get('name'),
            'alias'         => $request->get('alias'),
            'status'        => $request->get('status'),
        ];

        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            return back();
        }

        return redirect(action('Admin\ShopController@getIndex'));
    }


    /**
     * 编辑
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function getEdit(ShopModule $module, $shop_id)
    {
        $show = $module->show($shop_id);
        $manag_list = [];
        if ($show->manageShopRelation && !$show->manageShopRelation->isEmpty()) {
            $manag_list = $show->manageShopRelation->lists('manage')->lists('nick_name', 'id');
        }
        return view('admin.shop_edit')->with(compact('show', 'manag_list'));
    }


    /**
     * 提交修改
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function postEdit(ShopModule $module, Request $request)
    {
        $params = [
            'id'      => $request->get('id'),
            'address' => $request->get('address'),
            'name'    => $request->get('name'),
            'alias'   => $request->get('alias'),
            'status'  => $request->get('status'),
            'shopkeeper_id' => $request->get('shopkeeper_id'),
        ];

        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            return back();
        }

        return redirect(action('Admin\ShopController@getIndex'));
    }
}
