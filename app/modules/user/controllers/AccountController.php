<?php

namespace app\modules\user\controllers;

use Yii;

class AccountController extends \app\modules\Controller
{
    public function actionIndex()
    {
        $result = [
            ['uid'=>1, 'username'=> 'jacky', 'email'=>'87003637@qq.com','access-token'=> md5(mt_rand(10000,20000))],
            ['uid'=>2, 'username'=> 'test', 'email'=>'test@qq.com','access-token'=> md5(mt_rand(10000,20000))],
        ];
        return new \yii\data\ArrayDataProvider(['allModels' =>$result]);
    }

    public function actionLogin()
    {
        return ['uid'=>1, 'username'=> 'jacky', 'email'=>'87003637@qq.com','access-token'=> md5(time())];
    }

    public function actionLogout()
    {    
        return 'success';
    }

    public function actionError()
    {
        throw new \Exception('系统错误', 100001);

        throw new \yii\web\NotFoundHttpException('系统错误');
    }
}