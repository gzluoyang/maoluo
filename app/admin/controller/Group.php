<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Group as GroupService;

class Group
{
    protected $service = null;

    public function __construct(GroupService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示分组列表
     *
     * @return \think\Response
     */
    public function index($app_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        if(empty($app_id)) {
            throw new Exception('请选择对应的应用!');
        }

       $list = $this->service->find($app_id,$title,$page,$limit,$sort,$dir);
        return json($list);
    }

    /**
     * 保存新建的分组
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $group = $this->service->create($data);
        return json_success($group);
    }


    /**
     * 保存修改的分组
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $group = $this->service->update($data);
        return json_success($group);
    }

    public function move($id,$app_id)
    {
        $group = $this->service->move($id,$app_id);
        return json_success($group);
    }

    /**
     * 读取指定的分组
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $group = $this->service->find($id);
        return json_success($group);
    }

    /**
     * 删除指定分组
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
