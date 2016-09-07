@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            用户管理
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                管理用户信息
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-header">
                用户列表
            </div>
            <div class="dataTables_wrapper form-inline no-footer">
                <table id="simple-table" class="table table-bordered table-hover dataTable">
                    <thead>
                        <tr>
                            <th class="center">用户ID</th>
                            <th class="center">用户名</th>
                            <th class="center">积分</th>
                            <th class="center">
                                <i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
                                最后登录
                            </th>
                            <th class="center">操作</th>
                        </tr>
                    </thead>

                    <tbody>
                    @foreach ($list as $value)
                        <tr>
                            <td class="center">
                                {{$value->id}}
                            </td>
                            <td class="center">{{$value->nick_name}}</td>
                            <td class="center">{{$value->points}}</td>
                            <td class="center">{{date('Y-m-d H:i:s', $value->reg_time)}}</td>
                            <td class="center">
                                <div class="hidden-sm hidden-xs btn-group">
                                    <!-- <a class="btn btn-xs btn-warning" title="推送消息">
                                        <i class="ace-icon fa fa-bullhorn bigger-120"></i>
                                    </a> -->
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>

                <!-- PAGE CONTENT ENDS -->
                <div class="row">
                    {{$list->links()}}
                </div>
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
