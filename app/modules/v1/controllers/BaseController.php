<?php

namespace app\modules\v1\controllers;

use app\filters\UriTokenization;
use yii\filters\ContentNegotiator;
use yii\rest\Controller;
use yii\web\Response;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\QueryParamAuth;

class BaseController extends Controller
{
    public function behaviors()
    {
        $authTokenParam = 'auth_key';
        //ContentNegotiator支持响应内容格式处理和语言处理
        $behaviors['contentNegotiator'] = [
            'class' => ContentNegotiator::className(),
            'formats' => [
                'text/html' => Response::FORMAT_JSON
            ]
        ];
        //UriTokeniza过滤器
        $behaviors['uriTokenization'] = [
            'class' => UriTokenization::className(),
            'tokenForm' => 'JWT',
            'authTokenParam' => $authTokenParam,
            'except' => [
                //'index'
            ],
        ];
        //授权认证支持列表
        $behaviors['authenticator'] = [
            'class' => QueryParamAuth::className(),
            'tokenParam' => $authTokenParam,
            'except' => [
                //'index'
            ]
        ];
        return $behaviors;
    }
}