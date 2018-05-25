<?php

namespace app\extensions\auth;

use Yii;
use yii\base\ActionFilter;
use yii\helpers\ArrayHelper;
use Firebase\JWT\JWT;
use app\extensions\ApiException;

/**
 * JwtAuth
 *
 * 示例展示：
 *
 * ```php
 * public function behaviors()
 * {
 *      return [
 *          'tokenValidate' => [
 *              'class' => JwtAuth::className(),
 *          ]
 *      ];
 * }
 * ```
 *
 * @author hongbin.chen <87003637@qq.com>
 * @data 2017-03-23 10:56 am
 */
class JwtAuth extends ActionFilter
{
    /**
     * @var 参数
     */
    public $param = 'data';

    public function beforeAction($action)
    {
        if (Yii::$app->request->isGet) {
            $data = Yii::$app->request->get($this->param, '');
            if (empty($data)) {
                throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
            }
            try {
                Yii::$app->request->setQueryParams($this->decode($data));
            } catch (\Exception $e) {
                throw new ApiException(ApiException::SYSTEM_PARAM_ERROR);
            }
        } elseif (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post($this->param, '');
            if (empty($data)) {
                throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
            }
            try {
                Yii::$app->request->setBodyParams($this->decode($data));
            } catch (\Exception $e) {
                throw new ApiException(ApiException::SYSTEM_PARAM_ERROR);
            }
        } else {
            throw new ApiException(ApiException::SYSTEM_METHOD_ERROR);
        }

        return true;
    }

    /**
     * 解码
     */
    private function decode($data)
    {
        $data = JWT::decode($data, Yii::$app->params['jwt']['key'], Yii::$app->params['jwt']['allowed_algs']);
        $data = ArrayHelper::toArray($data);

        return $data;
    }
}
