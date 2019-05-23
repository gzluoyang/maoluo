<?php

return [
    'think\middleware\CheckRequestCache',
    'think\middleware\LoadLangPack',
    'think\middleware\SessionInit',
    'think\middleware\TraceDebug',
    'auth'	=>	app\http\middleware\Auth::class,
];
