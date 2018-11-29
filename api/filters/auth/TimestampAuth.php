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
use yii\base\ActionFilter;
use api\base\ApiException;

/**
 * TimestampAuth
 *
 * 示例展示：
 *
 * ```php
 * public function behaviors()
 * {
 *      return [
 *          'timestampValidate' => [
 *              'class' => TimestampAuth::className(),
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
 */
class TimestampAuth extends ActionFilter
{
    /**
     * 时间戳参数
     *
     * @var string
     */
    public $param = 'timestamp';

    /**
     * 请求时长 (秒)
     *
     * @var integer
     */
    public $timeout = 30;

    /**
     * 前置动作
     *
     * @param \yii\base\Action $action 动作
     *
     * @return void
     */
    public function beforeAction($action)
    {
        if (!$this->isActive($action)) {
            return;
        }

        if (Yii::$app->request->isGet) {
            $timestamp = Yii::$app->request->get($this->param, '');
            if (empty($timestamp)) {
                throw new ApiException(ApiException::SYSTEM_TIMESTAMP_NULL);
            }
        } elseif (Yii::$app->request->isPost) {
            $timestamp = Yii::$app->request->post($this->param, '');
            if (empty($timestamp)) {
                throw new ApiException(ApiException::SYSTEM_TIMESTAMP_NULL);
            }
        } else {
            throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
        }
        
        $now = time();
        if ($now > $timestamp + $this->timeout) {
            throw new ApiException(ApiException::SYSTEM_TIMESTAMP_EXPIRE);
        }
        
        return true;
    }
}
