<?php
namespace app\extensions;

use Yii;
use yii\base\Exception;

class ApiException extends Exception
{
    public const SYSTEM_ERROR              = 100001;
    public const SYSTEM_PARAM_ERROR        = 100002;
    public const SYSTEM_ILLEGAL_REQUEST    = 100003;
    public const SYSTEM_REQUEST_TIMEOUT    = 100004;
    public const SYSTEM_TIMESTAMP_NULL     = 100005;
    public const SYSTEM_TIMESTAMP_EXPIRE   = 100006;
    public const SYSTEM_ACCESS_TOKEN_NULL  = 100007;
    public const SYSTEM_UNAUTHORIZED       = 100008;
    public const SYSTEM_NOT_FOUND          = 100009;
    public const SYSTEM_METHOD_ERROR       = 100010;
    public const SYSTEM_IP_ILLEGAL         = 100011;
    public const SYSTEM_IP_LIMIT           = 100012;
    public const SYSTEM_USER_LIMIT         = 100013;
    public const SYSTEM_USER_VIP_LIMIT     = 100014;

    private static $messages = [
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

    public function __construct ($code = self::SYSTEM_ERROR, \Exception $previous = null)
    {
        if(!isset(self::$messages[$code])) {
            $code = self::SYSTEM_ERROR;
        }
        parent::__construct(self::$messages[$code], $code, $previous);
    }
}