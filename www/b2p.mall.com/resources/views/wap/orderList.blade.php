<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>订单列表</title>
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
        <link rel="stylesheet" href="{{ elixir('css/wap/orderList.css') }}">
    </head>

    <body>
        <div class="main_warp order_tab_box">
            <ul id="order_tab">
                <li class="on">全部订单</li>
                <li>待付款</li>
                <li>代收货</li>
            </ul>
        </div>

        <div class="main_warp order_content_box">
            <ul id="order_content">
                <li>
                    <div class="order_time">2016-08-22 21:34:07</div>
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
                            <span>&yen;<big id="goods_price">95</big>/件</span>
                        </div>
                    </div>
                    <div class="goods_sum">
                        共1件商品
                        <span>实付：<big id="pay_price">&yen;0</big></span>
                    </div>
                    <div class="order_status">
                        <span>待支付</span>
                        <a href="">去支付</a>
                        <a href="">取消订单</a>
                    </div>
                </li>
            </ul>
        </div>

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
        <script src="{{ elixir('js/wap/orderList.js') }}"></script>
    </body>
</html>
