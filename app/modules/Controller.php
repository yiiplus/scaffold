<?php

namespace app\modules;

use Yii;
use yii\web\Response;
use yii\helpers\ArrayHelper;
use yii\filters\ContentNegotiator;
use yii\filters\RateLimiter;  
use app\extensions\auth\JwtAuth;
use app\extensions\auth\TimestampAuth;
use app\extensions\auth\AccessTokenAuth;

abstract class Controller extends \yii\rest\Controller
{
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'list',
    ];

    public $public = false;
    
    public $publicActions = [];

    public $rateLimiter = true;

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        unset($behaviors['authenticator'], $behaviors['rateLimiter']);

        // 响应内容格式处理
        $behaviors['contentNegotiator'] = [
            'class' => 'yii\filters\ContentNegotiator',
            'formats' => [
                'application/json'       => Response::FORMAT_JSON,
                'application/javascript' => Response::FORMAT_JSONP,
            ]
        ];

        $isDebug  = YII_DEBUG && Yii::$app->request->get('__debug__') == 1;
        if($isDebug) {
            // 接口调试模式
            unset($_GET['__debug__']);
            Yii::$app->request->setBodyParams($_GET);
        } else {
            // 参数传递安全验证，防止篡改
            $behaviors['tokenValidate'] = [
                'class' => JwtAuth::className(),
            ];

            // 时间戳验证，防止重放攻击
            $behaviors['timestampValidate'] = [
                'class' => TimestampAuth::className(),
            ];

            // 授权验证（Authentication)
            $isPublic = $this->public || in_array(Yii::$app->controller->action->id, $this->publicActions);
            if (!$isPublic) {
                $behaviors['authValidate'] = [
                    'class' => AccessTokenAuth::className(),
                    'optional'  => ['register', 'login'],
                ];
            }
            
            // 数率限制 (Rate Limiting)
             $behaviors['rateLimiter'] = [
                 'class' => 'yii\filters\RateLimiter',
             ];
        }

        return $behaviors;
    }

    /**
     * {@inheritdoc}
     */
    protected function verbs()
    {
        return [
            'index' => ['GET', 'HEAD'],
            'view' => ['GET', 'HEAD'],
            'create' => ['POST'],
            'update' => ['PUT', 'PATCH'],
            'delete' => ['DELETE'],
        ];
    }
}