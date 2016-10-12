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
            <p><span>订单状态：</span><font>已完成</font></p>
            <p><span>订单总额：</span><big>95</big>(微信支付)</p>
            <p><span>收货人：</span>CK</p>
            <p><span>订单编号：</span>1000000000254265</p>
            <p><span>下单时间：</span>2016-10-12 23:15:51</p>
        </div>

        <div class="main_warp row_box goods_box">
            <ul>
                <li>
                    <div class="goods_info">
                        <div class="goods_img">
                            <img src="{{asset('images/goods_img.jpg')}}" alt="商品名称">
                        </div>

                        <div class="goods_name">
                            <p>商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称</p>
                            <p>数量：1</p>
                            <p>库存：1000件</p>
                        </div>

                        <div class="goods_price">
                            <span>
                                <p>原价：<big id="goods_price">95</big>/件</p>
                                <p>拼团价：<big id="goods_price">85</big>/件</p>
                            </span>
                        </div>
                    </div>
                </li>
            </ul>

            <div class="goods_count">
                <p>总价：<big id="count_price">95.00</big>元</p>
            </div>
        </div>

        <div class="main_warp btn_group">
            <a href="###">加入拼团</a>
        </div>

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
    </body>
</html>
