<?php

namespace App;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GoodsAttrValue extends Model
{
    //使用软删除
    use SoftDeletes;
    
    //设置表名
    public $table = 'goods_attr_value';
    
    
    /**
     * 关联到属性表
     * @author  jianwei
     */
    public function GoodsAttr()
    {
        return $this->hasOne(__NAMESPACE__.'\GoodsAttr','id','attr_id');
    }
}
