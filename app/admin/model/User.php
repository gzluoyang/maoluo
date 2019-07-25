<?php

namespace app\admin\model;

use think\Model;
use think\Exception;

class User extends Model
{
    protected $schema = [
        'id'          => 'int',
        'username'    => 'string',
        'password'    => 'string',
        'org_id'      => 'int',
        'login_count' => 'int',
        'status'      => 'int',
        'memo'        => 'string',
        'last_login_ip'    => 'int',
        'last_login_time'  => 'int',
        'reg_ip'           => 'int',
        'reg_time'         => 'int'
    ];


    //个人配置
    public function profile()
    {
        return $this->hasOne('Profile');
    }

    //
    public function org()
    {
        return $this->belongsTo('Org');
    }

    //角色
    public function roles()
    {
        return $this->belongsToMany('Role');
    }

    public function login($username,$password)
    {
        $user = $this->where('username',$username)->findOrEmpty();

        if($user->isEmpty()) {
            throw new Exception('用户名或密码错误!');
        }

        if($user->password != md5($password)) {
            throw new Exception('用户名或密码错误!');
        }

        return true;
    }
}
