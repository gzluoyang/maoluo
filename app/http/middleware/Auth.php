<?php

namespace app\http\middleware;

class Auth
{
    public function handle($request, \Closure $next)
    {
        $uid = session('user.id');
        $path = $request->root() . '/' . $request->path();
        return $next($request);
    }
}
