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

    public function menu($parent_id)
    {
        $list = [];

        $type = 0;
        $arr = explode(',',$parent_id);
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
