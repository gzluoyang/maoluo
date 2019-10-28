<?php

namespace app\admin\middleware;

class RoleButtons
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $role_id = $data['role_id'];

        $response = $next($request);

        cache(role_buttons_key($role_id), null);

        return $response;
    }
}
