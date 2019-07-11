<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\App as AppModel;
use app\admin\model\Group as GroupModel;
use app\admin\model\Menu as MenuModel;

class Tree 
{
    protected $appModel = null;
    protected $groupModel = null;
    protected $menuModel = null;

    public function __construct(AppModel $appModel, GroupModel $groupModel, MenuModel $menuModel)
    {
        $this->appModel = $appModel;
        $this->groupModel = $groupModel;
        $this->menuModel = $menuModel;
    }

    public function app($leaf = true)
    {
        $str = 'true';
        if($leaf)
        {
            $str = 'true';
        }
        else
        {
            $str = 'false';
        }

        $where = ['status' => 1];
        $list = $this->appModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,' . $str . ' as leaf')->select();
        return $list;
    }

    public function app_group($parent_id)
    {
        $list = null;
        if($parent_id)
        {
            $list = $this->group($parent_id);
        }
        else
        {
            $list = $this->app(false);
        }
        return $list;
    }

    public function app_group_menu($parent_id,$type = '')
    {
        $list = null;
        if($parent_id)
        {
            if($type == '')
            {
                $list = $this->group($parent_id, false);
            }
            else if($type == 'G')
            {
                $list = $this->menu($parent_id);
            }
        }
        else
        {
            $list = $this->app(false);
        }
        return $list;
    }


    private function group($app_id,$leaf = true)
    {
        if(!$app_id)
        {
            throw new Exception('app_id不能未空!');
        }

        $list = [];
        $where = ['status' => 1,'app_id' => $app_id];
        if($leaf == true)
        {
            $list = $this->groupModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,true as leaf')->select();
        }
        else
        {
            $list = $this->groupModel->where($where)->order('tab_index ASC')->field('concat(id,",G") as id,title as text,icon_cls as iconCls,false as leaf')->select();
        }

        return $list;
    }

    private function menu($group_id)
    {
        if(!$group_id)
        {
            throw new Exception('group_id不能未空!');
        }

        $where = ['status' => 1,'group_id' => $group_id];
        $list = $this->menuModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,true as leaf')->select();
        return $list;
    }
}
