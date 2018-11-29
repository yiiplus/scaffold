<?php
/**
 * 脚手架
 *
 * PHP version 7
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */

namespace api\modules\user\controllers;

/**
 * 账号API
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class AccountController extends \api\modules\Controller
{
    /**
     * 列表
     *
     * @return \yii\data\ArrayDataProvider
     */
    public function actionIndex()
    {
        $result = [
            ['uid'=>1, 'username'=> 'jacky', 'email'=>'87003637@qq.com','access-token'=> md5(mt_rand(10000, 20000))],
            ['uid'=>2, 'username'=> 'test', 'email'=>'test@qq.com','access-token'=> md5(mt_rand(10000, 20000))],
        ];

        return new \yii\data\ArrayDataProvider(['allModels' =>$result]);
    }

    /**
     * 登录
     *
     * @return array
     */
    public function actionLogin()
    {
        return ['uid'=>1, 'username'=> 'jacky', 'email'=>'87003637@qq.com','access-token'=> md5(time())];
    }

    /**
     * 退出
     *
     * @return string 状态
     */
    public function actionLogout()
    {
        return 'success';
    }

    /**
     * 错误
     *
     * @throws \Exception
     * @throws \yii\web\NotFoundHttpException
     * @return void
     */
    public function actionError()
    {
        throw new \Exception('系统错误', 100001);

        throw new \yii\web\NotFoundHttpException('系统错误');
    }
}
