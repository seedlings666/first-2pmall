<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

class PermissionController extends Controller
{
    public function getIndex()
    {
        return view('admin.competence');
    }
}
