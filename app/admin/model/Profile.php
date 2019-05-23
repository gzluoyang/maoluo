<?php

namespace app\admin\model;

use think\Model;

class Profile extends Model
{
    //
    public function user()
    {
        return $this->hasOne('User');
    }
}
