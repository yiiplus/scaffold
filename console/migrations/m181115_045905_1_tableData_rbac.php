<?php

class m181115_045905_1_tableData_rbac extends \yii\db\Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->batchInsert('{{%auth_item}}', 
            ['name', 'type', 'description', 'rule_name', 'data', 'created_at', 'updated_at'],
            [
                ['/*', 2, null, null, null, 1487816675, 1487816675],
                ['/admin/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/assignment/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/assignment/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/assignment/assign', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/assignment/revoke', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/assignment/view', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/delete', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/update', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/menu/view', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/assign', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/delete', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/remove', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/update', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/permission/view', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/assign', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/delete', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/remove', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/update', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/role/view', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/assign', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/refresh', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/route/remove', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/delete', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/update', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/rule/view', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/*', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/activate', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/create', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/delete', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/inactive', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/index', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/login', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/logout', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/reset-password', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/update', 2, null, null, null, 1487816732, 1487816732],
                ['/admin/user/view', 2, null, null, null, 1487816732, 1487816732],
                ['/site/*', 2, null, null, null, 1487816732, 1487816732],
                ['/site/error', 2, null, null, null, 1487816732, 1487816732],
                ['/site/index', 2, null, null, null, 1487816732, 1487816732],
                ['超级管理员', 1, null, null, null, 1487817275, 1487817275],
            ]
        );

        $this->batchInsert('{{%auth_item_child}}', 
            ['parent', 'child'],
            [
                ['超级管理员', '/*'],
                ['超级管理员', '/admin/*'],
                ['超级管理员', '/admin/assignment/*'],
                ['超级管理员', '/admin/assignment/index'],
                ['超级管理员', '/admin/assignment/assign'],
                ['超级管理员', '/admin/assignment/revoke'],
                ['超级管理员', '/admin/assignment/view'],
                ['超级管理员', '/admin/menu/*'],
                ['超级管理员', '/admin/menu/create'],
                ['超级管理员', '/admin/menu/delete'],
                ['超级管理员', '/admin/menu/index'],
                ['超级管理员', '/admin/menu/update'],
                ['超级管理员', '/admin/menu/view'],
                ['超级管理员', '/admin/permission/*'],
                ['超级管理员', '/admin/permission/assign'],
                ['超级管理员', '/admin/permission/create'],
                ['超级管理员', '/admin/permission/delete'],
                ['超级管理员', '/admin/permission/index'],
                ['超级管理员', '/admin/permission/remove'],
                ['超级管理员', '/admin/permission/update'],
                ['超级管理员', '/admin/permission/view'],
                ['超级管理员', '/admin/role/*'],
                ['超级管理员', '/admin/role/assign'],
                ['超级管理员', '/admin/role/create'],
                ['超级管理员', '/admin/role/delete'],
                ['超级管理员', '/admin/role/index'],
                ['超级管理员', '/admin/role/remove'],
                ['超级管理员', '/admin/role/update'],
                ['超级管理员', '/admin/role/view'],
                ['超级管理员', '/admin/route/*'],
                ['超级管理员', '/admin/route/assign'],
                ['超级管理员', '/admin/route/create'],
                ['超级管理员', '/admin/route/index'],
                ['超级管理员', '/admin/route/refresh'],
                ['超级管理员', '/admin/route/remove'],
                ['超级管理员', '/admin/rule/*'],
                ['超级管理员', '/admin/rule/create'],
                ['超级管理员', '/admin/rule/delete'],
                ['超级管理员', '/admin/rule/index'],
                ['超级管理员', '/admin/rule/update'],
                ['超级管理员', '/admin/rule/view'],
                ['超级管理员', '/admin/user/*'],
                ['超级管理员', '/admin/user/activate'],
                ['超级管理员', '/admin/user/create'],
                ['超级管理员', '/admin/user/delete'],
                ['超级管理员', '/admin/user/inactive'],
                ['超级管理员', '/admin/user/index'],
                ['超级管理员', '/admin/user/login'],
                ['超级管理员', '/admin/user/logout'],
                ['超级管理员', '/admin/user/reset-password'],
                ['超级管理员', '/admin/user/update'],
                ['超级管理员', '/admin/user/view'],
                ['超级管理员', '/site/*'],
                ['超级管理员', '/site/error'],
                ['超级管理员', '/site/index'],
            ]
        );

        $this->batchInsert('{{%auth_assignment}}', 
            ['item_name', 'user_id', 'created_at'],
            [
                ['超级管理员', '1', 1487817340],
            ]
        );
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {

    }
}
