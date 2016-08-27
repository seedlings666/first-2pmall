<?php

namespace App\Providers\Goods;
use App\Goods;
use App\Http\Common\Helper;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

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
            'images'    =>  ['required','string',],
        );
        
        $validate = Validator::make($goods_content,$rule);
        
        //校验
        if($validate->fails()){
            return Helper::ErrorMessage(10000,'参数错误!',$validate->messages()->toArray());
        }
    
        $goods_images = $goods_content['images'];
    
        $goods_images_id = explode(',',$goods_images);
    
        $goods_images_id = array_filter($goods_images_id,function($value){
            return is_numeric($value) ? true : false;
        });
        
        //查询商品图片是否存在
        $goods_images_condition = array();
        $goods_images_condition['goods_id'] = 0;
        $goods_images_list = $this->getImagesByIds($goods_images_id,$goods_images_condition);
        if(is_array($goods_images_list) && isset($goods_images_list['err_code'])){
            return $goods_images_list;
        }
    
        //存储此图片的 id
        $goods_images_id_arr = array_column($goods_images_list->toArray(),'id','id');
        
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
        
        //图片处理
        //修改图片的 goods_id
        $update_goods_images_condition = array();
        $update_goods_images_condition['goods_id'] = 0;
        $update_goods_images_update = array();
        $update_goods_images_update['goods_id'] = $goods_info->id;
        //暂时不判断是否可用
        $update_goods_images_response = $this->updateGoodsImages($goods_images_id_arr,$update_goods_images_condition,$update_goods_images_update);
        
        
        //处理 sku
        
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
    
        $GoodsModel->save();
        
        return $GoodsModel;
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
        
        if(!empty($goods_info) && !empty($relatives)){
            $goods_info->load($relatives);
        }
        
        return $goods_info;
    }
    
    /**
     * 通过 images_id 获取一组图片
     * @author  jianwei
     * @param   $images_id array 查询的图片 id
     * @param   $condition  array   额外的查询字段
     * @param   $select_columns array 查询字段
     * @param   $relatives  array   关系
     */
    public function getImagesByIds(array $images_id = [],array $condition = [],array $select_columns = ['*'],array $relatives = [])
    {
        $images_id = array_filter($images_id);
        
        if(empty($images_id)){
            return Helper::ErrorMessage(10001,'请上传商品图片!',[]);
        }
        
        $GoodsImagesModel = App::make('GoodsImagesModel');
    
        //查询字段
        $goods_images_obj = $GoodsImagesModel->select($select_columns);
        
        //查询 id
        $goods_images_obj->whereIn('id',$images_id);
        
        //额外的查询字段
        $goods_images_obj->where($condition);
    
        $goods_images_list = $goods_images_obj->get();
        
        if(count($goods_images_list) < 1){
            return Helper::ErrorMessage(50002,'找不到任何商品图片!');
        }
        
        return $goods_images_list;
    }
    
    /**
     * 修改图片的 goods_id 字段
     * @author  jianwei
     * @
     */
    public function updateGoodsImages(array $images_id = [],array $condition = [],array $update_arr = [])
    {
        $update_arr = array_filter($update_arr);
    
        $condition = array_filter($condition);
    
        $images_id = array_filter($images_id);
        
        if(empty($update_arr) || empty($condition) || empty($images_id)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        //修改
        $update_response = $GoodsImagesModel = App::make('GoodsImagesModel')->whereIn('id',$images_id)->where($condition)->update($update_arr);
        
        return $update_response;
    }
    
    /**
     * 图片文件上传
     * @author  jianwei
     */
    public function goodsImageUpload($goods_id,$image_file)
    {
        if(!$image_file->isValid()){
            return Helper::ErrorMessage(10002,'上传文件无效!');
        }
        
        //扩展名称
        $ext_name = $image_file->getClientOriginalExtension();
    
        //mime 类型
        $mime_type = $image_file->getMimeType();
        
        //允许的 mime 类型
        $allow_mime_arr = array('image/gif','image/jpeg','image/png');
        
        if(!in_array($mime_type,$allow_mime_arr)){
            return Helper::ErrorMessage(10003,'上传的图片类型不正确!');
        }
        
        //客户端名字
        $client_name = $image_file->getClientOriginalName();
        
        //在缓存中的名字
        $tmp_name = $image_file->getFileName();
    
        //缓存目录的绝对路径
        $tmp_real_path = $image_file->getRealPath();
        
        //迁移到public 目录,规则,public/file/images/goods/YYYY/MM/YYYYMMDDHHIISS.ext_name
    
        list($year,$month) = explode('-',date('Y-m'));
        
        $file_relative_path = '/file/images/goods/%d/%d/';
    
        $path_name_format = public_path().$file_relative_path;
    
        $path_name = sprintf($path_name_format,$year,$month);
        
        $file_name = date('YmdHis').'.'.$ext_name;
        
        $file_full_name = $path_name.$file_name;
        
        try {
            $file_obj = $image_file->move($path_name, $file_name);
        }catch(FileException $e){
            return Helper::ErrorMessage(10005,'图片上传失败!');
        }
        
        //获取图片相关信息,如长宽高大小
        //Image
        
        //保存图片
        $GoodsImagesModel = App::make('GoodsImagesModel');
    
        //图片 id
        $GoodsImagesModel->goods_id = $goods_id;
        //扩展名称
        $GoodsImagesModel->ext_name = $ext_name;
        //mime 类型
        $GoodsImagesModel->mime = $mime_type;
        //文件原名
        $GoodsImagesModel->origin_name = $client_name;
        //文件路径
        $GoodsImagesModel->file_path = $path_name;
        //文件名称
        $GoodsImagesModel->file_name = $file_name;
        //url 访问的相对路径
        $GoodsImagesModel->url_links = $file_relative_path.$file_name;
        //base64码
        //$GoodsImagesModel->base_code =
    }
    
    
    
    
}
