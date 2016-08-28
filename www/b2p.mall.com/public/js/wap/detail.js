/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
'use strict';
(function($, undefined){
    // sku选择
    $('#sku_box span').on('click',function(){
        var id = $(this).data('id');
        var ajaxUrl = $(this).parent().data('url');

        $(this).addClass('cur').siblings('span').removeClass('cur');
        $.ajax({
            url: ajaxUrl,
            type: 'POST',
            dataType: 'json',
            data: {sku_id: id}
        })
        .done(function(re) {
            console.log("success", re);
        })
        .fail(function(re) {
            console.log("error", re);
        });
    });
})(jQuery);
//# sourceMappingURL=detail.js.map
