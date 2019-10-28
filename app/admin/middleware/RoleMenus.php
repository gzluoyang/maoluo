<?php

namespace app\admin\middleware;

class RoleMenus
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $role_id = $data['role_id'];

        $response = $next($request);

        cache(role_menus_key($role_id), null);

        return $response;
    }
}
