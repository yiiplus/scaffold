<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'modules' => [
        'user'   => ['class' => 'app\modules\user\Module'],
        'shop'   => ['class' => 'app\modules\shop\Module'],
        'cms'    => ['class' => 'app\modules\cms\Module'],
        'bbs'    => ['class' => 'app\modules\bbs\Module'],
        'common' => ['class' => 'app\modules\common\Module'],
    ],
    'components' => [
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => true,
            'enableSession' => false,
            'loginUrl' => null,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'pluralize' => false,
                    'controller' => 'user/account',
                    'extraPatterns' => [
                        'GET login'  => 'login',
                        'GET logout' => 'logout',
                        'GET error'  => 'error',
                    ],
                ],
            ],
        ],
        'response' => [
            'class' => 'yii\web\Response',
            'formatters' => [
                \yii\web\Response::FORMAT_JSON => [
                    'class' => 'yii\web\JsonResponseFormatter',
                    'prettyPrint' => YII_DEBUG, // use "pretty" output in debug mode
                    'encodeOptions' => JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE,
                ],
            ],
            'on beforeSend' => function ($event) {
                $response = $event->sender;
                
                // 错误信息格式化
                if (!$response->isSuccessful && !YII_DEBUG) {
                    $exception = Yii::$app->getErrorHandler()->exception;
                    if ($exception->getCode() > 100000) {
                        $response->data = ['data' => $exception->getCode(), 'message' => $exception->getMessage()];
                    } else {
                        $response->data = ['data' => 100000, 'message' => '系统未知错误'];
                    }
                }

                // 数据组装
                $response->data = [
                    'success' => $response->isSuccessful,
                    'data' => $response->data,
                ];

                $response->statusCode = 200;
            },
        ],
    ],
    'params' => $params,
];
