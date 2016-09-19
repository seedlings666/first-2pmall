<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class Manage extends Model
{
    use EntrustUserTrait;
    public $table = 'zo_manage';
}
