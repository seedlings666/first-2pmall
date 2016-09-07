@extends('admin.layouts.master')

@section('header-style')

@stop

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            新增店员
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                新增店员基础数据
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12 form-horizontal">
            <!-- PAGE CONTENT BEGINS -->
            <form role="form" id="validation-form" method="post" action="{{action('Admin\ManageController@postEdit')}}">
                <input type="hidden" name="id" value="{{$show->id}}" >
                <!-- #section:elements.form -->
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 工号 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_name" name="work_number" placeholder="工号" class="col-xs-5" value="{{$show->work_number}}" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 登录名称 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_name" name="user_name" placeholder="登录名称" class="col-xs-5" value="{{$show->user_name}}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 昵称 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_name" name="nick_name" placeholder="昵称" class="col-xs-5" value="{{$show->nick_name}}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 手机号码 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_name" name="mobile_phone" placeholder="手机号码" class="col-xs-5" value="{{$show->mobile_phone}}"/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 密码 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="password" id="goods_name" name="password" placeholder="密码" class="col-xs-5" />
                        </div>
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 当前状态 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <select name="status">
                                <option value="1" @if ($show->status == 1) selected="selected" @endif>开店</option>
                                <option value="0" @if ($show->status == 0) selected="selected" @endif>闭店</option>
                            </select>
                        </div>
                    </div>
                <div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" > 店铺 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <select name="shop_id">
                            @foreach ($shop_list as $value)
                                <option value="{{$value->id}}" @if($value->id == $show->manageShopRelation->shop_id) selected="selected" @endif>{{$value->name}}</option>
                            @endforeach
                            </select>
                        </div>
                    </div>
                <div>
            </form>

            <!-- /section:elements.form -->
            <div class="space-4"></div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="submit" name="submit_from">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        提交
                    </button>

                    &nbsp; &nbsp; &nbsp;
                    <a href="{{url('/admin')}}" class="btn" type="reset">
                        <i class="ace-icon fa fa-undo bigger-110"></i>
                        取消
                    </a>
                </div>
            </div>
        </div><!-- /.row -->
    </div>
</div><!-- /.page-content -->
@stop

@section('footer-script')

@stop
