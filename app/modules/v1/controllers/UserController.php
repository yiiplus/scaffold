<?php

namespace app\modules\v1\controllers;

use Yii;
use yii\web\ServerErrorHttpException;

class UserController extends Controller
{
    public function actionIndex()
    {
        return new \yii\data\ArrayDataProvider(['allModels' =>[1,2,3,4,5]]);
    }

    public function actionSearch()
    {
        return new \yii\data\ArrayDataProvider(['allModels' =>[1,2,3,4,5,6]]);
    }

    public function actionError()
    {
    	throw new \Exception('error message.', 100001);
    	//throw new \yii\web\ServerErrorHttpException('ttttttttt');
    }
}