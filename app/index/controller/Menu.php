<?php

namespace app\index\controller;

use think\Request;
use think\Exception;
use think\facade\Cache;

use app\admin\service\Menu as MenuService;

class Menu
{
    protected $service = null;

    public function __construct(MenuService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        //
        $id = 1;
        $menu = $this->service->find($id);
        return json_success($menu);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        $handler = Cache::handler();
        dump($handler);
        Cache::set('test','test');
        $test = Cache::get('test');
        echo $test;
        $test = Cache::store('redis')->handler();
        echo Cache::store('redis')->set('test','hai');
        dump($test);
        $value = $test->hget('test','1');
        echo $value;
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
