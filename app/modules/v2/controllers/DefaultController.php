<?php

namespace app\modules\v2\controllers;

/**
 * Default controller for the `tradition` module
 */
class DefaultController extends BaseController
{
    /**
     * Renders the index view for the module
     * @return string
     */
    public function actionIndex()
    {
        return ['hello cloudnative!'];
    }
}
