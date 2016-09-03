<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Base
{
    use SoftDeletes;
    public $table = 'zo_orders';

    public function getPayStatusLabelAttribute()
    {
        $status = ['0' => '初始', '1' => '支付中', '2' => '支付成功', '3' => '返还现金'];
        return isset($status[$this->pay_status]) ? $status[$this->pay_status] : '';
    }

    public function orderGoods()
    {
        return $this->hasOne(__NAMESPACE__ . '\OrderGoods', 'order_id', 'id');
    }
}
