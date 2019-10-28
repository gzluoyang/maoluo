<?php

namespace app\admin\middleware;

use app\admin\model\Button as ButtonModel;

class ButtonRoles
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $button_id = $data['button_id'];
        $roles = $data['roles'];

        $model = new ButtonModel();
        $old = $model->where('id',$button_id)->find();
        $old_roles = $old->roles;

        $response = $next($request);

        foreach($old_roles as $old_role)
        {
            $old_role_id = $old_role['id'];
            cache(role_buttons_key($old_role_id), null);
        }

        foreach($roles as $role_id)
        {
            cache(role_buttons_key($role_id), null);
        }

        return $response;
    }
}
