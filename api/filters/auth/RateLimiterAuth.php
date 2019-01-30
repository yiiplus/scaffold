<?php
/**
 * yiiplus/scaffold
 *
 * @category  PHP
 * @package   Yii2
 * @copyright 2018-2019 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt Apache 2.0
 * @link      http://www.yiiplus.com
 */

namespace api\filters\auth;

use Yii;
use yii\filters\RateLimiter;
use api\base\ApiException;

/**
 * RateLimiterAuth
 *
 * 示例展示：
 *
 * ```php
 * public function behaviors()
 * {
 *      return [
 *          'rateLimiter' => [
 *              'class' => RateLimiterAuth::className(),
 *          ]
 *      ];
 * }
 * ```
 *
 * @author Hongbin Chen <87003637@qq.com>
 */
class RateLimiterAuth extends RateLimiter
{
    /**
     * 前置动作
     *
     * @param \yii\base\Action $action 动作
     *
     * @return bool|void
     */
    public function beforeAction($action)
    {
        if (!$this->isActive($action)) {
            return;
        }

        return parent::beforeAction($action);
    }
}
