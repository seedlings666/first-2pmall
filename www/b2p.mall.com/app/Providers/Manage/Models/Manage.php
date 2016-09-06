<?php

namespace App\Providers\Manage\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Manage
 * @author chentengfeng @create_at 2016-09-06  08:19:25
 */
class Manage
{
    use SoftDeletes;
    public $table = 'zo_manage';
}
