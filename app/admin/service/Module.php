<?php

namespace app\admin\service;

use think\Exception;

use app\admin\model\Module as ModuleModel;

class Module
{
    protected $model = null;

    public function __construct(ModuleModel $model)
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
     * @param  \app\admin\model\Module $data
     * @return \app\admin\model\Module
     */
    public function create($data)
    {
        $module= new ModuleModel();
        $module->save($data);
        return $module;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\Module $data
     * @return \app\admin\model\Module
     */
    public function update($data)
    {
        $id = $data['id'];
        $module = $this->model->find($id);
        $module->save($data);
        return $module;
    }

    public function move($id,$app_id)
    {
        $module = $this->model->find($id);
        $module['app_id'] = $app_id;
        $module->save();
        return $module;
    }

    /**
     * 读取指定的资源
     *
     * @param  int  $id
     * @return \app\admin\model\Module
    */
    public function read($id)
    {
        $module = $this->model->find($id);
        return $module;
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     */
    public function delete($id)
    {
        //
        $module = $this->model->find($id);
        $module->delete();
    }
}
