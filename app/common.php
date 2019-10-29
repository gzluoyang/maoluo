<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 字符串转换为数组，主要用于把分隔符调整到第二个参数
 * @param  string $str  要分割的字符串
 * @param  string $glue 分割符
 * @return array
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function str2arr($str, $glue = ','){
    return explode($glue, $str);
}

/**
 * 数组转换为字符串，主要用于把分隔符调整到第二个参数
 * @param  array  $arr  要连接的数组
 * @param  string $glue 分割符
 * @return string
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function arr2str($arr, $glue = ','){
    return implode($glue, $arr);
}

/**
 * success return by json format.
 */

function json_param()
{
    $data = file_get_contents("php://input");
    $data = json_decode($data,true);
    unset($data['__webviewId__']);

    return $data;
}


function json_success($data = null,$message = null)
{
    return json(array('success' => true, 'data' => $data, 'message' => $message));
}

function str2bool($val,$default)
{
    if(is_bool($val))
        return $val;

    if(is_string($val))
    {
        if($val === 'true')
            return true;
        else if($val === 'false')
            return false;
        else
            return $default;
    }

    return $default;
}

function tag($user_id)
{
    return 'user:' . $user_id;
}

function user_name_key($user_id)
{
    $tag = tag($user_id);
    return $tag . '_name';
}

function user_apps_key($user_id)
{
    $tag = tag($user_id);
    return $tag . '_apps';
}

function user_roles_key($user_id)
{
    $tag = tag($user_id);
    return $tag . '_roles';
}

function all_apps_key()
{
    return 'apps';
}

function role_apps_key($role_id)
{
    return 'role:' . $role_id . '_apps';
}

function user_menus_key($user_id, $app_id)
{
    $tag = tag($user_id);
    return $tag . '_app:' . $app_id . '_menus';
}

function all_groups_key($app_id)
{
    return 'app:' . $app_id . '_groups';
}

function all_submenus_key($group_id)
{
    return 'group:' . $group_id . '_menus';
}

function menu_key($menu_key)
{
    return 'menu_key:' . $menu_key;
}

function user_buttons_key($user_id, $menu_id)
{
    $tag = tag($user_id);
    return $tag . '_menu:' . $menu_id . '_buttons';
}

function role_menus_key($role_id)
{
    return 'role:' . $role_id . '_menus';
}

function all_buttons_key($menu_id)
{
    return 'menu:' . $menu_id . '_buttons';
}

function role_buttons_key($role_id)
{
    return 'role:' . $role_id . '_buttons';
}

function role_access_key($role_id, $url)
{
    return 'role:' . $role_id . '_access:' . $url;
}

function free_url_key($url)
{
    return 'free_url:' . $url;
}

function access_url_key($access_id)
{
    return 'access:' . $access_id . '_url';
}

