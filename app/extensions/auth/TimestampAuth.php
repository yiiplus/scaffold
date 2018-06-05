<?php

namespace app\extensions\auth;

use Yii;
use yii\base\ActionFilter;
use app\extensions\ApiException;

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
 * @author hongbin.chen <87003637@qq.com>
 * @data   2017-03-23 10:56 am
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
     * {@inheritdoc}
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
