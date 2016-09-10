<?php

namespace App\Providers\Buy;

use DB;

/**
 * 购物模块功能
 * @author  Evey-b <eveyb277@gmail.com>
 * @date 2016-08-27
 */
class BuyModule
{

    public $plan = 'B';

    /**
     * 检查商品是否可以购买
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  array     $goods 商品检测数组
     * @return array            成功返回为array中不带err_code键值
     */
    private function checkGoodsIsBuy(array $goods_data)
    {
        $sku_res = (array) DB::table('zo_goods_sku')->whereRaw('`deleted_at` is null')
            ->where('id', $goods_data['sku_id'])
            ->first(['id', 'goods_id', 'market_price', 'shop_price']);
        //商品不存在参数错误
        if (!$sku_res) {
            return ['err_code' => '400704', 'err_msg' => '商品参数错误!'];
        }
        $goods_res = (array) DB::table('zo_goods')->whereRaw('`deleted_at` is null')
            ->where('id', $sku_res['goods_id'])
            ->first(['id', 'is_on_sale']);
        //商品不存在参数错误
        if (!$goods_res) {
            return ['err_code' => '400704', 'err_msg' => '商品参数错误!'];
        }
        //商品已下架或关闭
        if ($goods_res['is_on_sale'] != 1) {
            // if ($sku_res['is_on_sale'] != 1 || $goods_res['is_on_sale'] != 1) {
            return ['err_code' => '400701', 'err_msg' => '商品已下架!'];
        }
        //商品库存不足,该判断暂未明确是否需要
        // if (false) {
        //     # code...
        // }
        return $sku_res;
    }

    /**
     * 通过sku_id获取多条商品数据
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-28
     * @param  array      $sku_ids
     * @return array
     */
    public function getGoodsBySkuIds(array $sku_ids)
    {
        //商品信息
        $sku_res = (array) DB::table('zo_goods_sku')->whereRaw('`deleted_at` is null')
            ->whereIn('id', $sku_ids)
            ->get(['id', 'goods_id', 'market_price', 'shop_price', 'sku_name']);
        if (!$sku_res) {
            return ['err_code' => '400724', '商品参数错误!'];
        }
        $goods_ids = [];
        foreach ($sku_res as $sku) {
            $goods_ids[] = $sku->goods_id;
        }
        $goods_res = (array) DB::table('zo_goods')->whereRaw('`deleted_at` is null')
            ->whereIn('id', $goods_ids)
            ->get(['id', 'shop_id', 'goods_name']);
        if (!$goods_res) {
            return ['err_code' => '400724', '商品参数错误!'];
        }
        $goods_hash = [];
        foreach ($goods_res as $goods) {
            $goods_hash[$goods->id] = (array) $goods;
        }
        $goods_img_res = (array) DB::table('zo_goods_images')->whereRaw('`deleted_at` is null')
            ->whereIn('goods_id', $goods_ids)
            ->get(['id', 'goods_id', 'url_links']);
        $goods_img_hash = [];
        foreach ($goods_img_res as $goods_img) {
            $goods_img_hash[$goods_img->goods_id][] = (array) $goods_img;
        }

        foreach ($sku_res as &$sku) {
            $sku   = (array) $sku;
            $goods = $imgs = [];
            if (isset($goods_hash[$sku['goods_id']])) {
                $goods = $goods_hash[$sku['goods_id']];
            }
            if (isset($goods_img_hash[$sku['goods_id']])) {
                $imgs = $goods_img_hash[$sku['goods_id']];
            }
            $sku['goods'] = $goods;
            $sku['imgs']  = $imgs;
        }
        return $sku_res;
    }

    /**
     * 检查是否可以加入拼团支付
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-28
     * @param  int     $group_id 拼团id
     * @param  int     $goods_id 拼团对应的商品id,非skuid
     * @param  int     $user_id  参加拼团的用户id
     * @return array               成功返回为array中不带err_code键值
     */
    public function checkJoinGroupPaySN($group_id, $goods_id, $user_id)
    {
        //获取拼团第一单数据
        $group_order_res = (array) DB::table('zo_orders')
            ->select(['user_id', 'order_status', 'created_at'])
            ->where('id', $group_id)
            ->first();
        $order_goods_res = (array) DB::table('zo_order_goods')
            ->select(['id'])
            ->where('order_id', $group_id)
            ->where('goods_id', $goods_id)
            ->first();
        if (!$group_order_res || !$order_goods_res) {
            return ['err_code' => '400815', 'err_msg' => '拼团参数错误!'];
        } elseif ($group_order_res['user_id'] == $user_id) {
            return ['err_code' => '400816', '不能参加自己的拼团!'];
        } elseif ($group_order_res['order_status'] == 2) {
            return ['err_code' => '400812', 'err_msg' => '拼团已结束!'];
        } elseif (time() > (strtotime($group_order_res['created_at']) + 86400)) {
            return ['err_code' => '400813', 'err_msg' => '拼团已过期!'];
        }

        return compact('group_order_res', 'order_goods_res');
    }

    /**
     * genratePaySN
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @return bigint     支付编号
     */
    public static function genratePaySN()
    {
        //bigint
        return 10 . rand(100, 666) . str_replace('.', '0', microtime(true));
    }

    /**
     * genrateOrderSN
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  int        $number 传入数值生成订单id,这里应传入订单id
     * @return int
     */
    public function genrateOrderSN($number = null)
    {
        $number = $number && is_int($number) ? $number : time() + rand(100000000, 999999999);
        return 8010000000000000000 + $number;
    }

    /**
     * 创建支付编号信息，用于拉取支付
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  array      $pay_data 创建支付编号所用数据
     * @return array               成功返回为array中不带err_code键值
     */
    private function createPaySN(array $pay_data)
    {
        if (!is_string($pay_data['attach'])) {
            $attach = json_encode($pay_data['attach']);
        } else {
            $attach = $pay_data['attach'];
        }
        //1为拼团第一单的支付编号，2为拼团第二单的支付编号
        $group_rp = $pay_data['group_rp'];
        if ($group_rp == 1) {
            $group_id = 0;
        } else {
            $group_id = $pay_data['group_id'];
        }

        $insert_data = [
            'group_rp'   => $group_rp,
            'status'     => 0,
            'user_id'    => $pay_data['user_id'],
            'group_id'   => $group_id,
            'order_id'   => 0,
            'pay_sn'     => self::genratePaySN(),
            'attach'     => $attach,
            'created_at' => date('Y-m-d H:i:s'),
        ];

        if (!DB::table('zo_pay_sn')->insert($insert_data)) {
            return ['err_code' => '400805', 'err_msg' => '支付创建失败!'];
        }
        return $insert_data;
    }

    /**
     * 多用用户生成不同支付编号，加入拼团支付所用，容易出现两个加入拼团都成功问题
     *
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-28
     * @param  array      $pay_data [description]
     * @return array               成功返回为array中不带err_code键值
     */
    public function joinGroupPaySNPlanA(array $pay_data)
    {
        if (!$pay_data['group_id']) {
            return [];
        }
        $where = [
            'group_rp' => $pay_data['group_rp'],
            'group_id' => $pay_data['group_id'],
            'user_id'  => $pay_data['user_id'],
        ];
        $pay_sn_res = (array) DB::table('zo_pay_sn')->where($where)->first();
        if ($pay_sn_res) {
            $attach_arr          = json_decode($pay_sn_res['attach'], 1);
            $attach_arr['goods'] = $pay_data['goods_list'];
            $up_pay_sn_data      = [
                'attach'     => json_encode($attach_arr),
                'updated_at' => date('Y-m-d H:i:s'),
            ];
            //更新拼团第二单数据，避免sku,价格和数量的变化
            if (!DB::table('zo_pay_sn')->where('id', $pay_sn_res['id'])->update($up_pay_sn_data)) {
                return ['err_code' => '400806', 'err_msg' => '支付创建失败!'];
            }
            return array_merge($pay_sn_res, $up_pay_sn_data);
        }
        return [];
    }

    /**
     * 多用用户同时支付一个支付编号所用，避免多用户同时加入拼团都支付成功方案
     *
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-28
     * @param  array      $pay_data [description]
     * @return array               成功返回为array中不带err_code键值
     */
    public function joinGroupPaySNPlanB(array $pay_data)
    {
        if (!$pay_data['group_id']) {
            return [];
        }
        // if (!$pay_data['group_id']) {
        //     return ['err_code' => '400809', 'err_msg' => '支付创建失败!'];
        // }
        $where = [
            'group_id' => $pay_data['group_id'],
            'group_rp' => 2,
        ];
        $pay_sn_res = (array) DB::table('zo_pay_sn')->select(['id', 'pay_sn'])->where($where)->first();
        if (!$pay_sn_res) {
            return ['err_code' => '400810', 'err_msg' => '支付创建失败!'];
        }
        $where = [
            'pay_sn_id' => $pay_sn_res['id'],
            'user_id'   => $pay_data['user_id'],
        ];
        $pay_sn_tmp_res = (array) DB::table('zo_pay_sn_tmp')->where($where)->first();
        if (!$pay_sn_tmp_res) {
            $in_pay_sn_tmp = [
                'pay_sn_id'  => $pay_sn_res['id'],
                'user_id'    => $pay_data['user_id'],
                'attach'     => json_encode(['goods' => $pay_data['goods_list']]),
                'created_at' => date('Y-m-d H:i:s'),
            ];
            if (!DB::table('zo_pay_sn_tmp')->insert($in_pay_sn_tmp)) {
                return ['err_code' => '400811', 'err_msg' => '支付创建失败!'];
            }
            $in_pay_sn_tmp['pay_sn'] = $pay_sn_res['pay_sn'];
            return $in_pay_sn_tmp;
        }

        $attach_arr          = json_decode($pay_sn_tmp_res['attach'], 1);
        $attach_arr['goods'] = $pay_data['goods_list'];
        $up_pay_sn_tmp       = [
            'attach'     => json_encode($attach_arr),
            'updated_at' => date('Y-m-d H:i:s'),
        ];
        if (!DB::table('zo_pay_sn_tmp')->where('id', $pay_sn_tmp_res['id'])->update($up_pay_sn_tmp)) {
            return ['err_code' => '400818', 'err_msg' => '支付创建失败!'];
        }
        $up_pay_sn_tmp['pay_sn'] = $pay_sn_res['pay_sn'];
        return array_merge($pay_sn_tmp_res, $up_pay_sn_tmp);
    }

    /**
     * [joinGroupPaySN description]
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-28
     * @param  [type]     $pay_data [description]
     * @return array               [description]
     */
    public function joinGroupPaySN(array $pay_data)
    {
        if ($this->plan == 'B') {
            $pay_sn_res = $this->joinGroupPaySNPlanB($pay_data);
            if (isset($pay_sn_res['err_code'])) {
                return $pay_sn_res;
            } elseif ($pay_sn_res) {
                return ['pay_sn' => $pay_sn_res];
            }
        } else {
            $pay_sn_res = $this->joinGroupPaySNPlanA($pay_data);
            if (isset($pay_sn_res['err_code'])) {
                return $pay_sn_res;
            } elseif ($pay_sn_res) {
                return ['pay_sn' => $pay_sn_res];
            }
        }

        $pay_sn_data = [
            'group_rp' => $pay_data['group_rp'],
            'group_id' => $pay_data['group_id'],
            'user_id'  => $pay_data['user_id'],
            //这个字段非常重要，涉及到后续的创建订单逻辑，一定不能格式错误和无数据
            'attach'   => ['goods' => $pay_data['goods_list']],
        ];
        //创建订单编号及相关信息，用于拉取支付，以及支付完成后生成订单所用数据
        $pay_sn_res = $this->createPaySN($pay_sn_data);
        if (isset($pay_sn_res['err_code'])) {
            return $pay_sn_res;
        }
        return ['pay_sn' => $pay_sn_res];
    }

    /**
     * 创建支付
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  array      $input_data
     * @return array                  成功则创建微信JsApi支付所需数据
     */
    public function createPay(array $input_data)
    {
        $sku_id       = isset($input_data['sku_id']) ? $input_data['sku_id'] : 0;
        $goods_number = isset($input_data['goods_number']) ? $input_data['goods_number'] : 0;
        $group_id     = isset($input_data['group_id']) ? $input_data['group_id'] : 0;
        $user_id      = isset($input_data['user_id']) ? $input_data['user_id'] : 0;

        if (!is_numeric($sku_id) || $sku_id < 1 || !is_numeric($goods_number) || $goods_number < 1) {
            return ['err_code' => '400703', 'err_msg' => '商品参数错误!'];
        }
        if (!is_numeric($group_id)) {
            return ['err_code' => '400803', 'err_msg' => '拼团参数错误!'];
        }
        if (!is_numeric($user_id) || $user_id < 1) {
            return ['err_code' => '400103', 'err_msg' => '用户参数错误!'];
        }

        //检查商品是否可以购买
        $goods_data = [
            'sku_id'       => $sku_id,
            'goods_number' => $goods_number,
        ];
        $goods_res = $this->checkGoodsIsBuy($goods_data);
        if (isset($goods_res['err_code'])) {
            return $goods_res;
        }
        $goods_list   = [];
        $goods_list[] = [
            'goods_id'     => $goods_res['goods_id'],
            'sku_id'       => $sku_id,
            'goods_number' => $goods_number,
            'sale_price'   => $goods_res['market_price'],
            'buy_price'    => $goods_res['shop_price'],
        ];

        $group_rp = 1;
        //带有group_id则是加入拼团
        if ($group_id) {
            $group_rp  = 2;
            $check_res = $this->checkJoinGroupPaySN($group_id, $goods_res['goods_id'], $user_id);
            if (isset($check_res['err_code'])) {
                return $check_res;
            }
        }

        $pay_sn_data = [
            'group_rp'   => $group_rp,
            'group_id'   => $group_id,
            'user_id'    => $user_id,
            'goods_list' => $goods_list,
        ];
        return $this->joinGroupPaySN($pay_sn_data);
    }

    /**
     * genrateBaseOrderData description
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @return array
     */
    private static function genrateBaseOrderData()
    {
        $order_data = [
            'group_rp'                  => 0,
            'order_status'              => 0,
            'pay_status'                => 0,
            'group_id'                  => 0,
            'user_id'                   => 0,
            'order_sn'                  => 0,
            'pay_sn'                    => 0,
            'order_amount'              => 0.00,
            'preferential_amount'       => 0.00,
            'group_preferential_amount' => 0.00,
            'order_subject'             => '',
        ];
        return $order_data;
    }

    /**
     * genrateInsertOrderData
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  array     $order_data
     * @return array
     */
    public function genrateUpdateOrderData(array $order_data)
    {
        $order_data['updated_at'] = date('Y-m-d H:i:s');
        return $order_data;
    }

    /**
     * genrateInsertOrderData
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-08-27
     * @param  array     $order_data
     * @return array
     */
    public function genrateInsertOrderData(array $order_data)
    {
        $order_data = array_merge(self::genrateBaseOrderData(), $order_data);
        // $order_data['group_rp']     = 1;
        $order_data['order_status'] = 1;
        $order_data['pay_status']   = 2;
        // $order_data['group_id']     = 0;
        $order_data['order_sn']   = 0;
        $order_data['created_at'] = date('Y-m-d H:i:s');
        return $order_data;
    }

    public function createOrder(array $input_data)
    {
        $pay_sn = isset($input_data['pay_sn']) ? $input_data['pay_sn'] : 0;
        if (!$pay_sn) {
            return ['err_code' => '400808', 'err_msg' => '支付编号错误!'];
        }
        //支付编号信息
        $select     = ['id', 'order_id', 'status', 'group_rp', 'group_id', 'pay_sn', 'user_id', 'attach'];
        $pay_sn_res = (array) DB::table('zo_pay_sn')->select($select)->where('pay_sn', $pay_sn)->first();
        if (!$pay_sn_res) {
            return ['err_code' => '400804', 'err_msg' => '支付编号不存在!'];
        }
        if (DB::table('zo_orders')->where('id', $pay_sn_res['group_id'])->where('order_status', 2)->first(['id'])) {
            return ['err_code' => '400812', 'err_msg' => '拼团已结束!'];
        }
        if ($this->plan == 'B' && $pay_sn_res['group_rp'] != 1) {
            $zo_pay_sn_tmp_res = (array) DB::table('zo_pay_sn_tmp')
                ->select(['attach'])
                ->where('pay_sn_id', $pay_sn_res['id'])
                ->where('user_id', $input_data['user_id'])
                ->first();
            if (!$zo_pay_sn_tmp_res) {
                return ['err_code' => '400854', 'err_msg' => '支付出现异常!'];
            }
            $pay_sn_res['user_id'] = $input_data['user_id'];
            $pay_sn_res['attach']  = $zo_pay_sn_tmp_res['attach'];
        }
        if ($pay_sn_res['status'] == 1 && $pay_sn_res['order_id'] > 0) {
            $order_res = (array) DB::table('zo_orders')->where('id', $pay_sn_res['order_id'])->first();
            if ($order_res) {
                return $order_res;
            }
            //防止出现脏数据，未有生成关联订单数据，仍然可进行后续操作流程
        }
        //attach_arr的goods里面保存有支付对应的商品数据.
        //如果出现数据不存在或者脏数据行为，将导致后续的流程无法进行下去，从而下单失败
        $attach_arr   = json_decode($pay_sn_res['attach'], 1);
        $attach_goods = [];
        foreach ($attach_arr['goods'] as $val) {
            $attach_goods[$val['sku_id']] = $val;
        }
        //商品信息
        $goods_res = $this->getGoodsBySkuIds(array_keys($attach_goods));
        //防止出现脏数据
        if (!$goods_res || $pay_sn_res['user_id'] < 1) {
            return ['err_code' => '400714', 'err_msg' => '订单创建失败!'];
        }
        $sale_goods_amount   = 0.00;
        $buy_goods_amount    = 0.00;
        $preferential_amount = 0.00;
        $in_order_goods      = [];
        foreach ($goods_res as $val) {
            //防止出现脏数据
            if (empty($attach_goods[$val['id']]['goods_number'])) {
                return ['err_code' => '400717', 'err_msg' => '订单创建失败!'];
            }
            $goods_number = $attach_goods[$val['id']]['goods_number'];
            $sale_price   = $attach_goods[$val['id']]['sale_price'];
            $buy_price    = $attach_goods[$val['id']]['buy_price'];
            $order_goods  = [
                'order_id'     => 0,
                'store_id'     => $val['goods']['shop_id'],
                'goods_id'     => $val['goods_id'],
                'sku_id'       => $val['id'],
                'goods_number' => $goods_number,
                'sale_price'   => $sale_price,
                'buy_price'    => $buy_price,
                'goods_title'  => $val['goods']['goods_name'],
                'goods_spec'   => $val['sku_name'],
                'goods_img'    => (!empty($val['imgs'][0]['url_links']) ? $val['imgs'][0]['url_links'] : ''),
            ];
            $in_order_goods[]  = $order_goods;
            $sale_goods_amount = ($order_goods['sale_price'] * $order_goods['goods_number']) + $sale_goods_amount;
            $buy_goods_amount  = ($order_goods['buy_price'] * $order_goods['goods_number']) + $buy_goods_amount;
        }
        $order_amount              = $pay_sn_res['group_rp'] == 1 ? $sale_goods_amount : $buy_goods_amount;
        $group_preferential_amount = $sale_goods_amount - $buy_goods_amount;
        $preferential_amount       = $group_preferential_amount;

        //////////////////////////
        //订单支付成功后，下单以及相关业务处理逻辑块 //
        //////////////////////////
        //创建订单
        $in_order_data = [
            'group_rp'                  => $pay_sn_res['group_rp'],
            'group_id'                  => 0,
            'user_id'                   => $pay_sn_res['user_id'],
            'pay_sn'                    => $pay_sn_res['pay_sn'],
            'order_amount'              => $order_amount,
            'preferential_amount'       => $preferential_amount,
            'group_preferential_amount' => $group_preferential_amount,
            'order_subject'             => 'B2P Mall Order',
        ];
        $in_order_data = $this->genrateInsertOrderData($in_order_data);
        DB::beginTransaction();
        //新增订单数据，由于grou_id和order_sn依赖于order_id该次新增将不会插入这两个数据 /
        $order_id = DB::table('zo_orders')->insertGetId($in_order_data);
        if (!$order_id) {
            DB::rollBack();
            return ['err_code' => '400885', 'err_msg' => '订单创建失败!'];
        }
        //更新订单数据，主要更新group_id和order_sn,order_status数据
        if ($pay_sn_res['group_rp'] == 1) {
            $group_id      = $order_id;
            $up_order_data = [
                'group_id' => $group_id,
                'order_sn' => self::genrateOrderSN($order_id),
            ];
            $up_order_data = $this->genrateUpdateOrderData($up_order_data);
            if (!DB::table('zo_orders')->where('id', $order_id)->update($up_order_data)) {
                DB::rollBack();
                return ['err_code' => '400886', 'err_msg' => '订单创建失败!'];
            }
        } else {
            //更新拼团第二单的数据，主要修改order_sn,order_status
            $group_id      = $pay_sn_res['group_id'];
            $up_order_data = [
                //如果是拼团第二单，则需要更新订单状态为2，表示拼团已完成
                'order_status' => 2,
                'order_sn'     => self::genrateOrderSN($order_id),
            ];
            $up_order_data = $this->genrateUpdateOrderData($up_order_data);
            if (!DB::table('zo_orders')->where('id', $order_id)->update($up_order_data)) {
                DB::rollBack();
                return ['err_code' => '400886', 'err_msg' => '订单创建失败!'];
            }
            //拼团第二单更新第一单的拼团状态
            if (!DB::table('zo_orders')->where('id', $group_id)->update(['order_status' => 2])
            ) {
                DB::rollBack();
                return ['err_code' => '400890', 'err_msg' => '订单创建失败!'];
            }
        }
        //用于支付日志记录
        $up_order_data['id'] = $order_id;

        //////////////////////////////
        //新增订单商品数据，主要记录当时下单时商品的相关数据 //
        //////////////////////////////
        foreach ($in_order_goods as &$val) {
            $val['order_id']   = $order_id;
            $val['created_at'] = date('Y-m-d H:i:s');
        }
        if (!DB::table('zo_order_goods')->insert($in_order_goods)) {
            DB::rollBack();
            return ['err_code' => '400887', 'err_msg' => '订单创建失败!'];
        };

        ////////////////////////////////////////////////////////
        //更新拼团订单的pay_sn数据，主要更新pay_sn的status和order_id,group_id //
        ////////////////////////////////////////////////////////
        $up_pay_sn_data = [
            'status'     => 1,
            'group_id'   => $group_id,
            'order_id'   => $order_id,
            'updated_at' => date('Y-m-d H:i:s'),
        ];
        if ($this->plan == 'B' && $pay_sn_res['group_rp'] != 1) {
            $up_pay_sn_data['user_id'] = $pay_sn_res['user_id'];
            $up_pay_sn_data['attach']  = $pay_sn_res['attach'];
        }
        if (!DB::table('zo_pay_sn')->where('id', $pay_sn_res['id'])->update($up_pay_sn_data)) {
            return ['err_code' => '400888', 'err_msg' => '订单创建失败!'];
        }
        //新增拼团第二单所pay_sn数据，用于拼团第二单时用户所用支付数据
        if ($this->plan == 'B' && $pay_sn_res['group_rp'] == 1) {
            $in_pay_sn = [
                'group_rp' => 2,
                'group_id' => $group_id,
                'user_id'  => 0,
                'pay_sn'   => self::genratePaySN(),
                'attach'   => [],
            ];
            $in_pay_sn_res = $this->createPaySN($in_pay_sn);
            if (isset($in_pay_sn_res['err_code'])) {
                DB::rollBack();
                return ['err_code' => '400889', 'err_msg' => '订单创建失败!'];
            }
        }
        DB::commit();

        return array_merge($in_order_data, $up_order_data);
    }

    /**
     * 获取订单数据
     * @author Evey-b <eveyb277@gmail.com>
     * @date   2016-09-03
     * @param  array      $input_data 条件参数
     * @param  integer    $offset     获取开始值
     * @param  integer    $take       每页条数
     * @return [type]                 [description]
     */
    public function getOrderList(array $input_data, $offset = 0, $take = 15)
    {
        $user_id            = $input_data['user_id'];
        $order_fields       = ['id', 'user_id', 'group_id', 'group_rp', 'order_amount', 'order_status', 'pay_status', 'created_at'];
        $order_goods_fields = ['id', 'goods_id', 'order_id', 'goods_title', 'sale_price', 'buy_price', 'goods_number', 'goods_img'];
        $order_res          = DB::table('zo_orders')->whereRaw('`deleted_at` is null');
        if (!empty($input_data['by_user'])) {
            $order_res = $order_res->where('user_id', $input_data['by_user']);
        }
        $order_res    = $order_res->orderBy('created_at', 'desc')->orderBy('group_rp', 'asc');
        $order_result = $order_res->take($take)->offset($offset)->get($order_fields);
        $next_page    = $take + $offset;
        if (!$order_res->take(1)->offset($next_page)->first()) {
            $next_page = null;
        }

        $order_ids  = [];
        $order_list = [];
        foreach ($order_result as $value) {
            $value->orderGoods = [];
            $order_list[]      = (array) $value;
            $order_ids[]       = $value->id;
        }

        $order_goods_result = DB::table('zo_order_goods')->whereIn('order_id', $order_ids)->get($order_goods_fields);
        $order_goods_list   = [];
        foreach ($order_goods_result as $value) {
            $order_goods_list[$value->order_id][] = (array) $value;
        }
        foreach ($order_list as $key => &$val) {
            if (empty($order_goods_list[$val['id']])) {
                unset($order_list[$key]);
                continue;
            }
            $val['orderGoods'] = $order_goods_list[$val['id']];

            $val['is_share']      = [];
            $val['join_group']    = '';
            $val['is_end']        = 0;
            $val['wait_cashback'] = 0;
            $val['is_expire']     = 0;
            $is_group_rp1         = $val['group_rp'] == 1;
            $is_order_status2     = $val['order_status'] == 2;
            $is_order_status1     = $val['order_status'] == 1;
            $is_expired           = (strtotime($val['created_at']) + 86400) < time();

            //判断是否结束
            if ($is_order_status2) {
                $val['is_end'] = 1;
            }
            //判断是否可以分享,分享链接地址
            if ($is_group_rp1) {
                $val['is_share'] = [];
            }
            //判断是否已过期
            if ($is_group_rp1 && !$is_order_status2 && $is_expired) {
                $val['is_expire'] = 1;
            }
            //判断是否等待返回优惠金额
            if ($is_group_rp1 && $is_order_status2 && $val['pay_status'] != 3) {
                $val['wait_cashback'] = 1;
            }
            //加入拼团链接地址,使用商品详情加上group_id
            if ($is_group_rp1 && $is_order_status1 && !$is_expired && $user_id != $val['user_id']) {
                // if (true) {
                $params = [
                    'id' => $val['orderGoods'][0]['goods_id'],
                ];
                $val['join_group'] = action('Wap\GoodsController@getShow', $params) . '?group_id=' . $val['group_id'];
            }
        }

        return ['order_list' => $order_list, 'next_page' => $next_page];
    }
}
