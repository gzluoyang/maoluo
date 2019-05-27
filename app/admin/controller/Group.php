<?php

namespace app\admin\controller;

use think\Request;
use app\admin\service\Group as GroupService;
class Group
{
    protected $service = null;

    public function __construct(GroupService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $list = $this->service->find($title,$page,$limit,$sort,$dir);
        return json($list);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $app = $this->service->create($data);
        return json_success($app);
    }


    /**
     * 保存修改的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $app = $this->service->update($data);
        return json_success($app);
    }

    /**
     * 读取指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $app = $this->service->find($id);
        return json_success($app);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $this->service->delete($id);
        return json_success();
    }

}
