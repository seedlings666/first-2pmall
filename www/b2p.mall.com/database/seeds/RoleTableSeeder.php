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

        $data = [
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
        ];
        DB::table('zo_roles')->insert($data);
    }
}
