<?php

namespace app\admin\service;

use think\Exception;
use think\facade\Db;

use app\admin\model\Button as ButtonModel;

class Button
{
    protected $model = null;

    public function __construct(ButtonModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($menu_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        if(empty($menu_id)) {
            throw new Exception('请选择对应的菜单!');
        }
        $where[] = ['menu_id','=',$menu_id];

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
     * @param  \app\admin\model\Button $data
     * @return \app\admin\model\Button
     */
    public function create($data)
    {
        $button = new ButtonModel();
        $button->save($data);
        return $button;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Button $data
     * @return \app\admin\model\Button
     */
    public function update($data)
    {
        $id = $data['id'];
        $button = $this->model->find($id);
        $button->save($data);
        return $button;
    }

    public function move($id,$menu_id)
    {
        $button = $this->model->find($id);
        $button['menu_id'] = $menu_id;
        $button->save();
        return $button;
    }

    public function sort($id,$tab_index,$dir)
    {
        $button = $this->model->find($id);
        $button['tab_index'] = $tab_index;
        $button->save();
        $menu_id = $button['menu_id'];
        $this->sortAll($menu_id,$dir);
    }

    public function sortAll($menu_id,$dir)
    {
        $where = array(
            'menu_id' => $menu_id
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
     * @return \app\admin\model\Button
    */
    public function read($id)
    {
        $button = $this->model->find($id);
        return $button;
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     */
    public function delete($id)
    {
        //
        $button = $this->model->find($id);
        $button->delete();
    }

    public function setRoles($button_id,$roles)
    {
        $button = $this->model->find($button_id);
        Db::startTrans();
        try
        {
            $button->roles()->detach();
            $button->roles()->saveAll($roles);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

}
