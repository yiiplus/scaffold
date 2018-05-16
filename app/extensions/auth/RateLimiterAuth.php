<?php
namespace app\extensions\auth;

use Yii;
use yii\filters\RateLimiter;
use app\extensions\ApiException;

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
 *              'class' => 'app\extensions\auth\RateLimiterAuth',
 *          ]
 *      ];
 * }
 * ```
 */
class RateLimiterAuth extends RateLimiter
{

}