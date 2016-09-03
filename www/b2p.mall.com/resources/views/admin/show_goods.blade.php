@extends('admin.layouts.master')

@section('header-style')
<link rel="stylesheet" type="text/css" href="{{ elixir('css/admin/colorbox.min.css') }}">
@stop

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            查看商品
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                查看商品基础数据
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12 form-horizontal">
            <!-- PAGE CONTENT BEGINS -->
            <form role="form" id="validation-form" method="get" action="">
                <!-- #section:elements.form -->
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_name"> 商品名 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input disabled type="text" id="goods_name" name="goods_name" placeholder="商品名" value="{{ $goods_details['goods_name'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_desc"> 商品简介 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input disabled type="text" id="goods_desc" name="goods_desc" placeholder="商品简介" class="col-xs-12" value="{{ $goods_details['goods_desc'] }}" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="shop_price"> 商品价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input disabled type="text" id="shop_price" name="shop_price" placeholder="商品价" value="{{ $goods_details['shop_price'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 市场价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input disabled type="text" id="market_price" name="market_price" placeholder="市场价" value="{{ $goods_details['market_price'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_number"> 库存 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input disabled type="text" id="goods_number" name="goods_number" placeholder="库存" value="{{ $goods_details['goods_number'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="is_sell"> 是否上架 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <label class="control-label">
                                <input disabled name="is_sell" class="ace ace-switch" type="checkbox" {{ $goods_details['is_on_sale'] == 1 ? 'checked' : '' }} />
                                <span class="lbl"></span>
                            </label>
                        </div>
                    </div>
                </div>


            </form>
            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right"> 单品 </label>
                <div class="col-sm-2">
                    <div class="clearfix">
                        <label class="radio">
                            <input disabled name="is_single_sku" value="1" type="radio" {{ $goods_details['attributes']['is_sku'] == 0 ? 'checked' : '' }} class="ace">
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>
                <label class="col-sm-2 control-label no-padding-right"> 多规格商品 </label>
                <div class="col-sm-2">
                    <div class="clearfix">
                        <label class="radio">
                            <input disabled name="is_single_sku" value="2" type="radio" class="ace"  {{ $goods_details['attributes']['is_sku'] == 1 ? 'checked' : '' }} id="multi_sku">
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group" id="multi_sku_box" style="display: {{ $goods_details['attributes']['is_sku'] == 1 ? 'block' : 'none' }};">
                <label class="col-sm-2 control-label no-padding-right"></label>
                <div class="col-sm-10">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="center" width="100">sku名称</th>
                                <th class="center" width="100">颜色</th>
                                <th class="center" width="100">大小</th>
                                <th class="center" width="100">商城价格</th>
                                <th class="center" width="100">市场价格</th>
                                <th class="center" width="100">库存</th>
                                <th class="center" width="100">是否上架</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(isset($goods_sku_list) && !isset($goods_sku_list['err_code']) && count($goods_sku_list) > 0 && $goods_details['attributes']['is_sku'] == 1)
                                @foreach($goods_sku_list as $lk=>$lv)
                                    <tr>
                                        <td>
                                            {{ $lv['sku_name'] }}
                                        </td>
                                        <td>
                                            {{ isset($lv['color']) ? $lv['color'] : '' }}
                                        </td>
                                        <td>
                                            {{ isset($lv['size']) ? $lv['size'] : '' }}
                                        </td>
                                        <td>
                                            {{ $lv['shop_price'] }}
                                        </td>
                                        <td>
                                            {{ $lv['market_price'] }}
                                        </td>
                                        <td>
                                            {{ $lv['sku_number'] }}
                                        </td>
                                        <td>
                                            {{ $lv['is_on_sale'] == 1 ? '是' : '否' }}
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right"> 商品图片 </label>
                <div class="col-sm-10">
                    <div class="dropzone well" id="goods_images_box">
                            <ul class="ace-thumbnails clearfix">
                                @foreach($goods_images as $v)
                                    <li>
                                        <a href="{{$v['url_links']}}" data-rel="colorbox">
                                            <img width="150" height="150" alt="150x150" src="{{$v['url_links']}}" />
                                            <div class="text">
                                                <div class="inner">{{$v['name']}}</div>
                                            </div>
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right"> 图文详情 </label>

                <div class="col-sm-10">
                    <div class="wysiwyg-editor" id="editor1">
                        {!! $goods_details['content'] !!}
                    </div>
                </div>
            </div>

            <!-- /section:elements.form -->
            <div class="space-4"></div>
        </div><!-- /.row -->
    </div>
</div><!-- /.page-content -->
@stop

@section('footer-script')
<script src="{{ elixir('js/admin/jquery.colorbox.js') }}"></script>
<script src="{{ elixir('js/admin/elements.colorpicker.js') }}"></script>
<script>
$(function() {
    var $overflow = '';
    var colorbox_params = {
        rel: 'colorbox',
        reposition:true,
        scalePhotos:true,
        scrolling:false,
        previous:'<i class="ace-icon fa fa-arrow-left"></i>',
        next:'<i class="ace-icon fa fa-arrow-right"></i>',
        close:'&times;',
        current:'{current} of {total}',
        maxWidth:'100%',
        maxHeight:'100%',
        onOpen:function(){
            $overflow = document.body.style.overflow;
            document.body.style.overflow = 'hidden';
        },
        onClosed:function(){
            document.body.style.overflow = $overflow;
        },
        onComplete:function(){
            $.colorbox.resize();
        }
    };

    $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
    $("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon
    $(document).one('ajaxloadstart.page', function(e) {
        $('#colorbox, #cboxOverlay').remove();
    });
});
</script>
@stop