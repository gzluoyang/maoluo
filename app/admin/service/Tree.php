<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\App as AppModel;
use app\admin\model\Group as GroupModel;
use app\admin\model\Menu as MenuModel;
use app\admin\model\Module as ModuleModel;
use app\admin\model\Role as RoleModel;
use app\admin\model\Access as AccessModel;

class Tree 
{
    protected $appModel = null;
    protected $groupModel = null;
    protected $menuModel = null;
    protected $moduleModel = null;
    protected $roleModel = null;
    protected $accessModel = null;

    public function __construct(AppModel $appModel, GroupModel $groupModel, MenuModel $menuModel, ModuleModel $moduleModel, RoleModel $roleModel, AccessModel $accessModel)
    {
        $this->appModel = $appModel;
        $this->groupModel = $groupModel;
        $this->menuModel = $menuModel;
        $this->moduleModel = $moduleModel;
        $this->roleModel = $roleModel;
        $this->accessModel = $accessModel;
    }

    public function role($parent_id,$status = true)
    {
        $where = ['parent_id' => $parent_id];
        if($status == true)
            $where['status'] = 1;

        $list = $this->roleModel->where($where)->order('tab_index ASC')->field('id,name as text')->select();
        return $list;
    }

    public function app($leaf = true,$status = true)
    {
        $str = 'true';
        if($leaf == true)
        {
            $str = 'true';
        }
        else
        {
            $str = 'false';
        }

        $where = [];
        if($status == true)
            $where['status'] = 1;

        $list = $this->appModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,' . $str . ' as leaf')->select();
        return $list;
    }

    public function app_group($parent_id,$status = true)
    {
        $list = null;
        if($parent_id)
        {
            $list = $this->group($parent_id,true,$status);
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    public function app_module($parent_id,$status = true)
    {
        $list = null;
        if($parent_id)
        {
            $list = $this->module($parent_id,true,$status);
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    public function app_module_access($parent_id,$type = '',$status = true)
    {
        $list = null;
        if($parent_id)
        {
            if($type == '')
            {
                $list = $this->module($parent_id,false,$status);
            }
            else if($type == 'M')
            {
                $list = $this->access($parent_id,$status);
            }
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    public function app_group_menu($parent_id,$type = '',$status = true)
    {
        $list = null;
        if($parent_id)
        {
            if($type == '')
            {
                $list = $this->group($parent_id,false,$status);
            }
            else if($type == 'G')
            {
                $list = $this->menu($parent_id,$status);
            }
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    private function group($app_id,$leaf = true,$status = true)
    {
        if(!$app_id)
        {
            throw new Exception('app_id不能未空!');
        }

        $where = ['app_id' => $app_id];
        if($status == true)
            $where['status'] = 1;

        $list = [];
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

    private function module($app_id,$leaf = true,$status = true)
    {
        if(!$app_id)
        {
            throw new Exception('app_id不能未空!');
        }

        $where = ['app_id' => $app_id];
        if($status == true)
            $where['status'] = 1;

        $list = [];
        if($leaf == true)
        {
            $list = $this->moduleModel->where($where)->order('tab_index ASC')->field('id,title as text,true as leaf')->select();
        }
        else
        {
            $list = $this->moduleModel->where($where)->order('tab_index ASC')->field('concat(id,",M") as id,title as text,false as leaf')->select();
        }

        return $list;
    }

    private function menu($group_id,$status = true)
    {
        if(!$group_id)
        {
            throw new Exception('group_id不能未空!');
        }

        $where = ['group_id' => $group_id];
        if($status == true)
            $where['status'] = 1;
        
        $list = $this->menuModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,true as leaf')->select();
        return $list;
    }

    private function access($module_id,$status = true)
    {
        if(!$module_id)
        {
            throw new Exception('module_id不能未空!');
        }

        $where = ['module_id' => $module_id];
        if($status == true)
            $where['status'] = 1;

        $list = $this->accessModel->where($where)->order('tab_index ASC')->field('id,title as text,true as leaf,true as checked')->select();
        return $list;
    }

}
