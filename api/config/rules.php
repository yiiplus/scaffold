<?php

return [
    'modules' => [
        'v1' => [
            'class' => 'api\modules\v1\Module',
            'modules' => [
                'user'   => ['class' => 'api\modules\v1\modules\user\Module'],
            ],
        ],
    ],
	'components' => [
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule',
                    'pluralize' => false,
                    'controller' => 'v1/user/account',
                    'extraPatterns' => [
                        'GET login'  => 'login',
                        'GET logout' => 'logout',
                        'GET error'  => 'error',
                    ],
                ],
            ],
        ],
	],
];
