<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Manage
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class Manage extends Model
{
    use SoftDeletes;
    public $table = 'zo_manage';

    /**
     * undocumented function
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  22:06:29
     */
    public function manageShopRelation()
    {
        return $this->hasOne(__NAMESPACE__ . '\ManageShopRelation', 'user_id', 'id');
    }
}
