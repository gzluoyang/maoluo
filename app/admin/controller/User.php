<?php

namespace app\admin\controller;

use think\Request;

use app\admin\model\User as UserModel;

class User
{
    protected $model = null;

    public function __construct(UserModel $model)
    {
        $this->model = $model;
    }

    /**
     * user login
     * $usernam
     * $password
     */
    public function login($username,$password)
    {
        try {
            $this->model->login($username,$password);
        } catch(Exception $e) {
            return json_error($e);
        }

        return json_success();
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $user = $this->model->select();
        /*
        $profile = array();
        $profile['true_name'] = 'luoyang';
        $profile['mobile'] = '13900000000';
        $user->profile()->save($profile);

        $user->roles()->save(['name' => '管理员']);
        $user->roles;
        */
        return json($user);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        $password = md5('123456');
        $data = array();
        $data['username'] = 'admin222';
        $data['password'] = $password;
        $this->model->save($data);
        return json_encode($data);
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
