<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>@yield('page-title', '后台管理系统')</title>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="{{ elixir('css/admin/bootstrap.css') }}" />
        <link rel="stylesheet" href="{{ elixir('css/admin/font-awesome.min.css') }}"/>

        <!-- page specific plugin styles -->
        @yield('header-style')

        <!-- text fonts -->
        <link rel="stylesheet" href="{{ elixir('css/admin/ace-fonts.css') }}" />

        <!-- ace styles -->
        <link rel="stylesheet" href="{{ elixir('css/admin/ace.css') }}" class="ace-main-stylesheet" id="main-ace-style" />

        <!--[if lte IE 9]>
            <link rel="stylesheet" href="{{ elixir('css/admin/ace-part2.css') }}" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="{{ elixir('css/admin/ace-skins.css') }}" />
        <link rel="stylesheet" href="{{ elixir('css/admin/ace-rtl.css') }}" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="{{ elixir('css/admin/ace-ie.css') }}" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="{{ elixir('js/admin/ace-extra.js') }}"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
            <script src="{{ elixir('js/admin/html5shiv.min.js') }}"></script>
            <script src="{{ elixir('js/admin/respond.min.js') }}"></script>
        <![endif]-->
    </head>

    <body class="no-skin">
        <!-- #section:basics/navbar.layout -->
        <div id="navbar" class="navbar navbar-default ace-save-state">
            <div class="navbar-container ace-save-state" id="navbar-container">
                @include('admin.layouts.topMenu')
            </div><!-- /.navbar-container -->
        </div>

        <!-- /section:basics/navbar.layout -->
        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try{ace.settings.loadState('main-container')}catch(e){}
            </script>

            <!-- #section:basics/sidebar -->
            <div id="sidebar" class="sidebar responsive ace-save-state">
                <script type="text/javascript">
                    try{ace.settings.loadState('sidebar')}catch(e){}
                </script>
                @include('admin.layouts.sidebar')
                <!-- /section:basics/sidebar.layout.minimize -->
            </div>
            <!-- /section:basics/sidebar -->

            <div class="main-content">
                <div class="main-content-inner">
                    @include('admin.layouts.breadcrumb')
                    @yield('content')
                </div>
            </div><!-- /.main-content -->

            <div class="footer">
                <div class="footer-inner">
                    <!-- #section:basics/footer -->
                    @include('admin.layouts.footer')
                    <!-- /section:basics/footer -->
                </div>
            </div>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <script src="{{ elixir('js/jquery.js') }}"></script>

        <script src="{{ elixir('js/admin/bootstrap.js') }}"></script>

        <!-- ace scripts -->
        <script src="{{ elixir('js/admin/ace.js') }}"></script>
        <script src="{{ elixir('js/admin/ace.basics.js') }}"></script>
        <script src="{{ elixir('js/admin/ace.sidebar.js') }}"></script>
        <script src="{{ elixir('js/admin/ace.settings.js') }}"></script>

        @yield('footer-script')
    </body>
</html>