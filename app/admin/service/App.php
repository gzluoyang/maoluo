<?php

namespace app\admin\service;

use app\admin\model\App as AppModel;

class App
{
    protected $model = null;

    public function __construct(AppModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        if($title == null)
        {
            $list = $this->model->order($sort, $dir)->paginate($params);
        }
        else
        {
            $list = $this->model->where('title','like',$title)->order($sort, $dir)->paginate($params);
        }

        return $list;
    }

    public function tree()
    {
        $where = ['status' => 1];
        $list = $this->model->where($where)->order('tab_index ASC')->field('id,title as text,icon_cls as iconCls,true as leaf')->select();
        return $list;
    }

    /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\App $data
     * @return \app\admin\model\App
     */
    public function create($data)
    {
        $app = new AppModel();
        $app->save($data);
        return $app;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\App $data
     * @return \app\admin\model\App
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
     * @return \app\admin\model\App
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
}
