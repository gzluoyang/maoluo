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

Route::post('role/accesses', 'Role/accesses')->middleware(\app\admin\middleware\RoleAccesses::class);
Route::post('role/users', 'Role/users')->middleware(\app\admin\middleware\RoleUsers::class);
Route::post('role/menus', 'Role/menus')->middleware(\app\admin\middleware\RoleMenus::class);
Route::post('role/buttons', 'Role/buttons')->middleware(\app\admin\middleware\RoleButtons::class);

Route::post('user/roles', 'User/roles')->middleware(\app\admin\middleware\UserRoles::class);

Route::post('app/roles', 'App/roles')->middleware(\app\admin\middleware\AppRoles::class);
Route::post('menu/roles', 'Menu/roles')->middleware(\app\admin\middleware\MenuRoles::class);
Route::post('button/roles', 'Button/roles')->middleware(\app\admin\middleware\ButtonRoles::class);

Route::post('home/clearCache', 'home/clearCache')->middleware(\app\admin\middleware\CheckAdmin::class);
