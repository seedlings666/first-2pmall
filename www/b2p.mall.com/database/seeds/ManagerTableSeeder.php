<?php

use Illuminate\Database\Seeder;

class ManagerTableSeeder extends Seeder
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
                'work_number'  => '',
                'user_name'    => 'seedlings',
                'password'     => substr(md5('seedlings@pwd.login'), 0, -2),
                'nick_name'    => 'SeedLings-ZO',
                'mobile_phone' => '',
                'role_id'      => '0',
                'status'       => '1',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'work_number'  => '',
                'user_name'    => 'yuepin',
                'password'     => substr(md5('yuepin@pwd.login'), 0, -2),
                'nick_name'    => 'Yuepin-Mall',
                'mobile_phone' => '',
                'role_id'      => '0',
                'status'       => '1',
                'created_at'   => date('Y-m-d H:i:s'),
            ],
        ];
        DB::table('zo_manage')->insert($data);
    }
}
