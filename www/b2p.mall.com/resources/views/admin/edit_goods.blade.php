@extends('admin.layouts.master')

@section('header-style')
<link rel="stylesheet" type="text/css" href="{{ elixir('css/admin/dropzone.css') }}">
@stop

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            新增商品
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                新增商品基础数据
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
                            <input type="text" id="goods_name" name="goods_name" placeholder="商品名" value="{{ $goods_details['goods_name'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_desc"> 商品简介 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_desc" name="goods_desc" placeholder="商品简介" class="col-xs-12" value="{{ $goods_details['goods_desc'] }}" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="shop_price"> 商品价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="shop_price" name="shop_price" placeholder="商品价" value="{{ $goods_details['shop_price'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 市场价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="market_price" name="market_price" placeholder="市场价" value="{{ $goods_details['market_price'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_number"> 库存 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_number" name="goods_number" placeholder="库存" value="{{ $goods_details['goods_number'] }}" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="is_sell"> 是否上架 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <label class="control-label">
                                <input name="is_sell" class="ace ace-switch" type="checkbox" {{ $goods_details['is_on_sale'] == 1 ? 'checked="checked"' : '' }}} />
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
                            <input name="is_single_sku" value="1" type="radio" {{ $goods_details['is_sku'] == 0 ? 'checked' : '' }} class="ace">
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>
                <label class="col-sm-2 control-label no-padding-right"> 多规格商品 </label>
                <div class="col-sm-2">
                    <div class="clearfix">
                        <label class="radio">
                            <input name="is_single_sku" value="2" type="radio" class="ace"  {{ $goods_details['is_sku'] == 1 ? 'checked' : '' }} id="multi_sku">
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group" id="multi_sku_box" style="display: {{ $goods_details['is_sku'] == 1 ? 'block' : 'none' }}};">
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
                                <th class="center" width="100">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        @if(isset($goods_sku_list) && count($goods_sku_list) > 0)
                            @foreach($goods_sku_list as $lk=>$lv)
                            <tr>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_name" value="{{ $lv['sku_name'] }}" placeholder="sku名称">
                                </td>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_color" value="{{ isset($lv['color']) ? $lv['color'] : '' }}" placeholder="颜色">
                                </td>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_size" value="{{ isset($lv['size']) ? $lv['size'] : '' }}" placeholder="大小">
                                </td>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_price" value="{{ $lv['shop_price'] }}" placeholder="商城价格">
                                </td>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_market_price" value="{{ $lv['market_price'] }}" placeholder="市场价格">
                                </td>
                                <td>
                                    <input class="col-xs-12" type="text" name="sku_goods_number" value="{{ $lv['sku_number'] }}" placeholder="库存">
                                </td>
                                <td class="center">
                                    <a title="新增" class="btn btn-xs btn-success" href="javascript:void(0);" id="add_sku">
                                        <i class="ace-icon fa fa-plus bigger-120"></i>
                                    </a>
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
                        <div class="fallback">
                            <input name="file" type="file" multiple="" />
                        </div>
                    </div>
                    <div id="preview-template" class="hide">
                        <div class="dz-preview dz-file-preview">
                            <!--
                            //获取现有图片
                                @if(isset($goods_images) && is_array($goods_images) && count($goods_images))
                                    @foreach($goods_images as $sk=>$sv)
                                        <div>图片 id : {{ $sv['id'] }} </div>
                                        <div>文件名称 : {{ $sv['file_name'] }} </div>
                                        <div>文件原名 : {{ $sv['origin_name'] }} </div>
                                        <div>文件 url : {{ $sv['url_links'] }} </div>
                                    @endforeach
                                @endif

                            -->
                            <div class="dz-image">
                                <img data-dz-thumbnail="" />
                            </div>

                            <div class="dz-details">
                                <div class="dz-size">
                                    <span data-dz-size=""></span>
                                </div>

                                <div class="dz-filename">
                                    <span data-dz-name=""></span>
                                </div>
                            </div>

                            <div class="dz-progress">
                                <span class="dz-upload" data-dz-uploadprogress="上传中~~"></span>
                            </div>

                            <div class="dz-error-message">
                                <span data-dz-errormessage="文件上传错误！"></span>
                            </div>

                            <div class="dz-success-mark">
                                <span class="fa-stack fa-lg bigger-150">
                                    <i class="fa fa-circle fa-stack-2x white"></i>
                                    <i class="fa fa-check fa-stack-1x fa-inverse green"></i>
                                </span>
                            </div>

                            <div class="dz-error-mark">
                                <span class="fa-stack fa-lg bigger-150">
                                    <i class="fa fa-circle fa-stack-2x white"></i>
                                    <i class="fa fa-remove fa-stack-1x fa-inverse red"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right"> 图文详情 </label>

                <div class="col-sm-10">
                    <div class="wysiwyg-editor" id="editor1">
                        {{ $goods_details['content'] }}
                    </div>
                </div>
            </div>

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
<script src="{{ elixir('js/admin/dropzone.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.validate.js') }}"></script>
<script src="{{ elixir('js/admin/additional-methods.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.hotkeys.js') }}"></script>
<script src="{{ elixir('js/admin/bootstrap-wysiwyg.js') }}"></script>
<script src="{{ elixir('js/admin/elements.fileinput.js') }}"></script>
<script src="{{ elixir('js/admin/elements.colorpicker.js') }}"></script>
<script src="{{ elixir('js/admin/elements.wysiwyg.js') }}"></script>

<script>
$(function(){
    // 最终提交的数据
    var goods_content = {};

    // 零时保存sku组信息
    var sku_tmp_data = [];

    // 保存图片id
    var images_id = [];

    // 服务器图片数据
    // var serviceImages = {{ $goods_images }};

    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            goods_name: {
                required: true
            },
            goods_desc: {
                required: true,
                maxlength: 50
            },
            shop_price: {
                required: true,
                number: true
            },
            market_price: {
                required: true,
                number: true
            },
            goods_number: {
                required: true,
                number: true
            }
        },
        messages: {
            goods_name: "必须填写商品名！",
            goods_desc: {
                required: "必须填写商品简介！",
                maxlength: "输入的内容不得大于50的字符！"
            },
            shop_price: {
                required: "必须填写商品价格！",
                number: "请输入一个正确的数字！"
            },
            market_price: {
                required: "必须填写商品市场价格！",
                number: "请输入一个正确的数字！"
            },
            goods_number: {
                required: "必须填写商品名库存！",
                number: "请输入一个正确的数字！"
            }
        },
        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
            $(e).remove();
        },
        errorPlacement: function (error, element) {
            if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                var controls = element.closest('div[class*="col-"]');
                if(controls.find(':checkbox,:radio').length > 1) {
                    controls.append(error);
                } else {
                    error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                }
            } else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            } else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            } else {
                error.insertAfter(element.parent());
            }
        },

        submitHandler: function (form) {
            var data = $(form).serializeArray();
            var goods_detail = $('#editor1').html();
            var is_single_sku = $('[name=is_single_sku]:checked').val();

            //console.log(is_single_sku);

            // 确保图片不为空
            if(images_id.length == 0){
                alert('请上传商品图片至少一张！');
                return false;
            }

            // 循环把表单数据转为json格式
            $.each(data, function (ix) {
                goods_content[this.name] = this.value;
            });

            // 判断是否上架
            if($('[name=is_sell]').prop('checked')){
                goods_content['is_on_sale'] = 1;
            }else{
                goods_content['is_on_sale'] = 0;
            }

            // 图片id赋值
            goods_content['images'] = images_id.toString();

            // 获取富文本内容
            goods_content['content'] = goods_detail;

            //数据库中0是单品,1是多 sku
            goods_content['is_sku'] = is_single_sku == 1 ? 0 : 1;

            // 判断是否为多规格商品
            if(goods_content['is_sku']){
                goods_content['sku_list'] = sku_tmp_data;
            }

            var a = {};
            a['goods_content'] = goods_content;
            // 提交数据
            $.ajax({
                url: '{{ url('/admin/goods/store') }}',
                type: 'POST',
                data: a
            })
            .done(function(json){
                alert('新建商品成功！')
                window.location.href = "{{ url('/admin/goods') }}";
            })
            .fail(function(re){
                alert(re.msg);
                console.log('fail', re);
            });
            return false;
        },
        invalidHandler: function (form) {
        }
    });

    // 富文本编辑器
    $('#editor1').ace_wysiwyg({
        toolbar:
        [
            'font',
            null,
            'fontSize',
            null,
            {name:'bold', className:'btn-info'},
            {name:'italic', className:'btn-info'},
            {name:'strikethrough', className:'btn-info'},
            {name:'underline', className:'btn-info'},
            null,
            {name:'insertunorderedlist', className:'btn-success'},
            {name:'insertorderedlist', className:'btn-success'},
            {name:'outdent', className:'btn-purple'},
            {name:'indent', className:'btn-purple'},
            null,
            {name:'justifyleft', className:'btn-primary'},
            {name:'justifycenter', className:'btn-primary'},
            {name:'justifyright', className:'btn-primary'},
            {name:'justifyfull', className:'btn-inverse'},
            null,
            {name:'createLink', className:'btn-pink'},
            {name:'unlink', className:'btn-pink'},
            null,
            {name:'insertImage', className:'btn-success'},
            null,
            'foreColor',
            null,
            'viewSource',
            {name:'undo', className:'btn-grey'},
            {name:'redo', className:'btn-grey'}
        ],
        'wysiwyg': {
            fileUploadError: showErrorAlert
        }
    }).prev().addClass('wysiwyg-style1');

    function showErrorAlert (reason, detail) {
        var msg='';
        if (reason==='unsupported-file-type') { msg = "不支持的格式 " + detail; }
        else {
            console.log("error uploading file", reason, detail);
        }
        $('<div class="alert"><button type="button" class="close" data-dismiss="alert">&times;</button>'+'<strong>文件上传错误！</strong> '+msg+' </div>').prependTo('#alerts');
    }

    // 多sku
    $('[name=is_single_sku]').on('change', function(){
        var status = $(this).prop('checked');
        var thisId = $(this).attr('id');
        if(status && thisId == 'multi_sku'){
            $('#multi_sku_box').show();
        }else{
            $('#multi_sku_box').hide();
        }
    });

    // 增加sku
    var sku_tmp_id = 0;
    $('#add_sku').on('click', function(){
        var sku_name         = $('[name=sku_name]').val();
        var sku_color        = $('[name=sku_color]').val();
        var sku_size         = $('[name=sku_size]').val();
        var sku_price        = $('[name=sku_price]').val();
        var sku_goods_number        = $('[name=sku_goods_number]').val();
        var sku_market_price = $('[name=sku_market_price]').val();

        if(sku_name == ''){
            alert("sku名称必须填写！");
            return false;
        }

        if(sku_color == ''){
            alert("sku颜色必须填写！");
            return false;
        }

        if(sku_size == ''){
            alert("sku大小必须填写！");
            return false;
        }

        if(sku_price == ''){
            alert("sku价格必须填写！");
            return false;
        }

        if(sku_market_price == ''){
            alert("sku市场价格必须填写！");
            return false;
        }

        if(sku_goods_number == ''){
            alert("sku库存必须填写！");
            return false;
        }
        var data = {
            id: sku_tmp_id,
            sku_name: sku_name,
            color: sku_color,
            size: sku_size,
            shop_price: sku_price,
            sku_number: sku_goods_number,
            market_price: sku_market_price
        }

        var appHt = '<tr><td>'+ data.sku_name +'</td><td>'+ data.color +'</td><td>'+ data.size +'</td><td>'+ data.shop_price +'</td><td>'+ data.market_price +'</td><td>'+ data.sku_number +'</td><td class="center"><button class="btn btn-xs btn-danger" data-id="'+ data.id +'" name="del_sku"><i class="ace-icon fa fa-trash-o bigger-120"></i></button></td></tr>';

        $(this).parents('tr').after(appHt);

        sku_tmp_data.push(data);
        sku_tmp_id++;

        $('[name=sku_name]').val('');
        $('[name=sku_color]').val('');
        $('[name=sku_size]').val('');
        $('[name=sku_price]').val('');
        $('[name=sku_goods_number]').val('');
        $('[name=sku_market_price]').val('');
    });

    // 删除新增的sku
    $('body').on('click', '[name=del_sku]', function(){
        var dataId = $(this).data('id');
        $.each(sku_tmp_data, function(ix){
            if(this.id == dataId){
                sku_tmp_data.splice(ix, 1);
            }
        });
        $(this).parents('tr').remove();
    });

    // 表单提交
    $('[name=submit_from]').on('click', function(){
        $('#validation-form').submit();
    });

    // 图片上传
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone('#goods_images_box', {
        url: '{{ url('admin/goods/upload') }}',
        previewTemplate: $('#preview-template').html(),
        thumbnailHeight: 120,
        thumbnailWidth: 120,
        maxFilesize: 100,
        addRemoveLinks : true,
        dictRemoveFile: '删除图片',
        dictDefaultMessage :
        '<span class="bigger-150 bolder"><i class="ace-icon fa fa-caret-right red"></i> 拖拽多个文件</span> 到这里上传 \
        <span class="smaller-80 grey">(或点击)</span> <br /> \
        <i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>'
        ,
        thumbnail: function(file, dataUrl) {
            if (file.previewElement) {
                $(file.previewElement).removeClass("dz-file-preview");
                var images = $(file.previewElement).find("[data-dz-thumbnail]").each(function() {
                    var thumbnailElement = this;
                    thumbnailElement.alt = file.name;
                    thumbnailElement.src = dataUrl;
                });
                setTimeout(function() {
                    $(file.previewElement).addClass("dz-image-preview");
                }, 1);
            }
        },
        init: function () {
            this.on('success',function(arg1, arg2){
                if(arg2){
                    images_id.push(arg2.id);
                }
            });
            this.on('removedfile', function(arg){
                var data = $.parseJSON(arg.xhr.response);
                images_id.splice($.inArray(data.id, images_id), 1);
            });
        }
    });

    // 服务器图片显示
    // myDropzone.emit('addedfile', serviceImages);
    // myDropzone.emit("thumbnail", serviceImages, "/image/url");
});
</script>
@stop