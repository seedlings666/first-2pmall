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
            <ul id="order_tab" data-url="{{action('Wap\BuyController@groupOrders')}}">
            @if(strtolower(request()->get('type')) == 'my_orders')
                <li class="on" data-type="my_orders">
                    <a href="{{ action('Wap\BuyController@groupOrders') }}/?type=my_orders">我的订单</a>
                </li>
            @elseif(strtolower(request()->get('type')) == 'groups')
                <li class="on" data-type="groups">
                    <a href="{{ action('Wap\BuyController@groupOrders') }}/?type=groups">拼团订单</a>
                </li>
            @elseif(strtolower(request()->get('type')) == 'hot')
                <li class="on" data-type="groups">
                    <a href="{{ action('Wap\BuyController@groupOrders') }}/?type=hot">热门拼团</a>
                </li>
            @else
                <li class="on" data-type="all_orders">
                    <a href="{{ action('Wap\BuyController@groupOrders') }}/?type=all_orders">全部订单</a>
                </li>
            @endif
            </ul>
        </div>

        <div class="main_warp order_content_box">
            @if(!$response_data['order_list'])
                <p class="no_order">暂无订单！</p>
            @else
                <ul id="order_content" data-next-page="{{$response_data['next_page']}}">
                    @foreach($response_data['order_list'] as $order)
                        <li>
                            <div class="order_time">{{ $order['created_at'] }}</div>
                            <a href="{{ $order['goods_url'] }}">
                                <div class="goods_info">
                                    <div class="goods_img">
                                            <img src="{{ $order['orderGoods'][0]['goods_img_url'] }}" alt="{{ $order['orderGoods'][0]['goods_title'] }}">
                                    </div>

                                    <div class="goods_name">
                                        <p>{{ $order['orderGoods'][0]['goods_title'] }} {{ $order['orderGoods'][0]['goods_spec'] }}</p>
                                        <p>数量：{{ $order['orderGoods'][0]['goods_number'] }}</p>
                                        <p>&nbsp;<!-- 库存：1000件 --></p>
                                    </div>

                                    <div class="goods_price" style="line-height:20px; width:120px;">
                                        <span>原价:&yen;<big>{{ $order['orderGoods'][0]['sale_price'] }}</big>/件</span>
                                        <span>团购价:&yen;<big id="goods_price">{{ $order['orderGoods'][0]['buy_price'] }}</big>/件</span>
                                    </div>
                                </div>
                            </a>
                            <div class="goods_sum">
                                共1件商品
                                @if($order['order_status'] == 1 && !$order['is_expire'])
                                团购第一单为原价,拼团完成后将返还团购价优惠金额
                                @endif
                                <span>实付：<big id="pay_price">&yen;{{ $order['order_amount'] }}</big></span>
                            </div>
                            <div class="order_status">
                                <!-- <span>待支付</span> -->
                                <!-- <a href="" class="go_to_buy">去支付</a> -->
                                <!-- <a href="">取消订单</a> -->
                                <!-- <a href="" class="share_pt">分享拼团</a> -->
                                @if($order['join_group'])
                                    <a href="{{ $order['join_group'] }}" class="join_pt">加入拼团</a>
                                @endif
                            </div>

                            @if($order['is_end'])
                            <div class="is_over">
                                拼团已结束
                            </div>
                            @elseif($order['is_expire'])
                            <div class="is_over">
                                拼团已过期
                            </div>
                            @endif
                            @if($order['wait_cashback'])
                            <div class="backtrack_money">
                                等待返回拼团优惠金
                            </div>
                            @endif
                        </li>
                    @endforeach
                </ul>
                <div class="load_text" id="load_point">查看更多数据</div>
            @endif
        </div>

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
        <script src="{{ elixir('js/wap/orderList.js') }}"></script>
    </body>
</html>
