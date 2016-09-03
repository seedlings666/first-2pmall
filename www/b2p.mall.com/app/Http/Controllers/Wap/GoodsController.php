<?php

namespace App\Http\Controllers\Wap;

use App\Http\Common\Helper;
use App\Http\Controllers\Controller;
use App\Providers\Goods\GoodsModule;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\View;

class GoodsController extends Controller
{
    
    
    /**
     * 用于测试
     * @author  jianwei
     */
    public function anyTest()
    {
        $goods_id = Input::get('goods_id',0);
    
        $GoodsModule = new GoodsModule();
        
        $goods_details = $GoodsModule->getGoodsDetails($goods_id,99999999999999999,1);
        
        if(is_array($goods_details) && isset($goods_details['err_code'])){
            return Response::json($goods_details);
        }
        
        $goods_info = $goods_details['goods_details'];
        
        if(!isset($goods_info['is_on_sale']) || $goods_info['is_on_sale'] != 1){
            //exit('该商品不上架!');
            $err_msg = Helper::ErrorMessage(50010,'该商品已下架!');
            return $err_msg;
        }
        
        //当商品为单品时,需要拿到默认 sku 数据
        $default_sku_info = null;
        $color_attr_arr = [];
        $size_attr_arr = [];
        if($goods_info['is_sku'] != 1){
            //获取默认 sku 数据
            $default_sku_info = $GoodsModule->getSkuByAttr($goods_id,0,0);
            if(isset($default_sku_info['err_code'])){
                return Response::json($default_sku_info);
            }
            //当不存在,抛出一个商品数据有误的错误
            if(empty($default_sku_info)){
                $err_msg = Helper::ErrorMessage(50009,'该商品数据有误!');
                return Response::json($err_msg);
            }
            
            if($default_sku_info->is_on_sale == 0) {
                //当默认 sku 不上架,那么抛出不上架错误
                $err_msg = Helper::ErrorMessage(50010, '该商品已下架!');
                return Response::json($err_msg);
            }
        }else{
            //获取 color 跟 size 的属性值
            //获取颜色属性
            $color_attr_arr = $GoodsModule->getSkuAttrValue($goods_id,'color');
            
            //大小属性
            $size_attr_arr = $GoodsModule->getSkuAttrValue($goods_id,'size');
            return $color_attr_arr;
        }
        
        return Response::json($color_attr_arr);
    }
    
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
