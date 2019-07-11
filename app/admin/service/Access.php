<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\Access as AccessModel;

class Access
{
    protected $model = null;

    public function __construct(AccessModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($module_id, $title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        if(empty($module_id)) {
            throw new Exception('请选择对应的分组!');
        }
        $where[] = ['module_id','=',$module_id];

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
     * @param  \app\admin\model\Access $data
     * @return \app\admin\model\Access
     */
    public function create($data)
    {
        $access = new AccessModel();
        $access->save($data);
        return $access;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Access $data
     * @return \app\admin\model\Access
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
     * @return \app\admin\model\Access
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
