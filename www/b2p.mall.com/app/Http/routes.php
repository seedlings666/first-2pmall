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

Route::get('/', function () {
    return view('welcome');
});

// 移动端
Route::group(['prefix' => 'wap', 'namespace' => 'Wap'], function () {
    Route::get('/', function () {
        return view('wap.index');
    });

    //商品模块控制器
    Route::controller('/goods', 'GoodsController');

    //微信
    Route::controller('/wx','WxController');

    //用户
    Route::controller('/user','UserController');

    Route::get('/user', function () {
        return view('wap.userInfo');
    });

    Route::get('/order', function () {
        return view('wap.order');
    });

    Route::get('/order/list', function () {
        return view('wap.orderList');
    });


    //拼团支付
    Route::get('/group/pay', 'BuyController@getPay');
    //创建拼团订单
    Route::any('/group/order/{type}/{pay_sn}', 'BuyController@createOrder');
    //所有拼团订单，包含当前用自己的订单
    Route::any('/group/orders/{type?}', 'BuyController@groupOrders');
});

// 管理后台
Route::group(['prefix' => 'admin','namespace'=>'Admin'], function () {

    //后台商品模块
    Route::controller('/goods','GoodsController');

    Route::get('/', function() {
        return view('admin.index');
    });

    Route::get('/shop', function(){
        return view('admin.shop');
    });

    Route::get('/shop/create', function(){
        return view('admin.shop_create');
    });
    /**
    Route::get('/goods/add', function() {
        return view('admin.add_goods');
    });
     */

    Route::get('/login', function() {
        return view('admin.login');
    });
    Route::get('/order', 'OrderController@getOrder');
    Route::get('/order/info/{id}', 'OrderController@getInfo');
    Route::get('/order_statistical', function() {
        return view('admin.order_statistical');
    });
    Route::get('/user', function () {
        return view('admin.user');
    });
    Route::get('/competence', function () {
        return view('admin.competence');
    });
});
