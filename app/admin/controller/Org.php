<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Org as OrgService;

class Org
{
    protected $service = null;

    public function __construct(OrgService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示菜单列表
     *
     * @return \think\Response
     */
    public function index($parent_id, $name = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
       $list = $this->service->find($parent_id,$name,$page,$limit,$sort,$dir);
        return json($list);
    }

    /**
     * 保存新建的菜单
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $org = $this->service->create($data);
        return json_success($org);
    }


    /**
     * 保存修改的菜单
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $org = $this->service->update($data);
        return json_success($org);
    }

    public function move($id,$parent_id)
    {
        $org = $this->service->move($id,$parent_id);
        return json_success($org);
    }

    /**
     * 读取指定的菜单
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $org = $this->service->find($id);
        return json_success($org);
    }

    /**
     * 删除指定菜单
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
