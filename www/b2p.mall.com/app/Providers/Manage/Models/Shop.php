<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Shop
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class Shop extends Model
{
    use SoftDeletes;
    public $table = 'zo_shop';

    /**
     * 店长名称
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function getShopkeeperNameAttribute()
    {
        if ($this->shopkeeper && !empty($this->shopkeeper)) {
            return $this->shopkeeper->nick_name;
        }

        return '-';
    }

    /**
     * 店长
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function shopkeeper()
    {
        return $this->hasOne(__NAMESPACE__ . '\Manage', 'id', 'shopkeeper_id');
    }

    /**
     * 关系
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-06  21:35:39
     */
    public function manageShopRelation()
    {
        return $this->hasMany(__NAMESPACE__ . '\ManageShopRelation', 'shop_id', 'id');
    }
}
