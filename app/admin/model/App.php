<?php

namespace app\admin\model;

use think\Model;

class App extends Model
{
    protected $schema = [
        'id'          => 'int',
        'title'       => 'string',
        'home'        => 'string',
        'icon'        => 'string',
        'icon_cls'    => 'string',
        'tab_index'   => 'int',
        'status'      => 'int',
        'memo'        => 'string',
        'create_time' => 'int',
        'update_time' => 'int',
    ];

    //
    public function modules()
    {
        return $this->hasMany('Module');
    }

    public function groups()
    {
        return $this->hasMany('Group');
    }

    public function roles()
    {
        return $this->belongsToMany('Role');
    }
}
