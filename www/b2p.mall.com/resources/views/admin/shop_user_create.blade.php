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
            <form role="form" id="validation-form" method="get" action="">
                <!-- #section:elements.form -->
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 姓名 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_name" name="goods_name" placeholder="姓名名称" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 当前状态 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="market_price" name="market_price" placeholder="当前状态" class="col-xs-5" />
                        </div>
                    </div>
                </div>
            </form>

            <!-- /section:elements.form -->
            <div class="space-4"></div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="button" name="submit_from">
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