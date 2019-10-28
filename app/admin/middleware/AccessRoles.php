<?php

namespace app\admin\middleware;

use app\admin\model\Access as AccessModel;

class AccessRoles
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $id = $data['access_id'];
        $roles = $data['roles'];

        $model = new AccessModel();
        $access = $model->find($id);
        $url = $access['url'];
        $old_roles = $access->roles;

        $response = $next($request);

        foreach($old_roles as $role)
        {
            $old_role_id = $role->id;
            cache(role_access_key($old_role_id,$url), null);
        }

        foreach($roles as $role_id)
        {
            cache(role_access_key($role_id,$url), 1);
        }

        return $response;
    }
}
