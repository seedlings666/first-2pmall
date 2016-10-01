<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>悦拼商城</title>
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
        <style>
            *{
                margin: 0;
                padding: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            body{
                max-width: 640px;
                min-width: 320px;
                margin: 0 auto;
                background: #fff;
            }
            .error_page{
                padding-top: 50px;
                text-align: left;
            }
            .error_page p{
                padding-bottom: 20px;
                font-size: 16px;
            }
            .error_page a{
                display: inline-block;
                padding: 10px;
                background: #00a6dc;
                color: #fff;
                text-decoration: none;
                font-weight: bold;
                font-size: 14px;
            }
        </style>
    </head>

    <body>
        <h1>{!! $notice !!}</h1>
        <div class="error_page">
            <p>{!! $content !!}</p>
            <a href="javascript:history.back(-1);">返回上一页</a>
        </div>
    </body>
</html>
