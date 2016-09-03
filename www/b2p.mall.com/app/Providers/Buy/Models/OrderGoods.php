<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class OrderGoods extends Base
{
    use SoftDeletes;
    public $table = 'zo_order_goods';
}
