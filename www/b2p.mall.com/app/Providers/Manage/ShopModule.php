<?php

namespace App\Providers\Manage;

use App\Providers\Manage\Helper;
use Validator;
use App;

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

        $builder = App::make('ShopModel')->select()->with('shopkeeper');


        return $builder->paginate($condition['page_number']);
    }

    /**
     * 店铺详情
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
            'alias',
        ];

        return App::make('ShopModel')->select($select)->find($id);
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
            'alias'         => ['required'],
            'shopkeeper_id' => ['sometimes', 'required','integer','min:1'],
            'status'        => ['required','boolean','in:0,1'],
        );

        //店铺名称唯一
        $unique_name = "unique:zo_shop,name";
        if (isset($params['id'])) {
            $unique_name .= ",{$params['id']}";
        }
        $rule['name'][] = $unique_name;
        
        $validate = Validator::make($params, $rule);
        
        //校验
        if($validate->fails()){
            return Helper::error(10000,'参数错误!',$validate->messages());
        }

        $model = App::make('ShopModel');

        if (isset($params['id'])) {
            $model = $model->find($params['id']);
            if (empty($model)) {
                return Helper::error(80000, '查找不到对应的店铺');
            }
        }

        $model->address = $params['address'];
        $model->name    = $params['name'];
        $model->alias   = $params['alias'];
        $model->status  = $params['status'];
        if (isset($params['shopkeeper_id'])) {
            $model->shopkeeper_id = $params['shopkeeper_id'];
        }

        if (!$model->save()) {
            return Helper::error(80001, '店铺资料保存失败');
        }
    }
}
