<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Goods\GoodsModule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;

class GoodsController extends Controller
{
    
    /**
     * 后台商品列表页
     * @author  jianwei
     */
    public function getIndex()
    {
        $condition = Input::get();
        
        $goods_list = (new GoodsModule())->goodsList($condition);
        
        return View::make('admin.index')->with('goods_list',$goods_list);
    }
    
    /**
     * 图片上传
     * @author  jianwei
     */
    public function postUpload()
    {
        $file = Input::file('file');
        //检验文件是否有效
    
        $goods_id = Input::get('goods_id',10);
        
        $upload_response = (new GoodsModule())->goodsImageUpload($goods_id,$file);
        
        return $upload_response;
    }
    
    
    /**
     * 新增商品页面
     * @author  jianwei
     */
    public function getCreate()
    {
        return View::make('admin.add_goods');
    }
    
    
    /**
     * 新增商品
     * @author  jianwei
     */
    public function anyStore()
    {
        //以 json 格式
        $data = Input::get('goods_content');
        
        //测试数据
        $data = array();
        //$data['goods_name'] = '测试商品名称-'.mt_rand();
        $data['goods_name'] = '测试商品名称-';
        $data['goods_desc'] = '商品描述';
        $data['shop_price'] = '10.00';
        $data['market_price'] = '20.20';
        $data['goods_number'] = 100;
        $data['is_on_sale'] = 1;
        $data['content'] = 'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent';
        $data['test'] = 'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent';
        $data['images'] = 'a,1,2,3,10,11,12,13';
        $data['is_sku'] = 1;
        $sku_list_tmp = array();
        $sku_list_tmp[1]['sku_name'] = 'sku名称';
        $sku_list_tmp[1]['shop_price'] = '10.10';
        $sku_list_tmp[1]['market_price'] = '20.20';
        $sku_list_tmp[1]['sku_number'] = '10';
        $sku_list_tmp[1]['color'] = 'red';
        $sku_list_tmp[1]['size'] = '10寸';
    
        $sku_list_tmp[2]['sku_name'] = 'sku名称2';
        $sku_list_tmp[2]['shop_price'] = '0.50';
        $sku_list_tmp[2]['market_price'] = '0.60';
        $sku_list_tmp[2]['sku_number'] = '100';
        $sku_list_tmp[2]['color'] = 'blue';
        $sku_list_tmp[2]['size'] = '20寸';
        $data['sku_list'] = $sku_list_tmp;
        
        $data = json_encode($data);
        $goods_content = (array)json_decode($data,true);
        $goods_content['shop_id'] = Session::get('shop_id');
        $goods_content['shop_id'] = 10;
        
        //开启事务
        DB::beginTransaction();
        $add_response = (new GoodsModule())->addGoods($goods_content);
        
        if(isset($add_response['err_code'])){
            //事务回滚
            DB::rollBack();
        }
        
        //DB::rollBack();
        DB::commit();
        
        return Response::json($add_response);
    }
    
}
