<?php

namespace App;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GoodsSku extends Model
{
    //使用软删除
    use SoftDeletes;
    
    //设置表名
    public $table = 'zo_goods_sku';
    
    
    /**
     * 关联到商品属性表
     * @author  jianwei
     */
    public function GoodsAttrColorValue()
    {
        return $this->hasOne(__NAMESPACE__.'\GoodsAttrValue','id','sku_attr_1');
    }
    
    /**
     * 关联到商品属性表
     * @author  jianwei
     */
    public function GoodsAttrSizeValue()
    {
        return $this->hasOne(__NAMESPACE__.'\GoodsAttrValue','id','sku_attr_2');
    }
    
}
