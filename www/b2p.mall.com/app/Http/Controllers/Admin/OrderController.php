<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Buy\Models\Order;

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
}
