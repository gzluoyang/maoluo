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
        $field = 'id as value,title as tooltip,icon,icon_cls as iconCls,tab_index as tabIndex,memo as tip';
        return Db::name('app')->field($field)->where($where)->order('tab_index','asc')->select()->toArray();
    }

    public function getAppIDsByRoleID($role_id)
    {
        $key = role_apps_key($role_id);
        $list = Cache::remember($key,function() use($role_id) {
            return $this->findAppIDsByRoleID($role_id);
        });

        return $list;
    }

    public function findAppIDsByRoleID($role_id)
    {
        $where = array(
            'role_id' => $role_id
        );
        return Db::name('app_role')->distinct(true)->where($where)->column('app_id');
    }

}
