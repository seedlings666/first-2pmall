<html>
<head>
    <meta charset="utf-8">
    <script type="text/javascript">
    function callpay()
    {
        WeixinJSBridge.invoke("getBrandWCPayRequest",
        {!! $biz_package !!},function(res){
            WeixinJSBridge.log(res.err_msg);

            // for(var i in res){
            //     alert(res[i]);
            // }

            var url = "";
            if(res.err_msg == "get_brand_wcpay_request:ok" ) {
                alert("微信支付成功");
                url = "{!! $callback_url !!}";
            }else if(res.err_msg == 'get_brand_wcpay_request:cancel'){
                // alert("取消微信支付");
                url = "{!! $cancel_url !!}";
            }else if(res.err_msg == 'get_brand_wcpay_request:fail'){
                // alert("支付失败!");
                url = "{!! $fail_url !!}";
            }else{
                alert(res.err_msg);
            }

            if (url) {
                location.replace(url);
                //window.open(url,"","fullscreen=1");
            }
        });
    }

    </script>
</head>

<body>
安全支付中...
<script type="text/javascript">
    // 当微信内置浏览器完成内部初始化后会触发WeixinJSBridgeReady事件。
    document.addEventListener("WeixinJSBridgeReady", function onBridgeReady() {
        //公众号支付
        //WeixinJSBridge.log("yo~ ready.");
        callpay();
        //alert('执行了!');
    }, false);
</script>
</body>

</html>
