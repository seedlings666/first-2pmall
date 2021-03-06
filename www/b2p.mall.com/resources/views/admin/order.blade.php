@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            订单管理
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                店铺的订单列表 &amp; 状态
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-header">
                订单列表
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th class="center">订单编号</th>
                            <th class="center">支付编号</th>
                            <th class="center">用户</th>
                            <th class="center">商品名称</th>
                            <th class="center">订单价格</th>
                            <th class="center">状态</th>
                            <th class="center">
                                <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                下单时间
                            </th>
                            <th class="center">操作</th>
                        </tr>
                    </thead>

                    <tbody>
                    @foreach ($res_data as $order)
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>

                            <td class="center">{{ $order['order_sn'] }}</td>
                            <td class="center">{{ $order['pay_sn'] }}</td>
                            <td class="center">{{ array_get($order, 'userWeixin.nickname') }}</td>
                            <td>{{ array_get($order, 'orderGoods.goods_title') }}</td>
                            <td class="center">&yen;{{ $order['order_amount'] }}</td>

                            <td class="center">
                                <span class="label label-sm label-warning">
                                {{ $order['pay_status_label'] }}
                                </span>
                                <span class="label label-sm label-warning">
                                {{ $order['order_status_label'] }}
                                </span>
                            </td>

                            <td class="center">{{ $order['created_at'] }}</td>

                            <td class="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a title="查看" href="{{action('Admin\OrderController@getInfo', [$order['id']])}}" class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-search bigger-120"></i>
                                    </a>

                                    <!-- <a title="编辑" class="btn btn-xs btn-info">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a> -->

                                    <!-- <button class="btn btn-xs btn-danger">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button> -->

                                    <!-- <button class="btn btn-xs btn-warning">
                                        <i class="ace-icon fa fa-flag bigger-120"></i>
                                    </button> -->
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>

                <!-- PAGE CONTENT ENDS -->
                {!! $res_data->render(new \App\PaginateRender($res_data)) !!}
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
