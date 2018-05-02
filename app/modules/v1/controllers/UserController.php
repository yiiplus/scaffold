<?php

namespace app\modules\v1\controllers;

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
}