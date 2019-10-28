<?php

namespace app\admin\middleware;

use app\admin\model\Access as AccessModel;

class AccessUpdate
{
    public function handle($request, \Closure $next)
    {
        $model = new AccessModel();

        $data = json_param();
        $id = $data['id'];
        $old = $model->find($id);
        $roles = $old->roles;

        $response = $next($request);

        $is_auth = $data['is_auth'];
        $url = $data['url'];

        if($url != $old['url'])
        {
            cache(free_url_key($old['url']),null);
            foreach($roles as $role)
            {
                $role_id = $role->id;
                cache(role_access_key($role_id,$old->url),null);
            }
        }

        $key = free_url_key($url);
        if(empty($is_auth))
        {
            cache(free_url_key($url),1);
            foreach($roles as $role)
            {
                $role_id = $role->id;
                cache(role_access_key($role_id,$url), null);
            }
       }
        else
        {
            cache(free_url_key($url),null);
            foreach($roles as $role)
            {
                $role_id = $role->id;
                cache(role_access_key($role_id,$url), 1);
            }
        }

        return $response;
    }
}
