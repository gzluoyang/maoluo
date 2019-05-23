<?php

namespace app\admin\model;

use think\Model;

class Menu extends Model
{
    //
    public function group()
    {
        return $this->belongTo('Group');
    }

    public function buttons()
    {
        return $this->hasMany('Button');
    }
}
