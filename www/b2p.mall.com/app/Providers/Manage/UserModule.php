<?php

namespace App\Providers\Manage;

use App;
use Validator;

/**
 * Class UserModule
 * @author chentengfeng @create_at 2016-09-06  23:41:55
 */
class UserModule
{
    /**
     * 用户列表
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  23:41:55
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

        $select = [
            'id',
            'points',
            'nick_name',
            'reg_time',
        ];
        return App::make('UserModel')->select()->paginate($condition['page_number']);
    }
}
