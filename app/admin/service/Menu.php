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
     * 显示某分组所有可用的菜单
     * @param $module_id 模块ID
     * @return Array
     */
    public function findAllEnabledByGroupID($group_id)
    {
        $where = array(
            'group_id' => $group_id,
            'status' => 1
        );

        $field = 'title as text,url as viewType,icon,icon_cls as iconCls,tab_index as tabIndex,memo as tip,true as leaf';
        $list = $this->model->field($field)->where($where)->order('tab_index','asc')->select();
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
        $menu = $this->model->find($id);
        $menu->save($data);
        return $menu;
    }

    public function move($id,$group_id)
    {
        $menu = $this->model->find($id);
        $menu['group_id'] = $group_id;
        $menu->save();
        return $menu;
    }

    public function sort($id,$tab_index,$dir)
    {
        $menu = $this->model->find($id);
        $menu['tab_index'] = $tab_index;
        $menu->save();
        $group_id = $menu['group_id'];
        $this->sortAll($group_id,$dir);
    }

    public function sortAll($group_id,$dir)
    {
        $where = array(
            'group_id' => $group_id
        );
        $list = $this->model->where($where)->order('tab_index asc, update_time ' . $dir)->select();

        $i = 0;
        foreach($list as $item)
        {
            $i++;
            $item['tab_index'] = $i;
            $item->save();
        }
    }

    /**
     * 读取指定的资源
     *
     * @param  int  $id
     * @return \app\admin\model\Menu
    */
    public function read($id)
    {
        $menu = $this->model->find($id);
        return $menu;
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     */
    public function delete($id)
    {
        //
        $menu = $this->model->find($id);
        $menu->delete();
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
