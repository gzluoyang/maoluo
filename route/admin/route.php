<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

Route::get('think', function () {
    return 'hello,ThinkPHP6!';
});

Route::post('access/create', 'Access/create')->middleware(\app\admin\middleware\AccessCreate::class);
Route::post('access/update', 'Access/update')->middleware(\app\admin\middleware\AccessUpdate::class);
Route::post('access/delete', 'Access/delete')->middleware(\app\admin\middleware\AccessDelete::class);
Route::post('access/roles', 'Access/roles')->middleware(\app\admin\middleware\AccessRoles::class);
