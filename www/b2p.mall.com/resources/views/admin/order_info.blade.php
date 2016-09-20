@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            订单详情
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                查看订单详细信息
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-header">
                商品列表
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <thead>
                        <tr>
                            <th class="center">商品图片</th>
                            <th class="center">商品名称</th>
                            <th class="center">价格</th>
                            <th class="center">数量</th>
                        </tr>
                    </thead>

                    <tbody>
                    @if($res_data['orderGoods'])
                        <tr>
                            <td class="center" width="150">
                                <img width="100" src="{{asset($res_data['orderGoods']['goods_img'])}}">
                            </td>
                            <td>{{ $res_data['orderGoods']['goods_title'] }} {{ $res_data['orderGoods']['goods_spec'] }}</td>
                            <td class="center">&yen;{{ $res_data['orderGoods']['buy_price'] }}</td>
                            <td class="center">{{ $res_data['orderGoods']['goods_number'] }}</td>
                        </tr>
                    @endif
                    </tbody>
                </table>
            </div><!-- /.col -->

            <div class="table-header">
                订单信息
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <tbody>
                        <tr>
                            <td class="center" width="100">订单编号：</td>
                            <td>{{ $res_data['order_sn'] }}</td>
                            <td class="center" width="100">收货人：</td>
                            <td>{{ array_get($res_data, 'userWeixin.nickname') }}</td>
                            <td class="center" width="100">联系方式：</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="center">下单时间：</td>
                            <td>{{ $res_data['created_at'] }}</td>
                            <td class="center"></td>
                            <td></td>
                            <td class="center"></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- /.col -->

            <div class="table-header">
                支付信息
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <tbody>
                        <tr>
                            <td class="center" width="100">支付编号：</td>
                            <td>{{ $res_data['pay_sn'] }}</td>
                            <td class="center" width="100">支付方式：</td>
                            <td>微信支付</td>
                            <td class="center" width="100">订单状态：</td>
                            <td><strong class="red">{{ $res_data['order_status_label'] }}</strong></td>
                        </tr>
                        <tr>
                            <td class="center">优惠金额：</td>
                            <td><strong class="red">&yen;{{ $res_data['preferential_amount'] }}</strong></td>
                            <td class="center">订单金额：</td>
                            <td><strong class="red">&yen;{{ $res_data['order_amount'] }}</strong></td>
                            <td class="center"></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- /.col -->
            <!-- PAGE CONTENT ENDS -->
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
