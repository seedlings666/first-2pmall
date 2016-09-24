<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Buy\Models\Order;
use Session;

class OrderController extends Controller
{
    public function getIndex()
    {
        $orderObj = Order::with(['orderGoods', 'userWeixin']);
        if (!$this->isSystem()) {
            $orderObj = $orderObj->whereHas('orderGoods', function ($query) {
                $query->where('store_id', Session::get('admin_user.shop_id'));
            });
        }

        $res_data = $orderObj->orderBy('id', 'desc')->paginate(2);
        return view('admin.order', compact('res_data'));
    }

    public function getInfo($id)
    {
        $orderObj = Order::with(['orderGoods', 'userWeixin'])->where('id', $id);
        if (!$this->isSystem()) {
            $orderObj = $orderObj->whereHas('orderGoods', function ($query) {
                $query->where('store_id', Session::get('admin_user.shop_id'));
            });
        }
        $res_data = $orderObj->first();
        return view('admin.order_info', compact('res_data'));
    }
}
