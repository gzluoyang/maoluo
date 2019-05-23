<?php

namespace app\admin\controller;

use think\Request;
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
     * @return \think\Response
     */
    public function index($title = null, $page = 1, $limit = 15, $sort = 'tab_index', $dir = 'ASC')
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

        return json($list);
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
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
        $data = json_param();
        $id = $data['id'];
        if($id) {
            $app = $this->model->find($id);
        } else {
            $app = new AppModel();
        }
        $app->save($data);
        return json_success($app);
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
        $app = $this->model->find($id);
        $app->delete();
        return json_success();
    }
}
