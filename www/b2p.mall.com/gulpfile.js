var elixir = require('laravel-elixir');
require('laravel-elixir-uglify');
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
elixir.config.sourcemaps = false;

elixir(function(mix) {
    // 复制js
    mix.copy('node_modules/jquery/dist/jquery.min.js', 'resources/assets/js/jquery.js')

        // 复制字体文件
        .copy('resources/assets/fonts', 'public/build/css/fonts')

        // 处理js
        .scripts('jquery.js', 'public/js/jquery.js')
        .scripts('wap/base.js', 'public/js/wap/base.js')
        .scripts('wap/swipeSlide.min.js', 'public/js/wap/swipeSlide.js')
        .scripts('wap/order.js', 'public/js/wap/order.js')
        .scripts('wap/userInfo.js', 'public/js/wap/userInfo.js')
        .scripts('wap/orderList.js', 'public/js/wap/orderList.js')
        .scripts('wap/detail.js', 'public/js/wap/detail.js')
        .scripts('admin/ace-extra.js', 'public/js/admin/ace-extra.js')
        .scripts('admin/ace-elements.js', 'public/js/admin/ace-elements.js')
        .scripts('admin/tree.js', 'public/js/admin/tree.js')
        .scripts('admin/html5shiv.min.js', 'public/js/admin/html5shiv.min.js')
        .scripts('admin/respond.min.js', 'public/js/admin/respond.min.js')
        .scripts('admin/jquery.mobile.custom.js', 'public/js/admin/jquery.mobile.custom.js')
        .scripts('admin/bootstrap.js', 'public/js/admin/bootstrap.js')
        .scripts('admin/jquery-ui.custom.js', 'public/js/admin/jquery-ui.custom.js')
        .scripts('admin/jquery.easypiechart.js', 'public/js/admin/jquery.easypiechart.js')
        .scripts('admin/jquery.ui.touch-punch.js', 'public/js/admin/jquery.ui.touch-punch.js')
        .scripts('admin/jquery.sparkline/index.js', 'public/js/admin/sparkline.js')
        .scripts('admin/jquery-validation/jquery.validate.js', 'public/js/admin/jquery.validate.js')
        .scripts('admin/jquery-validation/additional-methods.js', 'public/js/admin/additional-methods.js')
        .scripts('admin/jquery.flot.js', 'public/js/admin/jquery.flot.js')
        .scripts('admin/jquery.flot.pie.js', 'public/js/admin/jquery.flot.pie.js')
        .scripts('admin/jquery.flot.time.js', 'public/js/admin/jquery.flot.time.js')
        .scripts('admin/jquery.flot.resize.js', 'public/js/admin/jquery.flot.resize.js')
        .scripts('admin/jquery.flot.axislabels.js', 'public/js/admin/jquery.flot.axislabels.js')
        .scripts('admin/src/elements.scroller.js', 'public/js/admin/elements.scroller.js')
        .scripts('admin/src/elements.colorpicker.js', 'public/js/admin/elements.colorpicker.js')
        .scripts('admin/src/elements.fileinput.js', 'public/js/admin/elements.fileinput.js')
        .scripts('admin/src/elements.typeahead.js', 'public/js/admin/elements.typeahead.js')
        .scripts('admin/src/elements.wysiwyg.js', 'public/js/admin/elements.wysiwyg.js')
        .scripts('admin/src/elements.spinner.js', 'public/js/admin/elements.spinner.js')
        .scripts('admin/src/elements.treeview.js', 'public/js/admin/elements.treeview.js')
        .scripts('admin/src/elements.wizard.js', 'public/js/admin/elements.wizard.js')
        .scripts('admin/src/elements.aside.js', 'public/js/admin/elements.aside.js')
        .scripts('admin/src/elements.onpage-help.js', 'public/js/admin/elements.onpage-help.js')
        .scripts('admin/src/ace.js', 'public/js/admin/ace.js')
        .scripts('admin/src/ace.basics.js', 'public/js/admin/ace.basics.js')
        .scripts('admin/src/ace.scrolltop.js', 'public/js/admin/ace.scrolltop.js')
        .scripts('admin/src/ace.ajax-content.js', 'public/js/admin/ace.ajax-content.js')
        .scripts('admin/src/ace.touch-drag.js', 'public/js/admin/ace.touch-drag.js')
        .scripts('admin/src/ace.sidebar.js', 'public/js/admin/ace.sidebar.js')
        .scripts('admin/src/ace.sidebar-scroll-1.js', 'public/js/admin/ace.sidebar-scroll-1.js')
        .scripts('admin/src/ace.submenu-hover.js', 'public/js/admin/ace.submenu-hover.js')
        .scripts('admin/src/ace.widget-box.js', 'public/js/admin/ace.widget-box.js')
        .scripts('admin/src/ace.settings.js', 'public/js/admin/ace.settings.js')
        .scripts('admin/src/ace.settings-rtl.js', 'public/js/admin/ace.settings-rtl.js')
        .scripts('admin/src/ace.settings-skin.js', 'public/js/admin/ace.settings-skin.js')
        .scripts('admin/src/ace.widget-on-reload.js', 'public/js/admin/ace.widget-on-reload.js')
        .scripts('admin/src/ace.searchbox-autocomplete.js', 'public/js/admin/ace.searchbox-autocomplete.js')
        .scripts('admin/src/ace.onpage-help.js', 'public/js/admin/ace.onpage-help.js')
        .scripts('admin/rainbow.js', 'public/js/admin/rainbow.js')
        .scripts('admin/html.js', 'public/js/admin/html.js')
        .scripts('admin/css.js', 'public/js/admin/css.js')
        .scripts('admin/generic.js', 'public/js/admin/generic.js')
        .scripts('admin/javascript.js', 'public/js/admin/javascript.js')
        .scripts('admin/bootstrap-wysiwyg/bootstrap-wysiwyg.js', 'public/js/admin/bootstrap-wysiwyg.js')
        .scripts('admin/jquery.hotkeys/index.js', 'public/js/admin/jquery.hotkeys.js')
        .scripts('admin/bootbox/bootbox.js', 'public/js/admin/bootbox.js')
        .scripts('admin/jqueryui-touch-punch/jquery.ui.touch-punch.js', 'public/js/admin/jquery.ui.touch-punch.js')
        .scripts('admin/dropzone.js', 'public/js/admin/dropzone.js')
        .scripts('admin/jquery.colorbox.min.js', 'public/js/admin/jquery.colorbox.js')

        // 处理css、sass
        .styles('wap/base.css', 'public/css/wap')
        .sass('wap/index.scss', 'public/css/wap')
        .sass('wap/order.scss', 'public/css/wap')
        .sass('wap/orderDetail.scss', 'public/css/wap')
        .sass('wap/userInfo.scss', 'public/css/wap')
        .sass('wap/orderList.scss', 'public/css/wap')
        .styles('admin/ace.css', 'public/css/admin')
        .styles('admin/dropzone.css', 'public/css/admin')
        .styles('admin/ace.onpage-help.css', 'public/css/admin')
        .styles('admin/ace-fonts.css', 'public/css/admin')
        .styles('admin/ace-ie.css', 'public/css/admin')
        .styles('admin/ace-part2.css', 'public/css/admin')
        .styles('admin/ace-rtl.css', 'public/css/admin')
        .styles('admin/ace-skins.css', 'public/css/admin')
        .styles('admin/bootstrap.css', 'public/css/admin')
        .styles('admin/pace.css', 'public/css/admin')
        .styles('admin/font-awesome.min.css', 'public/css/admin')
        .styles('admin/sunburst.css', 'public/css/admin')
        .styles('admin/colorbox.min.css', 'public/css/admin')


        // 添加版本号
        .version([
            // 公用 js
            'js/jquery.js',

            // wap js
            'js/wap/base.js',
            'js/wap/swipeSlide.js',
            'js/wap/userInfo.js',
            'js/wap/order.js',
            'js/wap/orderList.js',
            'js/wap/detail.js',

            // admin js
            'js/admin/ace-extra.js',
            'js/admin/html5shiv.min.js',
            'js/admin/respond.min.js',
            'js/admin/jquery.mobile.custom.js',
            'js/admin/bootstrap.js',
            'js/admin/jquery-ui.custom.js',
            'js/admin/jquery.ui.touch-punch.js',
            'js/admin/jquery.easypiechart.js',
            'js/admin/jquery.ui.touch-punch.js',
            'js/admin/sparkline.js',
            'js/admin/jquery.flot.js',
            'js/admin/jquery.flot.pie.js',
            'js/admin/jquery.flot.time.js',
            'js/admin/jquery.flot.resize.js',
            'js/admin/jquery.flot.axislabels.js',
            'js/admin/jquery.validate.js',
            'js/admin/additional-methods.js',
            'js/admin/elements.scroller.js',
            'js/admin/elements.colorpicker.js',
            'js/admin/elements.fileinput.js',
            'js/admin/elements.typeahead.js',
            'js/admin/elements.wysiwyg.js',
            'js/admin/elements.spinner.js',
            'js/admin/elements.treeview.js',
            'js/admin/elements.wizard.js',
            'js/admin/elements.aside.js',
            'js/admin/elements.onpage-help.js',
            'js/admin/ace.js',
            'js/admin/ace.basics.js',
            'js/admin/ace.scrolltop.js',
            'js/admin/ace.ajax-content.js',
            'js/admin/ace.touch-drag.js',
            'js/admin/ace.sidebar.js',
            'js/admin/ace.sidebar-scroll-1.js',
            'js/admin/ace.submenu-hover.js',
            'js/admin/ace.widget-box.js',
            'js/admin/ace.settings.js',
            'js/admin/ace.settings-rtl.js',
            'js/admin/ace.settings-skin.js',
            'js/admin/ace.widget-on-reload.js',
            'js/admin/ace.searchbox-autocomplete.js',
            'js/admin/ace.onpage-help.js',
            'js/admin/rainbow.js',
            'js/admin/javascript.js',
            'js/admin/html.js',
            'js/admin/css.js',
            'js/admin/generic.js',
            'js/admin/ace-elements.js',
            'js/admin/tree.js',
            'js/admin/bootstrap-wysiwyg.js',
            'js/admin/jquery.hotkeys.js',
            'js/admin/bootbox.js',
            'js/admin/dropzone.js',
            'js/admin/jquery.colorbox.js',

            // wap css
            'css/wap/base.css',
            'css/wap/userInfo.css',
            'css/wap/order.css',
            'css/wap/orderDetail.css',
            'css/wap/orderList.css',
            'css/wap/index.css',

            // admin css
            'css/admin/ace.css',
            'css/admin/dropzone.css',
            'css/admin/ace.onpage-help.css',
            'css/admin/ace-fonts.css',
            'css/admin/ace-ie.css',
            'css/admin/ace-part2.css',
            'css/admin/ace-rtl.css',
            'css/admin/ace-skins.css',
            'css/admin/bootstrap.css',
            'css/admin/pace.css',
            'css/admin/font-awesome.min.css',
            'css/admin/sunburst.css',
            'css/admin/colorbox.min.css',
        ])
        .uglify();

    // 自动刷新页面
    // mix.browserSync({
    //     proxy: 'b2p.mall.net'
    // });
});
