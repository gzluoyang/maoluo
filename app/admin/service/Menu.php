<?php

namespace app\admin\service;

use think\Exception;
use think\facade\Db;

use app\admin\model\Menu as MenuModel;

class Menu
{
    protected $model = null;

    public function __construct(MenuModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($group_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        if(empty($group_id)) {
            throw new Exception('请选择对应的分组!');
        }
        $where[] = ['group_id','=',$group_id];

        if($title != null)
        {
            $where[] = ['title','like',$title];
        }

        $list = $this->model->where($where)->order($sort, $dir)->paginate($params);

        return $list;
    }

    /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Menu $data
     * @return \app\admin\model\Menu
     */
    public function create($data)
    {
        $menu = new MenuModel();
        $menu->save($data);
        return $menu;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Menu $data
     * @return \app\admin\model\Menu
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
     * @return \app\admin\model\Menu
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

    public function setRoles($menu_id,$roles)
    {
        $menu = $this->model->find($menu_id);
        Db::startTrans();
        try
        {
            $menu->roles()->detach();
            $menu->roles()->saveAll($roles);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

}
