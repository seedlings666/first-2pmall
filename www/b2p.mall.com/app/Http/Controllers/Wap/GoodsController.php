<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\View;

class GoodsController extends Controller
{
    
    /**
     * 商品详情页
     * @author  jianwei
     */
    public function getShow($goods_id)
    {
        
        
        return View::make('wap.index');
    }
    
}
