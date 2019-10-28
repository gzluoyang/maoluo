<?php

namespace app\middleware;

use think\facade\Cache;
use think\facade\Db;
use think\Exception;

use app\admin\service\CacheService;

class Auth
{
    public function handle($request, \Closure $next)
    {
        $path = $request->root() . '/' . $request->pathinfo();
        if($path == '/admin/user/login' || '/admin/user/logout' || '/admin/home/isLogin')
            return $next($request);

        $key = free_url_key($path);
        if(cache($key) == 1)
            return $next($request);

        $uid = session('user_id');
        if(empty($uid))
        {
            throw new Exception('会话超时,请登录!');
        }

        if($uid == 'admin')
            return $next($request);

        $cacheService = new CacheService();
        $roles = $cacheService->getRoleIDsByUserID($uid);
        if(empty($roles))
            throw new Exception('没有访问权限!');

        foreach($roles as $role_id)
        {
            $key = role_access_key($role_id,$path);
            if(cache($key) == 1)
                return $next($request);
        }

        throw new Exception('没有访问权限!');
    }
}
