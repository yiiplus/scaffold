<?php
/**
 * 脚手架
 *
 * PHP version 7
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <hongbin.chen@aliyun.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */

return [
    'adminEmail' => 'admin@example.com',
    'supportEmail' => 'support@example.com',
    'user.passwordResetTokenExpire' => 3600,

    // 缓存对照
    // $cacheSchema = Yii::$app->params['cacheSchema']['userInfo'];
    // $data = Yii::$app->cache->get($cacheSchema['prefix'] . $uid);
    // if ($data === false) {
    //    $data = 'HelloWorld' . time();
    //    Yii::$app->cache->set($cacheSchema['prefix'] . $uid, $data, $cacheSchema['expire']);
    // }
    'cacheSchema' => [
        // 用户基本信息
        'userInfo' => [
            'prefix' => 'user_info_', // user_info_{$uid}
            'expire' => 5, // 过期时间5秒
        ],
    ],
];
