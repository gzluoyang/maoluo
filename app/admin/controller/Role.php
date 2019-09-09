<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Role as RoleService;

class Role
{
    protected $service = null;

    public function __construct(RoleService $service)
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

    public function users(Request $request)
    {
        $data = json_param();
        $role_id = $data['role_id'];
        $users = $data['users'];

        $this->service->setUsers($role_id,$users);
        return json_success();
    }

    public function accesses(Request $request)
    {
        $data = json_param();
        $role_id = $data['role_id'];
        $accesses = $data['accesses'];

        $this->service->setAccesses($role_id,$accesses);
        return json_success();
    }

    public function menus(Request $request)
    {
        $data = json_param();
        $role_id = $data['role_id'];
        $menus = $data['menus'];

        $this->service->setMenus($role_id,$menus);
        return json_success();
    }

    public function buttons(Request $request)
    {
        $data = json_param();
        $role_id = $data['role_id'];
        $buttons = $data['buttons'];

        $this->service->setButtons($role_id,$buttons);
        return json_success();
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
        $role = $this->service->create($data);
        return json_success($role);
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
        $role = $this->service->update($data);
        return json_success($role);
    }

    public function move($id,$parent_id)
    {
        $role = $this->service->move($id,$parent_id);
        return json_success($role);
    }

    /**
     * 读取指定的菜单
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $role = $this->service->find($id);
        return json_success($role);
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
