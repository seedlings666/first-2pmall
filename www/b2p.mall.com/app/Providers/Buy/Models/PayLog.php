<?php

namespace App\Providers\Buy\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class PayLog extends Base
{
    use SoftDeletes;
    public $table = 'zo_pay_log';
}
