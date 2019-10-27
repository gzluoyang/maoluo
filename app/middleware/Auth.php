<?php

namespace app\middleware;

class Auth
{
    public function handle($request, \Closure $next)
    {
        $uid = session('user.id');
        $path = $request->root() . '/' . $request->pathinfo();
        return $next($request);
    }
}
