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
use yii\helpers\ArrayHelper;
use Firebase\JWT\JWT;
use api\base\ApiException;

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
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class JwtAuth extends ActionFilter
{
    public $param = 'data';

    /**
     * 前置动作
     *
     * @param \yii\base\Action $action 动作
     *
     * @return bool|void
     * @throws ApiException
     */
    public function beforeAction($action)
    {
        if (!$this->isActive($action)) {
            return;
        }

        if (Yii::$app->request->isGet) {
            $data = Yii::$app->request->get($this->param, '');
            if (empty($data)) {
                throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
            }
            try {
                Yii::$app->request->setQueryParams($this->_decode($data));
            } catch (\Exception $e) {
                throw new ApiException(ApiException::SYSTEM_PARAM_ERROR);
            }
        } elseif (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post($this->param, '');
            if (empty($data)) {
                throw new ApiException(ApiException::SYSTEM_ILLEGAL_REQUEST);
            }
            try {
                Yii::$app->request->setBodyParams($this->_decode($data));
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
     *
     * @param string $data 数据
     *
     * @return array|object
     */
    private function _decode($data)
    {
        $data = JWT::decode($data, Yii::$app->params['jwt']['key'], Yii::$app->params['jwt']['allowed_algs']);
        $data = ArrayHelper::toArray($data);

        return $data;
    }
}
