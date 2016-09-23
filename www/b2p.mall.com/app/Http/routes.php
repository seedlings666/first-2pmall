<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
 */

$wap_route = ['prefix' => '/', 'namespace' => 'Wap', 'middleware' => 'wxLogin'];
if (App::environment('local')) {
    \Session::put('user', [
        'id'        => env('LOCAL_USER_ID'),
        'openid'    => env('LOCAL_OPEN_ID'),
        'avatar'    => env('LOCAL_AVATAR'),
        'nick_name' => env('LOCAL_NICK_NAME'),
    ]);
    $wap_route['middleware'] = [];
}

// 移动端
Route::group($wap_route, function () {
    Route::get('/', function () {
        return view('wap.index');
    });

    //商品模块控制器
    Route::controller('/goods', 'GoodsController');
    //微信
    Route::controller('/wx', 'WxController');
    //用户
    Route::controller('/user', 'UserController');
    Route::get('/error', function () {
        return view('wap.error');
    });
    //拼团支付
    Route::get('/group/pay', 'BuyController@getPay');
    //所有拼团订单，包含当前用自己的订单
    Route::any('/group/orders/{type?}', 'BuyController@groupOrders');
});
//创建拼团订单,单独出来避免微信回调获取不到
Route::any('/group/order/{type}/{pay_sn}', 'Wap\BuyController@createOrder');

// 管理后台
Route::group(['prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => 'adminLogin'], function () {
    //后台商品模块
    Route::controller('/goods', 'GoodsController');
    Route::get('/', function () {
        return view('admin.index');
    });
    Route::controller('/shop', 'ShopController');
    Route::controller('/user', 'UserController');
    Route::controller('/manage', 'ManageController');
    Route::controller('/wx', 'WxController');
    Route::controller('/order', 'OrderController');
    // Route::get('/order_statistical', function () {
    //     return view('admin.order_statistical');
    // });
    Route::controller('/permission', 'PermissionController');
});

//登录页面
Route::get('admin/login', ['as' => 'login', function () {
    return view('admin.login');
}]);
Route::post('admin/login', 'Admin\ManageController@postLogin')->name('admin-login');
