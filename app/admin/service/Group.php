<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\Group as GroupModel;

class Group
{
    protected $model = null;

    public function __construct(GroupModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($app_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        if(empty($app_id)) {
            throw new Exception('请选择对应的应用!');
        }
        $where[] = ['app_id','=',$app_id];

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
     * @param  \app\admin\model\Group $data
     * @return \app\admin\model\Group
     */
    public function create($data)
    {
        $group= new GroupModel();
        $group->save($data);
        return $group;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Group $data
     * @return \app\admin\model\Group
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
     * @return \app\admin\model\Group
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
