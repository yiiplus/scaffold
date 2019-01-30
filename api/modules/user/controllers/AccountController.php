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

use Yii;

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
     * 用户送给主播火箭的接口
     *
     * @return \yii\data\ArrayDataProvider
     */
    public function actionIndex()
    {
        /**
        zoom_id
        uid
        type
        ....
        if feiji

        */

        $websocket = Yii::$app->websocket;
        $status = $websocket->send([
            'channel' => 'push',
            'room_id' => 2,
            'message' => '用户 3 送给主播 2 一架飞机！'
        ]);

[
    'uid' => 3
    'name' =>
    'zome'
]

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
    }
}
