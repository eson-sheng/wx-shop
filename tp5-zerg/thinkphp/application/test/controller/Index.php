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

    /**
     * 测试：
     * eg：curl -X POST "http://tp5-zerg/test/r/123?name=eson" -d "age=18"
     *
     * @param $id
     * @param $name
     * @param $age
     * @return string
     */
    public function route ($id, $name, $age)
    {
        $post_age = input('post.age'); // 助手函数

        print_r($post_age);

        $arr = [
            $id, $name, $age
        ];

        print_r($arr);

        return 'okay';
    }
}