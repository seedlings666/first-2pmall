<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;

class NoticeController extends Controller
{
    public function getGroupRule()
    {
        $notice  = '团购规则说明';
        $content = "*每次拼团人数最多只能为两人
                        <br/>*不能以拼团第二人身份加入自己的拼团
                        <br/>*新建拼团24小时内未有其它用户加入该拼团，则拼团过期，24小时后不会返还拼团优惠金额。
                        <br/>*新建拼团24小时内若有其它一名用户加入该拼团，则拼团成功并原路返还优惠金额至拼团创建者的微信账户之中
                        <br/>*拼团提交订单支付成功后才代表(创建/加入)拼团订单成功，如果中途退出操作未支付完成，则将不(创建/加入)拼团订单。";
        return view('wap.notice', compact('notice', 'content'));
    }

    public function getPointsDetailed()
    {
        $notice  = '积分明细';
        $content = "开发中...";
        return view('wap.notice', compact('notice', 'content'));
    }
}
