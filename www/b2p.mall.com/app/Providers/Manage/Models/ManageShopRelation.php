<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class ManageShopRelation
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class ManageShopRelation
{
    use SoftDeletes;
    public $table = 'zo_manage_shop_relation';
}
