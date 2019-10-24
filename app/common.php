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

