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

    // 弹框
    var JOEY = {
        /*
         * 弹框方法
         * @arguments object or string
         */
        alert: function (argument) {
            var def = {
                title: '提示',
                content: '系统提示',
                sureText: '确认',
                cancelText: '取消',
                singleBtn: false,
                sure: function (){},
                cancel: function(){}
            };
            if(typeof argument === 'object'){
                var opts = $.extend(def, argument);

                // 按钮html
                var btnHtml = '';

                if(!opts.singleBtn){
                    btnHtml = '<a href="javascript:void(0);" class="sure_btn" style="width:50%">'+ opts.sureText +'</a>'+
                               '<a href="javascript:void(0);" class="cancel_btn" style="width:50%">' + opts.cancelText + '</a>';
                }else{
                    btnHtml = '<a href="javascript:void(0);" class="sure_btn" style="width:100%">'+ opts.sureText +'</a>';
                }

                // 弹框html节点
                var h = $('<div><div class="prop_box">'+
                            '<div class="title">'+ opts.title +'</div>'+
                            '<div class="content">'+ opts.content +'</div>'+
                            '<div class="btn_box">'+ btnHtml +'</div>'+
                        '</div></div>');

                // 样式添加
                h.css({
                    background: 'rgba(0,0,0,.5)',
                    position: 'fixed',
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    zIndex: 1000,
                });
                h.find('.prop_box').css({
                    width:'80%',
                    background: '#fff',
                    borderRadius: '15px',
                    position: 'absolute',
                    left: '10%',
                    top: '30%',
                });
                h.find('.prop_box .title').css({
                    paddingTop: '.7rem',
                    lineHeight:'2.8rem',
                    fontSize: '1.6rem',
                    textAlign: 'center',
                    fontWeight: 'bold',
                });
                h.find('.prop_box .content').css({
                    padding: '1.5rem',
                    fontSize: '1.4rem'
                });
                h.find('.prop_box .btn_box').css({
                    fontSize: '1.4rem',
                    textAlign: 'center',
                    borderTop: '1px solid #e2e2e2',
                    borderRadius: '0 0 15px 15px',
                    overflow: 'hidden'
                });
                h.find('.prop_box .btn_box a').css({
                    display: 'block',
                    float:'left',
                    color: '#333',
                    position: 'relative',
                    boxSizing: 'border-box',
                    padding: '1rem'
                });
                h.find('.prop_box .btn_box a:nth-child(2)').css({
                    borderLeft:'1px solid #e2e2e2'
                });

                // 将节点显示出来
                $('body').append(h);

                // 确认按钮事件
                h.find('.sure_btn').on('click', function(){
                    opts.sure();
                    h.remove();
                });

                // 取消按钮事件
                h.find('.cancel_btn').on('click', function(){
                    opts.cancel();
                    h.remove();
                });
            }else{
                alert(argument);
            }
        }
    };

    window.JOEY = JOEY;
})(jQuery);
//# sourceMappingURL=base.js.map
