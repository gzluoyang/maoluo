<?php

namespace app\admin\middleware;

use app\admin\service\CacheService;
use app\admin\model\Role as RoleModel;

class RoleUsers
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $users = $data['role_id'];

        $response = $next($request);

        foreach($users as $user_id)
        {
            cache(user_roles_key($user_id), null);
        }

        return $response;
    }
}
