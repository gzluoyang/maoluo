<?php

namespace app\admin\middleware;

use think\Exception;

class CheckAdmin
{
    public function handle($request, \Closure $next)
    {
        $user_id = session('user_id');
        if(!$user_id)
            throw new Exception('用户还未登录,或登录超时!');

        $username = cache(user_name_key($user_id));

        if($username != 'admin')
            throw new Exception('只有系统管理员有权限操作!');

        return $next($request);
    }
}
