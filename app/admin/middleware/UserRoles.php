<?php

namespace app\admin\middleware;

class UserRoles
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $user_id = $data['user_id'];

        $response = $next($request);

        cache(user_roles_key($user_id), null);

        return $response;
    }
}
