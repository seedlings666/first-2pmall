<?php

namespace App\Http\Controllers\Wap;

use App\Http\Controllers\Controller;
use App\Providers\Goods\GoodsModule;
use Illuminate\Support\Facades\View;

class GoodsController extends Controller
{
    
    /**
     * 商品详情页
     * @author  jianwei
     */
    public function getShow($goods_id)
    {
        $goods_details = (new GoodsModule())->getGoodsDetails($goods_id,99999999999999999,1);
        
        if(is_array($goods_details) && isset($goods_details['err_code'])){
            exit('error!');
        }
        
        //获取属性跟属性值
        if(isset($goods_details->goodsSkuList)){
            
        }
        
        return View::make('wap.index')->with($goods_details);
    }
    
}
