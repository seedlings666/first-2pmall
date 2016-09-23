@extends('admin.layouts.master')

@section('header-style')

@stop

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            新增店铺
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                新增店铺基础数据
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12 form-horizontal">
            <!-- PAGE CONTENT BEGINS -->
            <form role="form" id="validation-form" method="post" action="{{action('Admin\ShopController@postStore')}}">
                <!-- #section:elements.form -->
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="shop_name"> 店铺名称 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="shop_name" name="name" placeholder="店铺名称" class="col-xs-5"/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="alias"> 别称 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="alias" name="alias" placeholder="别称" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="address"> 地址 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="address" name="address" placeholder="地址" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 当前状态 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <select name="status">
                                <option value="1" >开店</option>
                                <option value="0" >闭店</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="nick_name"> 商家称呼 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="nick_name" name="nick_name" placeholder="商家称呼" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="user_name"> 商家账号 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="user_name" name="user_name" placeholder="商家账号" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="password"> 商家密码 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="password" id="password" name="password" placeholder="商家密码" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="mobile_phone"> 商家手机 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="mobile_phone" name="mobile_phone" placeholder="商家手机" class="col-xs-5" />
                        </div>
                    </div>
                </div>

            <!-- /section:elements.form -->
            <div class="space-4"></div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="submit" name="submit_from">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        提交
                    </button>

                </div>
            </div>
            </form>
        </div><!-- /.row -->
    </div>
</div><!-- /.page-content -->
@stop

@section('footer-script')

@stop
