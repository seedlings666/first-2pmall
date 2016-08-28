<?php

namespace App\Providers\Goods;

use App\Goods;
use App\Http\Common\Helper;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;
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
        
        if(isset($condition['shop_id'])){
            $goods_obj->where('shop_id',$condition['shop_id']);
        }
    
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
            'shop_id'  =>  ['required','integer','min:0'],
            'is_on_sale'    =>  ['required','integer','in:0,1'],
            'content'   =>  ['required','min:0'],
            'is_sku'    =>  ['required','integer','in:0,1'],
            'images'    =>  ['required','string',],
            'sku_list'    =>  [],
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
        $check_goods = $this->getGoodsByName($goods_content['shop_id'],$goods_content['goods_name'],['id','goods_name']);
        
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
    
        $sku_list = isset($goods_content['sku_list']) ? $goods_content['sku_list'] : array();
        
        //处理 sku
        //不为 sku 时,那么生成一条默认 sku 数据到 sku
        $save_goods_sku_response = array();
        if($goods_content['is_sku'] == 0) {
            //创建单品
            $goods_sku_condition = array();
            $goods_sku_condition['goods_id'] = $goods_info->id;
            $goods_sku_condition['sku_name'] = '默认 sku';
            $goods_sku_condition['shop_price'] = $goods_info->shop_price;
            $goods_sku_condition['market_price'] = $goods_info->market_price;
            $goods_sku_condition['sku_number'] = $goods_info->goods_number;
            $goods_sku_condition['sku_attr_1'] = 0;
            $goods_sku_condition['sku_attr_2'] = 0;
    
            $save_goods_sku_response[] = $this->saveGoodsSku($goods_sku_condition);
        }else if($goods_content['is_sku'] == 1 && is_array($sku_list) && !empty($sku_list)){
            //先创建2个属性
            //颜色属性
            $goods_color_attr = $this->saveGoodsAttr($goods_info->id,'颜色');
            //尺寸属性
            $goods_size_attr = $this->saveGoodsAttr($goods_info->id,'尺寸');
    
    
            //存储新增的商品 sku 属性
            $add_sku_arr = array();
            
            //循环存储 sku 数据
            foreach($sku_list as $lk=>$lv){
                
                if(!isset($lv['sku_name']) ||
                    !isset($lv['shop_price']) ||
                    !isset($lv['market_price']) ||
                    !isset($lv['sku_number']) ||
                    !isset($lv['color']) ||
                    !isset($lv['size'])
                ){
                    continue;
                }
                
                //创建属性
                //颜色属性
                $sku_attr_color = $this->saveGoodsAttrValue($goods_info->id,$goods_color_attr->id,$lv['color']);
                //大小属性
                $sku_attr_size = $this->saveGoodsAttrValue($goods_info->id,$goods_size_attr->id,$lv['size']);
                
                //判断是否已经存在此 sku
                //如果存在,那么更新数据,不判断 err_code
                $sku_info = $this->getSkuByAttr($goods_info->id,$sku_attr_color->id,$sku_attr_size->id);
    
                $is_on_sale = isset($lv['is_on_sale']) && in_array($lv['is_on_sale'],[0,1]) ? $lv['is_on_sale'] : 1;
                
                if(isset($sku_info->id)){
                    //$sku_info->goods_id = $goods_info->id;
                    $sku_info->sku_name = $goods_info->sku_name;
                    $sku_info->shop_price = $goods_info->shop_price;
                    $sku_info->market_price = $goods_info->market_price;
                    $sku_info->sku_number = $goods_info->sku_number;
                    $sku_info->sku_attr_1 = $sku_attr_color->id;
                    $sku_info->sku_attr_2 = $sku_attr_size->id;
                    
                    //是否上下架,默认上架
                    $sku_info->in_on_sale = $is_on_sale;
                    
                    //直接修改
                    $sku_info->save();
                    $save_goods_sku_response[] = $sku_info->toArray();
                }else {
                    $goods_sku_tmp = array();
                    $goods_sku_tmp['goods_id'] = $goods_info->id;
                    $goods_sku_tmp['sku_name'] = $lv['sku_name'];
                    $goods_sku_tmp['shop_price'] = $lv['shop_price'];
                    $goods_sku_tmp['market_price'] = $lv['market_price'];
                    $goods_sku_tmp['sku_number'] = $lv['sku_number'];
                    $goods_sku_tmp['sku_attr_1'] = $sku_attr_color->id;
                    $goods_sku_tmp['sku_attr_2'] = $sku_attr_size->id;
                    $goods_sku_tmp['is_on_sale'] = $is_on_sale;
    
                    $add_sku_arr[] = $goods_sku_tmp;
                    $save_goods_sku_response[] = $goods_sku_tmp;
                }
    
            }
            
            if(!empty($add_sku_arr)){
                //新增数据
                App::make('GoodsSkuModel')->insert($add_sku_arr);
            }
        }else{
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        
        //回调,整理商品的数据
        $handle_goods_response = $this->handleGoods($goods_info->id);
        
        return $goods_info;
    }
    
    
    /**
     * 整理商品数据
     * @author  jianwei
     * @notice  直接写 sql
     */
    public function handleGoods($goods_id)
    {
        
        //当所有 sku 都下架以后,强制整个商品下架
        $check_goods_on_sale = "UPDATE zo_goods AS G ,(SELECT SUM(is_on_sale) AS total,goods_id FROM zo_goods_sku WHERE goods_id = '{$goods_id}' AND deleted_at is null) AS S SET G.is_on_sale = CASE WHEN S.total > 0 THEN 1 ELSE 0 END WHERE G.id = '{$goods_id}' AND G.id = S.goods_id AND G.deleted_at is null";
        
        echo $check_goods_on_sale;
        exit();
        
        //处理最低商品购买价
        $handle_buy_price_sql = 'UPDATE zo_goods AS G,(SELECT id,goods_id,shop_price,market_price FROM zo_goods_sku WHERE goods_id = '.$goods_id.' AND is_on_sale = 1 ORDER BY shop_price ASC LIMIT 1) AS S SET G.shop_price = S.shop_price,G.market_price=S.market_price WHERE G.id = '.$goods_id.' AND S.goods_id = G.id;';
        
        //处理商品总库存
        $handle_goods_number = 'UPDATE zo_goods AS G,(SELECT SUM(sku_number) AS all_number,goods_id FROM zo_goods_sku WHERE goods_id = '.$goods_id.' AND is_on_sale = 1) AS S SET G.goods_number = S.all_number WHERE G.id = '.$goods_id.' AND S.goods_id = G.id;';
        
        DB::update($handle_buy_price_sql);
        DB::update($handle_goods_number);
        
        return true;
    }
    
    
    /**
     * 各部 goods_id,sku_attr_1,sku_attr_2获取是否已经存在sku数据
     * @author  jianwei
     */
    public function getSkuByAttr($goods_id,$sku_attr_color_id,$sku_attr_size_id,array $select_columns = ['*'],array $relatives = [])
    {
        if(!is_numeric($goods_id) ||
            $goods_id < 1 ||
            !is_numeric($sku_attr_color_id) ||
            $sku_attr_color_id < 0 ||
            !is_numeric($sku_attr_size_id) ||
            $sku_attr_size_id < 0
        ){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsSkuModel = App::make('GoodsSkuModel');
    
        $goods_sku_obj = $GoodsSkuModel->select($select_columns);
    
        $goods_sku_obj->where('goods_id',$goods_id);
        
        $goods_sku_obj->where('sku_attr_1',$sku_attr_color_id);
        
        $goods_sku_obj->where('sku_attr_2',$sku_attr_size_id);
        
        $goods_sku_obj->orderBy('id','desc');
        
        $goods_sku_info = $goods_sku_obj->first();
        
        if(!empty($goods_sku_info) && !empty($relatives)){
            $goods_sku_info->load($relatives);
        }
        
        return $goods_sku_info;
    }
    
    
    /**
     * 查询或者创建属性
     * @author  jianwei
     * @param   $goods_id   int 商品 id
     * @param   $goods_attr_name    string      商品属性名称
     */
    public function saveGoodsAttr($goods_id,$goods_attr_name)
    {
        if(!is_numeric($goods_id) || $goods_id < 1 || !is_string($goods_attr_name) || empty($goods_attr_name)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $goods_attr_info = $this->getGoodsAttr($goods_id,$goods_attr_name);
        
        if(is_array($goods_attr_info) && isset($goods_attr_info['err_code'])){
            return $goods_attr_info;
        }
        
        if(isset($goods_attr_info->id)){
            return $goods_attr_info;
        }
    
        $GoodsAttrModel = App::make('GoodsAttrModel');
        $GoodsAttrModel->goods_id = $goods_id;
        $GoodsAttrModel->attr_name = $goods_attr_name;
        $GoodsAttrModel->save();
        
        $goods_attr_info = $GoodsAttrModel;
        
        return $goods_attr_info;
    }
    
    
    /**
     * 根据商品 id 以及属性名称,获取属性的数据
     * @author  jianwei
     */
    public function getGoodsAttr($goods_id,$goods_attr_name,array $select_columns = ['*'],array $relatives= [])
    {
        if(!is_numeric($goods_id) || $goods_id < 1 || !is_string($goods_attr_name) || empty($goods_attr_name)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsAttrModel = App::make('GoodsAttrModel');
        
        $goods_attr_obj = $GoodsAttrModel->select($select_columns);
    
        $goods_attr_obj->where('goods_id',$goods_id);
    
        $goods_attr_obj->where('attr_name',$goods_attr_name);
        
        $goods_attr_obj->orderBy('id','desc');
    
        $goods_attr_info = $goods_attr_obj->first();
        
        if(!empty($goods_attr_info) && !empty($relatives)){
            $goods_attr_info->load($relatives);
        }
        
        return $goods_attr_info;
    }
    
    
    /**
     * 查询或者创建属性值
     * @author  jianwei
     * @param   $goods_id   int 商品 id
     * @param   $attr_id    int 属性 id
     * @param   $goods_attr_name    string      商品属性名称
     */
    public function saveGoodsAttrValue($goods_id,$attr_id,$attr_value_name)
    {
        if(!is_numeric($goods_id) || $goods_id < 1 || !is_numeric($attr_id) || $attr_id < 1 || !is_string($attr_value_name) || empty($attr_value_name)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $goods_attr_value_info = $this->getGoodsAttrValue($goods_id,$attr_id,$attr_value_name);
        
        if(is_array($goods_attr_value_info) && isset($goods_attr_value_info['err_code'])){
            return $goods_attr_value_info;
        }
        
        if(isset($goods_attr_value_info->id)){
            return $goods_attr_value_info;
        }
        
        $GoodsAttrValueModel = App::make('GoodsAttrValueModel');
        $GoodsAttrValueModel->goods_id = $goods_id;
        $GoodsAttrValueModel->attr_id = $attr_id;
        $GoodsAttrValueModel->value_name = $attr_value_name;
        $GoodsAttrValueModel->save();
    
        $goods_attr_value_info = $GoodsAttrValueModel;
        
        return $goods_attr_value_info;
    }
    
    
    /**
     * 查询或者创建属性值
     * @author  jianwei
     * @param   $goods_id   int 商品 id
     * @param   $attr_id    int 属性 id
     * @param   $goods_attr_name    string      商品属性名称
     */
    public function getGoodsAttrValue($goods_id,$attr_id,$attr_value_name,array $select_columns = ['*'],array $relatives= [])
    {
        if(!is_numeric($goods_id) || $goods_id < 1 || !is_numeric($attr_id) || $attr_id < 1 || !is_string($attr_value_name) || empty($attr_value_name)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsAttrValueModel = App::make('GoodsAttrValueModel');
        
        $goods_attr_value_obj = $GoodsAttrValueModel->select($select_columns);
    
        $goods_attr_value_obj->where('goods_id',$goods_id);
        
        $goods_attr_value_obj->where('attr_id',$attr_id);
    
        $goods_attr_value_obj->where('value_name',$attr_value_name);
    
        $goods_attr_value_obj->orderBy('id','desc');
    
        $goods_attr_value_info = $goods_attr_value_obj->first();
        
        if(!empty($goods_attr_value_info) && !empty($relatives)){
            $goods_attr_value_info->load($relatives);
        }
        
        return $goods_attr_value_info;
    }
    
    /**
     * 创建 sku 数据
     * @author  jianwei
     * @param   $sku_arr    array     数据 sku
     */
    public function saveGoodsSku(array $sku_data = [])
    {
        //校验规则
        $rule = array(
            'id'        =>  ['integer',],
            'goods_id'  =>  ['required','integer',],
            'sku_name'  =>  ['required','string',],
            'shop_price'  =>  ['required','numeric','min:0'],
            'market_price'  =>  ['required','numeric','min:0'],
            'sku_number'  =>  ['required','integer','min:0'],
            'sku_attr_1'    =>  ['required','integer',],
            'sku_attr_2'    =>  ['required','integer',],
            );
        
        $validate = Validator::make($sku_data,$rule);
        
        if($validate->fails()){
            return Helper::ErrorMessage(10000,'参数错误',$validate->messages()->toArray());
        }
        
        $GoodsSkuModel = App::make('GoodsSkuModel');
    
        foreach (array_keys($rule) as $rk=>$rv){
            if(empty($sku_data[$rv])){
                continue;
            }
            
            $GoodsSkuModel->$rv = $sku_data[$rv];
        }
        
        $GoodsSkuModel->save();
        
        return $GoodsSkuModel;
    }
    
    /**
     * 创建商品
     * @author  jianwei
     */
    public function createGoods(array $data = [])
    {
        $rule = array(
            'shop_id'  =>  ['required','integer','min:0'],
            'goods_name'  =>  ['required','string','min:2'],
            'goods_desc'  =>  ['required','string','min:2','max:150'],
            'shop_price'  =>  ['required','numeric','min:0'],
            'market_price'  =>  ['required','numeric','min:0'],
            'goods_number'  =>  ['required','integer','min:0'],
            'is_on_sale'    =>  ['required','integer','in:0,1'],
            'is_sku'    =>  ['required','integer','in:0,1'],
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
    public function getGoodsByName($shop_id,$goods_name,array $select_columns = [],array $relatives = [])
    {
        if(!is_string($goods_name) || empty($goods_name) || !is_numeric($shop_id) || $shop_id < 1){
            return Helper::ErrorMessage(10000,'参数错误!',array());
        }
        
        $GoodsModel = App::make('GoodsModel');
    
        $goods_obj = $GoodsModel->select($select_columns);
        
        $goods_obj->where('shop_id',$shop_id);
    
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
        if(!is_numeric($goods_id) || $goods_id < 0){
           return Helper::ErrorMessage(10000,'参数错误!');
        }
        
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
        
        $file_relative_path_format = '/file/images/goods/%d/%d/';
    
        $file_relative_path = sprintf($file_relative_path_format,$year,$month);
    
        $path_name = public_path().$file_relative_path;
        
        $file_name = date('YmdHis').'.'.$ext_name;
        
        $file_full_name = $path_name.$file_name;
        
        try {
            $file_obj = $image_file->move($path_name, $file_name);
        }catch(FileException $e){
            return Helper::ErrorMessage(10005,'图片上传失败!');
        }
        
        //获取图片相关信息,如长宽高大小
        $img_obj = Image::make($file_full_name);
        
        //文件宽度
        $file_width = $img_obj->width();
        
        //文件高度
        $file_height = $img_obj->height();
        
        //文件大小
        //$file_size = $img_obj->size();        //GD 库无法使用
        $file_size = $image_file->getClientSize();
        
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
        //$GoodsImagesModel->base_code = base64_encode(file_get_contents($file_full_name));
        $GoodsImagesModel->base_code = '';
        //图片大小
        $GoodsImagesModel->size = $file_size;
        //图片的宽
        $GoodsImagesModel->width = $file_width;
        //图片的高
        $GoodsImagesModel->height = $file_height;
    
        //保存数据
        $GoodsImagesModel->save();
    
        $return_arr = array();
        $return_arr['id'] = $GoodsImagesModel->id;
        $return_arr['goods_id'] = $GoodsImagesModel->goods_id;
        $return_arr['file_name'] = $GoodsImagesModel->file_name;
        $return_arr['origin_name'] = $GoodsImagesModel->origin_name;
        $return_arr['base_code'] = $GoodsImagesModel->base_code;
        $return_arr['url_links'] = config('site.image_domain').$GoodsImagesModel->url_links;
        
        return $return_arr;
    }
    
    
    /**
     * 通过商品 id获取一个商品
     * @author  jianwei
     * @param   $goods_id   int 商品 id
     * @param   $select_columns array   查询字段
     * @param   $relatives  array   关联关系
     */
    public function getGoodsInfoById($goods_id,array $select_columns = ['*'],array $relatives = [])
    {
        if(!is_numeric($goods_id) || $goods_id < 1){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsModel = App::make('GoodsModel');
        
        $goods_obj = $GoodsModel->select($select_columns);
        
        $goods_obj->where('id',$goods_id);
        
        if(!empty($relatives)){
            $goods_obj->with($relatives);
        }
        
        $goods_info = $goods_obj->first();
        
        if(empty($goods_info)){
            return Helper::ErrorMessage(50004,'商品不存在!');
        }
        
        return $goods_info;
    }
    
    /**
     * 根据商品 id 以及店铺 id 删除商品
     * @author  jianwei
     * @param   $shop_id    int 店铺 id
     * @param   $goods_id   int 商品 id
     * @param   $is_system  int 是否系统用户
     */
    public function delGoods($shop_id,$goods_id,$is_system)
    {
        if(!is_numeric($shop_id) || !is_numeric($goods_id) || !is_numeric($is_system)){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $goods_info = $this->getGoodsInfoById($goods_id);
        
        if(is_array($goods_info) && isset($goods_info['err_code'])){
            return $goods_info;
        }
        
        //当不为系统管理员,并且 shop_id 不相同,那么禁止操作
        if($is_system != 1 && $goods_info->shop_id != $shop_id){
            return Helper::ErrorMessage(50003,'不得修改其他店铺的商品!');
        }
        
        
        //开启事务,删除此商品相关数据
        //DB::beginTransaction();
        //删除商品
        $goods_info->delete();
        //商品此商品的 sku
        App::make('GoodsSkuModel')->where('goods_id',$goods_id)->delete();
        //删除此商品的属性
        App::make('GoodsAttrModel')->where('goods_id',$goods_id)->delete();
        //删除商品的属性值
        App::make('GoodsAttrValueModel')->where('goods_id',$goods_id)->delete();
        //删除商品图片
        App::make('GoodsImagesModel')->where('goods_id',$goods_id)->delete();
        
        
        return $goods_info;
    }
    
    
    /**
     * 根据商品 id 获取一组图片
     * @author  jianwei
     * @param   $goods_id   int     商品 id
     * @param   $select_columns array   查询的字段
     * @param   $relatives  array 关联关系
     */
    public function getGoodsImagesByGoodsId($goods_id,array $select_columns = ['*'],array $relatives = [])
    {
        if(!is_numeric($goods_id) || $goods_id < 1){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsImagesModel = App::make('GoodsImagesModel');
        
        $goods_images_obj = $GoodsImagesModel->select($select_columns);
        
        $goods_images_obj->where('goods_id',$goods_id);
        
        $goods_images_list = $goods_images_obj->get();
        
        if(count($goods_images_list) < 1){
            return Helper::ErrorMessage(50005,'不存在任何商品图片!');
        }
        
        if(!empty($relatives)){
            $goods_images_list->load($relatives);
        }
        
        return $goods_images_list;
    }
    
    /**
     * 根据商品 id,获取 sku 列表
     * @author  jianwei
     * @param   $goods_id   int 商品 id
     * @param   $select_columns array   查询字段
     * @param   $relatives  array   关联关系
     */
    public function getGoodsSkuList($goods_id,array $select_columns = ['*'],array $relatives = [])
    {
        if(!is_numeric($goods_id) || $goods_id < 1){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $GoodsSkuModel = App::make('GoodsSkuModel');
        
        $goods_sku_obj = $GoodsSkuModel->select($select_columns);
        
        $goods_sku_obj->where('goods_id',$goods_id);
        
        $goods_sku_list = $goods_sku_obj->get();
        
        if(count($goods_sku_list) < 1){
            return Helper::ErrorMessage(50006,'不存在任何 sku 数据!');
        }
        
        if(!empty($relatives)){
            $goods_sku_list->load($relatives);
        }
        
        return $goods_sku_list;
    }
    
    /**
     * 通过一个属性值id,获取一个属性
     * @author  jianwei
     */
    public function getSkuAttrValueById($goods_id,$attr_value_id,array $select_columns = ['*'],array $relatives = [])
    {
        if(!is_numeric($goods_id) ||$goods_id < 1 || !is_numeric($attr_value_id) || $attr_value_id < 1){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
    
        $GoodsAttrValueModel = App::make('GoodsAttrValueModel');
    
        $goods_attr_value_obj = $GoodsAttrValueModel->select($select_columns);
    
        $goods_attr_value_obj->where('id',$attr_value_id);
    
        $goods_attr_value_obj->where('goods_id',$goods_id);
    
        $goods_attr_value_obj->orderBy('id','desc');
    
        $goods_attr_value = $goods_attr_value_obj->first();
        
        if(empty($goods_attr_value)){
            return Helper::ErrorMessage(50006,'不存在此属性值!');
        }
        
        if(!empty($goods_attr_value)){
            $goods_attr_value->load($relatives);
        }
        
        return $goods_attr_value;
    }
    
    /**
     * 商品详情页
     * @author  jianwei
     */
    public function getGoodsDetails($goods_id,$shop_id,$is_system)
    {
        if(!is_numeric($shop_id) || $shop_id < 1 || !is_numeric($goods_id) || $goods_id < 1 || !in_array($is_system,[0,1])){
            return Helper::ErrorMessage(10000,'参数错误!');
        }
        
        $goods_details = $this->getGoodsInfoById($goods_id);
        
        if(is_array($goods_details) && isset($goods_details['err_code'])){
            return $goods_details;
        }
        
        if($is_system != 1 && $goods_details->shop_id != $shop_id){
            return Helper::ErrorMessage(50006,'不得查看其他店铺的商品!');
        }
        
        //获取商品图片
        $goods_images_list = $this->getGoodsImagesByGoodsId($goods_id);
    
        $goods_images_arr = array();
        if(is_array($goods_images_list) && isset($goods_images_list['err_code'])){
            $goods_images_arr = array();
        }else{
            foreach($goods_images_list as $ak=>$av){
                $goods_images_tmp['id'] = $av->id;
                $goods_images_tmp['file_name'] = $av->file_name;
                $goods_images_tmp['goods_id'] = $av->goods_id;
                $goods_images_tmp['origin_name'] = $av->origin_name;
                $goods_images_tmp['url_links'] = config('site.image_domain').$av->url_links;
    
                $goods_images_arr[] = $goods_images_tmp;
            }
        }
    
        //存储 sku 列表
        $sku_list_arr = array();
        if($goods_details->is_sku == 1) {
    
            //获取 sku 列表
            $goods_sku_select_columns = ['*'];
            $goods_sku_relatives = [];
//        //颜色属性
//        $goods_sku_relatives['GoodsAttrColorValue'] = function($query){
//
//        };
//        //尺寸属性
//        $goods_sku_relatives['GoodsAttrSizeValue'] = function($query){
//
//        };
            $goods_sku_list = $this->getGoodsSkuList($goods_id, $goods_sku_select_columns, $goods_sku_relatives);
    
            if (is_array($goods_sku_list) && isset($goods_sku_list['err_code'])) {
                return $goods_sku_list;
            }
    
            $sku_list_arr = array();
            foreach ($goods_sku_list as $lk => $lv) {
                //$sku_tmp = array();
                //$sku_tmp['goods_id'] = $lv->goods_id;
                //$sku_tmp['sku_name'] = $lv->sku_name;
                //$sku_tmp['shop_price'] = $lv->shop_price;
                //$sku_tmp['market_price'] = $lv->market_price;
                //$sku_tmp['sku_number'] = $lv->sku_number;
                //$sku_tmp['sku_attr_1'] = $lv->sku_attr_1;
                //$sku_tmp['sku_attr_2'] = $lv->sku_attr_2;
                //$sku_tmp['created_at'] = $lv->created_at;
                //$sku_tmp['updated_at'] = $lv->updated_at;
        
                //默认保存所有数据
                $sku_tmp = $lv->toArray();
                $sku_tmp['is_default_sku'] = 0;
                foreach ($sku_tmp as $tk => $tv) {
                    if (is_numeric(strpos($tk, 'sku_attr'))) {
                
                        //通过值id,去获取一条属性以及属性值的信息
                        $goods_attr_value_columns = ['*'];
                        $goods_attr_value_relatives = [];
                        $goods_attr_value_relatives['GoodsAttr'] = function ($query) {
                    
                        };
                        $goods_attr_value = $this->getSkuAttrValueById($goods_id, $tv, $goods_attr_value_columns, $goods_attr_value_relatives);
                
                        if (is_array($goods_attr_value) && isset($goods_attr_value['err_code'])) {
                            continue;
                        }
                
                        if (empty($goods_attr_value->GoodsAttr) || !isset($goods_attr_value->GoodsAttr->attr_name)) {
                            continue;
                        }
                
                        //现阶段,sku_attr_1为 color 属性,sku_attr_2为 size 属性
                        //if('sku_attr_1' == $tk){
                        $sku_tmp['sku_attr_list'][$tk]['attr_name'] = $goods_attr_value->GoodsAttr->attr_name;
                        $sku_tmp['sku_attr_list'][$tk]['attr_value'] = $goods_attr_value->value_name;
                        //}
                    }
                }
        
                $sku_list_arr[$lv->id] = $sku_tmp;
            }
        }else{
            //获取默认 sku
            $default_sku_info = $this->getSkuByAttr($goods_id,0,0);
            $default_sku_info['is_default_sku'] = 1;
            $sku_list_arr[] = $default_sku_info;
        }
        
        $goods_respone = array();
        $goods_respone['goods_details'] = $goods_details;
        $goods_respone['goods_sku_list'] = $sku_list_arr;
        $goods_respone['goods_images'] = $goods_images_arr;
        
        return $goods_respone;
    }
    
}
