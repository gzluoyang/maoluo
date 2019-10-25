<?php

namespace app\admin\service;

use think\facade\Cache;
use think\facade\Db;
use think\Exception;

class CacheService
{
    public function getRoleIDsByUserID($user_id)
    {
        $tag = tag($user_id);
        $key = user_roles_key($user_id);
        $list = Cache::tag($tag)->remember($key,function() use($user_id) {
            return $this->findRoleIDsByUserID($user_id);
        });

        return $list;
    }

    public function findRoleIDsByUserID($user_id)
    {
        $where = array(
            'user_id' => $user_id
        );
        return Db::name('user_role')->distinct(true)->where($where)->column('role_id');
    }

    public function getAppsByUserID($user_id)
    {
        $tag = tag($user_id);
        $key = user_apps_key($user_id);
        $list = Cache::tag($tag)->remember($key,function() use($user_id) {
            $roleIDs = $this->getRoleIDsByUserID($user_id);
            $arr = [];
            foreach($roleIDs as $role_id)
            {
                $appIDs = $this->getAppIDsByRoleID($role_id);
                foreach($appIDs as $app_id)
                {
                    $arr[] = $app_id;
                }
            }
            $arr = array_unique($arr);

            $list = $this->getAllApps();
            $apps = null;
            foreach($list as $item)
            {
                if(in_array($item['value'],$arr))
                {
                    if(empty($apps))
                        $apps = [];
                    $apps[] = $item;
                }
            }
            
            return $apps;
        });

        return $list;
    }

    protected function getAllApps()
    {
        $key = all_apps_key();
        $list = Cache::remember($key, function() {
            $list = $this->findAllApps();
            return $list;
        });

        return $list;
    }

    protected function findAllApps()
    {
        $where = array(
            'status' => 1
        );
        $field = 'id as value,title as tooltip,home,icon,icon_cls as iconCls,tab_index as tabIndex,memo as tip';
        return Db::name('app')->field($field)->where($where)->order('tab_index','asc')->select()->toArray();
    }

    protected function getAppIDsByRoleID($role_id)
    {
        $key = role_apps_key($role_id);
        $list = Cache::remember($key,function() use($role_id) {
            return $this->findAppIDsByRoleID($role_id);
        });

        return $list;
    }

    protected function findAppIDsByRoleID($role_id)
    {
        $where = array(
            'role_id' => $role_id
        );
        return Db::name('app_role')->distinct(true)->where($where)->column('app_id');
    }

    public function getMenusByUserID($user_id, $app_id)
    {
        $tag = tag($user_id);
        $key = user_menus_key($user_id, $app_id);
        $list = Cache::tag($tag)->remember($key,function() use($user_id, $app_id) {
            $roleIDs = $this->getRoleIDsByUserID($user_id);
            $arr = [];
            foreach($roleIDs as $role_id)
            {
                $menuIDs = $this->getMenuIDsByRoleID($role_id);
                foreach($menuIDs as $menu_id)
                {
                    $arr[] = $menu_id;
                }
            }
            $arr = array_unique($arr);

            $groups = $this->getAllGroups($app_id);
            $menus = null;

            foreach($groups as $group)
            {
                $group_id = $group['id'];
                $allSubMenus = $this->getSubMenusByGroupID($group_id);

                $subMenus = null;
                foreach($allSubMenus as $item)
                {
                    $item_id = $item['id'];
                    unset($item['id']);

                    if(in_array($item_id,$arr))
                    {
                        if(empty($subMenus))
                            $subMenus = [];
                        $subMenus[] = $item;
                    }
                }

                if(!empty($subMenus))
                {
                    $group['children'] = $subMenus;
 
                    if(empty($menus))
                        $menus = [];
                    $menus[] = $group;
               }
            }
            
            return $menus;
        });

        return $list;
    }

    protected function getAllGroups($app_id)
    {
        $key = all_groups_key($app_id);
        $list = Cache::remember($key, function() use($app_id) {
            $list = $this->findAllGroups($app_id);
            return $list;
        });

        return $list;
    }

    protected function findAllGroups($app_id)
    {
        $where = array(
            'app_id' => $app_id,
            'status' => 1
        );

        $field = 'id,title as text,icon,icon_cls as iconCls,tab_index as tabIndex,memo as tip';
        return Db::name('group')->field($field)->where($where)->order('tab_index','asc')->select()->toArray();
    }

    protected function getSubMenusByGroupID($group_id)
    {
        $key = all_submenus_key($group_id);
        $list = Cache::remember($key, function() use($group_id) {
            $list = $this->findAllSubMenus($group_id);
            return $list;
        });

        return $list;

    }

    protected function findAllSubMenus($group_id)
    {
        $where = array(
            'group_id' => $group_id,
            'status' => 1
        );

        $field = 'id,title as text,url as viewType,icon,icon_cls as iconCls,tab_index as tabIndex,memo as tip,true as leaf';
        return Db::name('menu')->field($field)->where($where)->order('tab_index','asc')->select()->toArray();
    }

    protected function getMenuIDsByRoleID($role_id)
    {
        $key = role_menus_key($role_id);
        $list = Cache::remember($key,function() use($role_id) {
            return $this->findMenuIDsByRoleID($role_id);
        });

        return $list;
    }

    protected function findMenuIDsByRoleID($role_id)
    {
        $where = array(
            'role_id' => $role_id
        );
        return Db::name('menu_role')->distinct(true)->where($where)->column('menu_id');
    }

    public function getButtonsByUserID($user_id, $menu_id)
    {
        $tag = tag($user_id);
        $key = user_buttons_key($user_id, $menu_id);
        $list = Cache::tag($tag)->remember($key,function() use($user_id, $menu_id) {
            $roleIDs = $this->getRoleIDsByUserID($user_id);
            $arr = [];
            foreach($roleIDs as $role_id)
            {
                $buttonIDs = $this->getButtonIDsByRoleID($role_id);
                foreach($buttonIDs as $button_id)
                {
                    $arr[] = $button_id;
                }
            }
            $arr = array_unique($arr);

            $list = $this->getAllButtons($menu_id);
            $buttons = null;
            foreach($list as $item)
            {
                if(in_array($item['id'],$arr))
                {
                    if(empty($buttons))
                        $buttons = [];
                    $buttons[] = $item;
                }
            }
            
            return $buttons;
        });

        return $list;
    }

    protected function getButtonIDsByRoleID($role_id)
    {
        $key = role_buttons_key($role_id);
        $list = Cache::remember($key,function() use($role_id) {
            return $this->findButtonIDsByRoleID($role_id);
        });

        return $list;
    }

    protected function findButtonIDsByRoleID($role_id)
    {
        $where = array(
            'role_id' => $role_id
        );
        return Db::name('button_role')->distinct(true)->where($where)->column('button_id');
    }

    protected function getAllButtons($menu_id)
    {
        $key = all_buttons_key($menu_id);
        $list = Cache::remember($key, function() use($menu_id) {
            $list = $this->findAllButtons($menu_id);
            return $list;
        });

        return $list;
    }

    protected function findAllButtons($menu_id)
    {
        $where = array(
            'menu_id' => $menu_id,
            'status' => 1
        );

        $field = 'id,title,keyword,icon,icon_cls,tab_index,memo';
        return Db::name('button')->field($field)->where($where)->order('tab_index','asc')->select()->toArray();
    }

}
