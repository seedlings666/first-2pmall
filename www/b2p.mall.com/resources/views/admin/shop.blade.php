@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            店铺管理
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                管理店铺信息 &amp; 状态
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-header">
                店铺列表
                <div class="navbar-buttons navbar-header pull-right">
                    <a href="{{ action('Admin\ShopController@postStore') }}" class="btn btn-pink">新增店铺</a>
                </div>
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
                            <th class="center">店铺编号</th>
                            <th class="center">店铺名称</th>
                            <th class="center">店铺别称</th>
                            <th class="center">店长</th>
                            <th class="center"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>开店时间</th>
                            <th class="center">当前状态</th>
                            <th class="center">操作</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($list as $value)
                        <tr>
                            <td class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td class="center">{{$value->id}}</td>
                            <td class="center">{{$value->name}}</td>
                            <td class="center">{{$value->alias}}</td>
                            <td class="center">{{$value->shopkeeper_name}}</td>
                            <td class="center">{{$value->created_at}}</td>
                            <td class="center">
                                @if ($value->status == 1)
                                <span class="label label-sm label-info">开店</span>
                                @else
                                <span class="label label-sm label-warning">闭店</span>
                                @endif
                            </td>

                            <td class="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <!-- <a title="查看" href="{{url('/admin/order/info')}}" class="btn btn-xs btn-success">
                                        <i class="ace-icon fa fa-search bigger-120"></i>
                                    </a> -->

                                    <a title="编辑" class="btn btn-xs btn-info" href="{{action('Admin\ShopController@getEdit', [$value->id])}}">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>

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
                {!! $list->render(new \App\PaginateRender($list)) !!}
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
