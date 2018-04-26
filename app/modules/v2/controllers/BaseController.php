<?php

namespace app\modules\v2\controllers;

use yii\rest\Controller;
use yii\web\Response;

class BaseController extends Controller
{
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;
        return $behaviors;
    }
}