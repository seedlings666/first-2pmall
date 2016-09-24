<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Manage\ManageModule;
use App\Providers\Manage\ShopModule;
use DB;
use Session;
use \Illuminate\Http\Request;

/**
 * 员工
 * @author chentengfeng @create_at 2016-09-07  08:31:58
 */
class ManageController extends Controller
{

    /**
     * 登录
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  12:34:26
     */
    public function postLogin(Request $request, ManageModule $module)
    {
        $password  = $request->get('password');
        $user_name = $request->get('user_name');

        //默认提供一个admin账号
        if ($user_name == 'admin' && '3f136c1fa740470860f8da0ef69984' == $module->toolEncrypt($password)) {
            \Auth::guard('admin')->loginUsingId(1);
            Session::put('is_system', (int) $this->isAdmin());

            Session::put('admin_user', [
                'id'      => 1,
                'shop_id' => 1,
            ]);
            //return redirect()->action('Admin\GoodsController@getIndex');
            return redirect()->action('Admin\ShopController@getIndex');
        }
        $manage = $module->checkPassword($user_name, $password);
        if (empty($manage)) {
            return back();
        }

        //认证登录
        \Auth::guard('admin')->loginUsingId($manage->id);
        Session::put('is_system', (int) $this->isAdmin());

        $shop_id = $manage->manageShopRelation && !empty($manage->manageShopRelation) ? $manage->manageShopRelation->id : 0;
        Session::put('admin_user', [
            'id'      => $manage->id,
            'shop_id' => $shop_id,
        ]);

        //根据权限来
        return redirect()->action('Admin\GoodsController@getIndex');
    }

    /**
     * 员工列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function getIndex(Request $request, ManageModule $module)
    {
        $condition = [
            'page'        => $request->get('page', 1),
            'page_number' => $request->get('page_number', 15),
            'shop_id'     => Session::get('admin_user.shop_id'),
        ];

        $list = $module->index($condition, $this->isSystem());

        return view('admin.shop_user')->with(compact('list'));
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
        $shop_id   = Session::get('admin_user.shop_id');
        $is_system = $this->isSystem();
        return view('admin.shop_user_create')->with(compact('shop_list', 'shop_id', 'is_system'));
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
            'role_id'      => $request->get('role_id', 0),
            'status'       => 1,
        ];

        DB::beginTransaction();
        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            DB::rollBack();
            return back();
        }

        $manage_id = $rs->id;
        $shop_id   = $this->isSystem() ? $request->get('shop_id') : Session::get('admin_user.shop_id');
        $rs        = $module->joinShop($rs->id, $shop_id);
        if (isset($rs['err_code'])) {
            DB::rollBack();
            return back();
        }
        \App\Models\Manage::find($manage_id, ['id'])
            ->attachRole(\App\Models\Role::where('name', 'shop-staff')->first(['id']));
        DB::commit();

        return redirect()->action('Admin\ManageController@getIndex');
    }

    /**
     * 编辑
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function getEdit(Request $request, ManageModule $module, ShopModule $module_shop, $manage_id)
    {
        $shop_list = $module_shop->simpleList();
        $show      = $module->show($manage_id);
        $is_system = $this->isSystem();
        if (!$is_system && Session::get('admin_user.shop_id') != $show->manageShopRelation->shop_id) {
            \App::abort(404);
        }
        return view('admin.shop_user_edit')->with(compact('shop_list', 'show', 'is_system'));
    }

    /**
     * undocumented function
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  08:31:58
     */
    public function postEdit(Request $request, ManageModule $module, ShopModule $module_shop)
    {
        $params = [
            'id'           => $request->get('id'),
            'work_number'  => $request->get('work_number'),
            'user_name'    => $request->get('user_name'),
            'nick_name'    => $request->get('nick_name'),
            'mobile_phone' => $request->get('mobile_phone'),
            'role_id'      => $request->get('role_id', 0),
            'status'       => $request->get('status'),
        ];
        if (!empty($request->get('password'))) {
            $params['password'] = $request->get('password');
        }
        $shop_id = $this->isSystem() ? $request->get('shop_id') : Session::get('admin_user.shop_id');
        if (!$this->isSystem() && Session::get('admin_user.shop_id') != $request->get('shop_id')) {
            \App::abort(500);
        }

        DB::beginTransaction();
        $rs = $module->store($params);
        if (isset($rs['err_code'])) {
            DB::rollBack();
            return back();
        }

        $rs = $module->joinShop($rs->id, $shop_id);
        if (isset($rs['err_code'])) {
            DB::rollBack();
            return back();
        }
        DB::commit();

        return redirect()->action('Admin\ManageController@getIndex');
    }
}
