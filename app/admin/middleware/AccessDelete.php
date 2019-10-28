<?php

namespace app\admin\middleware;

use app\admin\model\Access as AccessModel;

class AccessDelete
{
    public function handle($request, \Closure $next)
    {
        $id = input('id');
        $model = new AccessModel();
        $old = $model->find($id);
        $url = $old['url'];
        $roles = $old->roles;

        $response = $next($request);

        cache(free_url_key($url),null);
        foreach($roles as $role)
        {
            $role_id = $role->id;
            cache(role_access_key($role_id,$url), null);
        }

        return $response;
    }
}
