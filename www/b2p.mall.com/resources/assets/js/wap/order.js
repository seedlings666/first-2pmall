/**
 * 订单页面
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
'use strict';

$(function(){
    // 商品数量加减
    $('#cut').on('click', function(){
        var sum = parseInt($('#sum').val());
        if(sum < 2){
            $(this).addClass('disabled');
        }else{
            $('#sum').val(sum - 1);
        }
        // 计算价格
        sumPrice();
    });

    $('#add').on('click', function(){
        var sum = parseInt($('#sum').val());
        $('#cut').removeClass('disabled');
        $('#sum').val(sum + 1);
        // 计算价格
        sumPrice();
    });

    $('#sum').on('change', function(){
        var a = /^[1-9]\d*$/;
        var b = $(this).val();

        if(!a.test(b)){
            alert('请输入正确的数值！');
            $(this).val(1);
        }

        if(b > 1){
            $('#cut').removeClass('disabled');
        }else{
            $('#cut').addClass('disabled');
        }

        // 计算价格
        sumPrice();
    });

    // 总价计算
    function sumPrice(){
        var goodsNumber = $('#sum').val();
        var goodsPrice = $('#goods_price').html();

        var countPrice = goodsPrice * goodsNumber;

        $('#count_price').html(countPrice.toFixed(2));
    }
});