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

/**
 * The manifest of files that are local to specific environment.
 * This file returns a list of environments that the application
 * may be installed under. The returned data must be in the following
 * format:
 *
 * ```php
 * return [
 *     'environment name' => [
 *         'path' => 'directory storing the local files',
 *         'skipFiles'  => [
 *             // list of files that should only copied once and skipped if they already exist
 *         ],
 *         'setWritable' => [
 *             // list of directories that should be set writable
 *         ],
 *         'setExecutable' => [
 *             // list of files that should be set executable
 *         ],
 *         'setCookieValidationKey' => [
 *             // list of config files that need to be inserted with automatically generated cookie validation keys
 *         ],
 *         'createSymlink' => [
 *             // list of symlinks to be created. Keys are symlinks, and values are the targets.
 *         ],
 *     ],
 * ];
 * ```
 */
return [
    'Development' => [
        'path' => 'dev',
        'setWritable' => [
            'h5/runtime',
            'h5/web/assets',
            'pc/runtime',
            'pc/web/assets',
            'app/runtime',
            'admin/runtime',
            'admin/web/assets',
        ],
        'setExecutable' => [
            'yii',
        ],
        'setCookieValidationKey' => [
            'h5/config/main-local.php',
            'pc/config/main-local.php',
            'app/config/main-local.php',
            'admin/config/main-local.php',
        ],
    ],
    'Test' => [
        'path' => 'test',
        'setWritable' => [
            'h5/runtime',
            'h5/web/assets',
            'pc/runtime',
            'pc/web/assets',
            'app/runtime',
            'admin/runtime',
            'admin/web/assets',
        ],
        'setExecutable' => [
            'yii',
            'yii_test',
        ],
        'setCookieValidationKey' => [
            'h5/config/main-local.php',
            'pc/config/main-local.php',
            'app/config/main-local.php',
            'admin/config/main-local.php',
        ],
    ],
    'Production' => [
        'path' => 'prod',
        'setWritable' => [
            'h5/runtime',
            'h5/web/assets',
            'pc/runtime',
            'pc/web/assets',
            'app/runtime',
            'admin/runtime',
            'admin/web/assets',
        ],
        'setExecutable' => [
            'yii',
        ],
        'setCookieValidationKey' => [
            'h5/config/main-local.php',
            'pc/config/main-local.php',
            'app/config/main-local.php',
            'admin/config/main-local.php',
        ],
    ],
];
