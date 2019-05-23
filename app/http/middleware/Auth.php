<?php

namespace app\http\middleware;

class Auth
{
    public function handle($request, \Closure $next, $key)
    {
        //echo $key;
        return $next($request);
    }
}
