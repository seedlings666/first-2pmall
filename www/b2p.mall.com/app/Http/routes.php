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
Route::group(['prefix' => 'wap','namespace'=>'Wap'], function () {
    Route::get('/', function () {
        return view('wap.index');
    });

    //商品模块控制器
    Route::controller('/goods','GoodsController');

    Route::get('/user', function () {
        return view('wap.userInfo');
    });

    Route::get('/order', function () {
        return view('wap.order');
    });

    Route::get('/order/list', function () {
        return view('wap.orderList');
    });
});

// 管理后台
Route::group(['prefix' => 'admin'], function () {
    Route::get('/', function() {
        return view('admin.index');
    });
    Route::get('/order', function() {
        return view('admin.order');
    });
    Route::get('/order_statistical', function() {
        return view('admin.order_statistical');
    });
    Route::get('/user', function() {
        return view('admin.user');
    });
    Route::get('/competence', function() {
        return view('admin.competence');
    });
});
