<?php

namespace App\Providers\Wx;

use App\Providers\Manage\Helper;

/**
 * Class ShopModule
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class ShopModule
{
    /**
     * 列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  08:26:10
     */
    public function index(array $condition)
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

        $builder = App::make('ShopModel')->select();


        return $builder->paginate($page_number);
    }

    /**
     * 更新保存
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  08:44:25
     */
    public function store(array $params)
    {
        $rule = array(
            'id'            => ['sometimes', 'required','integer','min:1'],
            'address'       => ['required'],
            'name'          => ['required'],
            'shopkeeper_id' => ['sometimes', 'required','integer','min:1'],
            'status'        => ['required','boolean','in:0,1'],
        );

        //店铺名称唯一
        $unique_name = "unique:zo_shop,name";
        if (isset($params['id'])) {
            $unique_name .= ",{$params['id']}";
        }
        $rule['name'][] = $unique_name;
        
        $validate = Validator::make($condition, $rule);
        
        //校验
        if($validate->fails()){
            return Helper::error(10000,'参数错误!',$validate->messages());
        }

        $model = App::make('ShopModel');

        if (isset($params['id'])) {
            $model = $model->find('id', $params['id']);
            if (empty($model)) {
                return Helper::error(80000, '查找不到对应的店铺');
            }
        }

        $model->address       = $params['address'];
        $model->name          = $params['name'];
        $model->status        = $params['status'];
        if (isset($params['shopkeeper_id'])) {
            $model->shopkeeper_id = $params['shopkeeper_id'];
        }

        if (!$model->save()) {
            return Helper::error(80001, '店铺资料保存失败');
        }
    }
}
