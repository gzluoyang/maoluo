<?php

namespace app\admin\model;

use think\Model;

class Menu extends Model
{
    protected $schema = [
        'id'          => 'int',
        'group_id'    => 'int',
        'title'       => 'string',
        'url'         => 'string',
        'icon'        => 'string',
        'icon_cls'    => 'string',
        'tab_index'   => 'int',
        'status'      => 'int',
        'memo'        => 'string',
        'create_time' => 'int',
        'update_time' => 'int',
    ];

    //
    public function group()
    {
        return $this->belongTo('Group');
    }

    public function buttons()
    {
        return $this->hasMany('Button');
    }

    public function roles()
    {
        return $this->belongsToMany('Role');
    }

}
