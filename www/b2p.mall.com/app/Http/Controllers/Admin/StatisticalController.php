<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Buy\Models\Order;
use DB;

class StatisticalController extends Controller
{
    /**
     * 订单统计
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  00:33:10
     */
    public function getOrder()
    {
        $start_time = date('Y-m-d H:i:s', strtotime('-30 day'));
        $select     = DB::raw("count(*) as order_count, sum(order_amount) as
            total_price, DATE_FORMAT(created_at, '%Y%m%d') as date");

        $orderObj = Order::select($select)
            ->where('created_at', '>', $start_time)
            ->where('pay_status', 2);
        if (!$this->isSystem()) {
            $orderObj = $orderObj->whereHas('orderGoods', function ($query) {
                $query->where('store_id', \Session::get('admin_user.shop_id'));
            });
        }
        $list = $orderObj->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y%m%d")'))
            ->orderBy('id')
            ->get();

        $sales = [];
        $count = [];
        foreach ($list as $value) {
            $sales[] = [
                strtotime($value->date) . '000',
                $value->order_count,
            ];
            $count[] = [
                strtotime($value->date) . '000',
                $value->total_price,
            ];
        }
        // for ($i = 1; $i < 10; $i++) {
        //     $sales[] = [
        //         (time() + 3600 * 12 * $i) . '000',
        //         123 + $i * 10,
        //     ];
        //     $count[] = [
        //         (time() + 3600 * 12 * $i) . '000',
        //         232 + $i * 10,
        //     ];
        // }

        return view('admin.order_statistical')->with(compact('sales', 'count'));
    }
}
