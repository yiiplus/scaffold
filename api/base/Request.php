<?php
/**
 * yiiplus/scaffold
 *
 * @category  PHP
 * @package   Yii2
 * @copyright 2018-2019 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt Apache 2.0
 * @link      http://www.yiiplus.com
 */

namespace api\base;

use Yii;

/**
 * The web Request class represents an HTTP request.
 *
 * It encapsulates the $_SERVER variable and resolves its inconsistency among different Web servers.
 * Also it provides an interface to retrieve request parameters from $_POST, $_GET, $_COOKIES and REST
 * parameters sent via other HTTP methods like PUT or DELETE.
 *
 * Request is configured as an application component in [[\yii\web\Application]] by default.
 * You can access that instance via `Yii::$app->request`.
 *
 * For more details and usage information on Request, see the [guide article on requests](guide:runtime-requests).
 *
 * @author Geng Xiankun <gengxiankun@126.com>
 */
class Request extends \yii\web\Request
{
    public $format = 'json';

    private $_queryParams;

    /**
     * Resolves the current request into a route and the associated parameters.
     * @return array the first element is the route, and the second is the associated parameters.
     * @throws ApiException if the request cannot be resolved.
     */
    public function resolve()
    {
        Yii::$app->response->format = $this->format;

        $result = Yii::$app->getUrlManager()->parseRequest($this);
        if ($result !== false) {
            list($route, $params) = $result;

            if ($this->_queryParams === null) {
                $_GET = $params + $_GET; // preserve numeric keys
            } else {
                $this->_queryParams = $params + $this->_queryParams;
            }

            return [$route, $this->getQueryParams()];
        }

        throw new ApiException(ApiException::SYSTEM_NOT_FOUND);
    }
}
