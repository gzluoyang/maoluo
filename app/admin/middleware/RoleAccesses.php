<?php

namespace app\admin\middleware;

use app\admin\service\CacheService;
use app\admin\model\Role as RoleModel;

class RoleAccesses
{
    public function handle($request, \Closure $next)
    {
        $data = json_param();
        $id = $data['role_id'];
        $accesses = $data['accesses'];

        $model = new RoleModel();
        $role = $model->find($id);
        $role_id = $role['id'];
        $old_accesses = $role->accesses;

        $response = $next($request);

        foreach($old_accesses as $access)
        {
            $old_url = $access->url;
            cache(role_access_key($role_id,$old_url), null);
        }

        $cacheService = new CacheService();
        foreach($accesses as $access_id)
        {
            $url = $cacheService->getUrlByAccessID($access_id);
            cache(role_access_key($role_id,$url), 1);
        }

        return $response;
    }
}
