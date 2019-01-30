<?php
return [
    'bootstrap' => [
        'websocket',
    ],
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=mysql;dbname=yiiplus',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'websocket' => [
            'class' => 'yiiplus\websocket\workerman\WebSocket',
            'host' => '',
            'port' => '9501',
            'channels' => [
                'push' => '\common\channels\PushChannel',
            ],
        ],
    ],
];
