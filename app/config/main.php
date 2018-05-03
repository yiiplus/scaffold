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
        'v1' => ['class' => 'app\modules\v1\Module'],
        'v2' => ['class' => 'app\modules\v2\Module'],
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
                    'controller' => 'v1/user',
                    //'except' => ['index', 'view', 'create', 'update', 'delete'],
                    'extraPatterns' => [
                        'GET search' => 'search',
                        'GET error'  => 'error',
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
                        'result'  => $response->data,
                    ];
                } else {
                    if(YII_DEBUG) {
                        $data = [
                            'success'     => $response->isSuccessful,
                            'code'        => $response->data['code'],
                            'message'     => $response->data['message'],
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
