<?php

namespace App;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Goods extends Model
{
    //使用软删除
    use SoftDeletes;
    
    //设置表名
    public $table = 'goods';
    
    /************************************自动封装*****************************/
    /**
     * 是否sku
     * @return string
     */
    public function getIsSkuStrAttribute(){
        $is_sku_str = '';
        if($this->is_sku == 1){
            $is_sku_str = '是';
        }else{
            $is_sku_str = '否';
        }
        
        return $is_sku_str;
    }
    
    /**
     * 上下架
     * @author  jianwei
     */
    public function getIsOnSaleStrAttribute()
    {
        return $this->is_on_sale == 1 ? '上架' : '下架';
    }
    
    /************************************自动封装*****************************/
    
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
