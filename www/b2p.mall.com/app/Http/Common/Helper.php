<?php

namespace App\Http\Common;

class Helper
{

    /**
     * 返回数据
     * @author  jianwei
     * @param   $code   int 错误码
     * @param   $msg    string      '消息'
     * @param   $data   array   返回的数据
     */
    public static function ErrorMessage($code, $msg = '', array $data = [])
    {
        $return_arr             = array();
        $return_arr['err_code'] = $code;
        $return_arr['msg']      = $msg;
        $return_arr['data']     = $data;
        return $return_arr;
    }
}
