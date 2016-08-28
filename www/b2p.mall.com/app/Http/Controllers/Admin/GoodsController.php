<?php

namespace App\Http\Controllers\Admin;

use App\Goods;
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
        
        //是否系统管理员,当为系统管理员,则忽略查询 shop_id 条件
        $is_system = Session::get('is_system');
        
        //商品 id
        $shop_id = Session::get('shop_id',0);
        
        if($is_system != 1){
            $condition['shop_id'] = $shop_id;
        }else{
            if(isset($condition['shop_id'])){
                unset($condition['shop_id']);
            }
        }
        
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
    
        $goods_id = Input::get('goods_id',0);
        
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
        $data['goods_name'] = '测试商品名称-'.mt_rand();
        //$data['goods_name'] = '测试商品名称-';
        $data['goods_desc'] = '商品描述';
        $data['shop_price'] = '10.00';
        $data['market_price'] = '20.20';
        $data['goods_number'] = 100;
        $data['is_on_sale'] = 1;
        $data['content'] = 'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent';
        $data['images'] = 'a,1,2,3,10,11,12,13,21,22';
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
//
//        echo json_encode($goods_content);
//        exit();
        
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
    
    
    
    /*
     * 设置 session
     * @author  jianwei
     */
    public function anySetSession()
    {
        $shop_id = Input::get('shop_id',0);
        $is_system = Input::get('is_system',0);
        Session::set('shop_id',$shop_id);
        Session::set('is_system',$is_system);
        
        return Response::json([
            'shop_id'   =>  $shop_id,
            'is_system' =>  $is_system
        ]);
    }
    
    /**
     * 删除商品
     * @author  jianwei
     */
    public function anyDelete()
    {
        //店铺 id
        $shop_id = Session::get('shop_id',0);
        
        //是否系统管理员
        $is_system = Session::get('is_system',0);
        
        $goods_id = Input::get('goods_id',0);
        
        $del_response = (new GoodsModule())-> delGoods($shop_id,$goods_id,$is_system);
        
        return Response::json($del_response);
    }
    
    
    /**
     * 商品详情
     * @author  jianwei
     */
    public function getShow()
    {
        $goods_id = Input::get('goods_id',0);
        
        $shop_id = Session::get('shop_id',0);
        
        $is_system = Session::get('is_system',0);
        
        $goods_info = (new GoodsModule())->getGoodsDetails($goods_id,$shop_id,$is_system);
        
        return Response::json($goods_info);
    }
}
