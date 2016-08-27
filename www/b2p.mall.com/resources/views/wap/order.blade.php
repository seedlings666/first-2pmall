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
        <meta name="author" content="CK-Joey" />

        <link rel="stylesheet" href="{{ elixir('css/wap/base.css') }}">
        <link rel="stylesheet" href="{{ elixir('css/wap/order.css') }}">
    </head>

    <body>
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
                            <span><big id="goods_price">95</big>/件</span>
                        </div>
                    </div>

                    <div class="goods_sum">
                        数量：
                        <div class="goods_sum_select">
                            <span class="disabled" id="cut">-</span>
                            <input type="text" value="1" id="sum">
                            <span id="add">+</span>
                        </div>
                    </div>
                </li>
            </ul>

            <div class="goods_count">
                <p>总价：<big id="count_price">95.00</big>元</p>
            </div>
        </div>

        <div class="main_warp row_box pay_methods">
            <span>支付方式</span>
            <ul>
                <li class="on wachat_pay" id='wachat_pay'>微信支付<i></i></li>
            </ul>
        </div>

        <div class="main_warp row_box order_message">
            <span>订单留言</span>
            <div class="message_box">
                <textarea placeholder="在此输入您对本次订单的备注信息！"></textarea>
            </div>

            <div class="btn_box">
                <a href="###">立即支付</a>
            </div>
        </div>

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
        <script src="{{ elixir('js/wap/order.js') }}"></script>
    </body>
</html>
