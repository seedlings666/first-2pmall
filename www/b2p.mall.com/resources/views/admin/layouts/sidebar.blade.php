<div class="sidebar-shortcuts" id="sidebar-shortcuts">
    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
        <a href="{{ url('/admin/goods') }}" class="btn btn-success">
            <i class="ace-icon fa fa-inbox"></i>
        </a>

        <a href="{{ url('/admin/order') }}" class="btn btn-info">
            <i class="ace-icon fa fa-list"></i>
        </a>

        <!-- #section:basics/sidebar.layout.shortcuts -->
        <a href="{{ url('/admin/user') }}" class="btn btn-warning">
            <i class="ace-icon fa fa-users"></i>
        </a>

        @ability('admin,owner', 'view-permission')
        <a href="{{ url('/admin/permission') }}" class="btn btn-danger">
            <i class="ace-icon fa fa-cogs"></i>
        </a>
        @endability

        <!-- /section:basics/sidebar.layout.shortcuts -->
    </div>

    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
        <span class="btn btn-success"></span>

        <span class="btn btn-info"></span>

        <span class="btn btn-warning"></span>

        <span class="btn btn-danger"></span>
    </div>
</div><!-- /.sidebar-shortcuts -->

<ul class="nav nav-list">

    @ability('admin,owner', 'view-goods')
    <li class="{{ Request::is('admin/goods*') ? 'active' : '' }}">
        <a href="{{ url('/admin/goods') }}">
            <i class="menu-icon fa fa-inbox"></i>
            <span class="menu-text"> 商品管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-order')
    <li class="{{ Request::is('admin/order*') ? 'active' : '' }}">
        <a href="{{ url('/admin/order') }}">
            <i class="menu-icon fa fa-list"></i>
            <span class="menu-text"> 订单管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-statistics')
    <li class="{{ Request::is('admin/statistical/order*') ? 'active' : '' }}">
        <a href="{{ action('Admin\StatisticalController@getOrder') }}">
            <i class="menu-icon fa fa-bar-chart-o"></i>
            <span class="menu-text"> 订单统计 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-shop')
    <li class="{{ Request::is('admin/shop*') ? 'active' : '' }}">
        <a href="{{ url('/admin/shop') }}">
            <i class="menu-icon fa fa-users"></i>
            <span class="menu-text"> 店铺管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-shop-staff')
    <li class="{{ Request::is('admin/manage*') ? 'active' : '' }}">
        <a href="{{ action('Admin\ManageController@getIndex') }}">
            <i class="menu-icon fa fa-users"></i>
            <span class="menu-text"> 店员管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-user')
    <li class="{{ Request::is('admin/user*') ? 'active' : '' }}">
        <a href="{{ url('/admin/user') }}">
            <i class="menu-icon fa fa-users"></i>
            <span class="menu-text"> 用户管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability

    @ability('admin,owner', 'view-permission')
    <li class="{{ Request::is('admin/permission*') ? 'active' : '' }}">
        <a href="{{ url('/admin/permission') }}">
            <i class="menu-icon fa fa-cogs"></i>
            <span class="menu-text"> 权限管理 </span>
        </a>

        <b class="arrow"></b>
    </li>
    @endability
</ul><!-- /.nav-list -->

<!-- #section:basics/sidebar.layout.minimize -->
<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
    <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
</div>
