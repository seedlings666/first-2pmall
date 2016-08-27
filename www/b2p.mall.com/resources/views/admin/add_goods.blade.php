@extends('admin.layouts.master')

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
                            <input type="text" id="goods_name" name="goods_name" placeholder="商品名" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_summary"> 商品简介 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_summary" name="goods_summary" placeholder="商品简介" class="col-xs-12" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="goods_price"> 商品价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="goods_price" name="goods_price" placeholder="商品价" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="market_price"> 市场价 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="market_price" name="market_price" placeholder="市场价" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="stock"> 库存 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <input type="text" id="stock" name="stock" placeholder="库存" class="col-xs-5" />
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="is_sell"> 是否上架 </label>

                    <div class="col-sm-10">
                        <div class="clearfix">
                            <label class="control-label">
                                <input name="is_sell" class="ace ace-switch" type="checkbox" />
                                <span class="lbl"></span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"> 单品 </label>
                    <div class="col-sm-2">
                        <div class="clearfix">
                            <label class="radio">
                                <input name="is_single_sku" type="radio" checked class="ace">
                                <span class="lbl"></span>
                            </label>
                        </div>
                    </div>
                    <label class="col-sm-2 control-label no-padding-right"> 多规格商品 </label>
                    <div class="col-sm-2">
                        <div class="clearfix">
                            <label class="radio">
                                <input name="is_single_sku" type="radio" class="ace" id="multi_sku">
                                <span class="lbl"></span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group" id="multi_sku_box" style="display: none;">
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
                                <tr>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_name" placeholder="sku名称">
                                    </td>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_color" placeholder="颜色">
                                    </td>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_size" placeholder="大小">
                                    </td>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_price" placeholder="商城价格">
                                    </td>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_market_price" placeholder="市场价格">
                                    </td>
                                    <td>
                                        <input class="col-xs-12" type="text" name="sku_stock" placeholder="库存">
                                    </td>
                                    <td class="center">
                                        <a title="新增" class="btn btn-xs btn-success" href="javascript:void(0);" id="add_sku">
                                            <i class="ace-icon fa fa-plus bigger-120"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right"> 商品图片 </label>
                    <div class="col-sm-10" id="goods_images_box">
                        <div class="form-group col-xs-5">
                            <div class="col-xs-12">
                                <input multiple="" type="file" name="goods_images"/>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
            <div class="form-group">
                <label class="col-sm-2 control-label no-padding-right"> 图文详情 </label>

                <div class="col-sm-10">
                    <div class="wysiwyg-editor" id="editor1">
                        内容
                    </div>
                </div>
            </div>

            <!-- /section:elements.form -->
            <div class="space-4"></div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="button">
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
<script src="{{ elixir('js/admin/jquery.validate.js') }}"></script>
<script src="{{ elixir('js/admin/additional-methods.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.hotkeys.js') }}"></script>
<script src="{{ elixir('js/admin/bootstrap-wysiwyg.js') }}"></script>
<script src="{{ elixir('js/admin/elements.fileinput.js') }}"></script>
<script src="{{ elixir('js/admin/elements.colorpicker.js') }}"></script>
<script src="{{ elixir('js/admin/elements.wysiwyg.js') }}"></script>
<script>
$(function(){
    var goods_content = {};
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        ignore: "",
        rules: {
            goods_name: {
                required: true
            },
            goods_summary: {
                required: true,
                maxlength: 50
            },
            goods_price: {
                required: true,
                number: true
            },
            market_price: {
                required: true,
                number: true
            },
            stock: {
                required: true,
                number: true
            }
        },

        messages: {
            goods_name: "必须填写商品名！",
            goods_summary: {
                required: "必须填写商品简介！",
                maxlength: "输入的内容不得大于50的字符！"
            },
            goods_price: {
                required: "必须填写商品价格！",
                number: "请输入一个正确的数字！"
            },
            market_price: {
                required: "必须填写商品市场价格！",
                number: "请输入一个正确的数字！"
            },
            stock: {
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
                if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if(element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if(element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },

        submitHandler: function (form) {
            console.log(form);
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
        if (reason==='unsupported-file-type') { msg = "Unsupported format " + detail; }
        else {
            console.log("error uploading file", reason, detail);
        }
        $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+'<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
    }

    // 文件上传
    $('[name=goods_images]').ace_file_input({
        style: 'well',
        btn_choose: '拖放多个文件到这里或点击选择多个文件',
        btn_change: null,
        no_icon: 'ace-icon fa fa-picture-o',
        droppable: true,
        thumbnail: 'fit',
        preview_error : function(filename, error_code) {
            console.log(error_code);
        },
        before_change: function () {
            console.log('更改当前图片');
            return true;
        },
        before_remove: function(){
            console.log('删除当前图片', $(this));
            return true;
        }
    }).on('change', function(){
        console.log($(this).data('ace_input_files'));
        console.log($(this).data('ace_input_method'));
        console.log($(this));
    });

    // 显示文件列表
    // $('[name=goods_images]').ace_file_input('show_file_list', [
    //     {type: 'image', name: 'name of image', path: 'http://path/to/image/for/preview'},
    //     {type: 'file', name: 'hello.txt'}
    // ]);

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
    $('#add_sku').on('click', function(){
        var sku_name         = $('[name=sku_name]').val();
        var sku_color        = $('[name=sku_color]').val();
        var sku_size         = $('[name=sku_size]').val();
        var sku_price        = $('[name=sku_price]').val();
        var sku_stock        = $('[name=sku_stock]').val();
        var sku_market_price = $('[name=sku_market_price]').val();

        var appHt = '<tr><td>'+ sku_name +'</td><td>'+ sku_color +'</td><td>'+ sku_size +'</td><td>'+ sku_price +'</td><td>'+ sku_market_price +'</td><td>'+ sku_stock +'</td><td class="center"><button class="btn btn-xs btn-danger" name="del_sku"><i class="ace-icon fa fa-trash-o bigger-120"></i></button></td></tr>';

        $(this).parents('tr').after(appHt);
    });

    $('body').on('click', '[name=del_sku]', function(){
        $(this).parents('tr').remove();
    });
});
</script>
@stop