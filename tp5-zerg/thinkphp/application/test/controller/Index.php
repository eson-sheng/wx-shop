<?php
/**
 * Created by PhpStorm.
 * User: eson
 * Date: 2019-04-18
 * Time: 14:28
 */

namespace app\test\controller;


use think\Controller;

class Index extends Controller
{
    public function index ()
    {
        /*测试数据库*/
        $ret = \think\Db::name('test')->find();
        dump($ret);

        /*日志扩展测试*/
        \SeasLog::info('test');
    }
}