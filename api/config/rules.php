<?php

return [
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
