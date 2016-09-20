<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class UserWeixin extends Base
{
    use SoftDeletes;
    public $table = 'zo_user_weixin';
}
