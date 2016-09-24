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

        if ($user_info && empty($user_info->avatar)) {
            $user_info->avatar = config('wechat.avatar');
        }

        return $user_info;
    }

    /**
     * 积分修改
     * @param $point 可正负
     *
     * @return int
     * @author chentengfeng @create_at 2016-09-11  15:12:11
     */
    public function pointsChange($user_id, $points)
    {
        if (empty($user_id) || !is_numeric($user_id) || $user_id < 1 || !is_numeric($points)) {
            return 0;
        }

        return DB::update(
            "update {$this->tables['user']} set points=points+{$points} where id = ?",
            [$user_id]
        );
    }
}
