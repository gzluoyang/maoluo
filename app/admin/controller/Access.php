<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Access as AccessService;

class Access
{
    protected $service = null;

    public function __construct(AccessService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示访问列表
     *
     * @return \think\Response
     */
    public function index($module_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        if(empty($module_id)) {
            throw new Exception('请选择对应的模块!');
        }

       $list = $this->service->find($module_id,$title,$page,$limit,$sort,$dir);
        return json($list);
    }

    public function roles(Request $request)
    {
        $data = json_param();
        $access_id = $data['access_id'];
        $roles = $data['roles'];

        $this->service->setRoles($access_id,$roles);
        return json_success();
    }

    /**
     * 保存新建的访问
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $access = $this->service->create($data);
        return json_success($access);
    }


    /**
     * 保存修改的访问
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $access = $this->service->update($data);
        return json_success($access);
    }

    public function move($id,$module_id)
    {
        $access = $this->service->move($id,$module_id);
        return json_success($access);
    }

    public function sort($id,$tab_index,$dir = 'desc')
    {
        $this->service->sort($id,$tab_index,$dir);
        return json_success();
    }

    /**
     * 读取指定的访问
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $access = $this->service->find($id);
        return json_success($access);
    }

    /**
     * 删除指定访问
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
