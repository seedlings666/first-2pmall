<?php

namespace App\Providers\Wx;

/**
 * 微信
 * @author chentengfeng @create_at 2016-08-28  00:29:25
 */
class WxModule
{
    private $tables = null;
    /**
     * 获取表名等数据
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  22:37:23
     */
    public function __construct(array $tables)
    {
        $this->tables = $tables;
    }

    /**
     * 将-分隔法转化为对应的get方法
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  00:29:25
     */
    private function toolGetFun($fun)
    {
        return 'get'.str_replace(' ', '', ucwords(str_replace('-', ' ', $fun)));
    }

    /**
     * 获取微信用户信息
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  09:07:55
     */
    private function toolWxInfo($code)
    {
        $appid = config('wx.appid');
        $secret = config('wx.appsecret');
        $token_url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$appid}&secret={$secret}&code={$code}&grant_type=authorization_code";
        $token = Helper::curlGet($token_url);
        $token = json_decode($token);
        //获取授权码失败
        if (isset($token['errcode'])) {
            return ;
        }
        $token['access_token'];
        $token['openid'];
        $info_url = "https://api.weixin.qq.com/sns/userinfo?access_token={$token['access_token']}&openid={$token['openid']}&lang=zh_CN";
        $user_info = Helper::curlGet($info_url);
        if (isset($user_info['errcode'])) {
            return ;
        }

        return $user_info;
    }

    /**
     * 回调地址获取
     * @param $controller 控制器
     * @param $fun 调用的方法(- 分隔方法)
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  00:29:25
     */
    public function redirectUrl($controller, $fun)
    {
        //为空，或者自身时跳转到默认路由
        if (empty($controller) || empty($fun) || ($controller == 'wx' && $fun == 'user-info')) {
            $controller = config('wx.default_controller');
            $fun        = config('wx.default_fun');
        }
        
        try {
            $redirect_url = action(ucfirst($controller).'Controller@'.$this->toolGetFun($fun));
        } catch (Exceptions $e) {
            //查找不到该路由则使用默认路由
            $redirect_url = action(ucfirst(Config::get('wx.default_controller')).'Controller@'.$this->toolGetFun(Config::get('wx.default_fun')));
        }

        return $redirect_url;
    }

    /**
     * 存储用户信息
     * @param $code 由链接跳转过来的code
     *
     * @return void
     * @author chentengfeng @create_at 2016-08-28  00:29:25
     */
    public function saveUserInfo($code)
    {
        $user_info = $this->toolWxInfo($code);
        if (isset($user_info['err_code'])) {
            return $user_info;
        }

        $current_time = time();
        $insert = [
            'sex'        => $user_info['sex'],
            'source'     => 3,
            'avatar'     => $user_info,
            'reg_time'   => $current_time,
            'last_login' => $current_time,
            'user_name'  => $user_info['openid'],
            'nick_name'  => $user_info['nickname'],
        ];
        $id = DB::table($this->tables['user'])->insertGetId($insert);

        $insert = [
            'openid'     => $user_info['openid'],
            'nickname'   => $user_info['nick_name'],
            'sex'        => $user_info['sex'],
            'province'   => $user_info['province'],
            'city'       => $user_info['city'],
            'country'    => $user_info['country'],
            'headimgurl' => $user_info['headimgurl'],
            'privilege'  => implode(',', $user_info['privilege']),
        ];

        //只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段
        if (isset($user_info['unionid'])) {
            $insert['unionid'] = $user_info['unionid'];
            $insert['subscribe'] = 1;
        }

        DB::table($this->tables['user_wx'])->insertGetId($insert);

        Session::put('user', [
            'user_id'   => $id,
            'avatar'    => $user_info['headimgurl'],
            'nick_name' => $user_info['nick_name']
        ]);
    }
}



