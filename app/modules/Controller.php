<?php

namespace app\modules;

use Yii;
use yii\web\Response;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\QueryParamAuth;
use yii\filters\ContentNegotiator;
use app\filters\UriTokenization;

abstract class Controller extends \yii\rest\Controller
{
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'result',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        
        // 权限认证
        // $behaviors['authenticator'] = [
        //     'class' => QueryParamAuth::className(),
        // ];


        // $authTokenParam = 'auth_key';
        // //ContentNegotiator支持响应内容格式处理和语言处理
        // $behaviors['contentNegotiator'] = [
        //     'class' => ContentNegotiator::className(),
        //     'formats' => [
        //         'text/html' => Response::FORMAT_JSON
        //     ]
        // ];
        // //UriTokeniza过滤器
        // $behaviors['uriTokenization'] = [
        //     'class' => UriTokenization::className(),
        //     'tokenForm' => 'JWT',
        //     'authTokenParam' => $authTokenParam,
        //     'except' => [
        //         "*"
        //     ],
        // ];
        // //授权认证支持列表
        // $behaviors['authenticator'] = [
        //     'class' => QueryParamAuth::className(),
        //     'tokenParam' => $authTokenParam,
        //     'except' => [
        //         "*"
        //     ]
        // ];
        // 

        // 响应内容格式处理
        $behaviors['contentNegotiator']['formats'] = [
            'application/json'          => Response::FORMAT_JSON,
            'application/javascript'    => Response::FORMAT_JSONP,
        ];
        return $behaviors;
    }
}