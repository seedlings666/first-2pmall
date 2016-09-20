<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Base
{
    use SoftDeletes;
    public $table = 'zo_orders';

    //是否拼团第一单
    public function isFirstGroup()
    {
        return $this->group_rp == 1;
    }

    //是否拼团已结束
    public function isGroupEnd()
    {
        return $this->order_status == 2;
    }

    //是否拼团已经过期
    public function isExpired()
    {
        return $this->isFirstGroup() && !$this->isGroupEnd() && (strtotime($this->created_at) + 86400) < time();
    }

    //是否已退还优惠金额
    public function isCashBack()
    {
        return $this->isFirstGroup() && $this->isGroupEnd() && $this->pay_status != 3;
    }

    public function getPayStatusLabelAttribute()
    {
        $status = ['0' => '初始', '1' => '支付中', '2' => '支付成功', '3' => '返还现金'];
        return isset($status[$this->pay_status]) ? $status[$this->pay_status] : '';
    }

    public function getOrderStatusLabelAttribute()
    {
        if ($this->isCashBack()) {
            return '等待返还优惠金额';
        }
        if ($this->isExpired()) {
            return '拼团已过期';
        }
        $status = ['0' => '初始', '1' => '等待拼团', '2' => '拼团成功'];
        return isset($status[$this->order_status]) ? $status[$this->order_status] : '';
    }

    public function orderGoods()
    {
        return $this->hasOne(__NAMESPACE__ . '\OrderGoods', 'order_id', 'id');
    }

    public function userWeixin()
    {
        return $this->hasOne(__NAMESPACE__ . '\UserWeixin', 'user_id', 'user_id');
    }
}
