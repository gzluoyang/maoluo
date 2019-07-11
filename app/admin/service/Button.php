<?php

namespace app\admin\service;

use think\Exception;

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
}
