<?php

namespace app\admin\middleware;

class AccessCreate
{
    public function handle($request, \Closure $next)
    {
        $response = $next($request);

        $data = json_param();

        $is_auth = $data['is_auth'];
        $url = $data['url'];

        $key = free_url_key($url);
        if(empty($is_auth))
            cache($key,1);

        return $response;
    }
}
