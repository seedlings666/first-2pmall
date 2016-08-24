<!-- #section:basics/sidebar.mobile.toggle -->
<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
    <span class="sr-only">Toggle sidebar</span>

    <span class="icon-bar"></span>

    <span class="icon-bar"></span>

    <span class="icon-bar"></span>
</button>

<!-- /section:basics/sidebar.mobile.toggle -->
<div class="navbar-header pull-left">
    <!-- #section:basics/navbar.layout.brand -->
    <a href="javascript:void(0);" class="navbar-brand">
        <small>
            <i class="fa fa-tachometer"></i>
            后台管理系统
        </small>
    </a>

    <!-- /section:basics/navbar.layout.brand -->

    <!-- #section:basics/navbar.toggle -->

    <!-- /section:basics/navbar.toggle -->
</div>

<!-- #section:basics/navbar.dropdown -->
<div class="navbar-buttons navbar-header pull-right" role="navigation">
    <ul class="nav ace-nav">
        <!-- #section:basics/navbar.user_menu -->
        <li class="light-blue dropdown-modal">
            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                <img class="nav-user-photo" src="{{ asset('images/avatars/user.jpg') }}" alt="Jason's Photo" />
                <span class="user-info">
                    <small>欢迎,</small>
                    管理员
                </span>

                <i class="ace-icon fa fa-caret-down"></i>
            </a>

            <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                <li>
                    <a href="#">
                        <i class="ace-icon fa fa-cog"></i>
                        个人设置
                    </a>
                </li>

                <li class="divider"></li>

                <li>
                    <a href="#">
                        <i class="ace-icon fa fa-power-off"></i>
                        退出登录
                    </a>
                </li>
            </ul>
        </li>
        <!-- /section:basics/navbar.user_menu -->
    </ul>
</div>
<!-- /section:basics/navbar.dropdown -->