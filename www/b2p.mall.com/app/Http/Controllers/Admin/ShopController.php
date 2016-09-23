<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Manage\ManageModule;
use App\Providers\Manage\ShopModule;
use \DB;
use \Illuminate\Http\Request;

/**
 * 店铺
 * @author chentengfeng @create_at 2016-09-06  00:23:57
 */
class ShopController extends Controller
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
    public function postStore(Request $request, ShopModule $module, ManageModule $manageModule)
    {
        $params = [
            'address' => $request->get('address'),
            'name'    => $request->get('name'),
            'alias'   => $request->get('alias'),
            'status'  => $request->get('status'),
        ];
        //角色关联不再通过该role_id进行
        $manageData = array_merge(
            $request->only(['user_name', 'password', 'nick_name', 'mobile_phone', 'status']),
            ['work_number' => 0, 'role_id' => 0]
        );

        DB::beginTransaction();
        $manage = $manageModule->store($manageData);
        if (isset($manage['err_code'])) {
            DB::rollBack();
            return back();
        }
        $params['shopkeeper_id'] = $manage->id;
        $shop                    = $module->store($params);
        if (isset($shop['err_code'])) {
            DB::rollBack();
            return back();
        }
        $relation = $manageModule->joinShop($manage->id, $shop->id);
        if (isset($relation['err_code'])) {
            DB::rollBack();
            return back();
        }
        \App\Models\Manage::find($manage->id, ['id'])
            ->attachRole(\App\Models\Role::where('name', 'seller')->first(['id']));
        DB::commit();

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
        $show       = $module->show($shop_id);
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
            'id'            => $request->get('id'),
            'address'       => $request->get('address'),
            'name'          => $request->get('name'),
            'alias'         => $request->get('alias'),
            'status'        => $request->get('status'),
            'shopkeeper_id' => $request->get('shopkeeper_id'),
        ];

        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            return back();
        }

        return redirect(action('Admin\ShopController@getIndex'));
    }
}
