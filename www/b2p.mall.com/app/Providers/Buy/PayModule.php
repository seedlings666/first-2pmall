<?php

namespace App\Providers\Buy;

use App\Providers\Buy\Models\Order;
use App\Providers\Buy\Models\PayLog;

/**
 * 支付模块功能
 * @author  Evey-b <eveyb277@gmail.com>
 * @date 2016-09-03
 */
class PayModule
{
    public function buildPayParams(array $input_data)
    {
        $attributes = [
            'trade_type'   => 'JSAPI', // JSAPI，NATIVE，APP...
            'openid'       => $input_data['openid'],
            'body'         => array_get($input_data, 'body', '悦团商城订单支付!'),
            'detail'       => array_get($input_data, 'detail', '悦团商城订单支付!'),
            'out_trade_no' => $input_data['out_trade_no'],
            'total_fee'    => $input_data['total_fee'],
            'notify_url'   => $input_data['notify_url'], // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            // ...
        ];
        $order = new \EasyWeChat\Payment\Order($attributes);

        $wechat = app('wechat');
        $result = $wechat->payment->prepare($order);
        if ($result->return_code != 'SUCCESS' || $result->result_code != 'SUCCESS') {
            return ['err_code' => '600510', 'err_msg' => '支付创建失败!'];
        }
        $prepayId = $result->prepay_id;

        $params              = [];
        $params['appId']     = $wechat->merchant->app_id;
        $params['nonceStr']  = uniqid();
        $params['package']   = 'prepay_id=' . $prepayId;
        $params['timeStamp'] = '' . time();
        $params['signType']  = 'MD5';
        $params['paySign']   = \EasyWeChat\Payment\generate_sign($params, $wechat->merchant->key, 'md5');
        $biz_package         = json_encode($params, true);
        return $biz_package;
    }

    public function log(array $data)
    {
        $payLog           = new PayLog();
        $payLog->type     = $data['type'];
        $payLog->status   = $data['status'];
        $payLog->user_id  = $data['user_id'];
        $payLog->order_id = array_get($data, 'order_id', 0);
        $payLog->pay_sn   = $data['pay_sn'];
        $payLog->pay_code = 'wxjsapi';
        $payLog->data     = $data['data'];
        $payLog->save();
        return $payLog;
    }

    public function refundByOrderId($order_id)
    {
        $where     = ['order_id' => $order_id, 'status' => 2, 'type' => 2];
        $payLogRes = PayLog::where($where)->first(['id']);
        if ($payLogRes) {
            \Log::info('[' . $order_id . ']该订单--已退款');
            return $order_id;
        }
        $orderRes = Order::where('id', $order_id)
            ->first(['id', 'user_id', 'order_status', 'group_rp', 'pay_sn', 'order_amount', 'group_preferential_amount']);
        if (!$orderRes) {
            \Log::info('[' . $order_id . ']该订单--不存在');
            return $order_id;
        }
        if ($orderRes->group_rp != 1) {
            \Log::info('[' . $order_id . ']该订单--不是拼团第一单');
            return $order_id;
        }
        if ($orderRes->order_status != 2) {
            \Log::info('[' . $order_id . ']该订单--拼团尚未结束');
            return $order_id;
        }

        $total_fee  = $orderRes->order_amount * 100;
        $refund_fee = $orderRes->group_preferential_amount * 100;

        $wechat    = app('wechat');
        $refundRes = $wechat->payment->refund('' . $orderRes->pay_sn, '' . $orderRes->pay_sn, $total_fee, $refund_fee);
        if (strtoupper($refundRes->return_code) == 'SUCCESS') {
            //退款成功
            $status = 2;
        } else {
            //退款失败
            $status = 5;
        }

        $payLog           = new PayLog();
        $payLog->type     = 2;
        $payLog->status   = $status;
        $payLog->user_id  = $orderRes->user_id;
        $payLog->order_id = $orderRes->id;
        $payLog->pay_sn   = $orderRes->pay_sn;
        $payLog->pay_code = 'wxjsapi';
        $payLog->data     = json_encode($refundRes);
        $payLog->save();
        return $payLog;
    }
}
