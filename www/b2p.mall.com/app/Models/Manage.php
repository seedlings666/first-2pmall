<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class Manage extends Authenticatable
{
    use EntrustUserTrait;
    public $table = 'zo_manage';
}
