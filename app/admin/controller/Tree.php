<?php

namespace app\admin\controller;

use think\Request;
use app\admin\service\Tree as TreeService;

class Tree
{
    protected $service = null;

    public function __construct(TreeService $service)
    {
        $this->service = $service;
    }

    public function app()
    {
        $list = $this->service->app();
        return json_success($list);
    }

    public function group($parent_id)
    {
        $list = $this->service->app_group($parent_id);
        return json_success($list);
    }

    public function module($parent_id)
    {
        $list = $this->service->app_module($parent_id);
        return json_success($list);
    }

    public function role($parent_id,$status = true,$checked = false,$user_id = null)
    {
        $list = $this->service->role($parent_id,str2bool($status,true),str2bool($checked,false),$user_id);
        return json_success($list);
    }

    public function org($parent_id)
    {
        $list = $this->service->org($parent_id);
        return json_success($list);
    }

    public function access($parent_id)
    {
        $list = [];

        $type = 0;
        $arr = str2arr($parent_id);
        if(count($arr) == 2)
        {
            $parent_id = intval($arr[0]);
            $type = $arr[1];
            $list = $this->service->app_module_access($parent_id,$type);
        }
        else
        {
            $list = $this->service->app_module_access($parent_id);
        }

        return json_success($list);
    }

    public function menu($parent_id)
    {
        $list = [];

        $type = 0;
        $arr = str2arr($parent_id);
        if(count($arr) == 2)
        {
            $parent_id = intval($arr[0]);
            $type = $arr[1];
            $list = $this->service->app_group_menu($parent_id,$type);
        }
        else
        {
            $list = $this->service->app_group_menu($parent_id);
        }

        return json_success($list);
    }
}
