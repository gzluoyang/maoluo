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
}
