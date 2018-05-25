<?php
namespace app\extensions\auth;

use Yii;
use yii\filters\auth\QueryParamAuth;
use app\extensions\ApiException;

/**
 * AccessTokenAuth
 *
 * 示例展示：
 *
 * ```php
 * public function behaviors()
 * {
 *      return [
 *          'authValidate' => [
 *              'class' => AccessTokenAuth::className(),
 *          ]
 *      ];
 * }
 * ```
 *
 * @author hongbin.chen <87003637@qq.com>
 * @data 2017-03-23 10:56 am
 */
class AccessTokenAuth extends QueryParamAuth
{
    public function beforeAction($action)
    {
        if (Yii::$app->request->isGet) {
            $token = Yii::$app->request->get($this->tokenParam, '');
            if (empty($token)) {
                throw new ApiException(ApiException::SYSTEM_ACCESS_TOKEN_NULL);
            }
        } elseif (Yii::$app->request->isPost) {
            $token = Yii::$app->request->post($this->tokenParam, '');
            if (empty($token)) {
                throw new ApiException(ApiException::SYSTEM_ACCESS_TOKEN_NULL);
            }
        } else {
            throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
        }

        try {
            return parent::beforeAction($action);
        } catch (\Exception $exception) {
            throw new ApiException(ApiException::SYSTEM_UNAUTHORIZED);
        }
    }
}
