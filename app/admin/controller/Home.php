<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;

use app\admin\service\App as AppService;
use app\admin\service\Group as groupService;
use app\admin\service\Menu as MenuService;
use app\admin\service\Button as ButtonService;

class Home
{
    protected $appSerivce = null;
    protected $groupService = null;
    protected $menuService = null;
    protected $buttonService = null;

    public function __construct(AppService $appService, GroupService $groupService, MenuService $menuService, ButtonService $buttonService)
    {
        $this->appService = $appService;
        $this->groupService = $groupService;
        $this->menuService = $menuService;
        $this->buttonService = $buttonService;
    }

    /**
     * 显示所有可用的应用
     */
    public function apps(Request $request)
    {
        $list = $this->appService->findAllEnabled();
        return json($list);
    }

    public function menus($app_id, Request $request)
    {
        $groups = $this->groupService->findAllEnabledByAppID($app_id);
        if(!empty($groups) && sizeof($groups) > 0)
        {
            foreach($groups as &$group)
            {
                $group_id = $group['id'];
                $menus = $this->menuService->findAllEnabledByGroupID($group_id);
                if(!empty($menus) && sizeof($menus) > 0)
                {
                    $group['children'] = $menus;
                }
            }
        }
        return json($groups);
    }

    public function buttons($menu_key, Request $request)
    {
        $menu = $this->menuService->findByMenuKey($menu_key);
        $menu_id = $menu['id'];
        $list = $this->buttonService->findByMenuID($menu_id);
        return json_success($list);
    }
}
