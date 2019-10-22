<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;
use think\facade\Cache;

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

    public function isLogin()
    {
        if(!session('?user.id'))
        {
            throw new Exception('用户还未登录,或登录超时!');
        }
        return json_success();
    }

    public function test()
    {
        session('test','hai');
        return json_success();
    }

    public function ok()
    {
        $str = session('?test');
        echo $str;
        return json_success(null,$str);
    }

    /**
     * 显示所有可用的应用
     */
    public function apps(Request $request)
    {
        $user_id = session('user.id');
        $key = 'topmenu_' . $user_id;
        $val = cache($key);
        if(empty($val))
        {
            $list = $this->appService->findAllEnabled();
            $val = json_encode($list);
            cache($key, $val, 7200);
            return json($list);
        }
        else
        {
            $list = json_decode($val,true);
            return json($list);
        }
    }

    public function menus($app_id, Request $request)
    {
        $user_id = session('user.id');
        $key = $app_id . '_' . $user_id;
        $val = cache($key);
        if(empty($val))
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
            $val = json_encode($groups);
            cache($key, $val, 7200);
            return json($groups);
        }
        else
        {
            $groups = json_decode($val,true);
            return json($groups);
        }
    }

    public function buttons($menu_key, Request $request)
    {
        $user_id = session('user.id');
        $key = $menu_key . '_' . $user_id;
        $val = cache($key);
        if(empty($val))
        {
            $menu = $this->menuService->findByMenuKey($menu_key);
            $menu_id = $menu['id'];
            $list = $this->buttonService->findByMenuID($menu_id);
            $val = json_encode($list);
            cache($key, $val, 7200);
            return json_success($list);
        }
        else
        {
            $list = json_decode($val,true);
            return json_success($list);
        }
    }

    public function clearCache()
    {
        Cache::clear();
        return json_success();
    }
}
