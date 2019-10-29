<?php

namespace app\admin\controller;

use think\Request;
use think\Exception;
use think\facade\Cache;
use think\facade\View;

use app\admin\service\App as AppService;
use app\admin\service\Group as groupService;
use app\admin\service\Menu as MenuService;
use app\admin\service\Button as ButtonService;
use app\admin\service\CacheService;

class Home
{
    protected $appSerivce = null;
    protected $groupService = null;
    protected $menuService = null;
    protected $buttonService = null;
    protected $cacheService = null;

    public function __construct(AppService $appService, GroupService $groupService, MenuService $menuService, ButtonService $buttonService, CacheService $cacheService)
    {
        $this->appService = $appService;
        $this->groupService = $groupService;
        $this->menuService = $menuService;
        $this->buttonService = $buttonService;
        $this->cacheService = $cacheService;
    }

    public function isLogin()
    {
        if(!session('?user_id'))
        {
            throw new Exception('用户还未登录,或登录超时!');
        }
        return json_success();
    }

    public function isAdmin()
    {
        $user_id = session('user_id');
        if(!$user_id)
            throw new Exception('用户还未登录,或登录超时!');
        $username = cache(user_name_key($user_id));

        $data = ['isAdmin' => false];
        if($username == 'admin')
            $data['isAdmin'] = true;
        return json_success($data);
    }


    /**
     * 显示所有可用的应用
     */
    public function apps(Request $request)
    {
        $user_id = session('user_id');
        $list = $this->cacheService->getAppsByUserID($user_id);

        return json($list);
    }

    public function menus($app_id, Request $request)
    {
        $user_id = session('user_id');
        $list = $this->cacheService->getMenusByUserID($user_id, $app_id);

        return json($list);
    }

    public function buttons($menu_key, Request $request)
    {
        $user_id = session('user_id');

        $key = menu_key($menu_key);
        $menu_id = Cache::remember($key, function() use($menu_key) {
            $menu = $this->menuService->findByMenuKey($menu_key);
            return $menu['id'];
        });

        $list = $this->cacheService->getButtonsByUserID($user_id, $menu_id);
        return json_success($list);
    }

    public function clearCache()
    {
        Cache::clear();
        session('user_id',null);
        return json_success();
    }
}
