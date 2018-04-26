<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-admin',
    'name' => 'Admin管理系统',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'layout' => '@yiiplus/desktop/views/layouts/main.php',
    'modules' => [
        'admin' => [
            'class' => 'yiiplus\desktop\Module',
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-admin',
        ],
        'user' => [
            'identityClass' => 'yiiplus\desktop\models\User',
            'loginUrl' => ['admin/user/login'],
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-admin', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the admin
            'name' => 'advanced-admin',
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
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'defaultRoles' => ['guest'],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
    ],
    'as access' => [
        'class' => 'yiiplus\desktop\components\AccessControl',
        'allowActions' => [
            'admin/user/login',
            'admin/user/logout',
        ]
    ],
    'params' => $params,
];
