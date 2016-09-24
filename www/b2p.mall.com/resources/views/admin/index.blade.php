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
                                    <a href="{{ action('Admin\GoodsController@getShow', [$lv->id]) }}" class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-search bigger-120"></i>
                                    </a>

                                    <a href="{{ action('Admin\GoodsController@getEdit', [$lv->id]) }}" class="btn btn-xs btn-info">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
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
@stop

@section('footer-script')
<script>
$(function(){
    var active_class = 'active';
    $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
        var th_checked = this.checked;//checkbox inside "TH" table header

        $(this).closest('table').find('tbody > tr').each(function(){
            var row = this;
            if(th_checked) {
                $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
            } else {
                $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
            }
        });
    });

    //select/deselect a row when the checkbox is checked/unchecked
    $('#simple-table').on('click', 'td input[type=checkbox]' , function(){
        var $row = $(this).closest('tr');
        if(this.checked) {
            $row.addClass(active_class);
        } else {
            $row.removeClass(active_class);
        }
    });
});
</script>
@stop