<?php

namespace App\Providers\Wx;

use DB;
use App\Providers\Wx\Helper;

/**
 * 用户
 * @author chentengfeng @create_at 2016-09-03  21:09:40
 */
class UserModule
{
    private $tables = null;

    /**
     * 获取表名等数据
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  22:37:23
     */
    public function __construct(array $tables)
    {
        $this->tables = $tables;
    }


    /**
     * 用户信息详情
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-03  21:09:40
     */
    public function userInfo($id)
    {
        if (empty($id) || !is_numeric($id) || $id < 1) {
            return Helper::error(10000, '参数错误');
        }
        $user_info  = DB::table($this->tables['user'])
                    ->select('id', 'points', 'nick_name', 'avatar')
                    ->find($id);

        if (empty($user_info->avatar)) {
            $user_info->avatar = config('wechat.avatar');
        }

        return $user_info;
    }
}
