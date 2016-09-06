<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Shop
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class User extends Model
{
    use SoftDeletes;
    public $table = 'zo_users';

}
