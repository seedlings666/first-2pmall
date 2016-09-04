<?php

namespace App\Providers\Buy;

use App\Providers\Buy\Models\PayLog;
use EasyWeChat\Payment\Order;

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
        $order = new Order($attributes);

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
}
