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
        try {
            return parent::beforeAction($action);
        } catch (\Exception $exception) {
            throw new ApiException(ApiException::SYSTEM_UNAUTHORIZED);
        }
    }
}