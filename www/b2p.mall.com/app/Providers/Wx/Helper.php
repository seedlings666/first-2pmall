<?php

namespace App\Providers\Wx;

/**
 * Class Helper
 * @author chentengfeng @create_at 2016-08-28  09:07:55
 */
class Helper
{
    /*
     * curl_get提交方式
     * @param string $url 请求链接
     * @oaram int $req_number 失败请求次数
     * @param int $timeout 请求时间
     *
     */
    public static function curlGet($url, $req_number = 2, $timeout=30) {
        
        //防止因网络原因而高层无法获取
        $cnt = 0;
        $result = FALSE;
        while ( $cnt < $req_number && $result === FALSE) {
            $cnt++;
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,$url);
            //禁止直接显示获取的内容 重要
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            //在发起连接前等待的时间，如果设置为0，则无限等待。
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
            //不验证证书下同
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            //SSL验证
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            $result = curl_exec($ch); //获取
            curl_close($ch);
        }//end func curl_get
        
        //获取数据
        $data = $result ? $result : null;
        
        return $data;
    }//end func curlGet
    
    
    /**
     * curl_get提交方式
     * @param string $url 请求链接
     * @param array $post_data 请求数据
     * @param string $post_type 请求类型(json)
     *
     */
    public static function curlPost($url, $post_data = '', $post_type = '', $curl_params = [])
    {
        //初始化curl
        $ch = curl_init();
        //设置请求地址
        curl_setopt($ch, CURLOPT_URL, $url);
        //设置curl参数，要求结果是否输出到屏幕上，为true的时候是不返回到网页中
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        
        //https ssl 验证
        if (!empty($curl_params['ssl'])) {
            $ssl = $curl_params['ssl'];
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2); //验证站点名
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1); // 只信任CA颁布的证书
            if (!empty($ssl['sslca'])) {
                curl_setopt($ch, CURLOPT_CAINFO, $ssl['sslca']);
            }
            if (!empty($ssl['sslcert'])) {
                curl_setopt($ch, CURLOPT_SSLCERT, $ssl['sslcert']);
            }
            if ($ssl['sslkey']) {
                curl_setopt($ch, CURLOPT_SSLKEY, $ssl['sslkey']);
            }
        } else {
            //验证站点名
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            //是否验证https(当请求链接为https时自动验证，强制为false)
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // 只信任CA颁布的证书
        }
        
        //设置post提交方式
        curl_setopt($ch, CURLOPT_POST, 1);
        //设置post字段
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        
        //判断是否json提交
        if ('json' == $post_type) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                    'Expect:',
                    'Content-Type: application/json; charset=utf-8',
                    'Content-Length: ' . strlen($post_data))
            );
        }
        
        //运行curl
        $output = curl_exec($ch);
        //关闭curl
        curl_close($ch);
        //返回结果
        return $output;
    }//end func curlPost


    /**
     * 日志纪录
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-01  08:19:18
     */
    public static function log($type, $content)
    {
        $current_day = date('Y-m-d');
        $msg = '[' . $current_day . ' ' . date('H:i:s') . ']';
        $msg .= $content;
        $msg .= "\n";
        $path = storage_path("logs/{$current_day}");
        if (!file_exists($path)) {
            mkdir($path, 0755);
        }
        file_put_contents("{$path}/$type.log", $msg, FILE_APPEND);
    }


    /**
     * 保存登录信息
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-03  17:46:41
     */
    public static function saveLoginInfo($id, $headimgurl, $nick_name)
    {
        Session::put('user', [
            'id'        => $id,
            'avatar'    => $headimgurl,
            'nick_name' => $nick_name
        ]);
    }

    /**
     * 返回错误数据格式
     *
     * @return void
     * @author chentengfeng @create_at 2016-09-03  20:09:33
     */
    public static function error($code, $msg='', $data = [])
    {
        return [
            'err_code' => $code,
            'err_msg'  => $msg,
            'data' => $data,
        ];
    }
}
