<?php

use Illuminate\Database\Seeder;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $roles = [
            [
                'name'         => 'owner',
                'display_name' => 'Project Owner',
                'description'  => 'User is the owner of a given project',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'name'         => 'admin',
                'display_name' => 'User Administrator',
                'description'  => 'User is allowed to manage and edit other users',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'name'         => 'seller',
                'display_name' => 'User Seller',
                'description'  => '卖家拥有商品管理 编辑 查看等权限',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'name'         => 'shop-staff',
                'display_name' => 'User Shop staff',
                'description'  => '卖家店铺的职员',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
        ];
        DB::table('zo_roles')->insert($roles);

        $permissions = [
            //商品管理权限
            [
                'name'         => 'view-goods',
                'display_name' => '查看商品',
                'description'  => '查看商品权限,查看商品列表和商品信息',
            ],
            [
                'name'         => 'create-goods',
                'display_name' => '创建商品',
                'description'  => '创建商品权限,创建一个新的商品数据',
            ],
            [
                'name'         => 'edit-goods',
                'display_name' => '编辑商品',
                'description'  => '编辑商品权限,编辑一个商品数据',
            ],
            [
                'name'         => 'del-goods',
                'display_name' => '删除商品',
                'description'  => '删除商品权限,删除一个商品数据',
            ],
            //订单管理权限
            [
                'name'         => 'view-order',
                'display_name' => '查看订单',
                'description'  => '查看订单权限,查看订单列表和订单信息',
            ],
            [
                'name'         => 'create-order',
                'display_name' => '创建订单',
                'description'  => '创建订单权限,创建一个新的订单数据',
            ],
            [
                'name'         => 'edit-order',
                'display_name' => '编辑订单',
                'description'  => '编辑订单权限,编辑一个订单数据',
            ],
            [
                'name'         => 'del-order',
                'display_name' => '删除订单',
                'description'  => '删除订单权限,删除一个订单数据',
            ],
            //统计管理
            [
                'name'         => 'view-statistics',
                'display_name' => '查看统计',
                'description'  => '查看统计权限,查看统计列表和统计信息',
            ],
            [
                'name'         => 'create-statistics',
                'display_name' => '创建统计',
                'description'  => '创建统计权限,创建一个新的统计数据',
            ],
            [
                'name'         => 'edit-statistics',
                'display_name' => '编辑统计',
                'description'  => '编辑统计权限,编辑一个统计数据',
            ],
            [
                'name'         => 'del-statistics',
                'display_name' => '删除统计',
                'description'  => '删除统计权限,删除一个统计数据',
            ],
            //店铺管理
            [
                'name'         => 'view-shop',
                'display_name' => '查看店铺',
                'description'  => '查看店铺权限,查看店铺列表和店铺信息',
            ],
            [
                'name'         => 'create-shop',
                'display_name' => '创建店铺',
                'description'  => '创建店铺权限,创建一个新的店铺数据',
            ],
            [
                'name'         => 'edit-shop',
                'display_name' => '编辑店铺',
                'description'  => '编辑店铺权限,编辑一个店铺数据',
            ],
            [
                'name'         => 'del-shop',
                'display_name' => '删除店铺',
                'description'  => '删除店铺权限,删除一个店铺数据',
            ],
            //店员管理
            [
                'name'         => 'view-shop-staff',
                'display_name' => '查看店员',
                'description'  => '查看店员权限,查看店员列表和店员信息',
            ],
            [
                'name'         => 'create-shop-staff',
                'display_name' => '创建店员',
                'description'  => '创建店员权限,创建一个新的店员数据',
            ],
            [
                'name'         => 'edit-shop-staff',
                'display_name' => '编辑店员',
                'description'  => '编辑店员权限,编辑一个店员数据',
            ],
            [
                'name'         => 'del-shop-staff',
                'display_name' => '删除店员',
                'description'  => '删除店员权限,删除一个店员数据',
            ],
            //(前台会员)用户管理
            [
                'name'         => 'view-user',
                'display_name' => '查看前台',
                'description'  => '查看前台权限,查看前台列表和前台信息',
            ],
            [
                'name'         => 'create-user',
                'display_name' => '创建前台',
                'description'  => '创建前台权限,创建一个新的前台数据',
            ],
            [
                'name'         => 'edit-user',
                'display_name' => '编辑前台',
                'description'  => '编辑前台权限,编辑一个前台数据',
            ],
            [
                'name'         => 'del-user',
                'display_name' => '删除前台',
                'description'  => '删除前台权限,删除一个前台数据',
            ],
            //权限管理
            [
                'name'         => 'view-permission',
                'display_name' => '查看权限',
                'description'  => '查看权限,查看权限列表和权限信息',
            ],
            [
                'name'         => 'create-permission',
                'display_name' => '创建权限',
                'description'  => '创建权限,创建一个新的权限数据',
            ],
            [
                'name'         => 'edit-permission',
                'display_name' => '编辑权限',
                'description'  => '编辑权限,编辑一个权限数据',
            ],
            [
                'name'         => 'del-permission',
                'display_name' => '删除权限',
                'description'  => '删除权限,删除一个权限数据',
            ],
        ];
        foreach ($permissions as &$val) {
            $val['created_at'] = date('Y-m-d H:i:s');
        }
        DB::table('zo_permissions')->insert($permissions);
    }
}
