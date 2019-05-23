<?php

namespace app\admin\model;

use think\Model;

class Module extends Model
{
    public function app()
    {
        return $this->belongsTo('App');
    }

    public function accesses()
    {
        return $this->hasMany('Access');
    }
}
