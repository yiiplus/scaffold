<?php
namespace app\extensions\auth;

use Yii;
use yii\filters\auth\AuthMethod;
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
 * @data   2017-03-23 10:56 am
 */
class AccessTokenAuth extends AuthMethod
{

    /**
     * @var string the parameter name for passing the access token
     */
    public $tokenParam = 'access-token';

    public function beforeAction($action)
    {
        if (!$this->isActive($action)) {
            return;
        }

        try {
            $identity = $this->authenticate(
                $this->user ?: Yii::$app->getUser(),
                $this->request ?: Yii::$app->getRequest(),
                Yii::$app->getResponse()
            );
        } catch (ApiException $e) {
            if ($this->isOptional($action)) {
                return true;
            }

            throw $e;
        }

        if ($identity !== null || $this->isOptional($action)) {
            return true;
        }

        throw new ApiException(ApiException::USER_LOGIN_FAIL);
    }

    /**
     * {@inheritdoc}
     */
    public function authenticate($user, $request, $response)
    {
        if (Yii::$app->request->isGet) {
            $token = $request->get($this->tokenParam, '');
            if (empty($token)) {
                throw new ApiException(ApiException::SYSTEM_ACCESS_TOKEN_NULL);
            }
        } elseif (Yii::$app->request->isPost) {
            $token = $request->post($this->tokenParam, '');
            if (empty($token)) {
                throw new ApiException(ApiException::SYSTEM_ACCESS_TOKEN_NULL);
            }
        } else {
            throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
        }

        if (is_string($token)) {
            $identity = $user->loginByAccessToken($token, get_class($this));
            if ($identity !== null) {
                return $identity;
            }
        }

        return null;
    }
}
