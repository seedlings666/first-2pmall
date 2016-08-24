var elixir = require('laravel-elixir');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(function(mix) {
    // 复制js
    mix.copy('node_modules/jquery/dist/jquery.min.js', 'resources/assets/js/jquery.js')

        // 处理js
        .scripts('jquery.js', 'public/js/jquery.js')
        .scripts('wap/swipeSlide.min.js', 'public/js/wap/swipeSlide.js')
        .scripts('wap/order.js', 'public/js/wap/order.js')
        .scripts('wap/userInfo.js', 'public/js/wap/userInfo.js')
        .scripts('wap/orderList.js', 'public/js/wap/orderList.js')

        // 处理css、sass
        .styles('wap/base.css', 'public/css/wap')
        .styles('admin/base.css', 'public/css/admin')
        .sass('wap/index.scss', 'public/css/wap')
        .sass('wap/order.scss', 'public/css/wap')
        .sass('wap/userInfo.scss', 'public/css/wap')
        .sass('wap/orderList.scss', 'public/css/wap')

        // 添加版本号
        .version([
            'js/jquery.js',
            'js/wap/swipeSlide.js',
            'js/wap/userInfo.js',
            'js/wap/order.js',
            'js/wap/orderList.js',
            'css/wap/base.css',
            'css/wap/userInfo.css',
            'css/wap/order.css',
            'css/wap/orderList.css',
            'css/wap/index.css',
            'css/admin/base.css'
        ]);

    // 自动刷新页面
    // mix.browserSync({
    //     proxy: 'b2p.mall.net'
    // });
});
