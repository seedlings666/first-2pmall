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
            $(this).addClass('on').siblings('li').removeClass('on');
        });
    }

};

$(function(){
    order_list.init();
});
//# sourceMappingURL=orderList.js.map
