<?php

use App\Models\Manage;
use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(ManagerTableSeeder::class);
        $this->call(RoleTableSeeder::class);

        $admin      = Role::where('name', 'admin')->first();
        $owner      = Role::where('name', 'owner')->first();
        $seller     = Role::where('name', 'seller')->first();
        $shop_staff = Role::where('name', 'shop-staff')->first();

        $staff_perms_name  = ['view-goods', 'create-goods', 'edit-goods', 'del-goods', 'view-order', 'create-order', 'edit-order', 'del-order', 'view-statistics', 'create-statistics', 'edit-statistics', 'del-statistics', 'view-user', 'create-user', 'edit-user', 'del-user'];
        $seller_perms_name = array_merge($staff_perms_name, ['view-shop-staff', 'create-shop-staff', 'edit-shop-staff', 'del-shop-staff']);

        $all_perms        = [];
        $seller_perms     = [];
        $shop_staff_perms = [];
        $perms            = Permission::get();
        foreach ($perms as $val) {
            $all_perms[] = $val['id'];
            if (in_array($val['name'], $seller_perms_name)) {
                $seller_perms[] = $val['id'];
            }
            if (in_array($val['name'], $staff_perms_name)) {
                $shop_staff_perms[] = $val['id'];
            }
        }
        $owner->perms()->sync($all_perms);
        $admin->perms()->sync($all_perms);
        $seller->perms()->sync($seller_perms);
        $shop_staff->perms()->sync($shop_staff_perms);

        $seedlings = Manage::where('user_name', 'seedlings')->first();
        $yuepin    = Manage::where('user_name', 'yuepin')->first();

        $seedlings->attachRole($owner);
        $yuepin->attachRole($admin);
    }
}
