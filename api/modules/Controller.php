<?php
/**
 * 脚手架
 *
 * PHP version 7
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */

namespace api\modules;

use Yii;
use yii\web\Response;

/**
 * BaseController
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
abstract class Controller extends \yii\rest\Controller
{
    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'list',
    ];

    /**
     * 行为
     *
     * @return array
     */
    public function behaviors()
    {
        $behaviors = parent::behaviors();

        unset($behaviors['authenticator'], $behaviors['rateLimiter']);

        $behaviors['contentNegotiator'] = [
            'class' => 'yii\filters\ContentNegotiator',
            'formats' => [
                'application/json'       => Response::FORMAT_JSON,
                'application/javascript' => Response::FORMAT_JSONP,
            ]
        ];

        $behaviors['tokenValidate'] = [
            'class' => 'api\filters\auth\JwtAuth',
            'except' => $this->isDebug ? ['*'] : []
        ];

        $behaviors['timestampValidate'] = [
            'class' => 'api\filters\auth\TimestampAuth',
            'except' => $this->isDebug ? ['*'] : []
        ];

        $behaviors['authValidate'] = [
            'class' => 'api\filters\auth\AccessTokenAuth',
            'except'  => $this->isDebug ? ['*'] : []
        ];

        $behaviors['rateLimiter'] = [
            'class' => 'api\filters\auth\RateLimiterAuth',
            'enableRateLimitHeaders' => true,
            'except'  => $this->isDebug ? ['*'] : []
        ];

        return $behaviors;
    }

    /**
     * 当在开发环境下使用GET方式传入的`__debug__`参数为1时，isDebug属性为true
     * 此时大部分behaviors将不会执行 e.g:
     * ```php
     *  $behaviors['authValidate'] = [
     *      'class' => 'api\extensions\auth\AccessTokenAuth',
     *      'except'  => $this->isDebug ? ['*'] : [] //except属性对isDebug进行支持
     *  ];
     * ```
     *
     * @return bool
     */
    public function getIsDebug()
    {
        return YII_DEBUG && Yii::$app->request->get('__debug__') == 1;
    }

    /**
     * 动词定义
     *
     * @return array
     */
    protected function verbs()
    {
        return [
            'index'  => ['GET'],
            'view'   => ['GET'],
            'create' => ['POST'],
            'update' => ['PUT', 'PATCH'],
            'delete' => ['DELETE'],
        ];
    }
}
