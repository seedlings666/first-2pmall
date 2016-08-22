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

Route::group(['prefix' => 'admin'], function () {
    Route::get('/', function() {
        return view('admin.index');
    });
});

Route::group(['prefix' => 'wap'], function () {
    Route::get('/', function () {
        return view('wap.index');
    });

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
