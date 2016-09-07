<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class ManageShopRelation
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class ManageShopRelation extends Model
{
    use SoftDeletes;
    public $table = 'zo_manage_shop_relation';

    /**
     * undocumented function
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  23:19:41
     */
    public function manage()
    {
        return $this->hasOne(__NAMESPACE__ . '\Manage', 'id', 'user_id');
    }
}
