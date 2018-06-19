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

namespace common\db;

use yii\behaviors\TimestampBehavior;

/**
 * ActiveRecord is the base class for classes representing relational data in terms of objects.
 *
 * @category  PHP
 * @package   Yii2
 * @author    Hongbin Chen <87003637@qq.com>
 * @copyright 2006-2018 YiiPlus Ltd
 * @license   https://github.com/yiiplus/scaffold/licence.txt BSD Licence
 * @link      http://www.yiiplus.com
 */
class ActiveRecord extends \yii\db\ActiveRecord
{
    /**
     * NOT_DELETED是删除状态，它表示这条数据未被删除
     */
    const NOT_DELETED = 0;

    /**
     * ACTIVE_DELETE是删除状态，它表示这条数据被主动删除
     */
    const ACTIVE_DELETE = 1;

    /**
     * BACKGROUND_DELETE是删除状态，它表示这台数据被后台删除
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
     * This method provides a convenient shortcut for:
     *
     * ```php
     * if (isset($_POST['FormName'])) {
     *     $model->attributes = $_POST['FormName'];
     *     if ($model->save()) {
     *         // handle success
     *     }
     * }
     * ```
     *
     * which, with `load()` can be written as:
     *
     * ```php
     * if ($model->load($_POST) && $model->save()) {
     *     // handle success
     * }
     * ```
     *
     * `load()` gets the `'FormName'` from the model's [[formName()]] method (which you may override), unless the
     * `$formName` parameter is given. If the form name is empty, `load()` populates the model with the whole of `$data`,
     * instead of `$data['FormName']`.
     *
     * Note, that the data being populated is subject to the safety check by [[setAttributes()]].
     *
     * @param array $data the data array to load, typically `$_POST` or `$_GET`.
     * @param string $formName the form name to use to load the data into the model.
     * If not set, [[formName()]] is used.
     * @return bool whether `load()` found the expected form in `$data`.
     */
    public function load($data, $formName = '')
    {
        return parent::load($data, $formName);
    }
}
