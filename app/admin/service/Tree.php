<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\App as AppModel;
use app\admin\model\Group as GroupModel;
use app\admin\model\Menu as MenuModel;
use app\admin\model\Button as ButtonModel;
use app\admin\model\Module as ModuleModel;
use app\admin\model\Role as RoleModel;
use app\admin\model\Access as AccessModel;
use app\admin\model\Org as OrgModel;
use app\admin\model\User as UserModel;

class Tree 
{
    protected $appModel = null;
    protected $groupModel = null;
    protected $menuModel = null;
    protected $buttonModel = null;
    protected $moduleModel = null;
    protected $roleModel = null;
    protected $accessModel = null;
    protected $orgModel = null;
    protected $userModel = null;

    public function __construct(AppModel $appModel, GroupModel $groupModel, MenuModel $menuModel, ButtonModel $buttonModel, ModuleModel $moduleModel, RoleModel $roleModel, AccessModel $accessModel, OrgModel $orgModel, UserModel $userModel)
    {
        $this->appModel = $appModel;
        $this->groupModel = $groupModel;
        $this->menuModel = $menuModel;
        $this->buttonModel = $buttonModel;
        $this->moduleModel = $moduleModel;
        $this->roleModel = $roleModel;
        $this->accessModel = $accessModel;
        $this->orgModel = $orgModel;
        $this->userModel = $userModel;
    }

    public function role($parent_id,$user_id = null,$access_id = null,$menu_id = null,$button_id = null,$status = true,$checked = false)
    {
        $where = ['parent_id' => $parent_id];
        if($status === true)
            $where['status'] = 1;

        $field = 'id,name as text,parent_id';
        if($checked === true)
        {
            $field = $field . ',false as checked';
        }

        $list = $this->roleModel->where($where)->order('tab_index ASC')->field($field)->select();

        if($checked === true && !empty($list))
        {
            if(!empty($user_id))
            {
                $user = $this->userModel->find($user_id);
                $roles = $user->roles;
                if(!empty($roles))
                {
                    $arr = [];
                    foreach($roles as $role)
                    {
                        $arr[] = $role['id'];
                    }

                    $n = count($list);
                    foreach($list as &$item)
                    {
                        $item['checked'] = false;
                        if(in_array($item['id'],$arr))
                            $item['checked'] = true;
                    }
                }
            }

            if(!empty($access_id))
            {
                $access = $this->accessModel->find($access_id);
                $roles = $access->roles;
                if(!empty($roles))
                {
                    $arr = [];
                    foreach($roles as $role)
                    {
                        $arr[] = $role['id'];
                    }

                    $n = count($list);
                    foreach($list as &$item)
                    {
                        $item['checked'] = false;
                        if(in_array($item['id'],$arr))
                            $item['checked'] = true;
                    }
                }
            }

            if(!empty($menu_id))
            {
                $menu = $this->menuModel->find($menu_id);
                $roles = $menu->roles;
                if(!empty($roles))
                {
                    $arr = [];
                    foreach($roles as $role)
                    {
                        $arr[] = $role['id'];
                    }

                    $n = count($list);
                    foreach($list as &$item)
                    {
                        $item['checked'] = false;
                        if(in_array($item['id'],$arr))
                            $item['checked'] = true;
                    }
                }
            }

            if(!empty($button_id))
            {
                $button = $this->buttonModel->find($button_id);
                $roles = $button->roles;
                if(!empty($roles))
                {
                    $arr = [];
                    foreach($roles as $role)
                    {
                        $arr[] = $role['id'];
                    }

                    $n = count($list);
                    foreach($list as &$item)
                    {
                        $item['checked'] = false;
                        if(in_array($item['id'],$arr))
                            $item['checked'] = true;
                    }
                }
            }

       }

        return $list;
    }

    public function user($parent_id,$role_id,$status = true,$checked = false)
    {
        $list = [];

        $arr = str2arr($parent_id);
        $parent_id = intval($arr[0]);

        $where = ['parent_id' => $parent_id];
        if($status == true)
            $where['status'] = 1;

        $orgs = $this->orgModel->where($where)->order('tab_index ASC')->field('concat(id,",O") as id,name as text')->select();
        if(!empty($orgs))
        {
            foreach($orgs as $org)
            {
                $list[] = $org;
            }
        }

        $role = $this->roleModel->find($role_id);
        $users = $role->users;
        if(!empty($users))
        {
            $arr = [];
            foreach($users as $user)
            {
                $arr[] = $user['id'];
            }
        }

        $where = ['org_id' => $parent_id];
        if($status == true)
            $where['status'] = 1;

        $users = $this->userModel->where($where)->order('tab_index ASC')->field('id,username as text,true as leaf,false as checked')->select();

        if(!empty($users))
        {
            foreach($users as $user)
            {
                $user['iconCls'] = 'fa-user';
                if(in_array($user['id'],$arr))
                    $user['checked'] = true;

                $list[] = $user;
            }
        }

        return $list;
    }


    public function org($parent_id,$status = true)
    {
        $where = ['parent_id' => $parent_id];
        if($status == true)
            $where['status'] = 1;

        $list = $this->orgModel->where($where)->order('tab_index ASC')->field('id,name as text,parent_id')->select();
        return $list;
    }

    public function app($leaf = true,$status = true)
    {
        $where = [];
        if($status == true)
            $where['status'] = 1;

        $list = [];

        $str = 'true';
        if($leaf == true)
        {
            $str = 'true';
            $list = $this->appModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,"AP" as type,' . $str . ' as leaf')->select();
        }
        else
        {
            $str = 'false';
            $list = $this->appModel->where($where)->order('tab_index ASC')->field('concat(id,",A") as id,title as text,icon_cls as iconCls,"AP" as type,' . $str . ' as leaf')->select();
        }

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

    public function app_module_access($parent_id,$role_id,$type,$status = false,$checked = true)
    {
        $list = null;
        if($parent_id)
        {
            if($type == 'A')
            {
                $list = $this->module($parent_id,false,$status);
            }
            else if($type == 'M')
            {
                $list = $this->access($parent_id,$status);

                $role = $this->roleModel->find($role_id);
                $accesses = $role->accesses;
                if(!empty($accesses))
                {
                    $arr = [];
                    foreach($accesses as $access)
                    {
                        $arr[] = $access['id'];
                    }

                    foreach($list as &$item)
                    {
                        if(in_array($item['id'],$arr))
                            $item['checked'] = true;
                    }
                }
            }
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    public function app_group_menu($parent_id,$role_id,$type = '',$status = false,$checked = true)
    {
        $list = null;
        if($parent_id)
        {
            if($type == 'A')
            {
                $list = $this->group($parent_id,false,$status);
            }
            else if($type == 'G')
            {
                $list = $this->menu($parent_id,$status,$checked);

                if(!empty($role_id))
                {
                    $role = $this->roleModel->find($role_id);
                    $menus = $role->menus;
                    if(!empty($menus))
                    {
                        $arr = [];
                        foreach($menus as $menu)
                        {
                            $arr[] = $menu['id'];
                        }

                        foreach($list as &$item)
                        {
                            if(in_array($item['id'],$arr))
                                $item['checked'] = true;
                        }
                    }
                }
           }
        }
        else
        {
            $list = $this->app(false,$status);
        }
        return $list;
    }

    public function app_group_menu_button($parent_id,$role_id,$type = '',$status = false,$checked = true)
    {
        $list = null;
        if($parent_id)
        {
            if($type == 'A')
            {
                $list = $this->group($parent_id,false,$status);
            }
            else if($type == 'G')
            {
                $list = $this->menu($parent_id,$status,false,false);
            }
            else if($type == 'M')
            {
                $list = $this->button($parent_id,$status,$checked,true);

                if(!empty($role_id))
                {
                    $role = $this->roleModel->find($role_id);
                    $buttons = $role->buttons;
                    if(!empty($buttons))
                    {
                        $arr = [];
                        foreach($buttons as $button)
                        {
                            $arr[] = $button['id'];
                        }

                        foreach($list as &$item)
                        {
                            if(in_array($item['id'],$arr))
                                $item['checked'] = true;
                        }
                    }
                }
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
            $list = $this->groupModel->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,"GR" as type,true as leaf')->select();
        }
        else
        {
            $list = $this->groupModel->where($where)->order('tab_index ASC')->field('concat(id,",G") as id,title as text,icon_cls as iconCls,"GR" as type,false as leaf')->select();
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
        if($leaf === true)
        {
            $list = $this->moduleModel->where($where)->order('tab_index ASC')->field('id,title as text,"MO" as type,true as leaf')->select();
        }
        else
        {
            $list = $this->moduleModel->where($where)->order('tab_index ASC')->field('concat(id,",M") as id,title as text,"MO" as type,false as leaf')->select();
        }

        return $list;
    }

    private function menu($group_id,$status = true,$checked = false,$leaf = true)
    {
        if(!$group_id)
        {
            throw new Exception('group_id不能未空!');
        }

        $where = ['group_id' => $group_id];
        if($status == true)
            $where['status'] = 1;

        $field = 'id,title as text,icon_cls as iconCls,"ME" as type';
        if($leaf === true)
        {
            $field = $field . ',true as leaf';
        }
        else
        {
            $field = 'concat(id,",M") as id,title as text,icon_cls as iconCls,"ME" as type';
        }

        if($checked === true)
            $field = $field . ',false as checked';
       
        $list = $this->menuModel->where($where)->order('tab_index ASC')->field($field)->select();
        return $list;
    }

    private function button($menu_id,$status = true,$checked = false)
    {
        if(!$menu_id)
        {
            throw new Exception('menu_id不能未空!');
        }

        $where = ['menu_id' => $menu_id];
        if($status == true)
            $where['status'] = 1;

        $field = 'id,title as text,icon_cls as iconCls,"BU" as type,true as leaf';
        if($checked === true)
            $field = $field . ',false as checked';
        
        $list = $this->buttonModel->where($where)->order('tab_index ASC')->field($field)->select();
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

        $list = $this->accessModel->where($where)->order('tab_index ASC')->field('id,title as text,url as qtip,true as leaf,"AC" as type,false as checked')->select();
        return $list;
    }

}
