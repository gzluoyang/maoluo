<?php

namespace app\admin\model;

use think\Model;

class Button extends Model
{
    protected $schema = [
        'id'          => 'int',
        'menu_id'     => 'int',
        'title'       => 'string',
        'keyword'     => 'string',
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
    public function menu()
    {
        return $this->belongTo('Menu');
    }

    public function roles()
    {
        return $this->belongsToMany('Role');
    }
}
