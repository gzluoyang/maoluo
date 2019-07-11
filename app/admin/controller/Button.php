<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\Button as ButtonService;

class Button
{
    protected $service = null;

    public function __construct(ButtonService $service)
    {
        $this->service = $service;
    }

    /**
     * 显示按钮列表
     *
     * @return \think\Response
     */
    public function index($menu_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        if(empty($menu_id)) {
            throw new Exception('请选择对应的分组!');
        }

       $list = $this->service->find($menu_id,$title,$page,$limit,$sort,$dir);
        return json($list);
    }

    /**
     * 保存新建的按钮
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $button = $this->service->create($data);
        return json_success($button);
    }


    /**
     * 保存修改的按钮
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $button = $this->service->update($data);
        return json_success($button);
    }

    /**
     * 读取指定的按钮
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $button = $this->service->find($id);
        return json_success($button);
    }

    /**
     * 删除指定按钮
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
