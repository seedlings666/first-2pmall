<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class PaySn extends Base
{
    use SoftDeletes;
    public $table = 'zo_pay_sn';
}
