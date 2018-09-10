<?php
/**
 * 脚手架
 *
 * PHP version 7
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <hongbin.chen@aliyun.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */

namespace common\db;

use yii\behaviors\TimestampBehavior;

/**
 * ActiveRecord is the base class for classes representing relational data in terms of objects.
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <hongbin.chen@aliyun.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class ActiveRecord extends \yii\db\ActiveRecord
{
    /**
     * 未删除
     */
    const UNDELETED = 0;

    /**
     * 前端用户主动删除
     */
    const FRONTEND_DELETE = 1;

    /**
     * 运营后台被动删除
     */
    const BACKGROUND_DELETE = 2;

    /**
     * 行为
     *
     * @return array
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }
    
    /**
     * Populates the model with input data.
     *
     * @param array  $data     the data array to load, typically `$_POST` or `$_GET`.
     * @param string $formName the form name to use to load the data into the model.If not set, [[formName()]] is used.
     *
     * @return bool             whether `load()` found the expected form in `$data`.
     */
    public function load($data, $formName = '')
    {
        return parent::load($data, $formName);
    }
}
