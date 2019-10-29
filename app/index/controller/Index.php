<?php
namespace app\index\controller;

use think\Request;
use think\Exception;
use think\facade\Cache;
use think\facade\View;

class Index
{
    public function index()
    {
        return '您好！这是一个[index]示例应用';
    }

    public function test($code = '123456',Request $request)
    {
        $str = file_get_contents("php://input");
        cache('test',$str);
        return json_success(null,'ok');
    }

    public function go2(Request $request)
    {
        $str = cache('test');
        $data = json_decode(urldecode($str),true);
        return view('index',$data);
        //$content = '<img src="{$image}"/>';
        //return json_success($data);
        //return View::display($content, $data);
    }

    public function clearCache()
    {
        Cache::clear();
        return json_success();
    }

}
