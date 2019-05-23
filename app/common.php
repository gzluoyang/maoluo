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

