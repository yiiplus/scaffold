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

namespace app\base;

use yii\base\Exception;

/**
 * ApiException 接口异常对照
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class ApiException extends Exception
{
    const SYSTEM_ERROR              = 100001;
    const SYSTEM_PARAM_ERROR        = 100002;
    const SYSTEM_ILLEGAL_REQUEST    = 100003;
    const SYSTEM_REQUEST_TIMEOUT    = 100004;
    const SYSTEM_TIMESTAMP_NULL     = 100005;
    const SYSTEM_TIMESTAMP_EXPIRE   = 100006;
    const SYSTEM_ACCESS_TOKEN_NULL  = 100007;
    const SYSTEM_UNAUTHORIZED       = 100008;
    const SYSTEM_NOT_FOUND          = 100009;
    const SYSTEM_METHOD_ERROR       = 100010;
    const SYSTEM_IP_ILLEGAL         = 100011;
    const SYSTEM_IP_LIMIT           = 100012;
    const SYSTEM_USER_LIMIT         = 100013;
    const SYSTEM_USER_VIP_LIMIT     = 100014;

    private $_messages = [
        self::SYSTEM_ERROR             => '系统错误',
        self::SYSTEM_PARAM_ERROR       => '参数错误',
        self::SYSTEM_ILLEGAL_REQUEST   => '非法请求',
        self::SYSTEM_REQUEST_TIMEOUT   => '请求超时',
        self::SYSTEM_TIMESTAMP_NULL    => '缺少 (timestamp) 参数',
        self::SYSTEM_TIMESTAMP_EXPIRE  => '请求已过期',
        self::SYSTEM_ACCESS_TOKEN_NULL => '缺少 (access token) 参数',
        self::SYSTEM_UNAUTHORIZED      => '接口未授权',
        self::SYSTEM_NOT_FOUND         => '接口不存在',
        self::SYSTEM_METHOD_ERROR      => '请求的HTTP METHOD不支持，请检查是否选择了正确的POST/GET方式',
        self::SYSTEM_IP_ILLEGAL        => 'IP限制不能请求该资源',
        self::SYSTEM_IP_LIMIT          => 'IP请求频次超过上限',
        self::SYSTEM_USER_LIMIT        => '用户请求频次超过上限',
        self::SYSTEM_USER_VIP_LIMIT    => '用户请求特殊接口 (%s) 频次超过上限',
    ];

    /**
     * ApiException constructor
     *
     * @param int $code 错误编码
     */
    public function __construct($code = self::SYSTEM_ERROR)
    {
        if (!isset($this->_messages[$code])) {
            $code = self::SYSTEM_ERROR;
        }

        parent::__construct($this->_messages[$code], $code);
    }
}
