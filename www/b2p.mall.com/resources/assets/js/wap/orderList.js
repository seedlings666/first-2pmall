/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
'use strict';

var order_list = {
    init: function(){
        // tab 切换
        this.tabSwitch();
    },
    tabSwitch: function(){
        $('#order_tab li').on('click', function(){
            var _this = this;
            // 获取请求地址
            var ajaxUrl = $(this).parents('ul').data('url');
            // 获取当前请求类型
            var dataType = $(this).data('type');
            // 请求数据
            $.ajax({
                url: ajaxUrl,
                type: 'get',
                dataType: 'json',
                data: {type: dataType}
            })
            .done(function(re){
                var h = '';
                // 修改下一页页码
                $(_this).parents('ul').data('next-page', re.response_data.next_page);
                // 修改tab样式
                $(_this).addClass('on').siblings('li').removeClass('on');

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
                                        '<img src="'+ (this.img_src ? this.img_src : '') +'" alt="'+ this.orderGoods[0].goods_title +'">'+
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
                                (this.is_share ? '<a href="" class="share_pt">分享拼团</a>' : '') +
                                (this.join_group ? '<a href="'+ this.join_group + '" class="join_pt">加入拼团</a>' : '')+
                            '</div>'+
                            (this.is_end ? '<div class="is_over">拼团已结束</div>' : '') +
                            (this.wait_cashback ? '<div class="backtrack_money">等待返回拼团优惠金</div>' : '') +
                        '</li>';
                    });
                }

                // 将拼接的html放到页面容器中
                $('#order_content').html(h);
            })
            .fail(function(){
                console.log('请求接口失败!');
            });
        });
    }

};

$(function(){
    order_list.init();
});