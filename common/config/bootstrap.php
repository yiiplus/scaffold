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

Yii::setAlias('@base', dirname(dirname(__DIR__)));
Yii::setAlias('@common', dirname(__DIR__));
Yii::setAlias('@console', dirname(dirname(__DIR__)) . '/console');
Yii::setAlias('@admin', dirname(dirname(__DIR__)) . '/admin');
Yii::setAlias('@app', dirname(dirname(__DIR__)) . '/app');
Yii::setAlias('@pc', dirname(dirname(__DIR__)) . '/pc');
Yii::setAlias('@h5', dirname(dirname(__DIR__)) . '/h5');
