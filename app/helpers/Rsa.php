<?php

namespace common\helpers;

use Yii;

class Rsa
{
    private static $PRIVATE_KEY ;
    private static $PUBLIC_KEY ;
    /**
     *返回对应的私钥
     */
    private static function getPrivateKey(){
        if(!self::$PRIVATE_KEY){
            self::$PRIVATE_KEY = Yii::$app->params["rsa"]["privatekey"];
        }
        $privKey = self::$PRIVATE_KEY;
        return openssl_pkey_get_private($privKey);
    }

    /**
     *返回对应的私钥
     */
    private static function getPublicKey(){
        if(!self::$PUBLIC_KEY){
            self::$PUBLIC_KEY = Yii::$app->params["rsa"]["publickey"];
        }
        $publicKey = self::$PUBLIC_KEY;

        return openssl_pkey_get_public($publicKey);
    }

    /**
     * 公钥加密
     */
    public static function pubEncrypt($data)
    {
        if(!is_string($data)){
            return null;
        }
        return openssl_public_encrypt($data,$encrypted,self::getPublicKey())? base64_encode($encrypted) : null;
    }

    /**
     * 公钥解密
     */
    public static function pubDecrypt($encrypted)
    {
        if(!is_string($encrypted)){
            return null;
        }
        return (openssl_public_decrypt(base64_decode($encrypted), $decrypted, self::getPublicKey()))? $decrypted : null;
    }



    /**
     * 私钥加密
     */
    public static function privEncrypt($data)
    {
        if(!is_string($data)){
            return null;
        }
        return openssl_private_encrypt($data,$encrypted,self::getPrivateKey())? base64_encode($encrypted) : null;
    }


    /**
     * 私钥解密
     */
    public static function privDecrypt($encrypted)
    {
        if(!is_string($encrypted)){
            return null;
        }
        return (openssl_private_decrypt(base64_decode($encrypted), $decrypted, self::getPrivateKey()))? $decrypted : null;
    }
}