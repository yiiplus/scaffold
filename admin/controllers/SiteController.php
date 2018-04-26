<?php
namespace app\controllers;

use Yii;
use admin\controllers\BaseController;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use admin\models\AdminLoginForm;

/**
 * Site controller
 */
class SiteController extends BaseController
{
    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}