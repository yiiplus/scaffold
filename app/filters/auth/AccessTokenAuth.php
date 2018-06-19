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

namespace app\filters\auth;

use Yii;
use yii\filters\auth\AuthMethod;
use app\base\ApiException;

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
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class AccessTokenAuth extends AuthMethod
{
    public $tokenParam = 'access-token';

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
     * 授权检查
     *
     * @param \yii\web\User     $user     用户
     * @param \yii\web\Request  $request  请求
     * @param \yii\web\Response $response 响应
     *
     * @return null|\yii\web\IdentityInterface
     * @throws ApiException
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
