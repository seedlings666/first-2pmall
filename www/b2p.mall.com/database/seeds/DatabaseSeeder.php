<?php

use App\Models\Manage;
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

        $admin = Role::where('name', 'admin')->first();
        $owner = Role::where('name', 'owner')->first();

        $seedlings = Manage::where('user_name', 'seedlings')->first();
        $yuepin    = Manage::where('user_name', 'yuepin')->first();

        $seedlings->attachRole($owner);
        $yuepin->attachRole($admin);
    }
}
