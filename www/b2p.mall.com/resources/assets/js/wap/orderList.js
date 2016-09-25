/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
'use strict';

var order_list = {
    init: function(){
        // 滚动加载更多
        this.scrollLoadMore();
    },
    // 滚动加载更多
    scrollLoadMore: function(){
        var _this = this;
        // 是否进行加载数据
        var status = true;
        // 请求地址
        var ajaxUrl = $('#order_tab').data('url');
        // 窗口高度
        var winHeight = $(window).height();
        // 获取当前加载订单类型
        var orderType = $('#order_tab li.on').data('type');
        // 下一页数值
        var nextPage = $('#order_content').data('next-page') || null;

        // 监听页面滚动事件
        $(document).scroll(function(){
            // 下一页数值
            nextPage = $('#order_content').data('next-page') || null;
            // 获取当前滚动的距离
            var scrollTopVal = $(document).scrollTop();
            // 文档的高度
            var docHeight = $(document).height();
            // 加载距离
            var loadDistance = winHeight + scrollTopVal;

            // 当文档高度等于加载距离是进行加载并且判断是否可以进行ajax请求
            if(loadDistance == docHeight && status && nextPage != null){
                // 将加载状态设置为不可加载，以避免重复请求
                status = false;
                // 改变提示文字
                $('#load_point').html('数据加载中……');
                // ajax请求数据列表
                $.ajax({
                    url: ajaxUrl,
                    type: 'GET',
                    dataType: 'json',
                    data: {type: orderType, page: nextPage},
                })
                .done(function(re) {
                    var h = _this._dataPj(re);
                    // 修改页面下一页的值
                    $('#order_content').data('next-page', re.response_data.next_page);

                    // 将加载状态设置为可加载
                    status = true;

                    // 将拼接的html放到页面容器中
                    $('#order_content').append(h);
                    console.log("success", re);
                })
                .fail(function() {
                    // 将加载状态设置为可加载
                    status = true;
                    // 改变提示文字
                    $('#load_point').html('加载失败！请刷新页面重新加载！');
                    console.log("error");
                });
            }else{
                // 改变提示文字
                $('#load_point').html('没有更多的数据了！');
            }
        });

        // 点击加载更多
        $('#load_point').on('click', function(){
            // 下一页数值
            nextPage = $('#order_content').data('next-page') || null;

            // 当文档高度等于加载距离是进行加载并且判断是否可以进行ajax请求
            if(status && nextPage != null){
                // 将加载状态设置为不可加载，以避免重复请求
                status = false;
                // 改变提示文字
                $('#load_point').html('数据加载中……');
                // ajax请求数据列表
                $.ajax({
                    url: ajaxUrl,
                    type: 'GET',
                    dataType: 'json',
                    data: {type: orderType, page: nextPage},
                })
                .done(function(re) {
                    var h = _this._dataPj(re);

                    // 修改页面下一页的值
                    $('#order_content').data('next-page', re.response_data.next_page);

                    // 修改文字状态
                    if(re.response_data.next_page != null){
                        $('#load_point').html('查看更多数据');
                    }

                    // 将加载状态设置为可加载
                    status = true;
                    // 将拼接的html放到页面容器中
                    $('#order_content').append(h);
                    console.log("success", re);
                })
                .fail(function() {
                    // 将加载状态设置为可加载
                    status = true;
                    // 改变提示文字
                    $('#load_point').html('加载失败！请刷新页面重新加载！');
                    console.log("error");
                });
            }else{
                // 改变提示文字
                $('#load_point').html('没有更多的数据了！');
            }
        });
    },
    // 数据拼接
    _dataPj:function(re){
        var h = '';
        // 拼接列表
        if(re.response_data.order_list.length == null){
            h = '<p class="no_order">暂无订单！</p>';
        }else{
            $.each(re.response_data.order_list, function() {
                h += '<li>'+
                    '<div class="order_time">'+ this.created_at + '</div>'+
                    '<div class="goods_info">'+
                        '<div class="goods_img">'+
                            '<a href="'+ this.goods_url + '">'+
                                '<img src="'+ this.orderGoods[0].goods_img_url +'" alt="'+ this.orderGoods[0].goods_title +'">'+
                            '</a>'+
                        '</div>'+

                        '<div class="goods_name">'+
                            '<p>'+ this.orderGoods[0].goods_title + ' '+ this.orderGoods[0].goods_spec + '</p>'+
                            '<p>数量：'+ this.orderGoods[0].goods_number + '</p>'+
                            '<p>&nbsp;<!-- 库存：1000件 --></p>'+
                        '</div>'+

                        '<div class="goods_price">'+
                            '<span>&yen;<big id="goods_price">'+ this.orderGoods[0].buy_price + '</big>/件</span>'+
                        '</div>'+
                    '</div>'+
                    '<div class="goods_sum">'+
                        '共1件商品'+
                        '<span>实付：<big id="pay_price">&yen;'+ this.order_amount + '</big></span>'+
                    '</div>'+
                    '<div class="order_status">'+
                        '<!-- <span>待支付</span> -->'+
                        '<!-- <a href="" class="go_to_buy">去支付</a> -->'+
                        '<!-- <a href="">取消订单</a> -->'+
                        '<!-- <a href="" class="share_pt">分享拼团</a> -->' +
                        (this.join_group ? '<a href="'+ this.join_group + '" class="join_pt">加入拼团</a>' : '')+
                    '</div>'+
                    (this.is_end ? '<div class="is_over">拼团已结束</div>' : '') +
                    (this.wait_cashback ? '<div class="backtrack_money">等待返回拼团优惠金</div>' : '') +
                '</li>';
            });
        }
        return h;
    }
};

$(function(){
    order_list.init();
});