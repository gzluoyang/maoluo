<?php

namespace app\admin\model;

use think\Model;

class Role extends Model
{
    protected $schema = [
        'id'          => 'int',
        'name'        => 'string',
        'parent_id'   => 'int',
        'tab_index'   => 'int',
        'status'      => 'int',
        'memo'        => 'string',
        'create_time' => 'int',
        'update_time' => 'int',
    ];

    public function users()
    {
        return $this->belongsToMany('User','user_role');
    }

    public function accesses()
    {
        return $this->belongsToMany('Access','access_role');
    }

    public function apps()
    {
        return $this->belongsToMany('App','app_role');
    }

    public function menus()
    {
        return $this->belongsToMany('Menu','menu_role');
    }

    public function buttons()
    {
        return $this->belongsToMany('Button','button_role');
    }

}
