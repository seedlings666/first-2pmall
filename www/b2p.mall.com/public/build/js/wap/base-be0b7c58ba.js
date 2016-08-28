/**
 * base javascript
 * @authors CK-Joey (zhangjie.tk)
 * @date    2016-08-19 01:07:00
 * @version 1.0
 */
(function($, undefined){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
})(jQuery);
//# sourceMappingURL=base.js.map
