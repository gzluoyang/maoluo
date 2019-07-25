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

    public function role($parent_id,$user_id = null,$access_id = null,$menu_id = null,$button_id = null,$status = true,$checked = false)
    {
        $list = $this->service->role($parent_id,$user_id,$access_id,$menu_id,$button_id,str2bool($status,true),str2bool($checked,false));
        return json_success($list);
    }

    public function org($parent_id)
    {
        $list = $this->service->org($parent_id);
        return json_success($list);
    }

    public function user($parent_id,$role_id = null,$status = false,$checked = true)
    {
        if(empty($role_id))
            return json_success([]);

        $list = $this->service->user($parent_id,$role_id,str2bool($status,false),str2bool($checked,true));
        return json_success($list);
    }

    public function access($parent_id,$role_id = null,$status = false,$checked = true)
    {
        if(empty($role_id))
            return json_success([]);

        $arr = str2arr($parent_id);
        $parent_id = intval($arr[0]);
        $type = null;
        if(count($arr) == 2)
            $type = $arr[1];
        
        $list = $this->service->app_module_access($parent_id,$role_id,$type,str2bool($status,false),str2bool($checked,true));

        return json_success($list);
    }

    public function menu($parent_id,$role_id = null,$status = false,$checked = false)
    {
        $arr = str2arr($parent_id);
        $parent_id = intval($arr[0]);
        $type = null;
        if(count($arr) == 2)
            $type = $arr[1];
        
        $list = $this->service->app_group_menu($parent_id,$role_id,$type,str2bool($status,false),str2bool($checked,true));

        return json_success($list);
    }

    public function button($parent_id,$role_id = null,$status = false,$checked = true)
    {
        $arr = str2arr($parent_id);
        $parent_id = intval($arr[0]);
        $type = null;
        if(count($arr) == 2)
            $type = $arr[1];
        
        $list = $this->service->app_group_menu_button($parent_id,$role_id,$type,str2bool($status,false),str2bool($checked,true));

        return json_success($list);
    }

}
