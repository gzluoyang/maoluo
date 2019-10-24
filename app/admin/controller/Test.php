<?php

namespace app\admin\controller;

use think\Request;
use app\admin\service\CacheService;

class Test
{
    protected $service = null;

    public function __construct(CacheService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        $list = $this->service->findAllEnabledApps();
        return json($list);
    }
}
