<?php

namespace app\admin\controller;

use think\Request;
use think\facade\Session;

use app\admin\service\User as UserService;

class User
{
    protected $service = null;

    public function __construct(UserService $service)
    {
        $this->service = $service;
    }

    /**
     * user login
     * $usernam
     * $password
     */
    public function login($username,$password)
    {
        $user = $this->service->login($username,$password);

        $user_id = $user['id'];
        $username = $user['username'];
        $key = user_name_key($user_id);

        session('user_id',$user_id);
        cache($key,$username);
        return json_success();
    }

    public function logout()
    {
        session('user_id',null);
        return json_success();
    }

    public function checkLogin()
    {
        if(!session('?user_id'))
        {
            throw new Exception('用户还未登录,或登录超时!');
        }

        return json_success();
    }

    public function roles(Request $request)
    {
        $data = json_param();
        $user_id = $data['user_id'];
        $roles = $data['roles'];

        $this->service->setRoles($user_id,$roles);
        return json_success();
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index($org_id = 0, $name = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
    {
        $list = $this->service->find($org_id,$name,$page,$limit,$sort,$dir);
        return json($list);
    }

    /**
     * 保存新建的用户
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function create(Request $request)
    {
        $data = json_param();
        $org = $this->service->create($data);
        return json_success($org);
    }


    /**
     * 保存修改的用户
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function update(Request $request)
    {
        //
        $data = json_param();
        $org = $this->service->update($data);
        return json_success($org);
    }

    public function move($id,$org_id)
    {
        $user = $this->service->move($id,$org_id);
        return json_success($user);
    }

    public function sort($id,$tab_index,$dir = 'desc')
    {
        $this->service->sort($id,$tab_index,$dir);
        return json_success();
    }

    /**
     * 读取指定的用户
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $org = $this->service->find($id);
        return json_success($org);
    }

    /**
     * 删除指定用户
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $this->service->delete($id);
        return json_success();
    }
}
