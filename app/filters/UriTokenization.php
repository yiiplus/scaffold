<?php

namespace app\filters;

use Yii;
use yii\base\ActionFilter;
use yii\helpers\ArrayHelper;

/**
 * UriTokenization是一个Uri过滤器，它将提供Uri与Token之间的互相转换
 * 它现支持JWT规范的Tokeniza，依赖JWT应用组件提供JWT与Uri的相互转换
 *
 * 示例展示：
 *
 * ```php
 * public function behaviors()
 * {
 *      return [
 *          'uriTokenization' => [
 *              'class' => UriTokenization::className(),
 *              'tokenForm' => 'JWT'
 *          ]
 *      ];
 * }
 * ```
 *
 * @author xiankun Geng <gengxiankun@hoolai.com>
 * @data 2017-03-23 10:56 am
 */
class UriTokenization extends ActionFilter
{
    /**
     * @var string token形式，默认使用JWT（JSON WEB TOKEN）形式的TOKEN。
     */
    public $tokenForm = 'JWT';
    /**
     * @var string the parameter name for passing the uri token
     */
    public $tokenParam = 'data';
    /**
     * @var string pass whether to debug the parameter name
     */
    public $isDebug = 'debug';
    /**
     * @var string
     */
    public $authTokenParam = 'access-token';

    /**
     * {@inheritdoc}
     */
    public function beforeAction($action)
    {
        // 调试模式下可以同时接受get\post两种方式的uri
        $isDebug = Yii::$app->request->get($this->isDebug, 0);
        if (YII_DEBUG && $isDebug === 1) {
            unset($_GET[$this->debugParam]);
            $bodyParams = yii\helpers\ArrayHelper::merge($_GET, $_POST);
            Yii::$app->request->setBodyParams($bodyParams);
            return true;
        }

        // Token验证
        $uriToken = Yii::$app->request->post($this->tokenParam, '');
        // 如果Token为空，则认为其他POST方式的请求均为非法
        if (empty($uriToken) && isset($_POST)){
            return false;
        }
        switch ($this->tokenForm) {
            case 'JWT':
                $uri = $this->tokenizationWithJwt($uriToken);
                break;
            default:
                return true;
                break;
        }

        $this->reductionQueryParams($uri);
        return true;
    }

    /**
     * 这个方法遵循JWT规范解密Token；它依赖jwt应用组件，需要提前配置`salt`
     * @param $uriToken 需解密的Token
     * @return array 返回解密成功的数组
     */
    protected function tokenizationWithJwt($uriToken)
    {
        $jwt = Yii::$app->jwt;
        return ArrayHelper::toArray($jwt->decode($uriToken));
    }

    /**
     * 将token里的请求参数还原，如果参数里面存在`$this->authTokenParam`，将此参数传入`$_GET`，他将接受`QueryParamAuth`的授权验证
     * @param null $uri
     */
    protected function reductionQueryParams($uri = null)
    {
        if ($uri[$this->authTokenParam]) {
            Yii::$app->request->setQueryParams([$this->authTokenParam => $uri[$this->authTokenParam]]);
            unset($uri[$this->authTokenParam]);
        }
        Yii::$app->request->setBodyParams($uri);
    }
}