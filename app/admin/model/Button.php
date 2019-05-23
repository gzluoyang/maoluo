<?php

namespace app\admin\model;

use think\Model;

class Button extends Model
{
    //
    public function menu()
    {
        return $this->belongTo('Menu');
    }
}
