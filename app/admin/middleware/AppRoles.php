<?php

namespace app\admin\middleware;

use app\admin\model\App as AppModel;

class AppRoles
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $app_id = $data['app_id'];
        $roles = $data['roles'];

        $model = new AppModel();
        $old = $model->where('id',$app_id)->find();
        $old_roles = $old->roles;

        $response = $next($request);

        foreach($old_roles as $old_role)
        {
            $old_role_id = $old_role['id'];
            cache(role_apps_key($old_role_id), null);
        }
        
        foreach($roles as $role_id)
        {
            cache(role_apps_key($role_id), null);
        }

        return $response;
    }
}
