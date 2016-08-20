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
    // 复制css
    mix.copy('node_modules/islider.js/build/iSlider.min.css', 'resources/assets/css/wap/iSlider.css')

        // 复制js
        .copy('node_modules/jquery/dist/jquery.min.js', 'resources/assets/js/jquery.js')
        .copy('node_modules/islider.js/build/iSlider.min.js', 'resources/assets/js/wap/iSlider.min.js')
        .copy('node_modules/islider.js/build/iSlider.plugin.dot.min.js', 'resources/assets/js/wap/iSlider.plugin.dot.min.js')
        .copy('node_modules/islider.js/build/iSlider.plugin.button.min.js', 'resources/assets/js/wap/iSlider.plugin.button.min.js')

        // 处理js
        .scripts('jquery.js', 'public/js/jquery.js')
        .scripts('wap/base.js', 'public/js/wap/base.js')
        .scripts('wap/swipeSlide.min.js', 'public/js/wap/swipeSlide.js')

        // 处理css、sass
        .styles('wap/base.css', 'public/css/wap')
        .styles('wap/iSlider.css', 'public/css/wap')
        .styles('admin/base.css', 'public/css/admin')
        .sass('wap/index.scss', 'public/css/wap')

        // 添加版本号
        .version([
            'js/jquery.js',
            'js/wap/swipeSlide.js',
            'js/wap/base.js',
            'css/wap/base.css',
            'css/wap/index.css',
            'css/admin/base.css'
        ]);

    // 自动刷新页面
    // mix.browserSync({
    //     proxy: 'b2p.mall.net'
    // });
});
