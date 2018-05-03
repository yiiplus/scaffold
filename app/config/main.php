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
        'user' => ['class' => 'app\modules\user\Module'],
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
                    // 账号信息
                    'class' => 'yii\rest\UrlRule',
                    'controller' => 'user/account',
                    'extraPatterns' => [
                        'GET login'  => 'login',
                        'GET logout' => 'logout',
                    ],
                    'pluralize' => false,
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

                if($response->isSuccessful) {
                    $data = [
                        'success' => $response->isSuccessful,
                        'code'    => 0,
                        'message' => $response->statusText,
                        'data'  => $response->data,
                    ];
                } else {
                    if(YII_DEBUG) {
                        $data = [
                            'success'     => $response->isSuccessful,
                            'code'        => isset($response->data['code']) ? $response->data['code'] : 100001,
                            'message'     => isset($response->data['message']) ? $response->data['message'] : '系统错误',
                            'statusCode'  => $response->statusCode,
                            'statusText'  => $response->statusText,
                        ];
                    } else {
                        $exception = Yii::$app->getErrorHandler()->exception;
                        $error_code    = $exception->getCode();
                        $error_message = $exception->getMessage();
                        $data = [
                            'success'     => $response->isSuccessful,
                            'code'        => $error_code ? $error_code : 100001,
                            'message'     => $error_message ? $error_message : '系统错误',
                        ];

                    }
                }

                $response->data = $data;
                $response->statusCode = 200;
            },
        ],
    ],
    'params' => $params,
];
