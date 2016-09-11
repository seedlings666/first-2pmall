<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>个人中心</title>
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
        <link rel="stylesheet" href="{{ elixir('css/wap/userInfo.css') }}">
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" charset="utf-8">
			wx.config({!! $js->config(array('onMenuShareTimeline', 'onMenuShareAppMessage'), true) !!});
            wx.ready(function () {
                //分享到朋友圈
                wx.onMenuShareTimeline({
                    title: '这是分享到朋友圈的标题', // 分享标题
                    link: '这是分享到朋友圈的链接', // 分享链接
                    imgUrl: 'xx', // 分享图标
                    success: function () { 
                        // 用户确认分享后执行的回调函数
                    },
                    cancel: function () { 
                        // 用户取消分享后执行的回调函数
                    }
                });
                //分享给朋友
                wx.onMenuShareAppMessage({
                    title: '这是分享朋友的标题', // 分享标题
                    desc: '这是分享朋友的描述', // 分享描述
                    link: '这是分享朋友的链接', // 分享链接
                    imgUrl: '这是分享朋友的图片', // 分享图标
                    success: function () { 
                        // 用户确认分享后执行的回调函数
                        alert('success!');
                    },
                    cancel: function () { 
                        // 用户取消分享后执行的回调函数
                    }
                });
            });
		</script>
    </head>

    <body>
        <div class="main_warp user_info_box">
            <div class="user_photo">
                <img src="{{asset($user->avatar)}}">
            </div>
            <strong>{{$user->nick_name}}</strong>
            <p>我的积分：{{$user->points}}</p>
        </div>

        <div class="main_warp user_tool">
            <ul>
                <li class="my_order">
                    <a href="">我的订单</a>
                </li>
            </ul>
        </div>

        <script src="{{ elixir('js/jquery.js') }}"></script>
        <script src="{{ elixir('js/wap/base.js') }}"></script>
        <script src="{{ elixir('js/wap/userInfo.js') }}"></script>
    </body>
</html>
