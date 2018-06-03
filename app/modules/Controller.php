<?php

namespace app\modules;

use Yii;
use yii\web\Response;

abstract class Controller extends \yii\rest\Controller
{
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'list',
    ];

    public function behaviors()
    {
        $behaviors = parent::behaviors();

        unset($behaviors['authenticator'], $behaviors['rateLimiter']);

        $behaviors['contentNegotiator'] = [
            'class' => 'yii\filters\ContentNegotiator',
            'formats' => [
                'application/json'       => Response::FORMAT_JSON,
                'application/javascript' => Response::FORMAT_JSONP,
            ]
        ];

        $behaviors['tokenValidate'] = [
            'class' => 'app\extensions\auth\JwtAuth',
            'except' => $this->isDebug ? ['*'] : []
        ];

        $behaviors['timestampValidate'] = [
            'class' => 'app\extensions\auth\TimestampAuth',
            'except' => $this->isDebug ? ['*'] : []
        ];

        $behaviors['authValidate'] = [
            'class' => 'app\extensions\auth\AccessTokenAuth',
            'except'  => $this->isDebug ? ['*'] : []
        ];

        $behaviors['rateLimiter'] = [
            'class' => 'app\extensions\auth\RateLimiterAuth',
            'enableRateLimitHeaders' => true,
            'except'  => $this->isDebug ? ['*'] : []
        ];

        return $behaviors;
    }

    /**
     * 当在开发环境下使用GET方式传入的`__debug__`参数为1时，isDebug属性为true
     * 此时大部分behaviors将不会执行 e.g:
     * ```php
     *  $behaviors['authValidate'] = [
     *      'class' => 'app\extensions\auth\AccessTokenAuth',
     *      'except'  => $this->isDebug ? ['*'] : [] //except属性对isDebug进行支持
     *  ];
     * ```
     * @return bool
     */
    public function getIsDebug()
    {
        return YII_DEBUG && Yii::$app->request->get('__debug__') == 1;
    }

    /**
     * {@inheritdoc}
     */
    protected function verbs()
    {
        return [
            'index'  => ['GET'],
            'view'   => ['GET'],
            'create' => ['POST'],
            'update' => ['PUT', 'PATCH'],
            'delete' => ['DELETE'],
        ];
    }
}
