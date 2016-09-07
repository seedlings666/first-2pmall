<?php

namespace App\Providers\Manage;

use Validator;
use App;

/**
 * 管理员
 * @author chentengfeng @create_at 2016-09-06  12:25:58
 */
class ManageModule
{
    /**
     * 密码加密
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    private function toolEncrypt($password)
    {
        return substr(md($password), 0, -2);
    }

    /**
     * 检测用户是否登录
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  12:34:26
     */
    public function checkPassword($user_name, $password)
    {
        return App::make('ManageModel')->select()
                    ->where('user_name', $user_name)
                    ->where('password', $this->toolEncrypt($password))
                    ->first();
    }

    /**
     *  列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  12:25:58
     */
    public function index(array $condition=[])
    {
        $rule = array(
            'page' => ['sometimes', 'required','integer','min:1'],
            'page_number' => ['sometimes', 'required','integer','min:1'],
        );
        
        $validate = Validator::make($condition, $rule);
        
        //校验
        if($validate->fails()){
            return Helper::error(10000,'参数错误!',$validate->messages());
        }

        $builder = App::make('ManageModel')->select();


        return $builder->paginate($page_number);
    }



    /**
     * 详情
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  12:25:58
     */
    public function show($id)
    {
        if (empty($id) || !is_numeric($id)) {
            return Helper::error(10000, '参数错误');
        }

        $select = [
            'id',
            'address',
            'name',
            'shopkeeper_id',
            'status',
        ];

        return App::make('ManageModel')->select($select)->find($id);
    }


    /**
     * 保存
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  12:25:58
     */
    public function store(array $params)
    {
        $rule = array(
            'id'           => ['sometimes', 'required','integer','min:1'],
            'work_number'  => ['required'],
            'user_name'    => ['required'],
            'password'     => ['sometimes','required'],
            'nick_name'    => ['required'],
            'mobile_phone' => ['required','integer'],
            'role_id'      => ['required','integer','min:1'],
            'status'       => ['required','boolean','in:0,1'],
        );

        //用户名称唯一
        $unique_name = "unique:zo_manage,user_name";
        if (isset($params['id'])) {
            $unique_name .= ",{$params['id']}";
        }
        $rule['user_name'][] = $unique_name;
        
        $validate = Validator::make($params, $rule);
        
        //校验
        if($validate->fails()){
            return Helper::error(10000,'参数错误!',$validate->messages());
        }

        $model = App::make('ManageModel');

        if (isset($params['id'])) {
            $model = $model->find('id', $params['id']);
            if (empty($model)) {
                return Helper::error(80003, '查找不到对应的用户');
            }
        }

        $model->work_number  = $params['work_number'];
        $model->user_name    = $params['user_name'];
        $model->nick_name    = $params['nick_name'];
        $model->mobile_phone = $params['mobile_phone'];
        $model->role_id      = $params['role_id'];
        $model->status       = $params['status'];
        $model->password     = $this->toolEncrypt($params['password']);
        if (!$model->save()) {
            return Helper::error(80002, '用户信息保存失败');
        }
    }


    /**
     * 保存店铺与用户的关系
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function joinShop($user_id, $shop_id)
    {
        if (empty($user_id) || !is_numeric($user_id) || empty($shop_id) || !is_numeric($shop_id)) {
            return Helper::error(10000, '参数错误');
        }

        $model = App::make('ManageShopRelationModel');

        $model->user_id = $user_id;
        $model->shop_id = $shop_id;

        if (!$model->save()) {
            return Helper::error(80004, '保存店铺与用户从属关系失败');
        }
    }

    /**
     * 离开店铺
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function leaveShop($user_id, $shop_id)
    {
        if (empty($user_id) || !is_numeric($user_id) || empty($shop_id) || !is_numeric($shop_id)) {
            return Helper::error(10000, '参数错误');
        }

        $model = App::make('ManageShopRelationModel');

        $builder = $model->where('user_id', $user_id)->where('shop_id', $shop_id);

        if ($builder->delete() == 0) {
            return Helper::error(80005, '删除店铺与员工关系失败');
        }
    }


    /**
     * 用户关系列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function relationList($shop_id)
    {
        if (empty($shop_id) || !is_numeric($shop_id)) {
            return Helper::error(10000, '参数错误');
        }

        $model = App::make('ManageShopRelationModel');

        $relation = $model->select('id', 'user_id', 'shop_id')
                            ->with('manage')
                            ->where('shop_id', $shop_id)
                            ->get();

        return $relation->lists('manage');
    }
}
