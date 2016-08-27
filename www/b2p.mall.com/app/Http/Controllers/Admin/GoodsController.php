<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Providers\Goods\GoodsModule;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Response;
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
        $data['goods_name'] = '测试商品名称-'.mt_rand();
        $data['goods_desc'] = '商品描述';
        $data['shop_price'] = '10.00';
        $data['market_price'] = '20.20';
        $data['goods_number'] = 100;
        $data['is_on_sale'] = 1;
        $data['content'] = 'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent';
        $data['test'] = 'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent';
        $data['images'] = 'a,1,2,3,10,11,12,13';
        
        $data = json_encode($data);
        $goods_content = (array)json_decode($data,true);
        
        //开启事务
        DB::beginTransaction();
        $add_response = (new GoodsModule())->addGoods($goods_content);
        
        if(isset($add_response['err_code'])){
            //事务回滚
            DB::rollBack();
        }
        
        DB::rollBack();
        //DB::commit();
        
        return Response::json($add_response);
    }
    
}
