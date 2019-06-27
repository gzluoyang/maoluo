<?php

namespace app\admin\model;

use think\Model;

class Group extends Model
{
    protected $schema = [
        'id'          => 'int',
        'app_id'      => 'int',
        'title'       => 'string',
        'icon'        => 'string',
        'icon_cls'    => 'string',
        'tab_index'   => 'int',
        'status'      => 'int',
        'memo'        => 'string',
        'create_time' => 'int',
        'update_time' => 'int',
    ];

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
