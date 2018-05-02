<?php

namespace app\controllers;

use Yii;

abstract class Controller extends \yii\web\Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors() {
        return parent::behaviors();
    }

    /**
     * @inheritdoc
     */
    public function actions() {
        
    }
}