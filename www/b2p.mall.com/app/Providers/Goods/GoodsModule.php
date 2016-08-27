<?php

namespace App\Providers\Goods;
use App\Goods;
use App\Http\Common\Helper;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Validator;

/**
 * Class GoodsModule
 * @package App\Providers\Buy
 */
class GoodsModule
{

    
    /**
     * 获取商品列表页
     * @author  jianwei
     * @param   $condition  array 查询条件
     */
    public function goodsList(array $condition = [])
    {
        $GoodsModel = new Goods();
        
        $select_column = ['*'];
        
        $goods_obj = $GoodsModel->select($select_column);
    
        //商品名称模糊匹配
        if(!empty($condition['goods_name'])) {
            $goods_obj->where('goods_name', 'LIKE', '%' . $condition['goods_name'] . '%');
        }
        
        $goods_list = $goods_obj->paginate();
        
        return  $goods_list;
    }
    
    
    /**
     * 新增商品
     * @author  jianwei
     * @param   $goods_content  array   商品的内容
     */
    public function addGoods(array $goods_content = [])
    {
        $rule = array(
            'goods_name'  =>  ['required','string','min:2'],
            'goods_desc'  =>  ['required','string','min:2','max:150'],
            'shop_price'  =>  ['required','numeric','min:0'],
            'market_price'  =>  ['required','numeric','min:0'],
            'goods_number'  =>  ['required','integer','min:0'],
            'is_on_sale'    =>  ['required','in:0,1'],
            'content'   =>  ['required','min:0'],
        );
        
        $validate = Validator::make($goods_content,$rule);
        
        //校验
        if($validate->fails()){
            return Helper::ErrorMessage(10000,'参数错误!',$validate->messages()->toArray());
        }
    
        //检查是否已经有同样的商品名称
        $check_goods = $this->getGoodsByName($goods_content['goods_name'],['id','goods_name']);
        
        if(is_array($check_goods) && isset($check_goods['err_code'])){
            return $check_goods;
        }else if(is_object($check_goods) && isset($check_goods->id)){
            return Helper::ErrorMessage(50000,'商品已存在!');
        }
        
        //创建商品
        $goods_info = $this->createGoods($goods_content);
    
        if(is_array($check_goods) && isset($check_goods['err_code'])){
            return $check_goods;
        }else if($check_goods === false){
            return Helper::ErrorMessage(50001,'商品创建失败!');
        }
        
        
    }
    
    /**
     * 创建商品
     * @author  jianwei
     */
    public function createGoods(array $data = [])
    {
        $rule = array(
            'goods_name'  =>  ['required','string','min:2'],
            'goods_desc'  =>  ['required','string','min:2','max:150'],
            'shop_price'  =>  ['required','numeric','min:0'],
            'market_price'  =>  ['required','numeric','min:0'],
            'goods_number'  =>  ['required','integer','min:0'],
            'is_on_sale'    =>  ['required','in:0,1'],
            'content'   =>  ['required','min:0'],
        );
        
        $validate = Validator::make($data,$rule);
        
        if($validate->fails()){
            return Helper::ErrorMessage(10000,'参数错误',$validate->messages()->toArray());
        }
        
        $GoodsModel = App::make('GoodsModel');
        
        $goods_columns = array_keys($rule);
        
        foreach($goods_columns as $ck=>$cv){
            if(isset($data[$cv])){
                $GoodsModel->$cv = $data[$cv];
            }
        }
    
        return $GoodsModel->save();
    }
    
    /**
     * 通过一个商品名称,获取一个商品
     * @author  jianwei
     */
    public function getGoodsByName($goods_name,array $select_columns = [],array $relatives = [])
    {
        if(!is_string($goods_name) || empty($goods_name)){
            return Helper::ErrorMessage(10000,'参数错误!',array());
        }
        
        $GoodsModel = App::make('GoodsModel');
    
        $goods_obj = $GoodsModel->select($select_columns);
    
        $goods_obj->where('goods_name',$goods_name);
        
        $goods_obj->orderBy('id','desc');
        
        $goods_info = $goods_obj->first();
        
        return $goods_info;
    }
    
}
