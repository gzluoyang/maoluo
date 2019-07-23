<?php

namespace app\admin\service;

use think\Exception;
use think\facade\Db;

use app\admin\model\User as UserModel;

class User
{
    protected $model = null;

    public function __construct(UserModel $model)
    {
        $this->model = $model;
    }

    /**
     * 显示资源列表
     *
     * @return 
     */
    public function find($org_id = 0, $name = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $params = array(
            'list_rows' => $limit,
            'page' => $page
        );

        $where[] = ['org_id','=',$org_id];

        if($name != null)
        {
            $where[] = ['name','like',$name];
        }

        $field = "id,org_id,username,status,tab_index,login_count,last_login_time,last_login_ip,reg_ip,reg_time,memo";
        $list = $this->model->field($field)->where($where)->order($sort, $dir)->paginate($params);

        return $list;
    }

    /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\User $data
     * @return \app\admin\model\User
     */
    public function create($data)
    {
        $user = new UserModel();
        $user->save($data);
        return $user;
    }

     /**
     * 保存新建的资源
     *
     * @param  \app\admin\model\User $data
     * @return \app\admin\model\User
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
     * @return \app\admin\model\User
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

    public function setRoles($user_id,$roles)
    {
        $user = $this->model->find($user_id);
        Db::startTrans();
        try
        {
            $user->roles()->detach();
            $user->roles()->saveAll($roles);
            Db::commit();
        }
        catch(Exception $e)
        {
            Db::rollback();
            throw $e;
        }
    }
}
