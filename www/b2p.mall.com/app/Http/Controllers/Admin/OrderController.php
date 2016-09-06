<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Buy\Models\Order;
use DB;

class OrderController extends Controller
{
    public function getOrder()
    {
        $res_data = Order::with('orderGoods')->orderBy('id', 'desc')->get();
        return view('admin.order', compact('res_data'));
    }

    public function getInfo($id)
    {
        $res_data = Order::with('orderGoods')->where('id', $id)->first();
        return view('admin.order_info', compact('res_data'));
    }

    /**
     * 统计
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-07  00:33:10
     */
    public function getStatistic()
    {
        $start_time = date('Y-m-d H:i:s', strtotime('-30 day'));
        $select = DB::raw("count(*) as order_count, sum(order_amount) as total_price, DATE_FORMAT(created_at, '%Y%m%d') as date");
        $list = Order::select($select)->where('created_at', '>', $start_time)
                    ->where('pay_status', 2)
                    ->groupBy(DB::raw('DATE_FORMAT(created_at, "%Y%m%d")'))->get();

        $sales = [];
        $count = [];
        foreach ($list as $value) {
            $sales[] = [
                $value->date,
                $value->order_count
            ];
            $count[] = [
                $value->date,
                $value->total_price,
            ];
        }
        $sales[] = [
            strtotime('2016-08-09'),
            123,
        ];
        $sales[] = [
            strtotime('2016-08-10'),
            232,
        ];
        $count[] = [
            strtotime('2016-08-09'),
            234
        ];
        $count[] = [
            strtotime('2016-08-10'),
            434
        ];

        return view('admin.order_statistical')->with(compact('sales', 'count'));
    }
}
