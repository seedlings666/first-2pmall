@extends('admin.layouts.master')

@section('content')
<div class="page-content">
    <!-- /section:settings.box -->
    <div class="page-header">
        <h1>
            订单统计
            <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                统计每月订单销售情况
            </small>
        </h1>
    </div><!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="col-xs-12">
                <div class="widget-box transparent">
                    <div class="widget-body">
                        <div class="widget-main padding-4">
                            <div id="sales-charts"></div>
                        </div><!-- /.widget-main -->
                    </div><!-- /.widget-body -->
                </div><!-- /.widget-box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</div><!-- /.page-content -->
@stop

@section('footer-script')
<script src="{{ elixir('js/admin/jquery.flot.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.flot.time.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.flot.resize.js') }}"></script>
<script src="{{ elixir('js/admin/jquery.flot.axislabels.js') }}"></script>
<script>
function gd(year, month, day) {
    return new Date(year, month - 1, day).getTime();
}
// 模拟数据
var d1 = [];
for (var i = 1; i < 32; i ++ ) {
    d1.push([gd(2016, 8, i), Math.floor(Math.random() * 2000)]);
}

var d2 = [];
for (var i = 1; i < 32; i ++ ) {
    d2.push([gd(2016, 8, i), Math.floor(Math.random() * 2000)]);
}

// 图标
var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'500px'});
$.plot("#sales-charts", [
    { label: "销量", data: d1 },
    { label: "金额", data: d2 }
], {
    shadowSize: 1,
    series: {
        lines: { show: true },
        points: { show: true },
    },
    xaxis: {
        mode: 'time',
        timeformat: "%d",
        tickSize: [1, "day"],
        tickLength: 0,
        axisLabel: "单位（天）"
    },
    yaxis: {
        ticks: 10,
        tickDecimals: 2,
        axisLabel: "每月销量和销售金额（元）"
    },
    yaxes: {
    },
    grid: {
        clickable: true,
        hoverable: true,
        autoHighlight: true,
        backgroundColor: { colors: [ "#fff", "#fff" ] },
        borderWidth: 1,
        borderColor:'#555'
    }
});
// 点击事件
var previousPoint = null,
    previousLabel = null;

$("#sales-charts").on("plothover", function (event, pos, item) {
    if (item) {
        if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
            previousPoint = item.dataIndex;
            previousLabel = item.series.label;

            $("#tooltip").remove();

            var x = item.datapoint[0];
            var y = item.datapoint[1];
            var date = new Date(x);
            var color = item.series.color;

            showTooltip(item.pageX, item.pageY, color, "<strong>" + item.series.label + "</strong><br>"  + (date.getMonth() + 1) + "月" + date.getDate() + " : &yen;<strong>" + y + "</strong>元");
        }
    } else {
        $("#tooltip").remove();
        previousPoint = null;
    }
});

function showTooltip(x, y, color, contents) {
    var winWidth = $(window).width();
    if(winWidth - 150 < x){
        x = x - 100;
    }
    $('<div id="tooltip">' + contents + '</div>').css({
        position: 'absolute',
        display: 'none',
        top: y - 60,
        left: x,
        border: '2px solid ' + color,
        padding: '3px',
        'font-size': '9px',
        'border-radius': '5px',
        'background-color': '#fff',
        'font-family': 'Verdana, Arial, Helvetica, Tahoma, sans-serif',
        opacity: 0.9
    }).appendTo("body").fadeIn(200);
}
</script>
@stop