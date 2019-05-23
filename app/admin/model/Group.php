<?php

namespace app\admin\model;

use think\Model;

class Group extends Model
{
    //
    public function app()
    {
        return $this->belongsTo('App');
    }

    public function menus()
    {
        return $this->hasMany('Menu');
    }
}
