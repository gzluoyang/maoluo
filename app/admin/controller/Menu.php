<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Menu as MenuService;

class Menu
{
    protected $service = null;

    public function __construct(MenuService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示菜单列表
     *
     * @return \think\Response
     */
    public function index($group_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        if(empty($group_id)) {
            throw new Exception('请选择对应的分组!');
        }

       $list = $this->service->find($group_id,$title,$page,$limit,$sort,$dir);
        return json($list);
    }

    public function roles(Request $request)
    {
        $data = json_param();
        $menu_id = $data['menu_id'];
        $roles = $data['roles'];

        $this->service->setRoles($menu_id,$roles);
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
        $menu = $this->service->create($data);
        return json_success($menu);
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
        $menu = $this->service->update($data);
        return json_success($menu);
    }

    public function move($id,$group_id)
    {
        $group = $this->service->move($id,$group_id);
        return json_success($group);
    }

    /**
     * 读取指定的菜单
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $menu = $this->service->find($id);
        return json_success($menu);
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
