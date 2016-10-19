@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            商品管理
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                管理商品数据 &amp; 状态
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-header">
                商品列表
                <div class="navbar-buttons navbar-header pull-right">
                    <a href="{{ url('/admin/goods/create') }}" class="btn btn-pink">新增商品</a>
                </div>
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <thead>
                        <tr>
                            <!--
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            -->
                            <th class="center">商品编号</th>
                            <th class="center">商品名称</th>
                            <th class="center">多规格</th>
                            <th class="center">价格</th>
                            <th class="center">市场价格</th>
                            <th class="center">状态</th>
                            <th class="center">
                                <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                更新时间
                            </th>
                            <th class="center">操作</th>
                        </tr>
                    </thead>

                    <tbody>
                    @if(count($goods_list))
                    @foreach($goods_list as $lk=>$lv)
                        <tr>
                            <!--
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            -->
                            <td class="center">
                                {{ $lv->id }}
                            </td>
                            <td>{{ $lv->goods_name }}</td>
                            <td> {{ $lv->is_sku_str }}</td>
                            <td class="center">&yen;{{ $lv->shop_price }}</td>
                            <td class="center">&yen;{{ $lv->market_price }}</td>

                            <td class="center">
                                <span class="label label-sm {{ $lv->is_on_sale == 1 ? 'label-info' : 'label-warning' }}">{{ $lv->is_on_sale_str }}</span>
                            </td>

                            <td class="center">
                                {{ $lv->updated_at }}
                            </td>

                            <td class="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a href="{{ action('Admin\GoodsController@getShow', [$lv->id]) }}" class="btn btn-xs btn-success" title="查看商品详情">
                                        <i class="ace-icon fa fa-search bigger-120"></i>
                                    </a>
                                    @if(Session::get('admin_user.shop_id') == $lv->shop_id)
                                        <a href="{{ action('Admin\GoodsController@getEdit', [$lv->id]) }}" class="btn btn-xs btn-info" title="编辑商品详情">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                    @endif

                                    <a href="javascript:void(0);" class="btn btn-xs btn-danger" title="生成二维码" name="create-qr-code" data-goods-id="{{ $lv->id }}">
                                        <i class="ace-icon glyphicon glyphicon-qrcode bigger-120"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    @endif
                    </tbody>
                </table>

                <!-- PAGE CONTENT ENDS -->
                {!! $goods_list->render(new \App\PaginateRender($goods_list)) !!}
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</div><!-- /.page-content -->

<!-- Modal -->
<div class="modal fade" id="QRModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                <h4 class="modal-title" id="myModalLabel">二维码下载</h4>
            </div>
            <div class="modal-body" style="text-align: center;">
                <img src="">
            </div>
            <div class="modal-footer">
                <a href="###" class="btn btn-success btn-sm">下载二维码</a>
                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
@stop

@section('footer-script')
<script>
    $(function(){
        $('[name=create-qr-code]').on('click', function(){
            // 商品id
            var goods_id = $(this).data('goods-id');

            // 显示二维码弹框
            $('#QRModal').modal('show');

            // 将二维码显示
            $('#QRModal').find('.modal-body img').attr('src', '{{ action('Admin\GoodsController@anyGoodsQrcode') }}?goods_id=' + goods_id);
            $('#QRModal').find('.modal-footer a').attr('href', '{{ action('Admin\GoodsController@anyGoodsQrcode') }}?goods_id=' + goods_id + '&download=true');
        });
    });
</script>
@stop
