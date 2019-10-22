<?php
namespace app\admin\exception;

use Throwable;
use think\exception\Handle;
use think\Exception;
use think\Response;

class ExceptionHandle extends Handle
{
    public function render($request, Throwable $e) : Response
    {
        // 请求异常
        if ($e instanceof Exception) {
            $data = $this->convertExceptionToArray($e);
            $data['success'] = false;
            return json($data);
        }

        // 其他错误交给系统处理
        return parent::render($request, $e);
    }
}
