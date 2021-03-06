<?php

namespace app\admin\service;

use think\Exception;
use think\facade\Db;

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

    public function move($id,$module_id)
    {
        $access = $this->model->find($id);
        $access['module_id'] = $module_id;
        $access->save();
        return $access;
    }

    public function sort($id,$tab_index,$dir)
    {
        $access = $this->model->find($id);
        $access['tab_index'] = $tab_index;
        $access->save();
        $module_id = $access['module_id'];
        $this->sortAll($module_id,$dir);
    }

    public function sortAll($module_id,$dir)
    {
        $where = array(
            'module_id' => $module_id
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

    public function setRoles($access_id,$roles)
    {
        $access = $this->model->find($access_id);
        Db::startTrans();
        try
        {
            $access->roles()->detach();
            $access->roles()->saveAll($roles);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }

}
