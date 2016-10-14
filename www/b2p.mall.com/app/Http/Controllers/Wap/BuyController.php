<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;
use App\Providers\Buy\BuyModule;
use App\Providers\Buy\PayModule;

class BuyController extends Controller
{

    /**
     * 拼团创建支付入口
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  string     $value [description]
     */
    public function getPay()
    {
        // http://b2p.mall.dev:8080/group/pay?goods_id=23&sku_id=12

        $goods_id = \Request::get('goods_id', 0);
        $user_id  = \Session::get('user.id');
        //$input['group_id'] 传入group_id则代表加入拼团,未传入则代表是新建拼团
        $input_data = [
            'group_id'     => \Request::get('group_id', 0),
            'sku_id'       => \Request::get('sku_id', 0),
            // 'goods_number' => \Request::get('goods_number', 0),
            // 写死暂时不清楚拼团是否可以多件商品
            'goods_number' => 1,
            'user_id'      => $user_id,
        ];
        $buyModule = new BuyModule();
        $res       = $buyModule->createPay($input_data);
        if (isset($res['err_code'])) {
            return view('wap.error', ['error' => $res]);
        }
        $pay_sn = $res['pay_sn']['pay_sn'];
        //创建微信支付
        $pay_data = [
            'openid'       => \Session::get('user.openid'),
            'out_trade_no' => $pay_sn,
            'total_fee'    => $res['total_fee'] * 100,
            'notify_url'   => action('Wap\BuyController@createOrder', ['notify', $pay_sn]),
        ];
        $payModule   = new PayModule();
        $biz_package = $payModule->buildPayParams($pay_data);
        if (isset($biz_package['err_code'])) {
            return view('wap.error', ['error' => $biz_package]);
        }
        //支付成功跳转页面
        $callback_url = action('Wap\BuyController@groupOrders', [$user_id]);
        //用户取消跳转页面
        $cancel_url = action('Wap\GoodsController@getShow', [$goods_id]) . '?'
        . http_build_query(array_only($input_data, ['group_id', 'sku_id', 'goods_number']));
        //支付失败跳转页面
        $fail_url = $cancel_url;
        return view('wap.pay.wxpay.jsapi', compact('biz_package', 'callback_url', 'cancel_url', 'fail_url'));
    }

    /**
     * 支付成功，创建订单入口
     *
     * $type = 'callback' 为回调方式，浏览器页面跳转方式
     * $type = 'notify' 为通知方式，支付平台异步请求通知方式
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  string     $type 接收响应类型
     * @return [type]          [description]
     */
    public function createOrder($type = 'callback', $pay_sn = '')
    {
        //模拟微信支付回调数据
        // $content = '<xml><appid><![CDATA[wx79f8358726155a15]]></appid><attach><![CDATA[{"notify_url":"http:\/\/wap.7lk.cn\/user.php\/wxpay\/jsapi\/notify"}]]></attach><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[100]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1219538401]]></mch_id><nonce_str><![CDATA[HKWvO7kBbXw0u6TtMJ10gymKGC8LfvIX]]></nonce_str><openid><![CDATA[oGJafjlRCamI8eKeOcjhB1sN-GhQ]]></openid><out_trade_no><![CDATA[2015030223734]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[336205E80BEFA153A53384ED6502FE23]]></sign><time_end><![CDATA[20150302200726]]></time_end><total_fee>100</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[1008780987201503020023880562]]></transaction_id></xml>';

        $log_data = [
            //1为支付，2为退款
            'type'   => 1,
            //1为支付成功，2为退款成功，4为支付失败
            'status' => 1,
            'pay_sn' => $pay_sn,
            'data'   => \Request::getContent(),
        ];

        if ($type == 'notify') {
            $wechat      = app('wechat');
            $openid      = '';
            $pay_success = false;
            $response    = $wechat->payment->handleNotify(function ($notify, $successful) use (&$openid, &$pay_success) {
                $openid = $notify->openid;
                // 验证用户是否支付成功
                if ($successful) {
                    $pay_success = true;
                }
                return true;
            });
            $wx_user             = (array) \DB::table('zo_user_weixin')->where('openid', $openid)->first();
            $log_data['user_id'] = array_get($wx_user, 'user_id', 0);

            if ($pay_success !== true) {
                $log_data['status'] = 4;
            }
            $payModule = new PayModule();
            $pay_log   = $payModule->log($log_data);
            //刷出缓冲，响应微信
            $response->send();

            //支付失败后续流程不再进行
            if ($pay_success === false) {
                return 'paid fail';
            }
        } else {
            //暂时禁止通过callbak,跳转回来
            return 'Invalid Request';
            //如果是页面回调通知，则需要平台自己加密解密操作
            $log_data['user_id'] = \Session::get('user.id', 0);
            $payModule           = new PayModule();
            $pay_log             = $payModule->log($log_data);
        }

        //创建订单
        $buyModule = new BuyModule();
        $res       = $buyModule->createOrder(['pay_sn' => $pay_sn, 'user_id' => $log_data['user_id']]);
        if (isset($res['err_code'])) {
            \Log::info('paid', $res);
            return $pay_sn;
        }
        //更新支付日志的订单id
        $pay_log->order_id = $res['id'];
        $pay_log->save();

        //进行拼团第一单退款操作，增加用户的退款日志
        if ($res['group_rp'] != 1) {
            $payModule = new PayModule();
            $payModule->refundByOrderId($res['group_id']);
        }
        $userModule = \App::make('\App\Providers\Wx\UserModule');
        $userModule->pointsChange($log_data['user_id'], $res['order_amount']);

        return $pay_sn;
    }

    public function groupOrders($type = null)
    {
        //seesion获取用户id
        $input_data         = ['user_id' => \Session::get('user.id', 0)];
        $input_data['type'] = strtolower(request()->get('type', $type));
        if ($input_data['type'] == 'my_orders') {
            //seesion获取用户id
            $input_data['by_user'] = \Session::get('user.id', 0);
        }
        $buyModule  = new BuyModule();
        $order_list = $buyModule->getOrderList($input_data, \Request::get('page', 0), 15);

        if (\Request::ajax()) {
            return ['response_data' => $order_list];
        }
        return view('wap.orderList', ['response_data' => $order_list]);
    }

    public function getOrder($id)
    {
        $order = \App\Providers\Buy\Models\Order::with(['orderGoods', 'userWeixin'])->find($id);
        if (!$order) {
            return view('wap.error', ['error' => []]);
        }
        $order->join_group                = $order->canJoin(\Session::get('user.id', 0));
        $order->orderGoods->goods_img_url = asset($order->orderGoods->goods_img);
        $order->orderGoods->goods_url     = action(
            'Wap\GoodsController@getShow',
            ['id' => $order->orderGoods->goods_id]
        ) . ($order->isFirstGroup() ? '?group_id=' . $order->group_id : '');
        return view('wap.orderDetail', ['res' => $order]);
    }
}
