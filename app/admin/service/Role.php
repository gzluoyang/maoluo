<?php

namespace app\admin\service;

use think\Exception;
use think\facade\Db;

use app\admin\model\Role as RoleModel;

class Role
{
    protected $model = null;

    public function __construct(RoleModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($parent_id, $name = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        $where[] = ['parent_id','=',$parent_id];

        if($name != null)
        {
            $where[] = ['name','like',$name];
        }

        $list = $this->model->where($where)->order($sort, $dir)->paginate($params);

        return $list;
    }

    /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Role $data
     * @return \app\admin\model\Role
     */
    public function create($data)
    {
        $role = new RoleModel();
        $role->save($data);
        return $role;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Role $data
     * @return \app\admin\model\Role
     */
    public function update($data)
    {
        $id = $data['id'];
        $app = $this->model->find($id);
        $app->save($data);
        return $app;
    }

   /**
     * 读取指定的资源
     *
     * @param  int  $id
     * @return \app\admin\model\Role
    */
    public function read($id)
    {
        $app = $this->model->find($id);
        return $app;
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     */
    public function delete($id)
    {
        //
        $app = $this->model->find($id);
        $app->delete();
    }

    public function setUsers($role_id,$users)
    {
        $role = $this->model->find($role_id);
        Db::startTrans();
        try
        {
            $role->users()->detach();
            $role->users()->saveAll($users);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

    public function setAccesses($role_id,$accesses)
    {
        $role = $this->model->find($role_id);
        Db::startTrans();
        try
        {
            $role->accesses()->detach();
            $role->accesses()->saveAll($accesses);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

    public function setMenus($role_id,$menus)
    {
        $role = $this->model->find($role_id);
        Db::startTrans();
        try
        {
            $role->menus()->detach();
            $role->menus()->saveAll($menus);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

    public function setButtons($role_id,$buttons)
    {
        $role = $this->model->find($role_id);
        Db::startTrans();
        try
        {
            $role->buttons()->detach();
            $role->buttons()->saveAll($buttons);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

}
