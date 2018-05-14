<?php
namespace app\extensions;

use Yii;
use yii\base\Exception;

class ApiException extends Exception
{
    public const SYSTEM_ERROR           = 100001;
    public const SYSTEM_PARAM_ERROR     = 100002;
    public const SYSTEM_ILLEGAL_REQUEST = 100003;
    public const SYSTEM_REQUEST_TIMEOUT = 100004;
    public const SYSTEM_TIMESTAMP_NULL  = 100005;
    public const SYSTEM_UNAUTHORIZED    = 100006;

    private static $messages = [
        self::SYSTEM_ERROR => '系统错误',
        self::SYSTEM_PARAM_ERROR => '参数错误',
        self::SYSTEM_ILLEGAL_REQUEST => '非法请求',
        self::SYSTEM_REQUEST_TIMEOUT => '请求超时',
        self::SYSTEM_TIMESTAMP_NULL => '缺少 (timestamp) 参数',
        self::SYSTEM_UNAUTHORIZED => '未经授权',
    ];

    public function __construct ($code = self::SYSTEM_ERROR, \Exception $previous = null)
    {
        if(!isset(self::$messages[$code])) {
            $code = self::SYSTEM_ERROR;
        }
        parent::__construct(self::$messages[$code], $code, $previous);
    }
}