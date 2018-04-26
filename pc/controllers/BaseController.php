<?php

namespace pc\controllers;

use yii\web\Controller;

class BaseController extends Controller
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
    public function actions() {}
}