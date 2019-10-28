<?php

namespace app\admin\middleware;

use app\admin\model\Menu as MenuModel;

class MenuRoles
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $menu_id = $data['menu_id'];
        $roles = $data['roles'];

        $model = new MenuModel();
        $old = $model->where('id',$menu_id)->find();
        $old_roles = $old->roles;

        $response = $next($request);

        foreach($old_roles as $old_role)
        {
            $old_role_id = $old_role['id'];
            cache(role_menus_key($old_role_id), null);
        }

        foreach($roles as $role_id)
        {
            cache(role_menus_key($role_id), null);
        }

        return $response;
    }
}
