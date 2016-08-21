/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
'use strict';

$(function(){
    $('#address_from').submit(function(){
        var fromData = $(this).serializeArray();
        var fromAction = $(this).attr('action');
        var result = true;
        var ajaxData = {};

        // 验证数据
        $.each(fromData, function(){
            result = verificationFun(this);
            if(!result){return false;}
        });

        // 组装数据
        $.each(fromData, function(){
            ajaxData[this['name']] = this['value'];
        });

        if(result){
            $.ajax({
                'url' : fromAction,
                'type': 'post',
                'data' : ajaxData,
                'dataType' : 'json',
            })
            .done(function(re){
                console.log('done', re);
            })
            .error(function(re){
                console.log('error', re);
                window.location.href = '/wap/order';
            });
        }

        return false;
    });
});

// 数据验证方法
function verificationFun(obj){
    var a = /^1[34578]\d{9}$/;
    var b = {
        'user_name'    : '收货人',
        'user_phone'   : '手机号码',
        'province'     : '省',
        'city'         : '市',
        'area'         : '区/镇',
        'address_info' : '详细地址'
    };

    if(obj['value'] == ''){
        alert(b[obj['name']] + '必须填写！');
        return false;
    }

    if(obj['name'] == 'user_phone'){
        var c = a.test(obj['value']);

        if(!c){
            alert('请填写正确的手机号码！');
            return false;
        }
    }

    return true;
};
//# sourceMappingURL=address.js.map
