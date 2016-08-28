<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;
use App\Providers\Buy\BuyModule;

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
        //$input['group_id'] 传入group_id则代表加入拼团,未传入则代表是新建拼团
        $input_data = [
            'group_id'     => '3',
            'sku_id'       => '777',
            'goods_number' => '3',
            'user_id'      => '277',
        ];
        $buyModule = new BuyModule();
        $res       = $buyModule->createPay($input_data);
        return $res;
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
    public function createOrder($type = 'callback')
    {
        $input_data['pay_sn'] = '10584147238240505142';
        $input_data['user_id'] = '275';

        $buyModule = new BuyModule();
        $res       = $buyModule->createOrder($input_data);
        // $res       = $buyModule->genrateOrderSN('10');
        // $res       = $buyModule->genrateInsertOrderData(['order_amount' => '18888.00']);
        var_dump($res);
    }
}
