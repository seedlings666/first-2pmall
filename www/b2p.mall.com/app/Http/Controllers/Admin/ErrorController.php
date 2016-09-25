<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Goods\GoodsModule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;

class ErrorController extends Controller
{

    /**
     * 后台商品列表页
     * @author  joey
     */
    public function getIndex()
    {
        return View::make('admin.error.404_page');
    }
}
