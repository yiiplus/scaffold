<?php

namespace app\components;

use yii\base\Component;
use \Firebase\JWT\JWT as FJWT;

class Jwt extends Component
{
    public $salt;

    public $algorithms = [
        'HS256'
    ];

    public function decode($jwt)
    {
        return FJWT::decode($jwt, $this->salt, $this->algorithms);
    }

    public function encode($token)
    {
        return FJWT::encode($token, $this->salt);
    }
}