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
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 * @link      http://www.yiiplus.com
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
