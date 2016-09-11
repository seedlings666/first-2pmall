/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
(function($, undefined){
    // sku选择
    var tmpArr = [];
    $('.sku_box a').on('click', function(){
        var id = $(this).data('id');
        var attrUrl = $(this).parents('#goods_main_box').data('atr-url');
        var sureUrl = $(this).parents('#goods_main_box').data('url');
        var type = $(this).parent().data('type');
        var sureSkuStatus = false;

        $(this).addClass('cur').siblings('a').removeClass('cur');

        if($.inArray( type, tmpArr) == -1){
            tmpArr.push(type);
        }

        if(tmpArr.length >= 2){
            sureSkuStatus = true;
        }

        if(sureSkuStatus && tmpArr.length > 1){
            var data = {
                goods_id: goodsData.goods_id,
                color_attr_val_id: $('[data-type=color] a.cur').data('id'),
                size_attr_val_id: $('[data-type=size] a.cur').data('id')
            };
            $.ajax({
                url: sureUrl,
                type: 'POST',
                dataType: 'json',
                data: data
            })
            .done(function(re) {
                if(re.err_code){
                    attrSelectFun(type, id);
                }else{
                    // 商品价格
                    $('[name=shop_price]').html('&yen;' + parseFloat(re.shop_price).toFixed(2));

                    // 商品市场价格
                    $('[name=market_price]').html('&yen;' + parseFloat(re.market_price).toFixed(2));

                    // 商品库存
                    $('[name=stock]').html('库存：'+ re.sku_number +'件');

                    // 订单连接拼接
                    var payUrl = goodsData.buy_link + '?goods_id=' + goodsData.goods_id + '&sku_id=' + re.id;
                    $('[name=buy_but]').attr('href', payUrl);
                }
            })
            .fail(function(re) {
                console.log("error", re);
            });
        }else{
            attrSelectFun(type, id);
        }

        // 获取属性方法
        function attrSelectFun(type, id) {
            var data = {
                goods_id: goodsData.goods_id,
                attr_type: type,
                attr_id: id,
            };
            // 清除提交订单的连接
            $('[name=buy_but]').attr('href', 'javascript:void(0);');

            // 添加默认样式
            $('[data-type='+ type +'] a').removeClass('invalid');

            $.ajax({
                url: attrUrl,
                type: 'POST',
                dataType: 'json',
                data: data
            })
            .done(function(re) {
                if('err_code' in re){
                    alert(re.msg);
                }else{
                    if(type == 'size'){
                        // 添加默认样式
                        $('[data-type=color] a').addClass('invalid').removeClass('cur');

                        // 去掉可组合的无效样式
                        $.each(re, function() {
                            $('[data-type=color]').find('#sku_item_' + this.id).removeClass('invalid');
                        });
                        // tmpArr.splice($.inArray('color', tmpArr), 1);
                    }

                    if(type == 'color'){
                        // 添加默认样式
                        $('[data-type=size] a').addClass('invalid').removeClass('cur');

                        // 去掉可组合的无效样式
                        $.each(re, function() {
                            $('[data-type=size]').find('#sku_item_' + this.id).removeClass('invalid');
                        });
                        // tmpArr.splice($.inArray('size', tmpArr), 1);
                    }

                }
            })
            .fail(function(re) {
                console.log("error", re);
            });
        }
    });
})(jQuery);
//# sourceMappingURL=detail.js.map
