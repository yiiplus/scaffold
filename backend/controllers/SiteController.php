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

namespace app\controllers;

/**
 * Site controller
 *
 * @author Hongbin Chen <87003637@qq.com>
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
