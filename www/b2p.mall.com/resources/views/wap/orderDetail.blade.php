<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>确认订单</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no"/>
        <meta name="format-detection" content="telephone=no" />
        <!-- iphone的私有标签 它指定的iphone中safari顶端的状态条的样式 默认值为default（白色），可以定为black（黑色）和black-translucent（灰色半透明） -->
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
        <!-- iphone设备中的safari私有meta标签 允许全屏模式浏览，隐藏浏览器导航栏 -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- 它支持用户将网页创建快捷方式到桌面时，其图标变为我们自己定义的图标 apple-touch-icon.png 命名 -->
        <link rel="apple-touch-icon-precomposed" href="http://3gimg.qq.com/wap30/info/info5/img/logo_icon.png">
        <meta name="author" content="seedlings" />

        <link rel="stylesheet" href="{{ elixir('css/wap/base.css') }}">
        <link rel="stylesheet" href="{{ elixir('css/wap/orderDetail.css') }}">
    </head>

    <body>
        <div class="main_warp row_box order_info">
            <p><span>订单状态：</span><font>{{ $res['order_status_label'] }}</font></p>
            <p><span>订单总额：</span><big>{{ $res['order_amount'] }}</big>(微信支付)</p>
            <p><span>收货人：</span>{{ $res['userWeixin']['nickname'] }}</p>
            <p><span>订单编号：</span>{{ $res['order_sn'] }}</p>
            <p><span>下单时间：</span>{{ $res['created_at'] }}</p>
        </div>

        <div class="main_warp row_box goods_box">
            <ul>
                <li>
                    <div class="goods_info">
                    <a href="{{ $res['orderGoods']['goods_url'] }}">
                        <div class="goods_img">
                            <img src="{{ $res['orderGoods']['goods_img_url'] }}" alt="{{ $res['goods_title'] }}">
                        </div>

                        <div class="goods_name">
                            <p>{{ $res['orderGoods']['goods_title'] }} {{ $res['orderGoods']['goods_spec'] }}</p>
                            <p>数量：{{ $res['orderGoods']['goods_number'] }}</p>
                            <p>&nbsp;</p>
                            <!-- <p>库存：1000件</p> -->
                        </div>

                        <div class="goods_price">
                            <span>
                                <p>原价：<big id="goods_price">{{ $res['orderGoods']['sale_price'] }}</big>/件</p>
                                <p>拼团价：<big id="goods_price">{{ $res['orderGoods']['buy_price'] }}</big>/件</p>
                            </span>
                        </div>
                    </a>
                    </div>
                </li>
            </ul>

            <div class="goods_count">
                <p>总价：<big id="count_price">{{ $res['order_amount'] }}</big>元</p>
            </div>
        </div>

        @if($res['join_group'])
        <div class="main_warp btn_group">
            <a href="{{ $res['join_group'] }}">加入拼团</a>
        </div>
        @endif

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
    </body>
</html>
