<?php

namespace app\admin\model;

use think\Model;

class Access extends Model
{
    //
    public function module()
    {
        return $this->belongTo('Module');
    }

    public function roles()
    {
        return $this->belongsToMany('Role');
    }
}
