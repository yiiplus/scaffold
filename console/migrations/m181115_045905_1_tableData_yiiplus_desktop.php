<?php

class m181115_045905_1_tableData_yiiplus_desktop extends \yii\db\Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->batchInsert('{{%yp_desktop_user}}', 
            ['id', 'username', 'auth_key', 'password_hash', 'password_reset_token', 'email', 'status', 'created_at', 'updated_at'],
            [
                [1, 'webmaster', 'UKpH8-7IxZXSLzcOU7ooSaUHwPYq9BLp', '$2y$13$HylJs5OBsNBcnI4DCVQuqeGeIvr1/JqXrkOnhRtDKJsRoGGAfRu5e', null, 'webmaster@example.com', 10, 1504106471, 1504106471],
            ]
        );
        $this->batchInsert('{{%yp_desktop_menu}}', 
            ['id', 'name', 'parent', 'route', 'icon', 'order', 'data'],
            [
                [1, '仪表盘', null, '/', 'dashboard', 100, ''],
                [2, '系统设置', null, null, 'cog', 200, ''],
                [3, '菜单列表', 2, '/admin/menu/index', 'list', 1, ''],
                [4, '操作日志', 2, '/admin/log/index', 'file', 2, ''],
                [5, '用户管理', 2, '/admin/user/index', 'user', 2, ''],
                [6, '角色列表', 2, '/admin/role/index', 'users', 3, ''],
                [7, '访问控制', 2, null, 'laptop', 4, ''],
                [8, '路由列表', 7, '/admin/route/index', 'circle', 61, ''],
                [9, '规则列表', 7, '/admin/rule/index', 'circle', 62, ''],
                [10, '权限列表', 7, '/admin/permission/index', 'circle', 63, ''],
            ]
        );

        if(YII_ENV_DEV) {
            $this->batchInsert('{{%yp_desktop_menu}}', 
                ['name', 'parent', 'route', 'icon', 'order', 'data'],
                [
                    ['GII', null, '/admin/gii/default/index', 'circle', 997, ''],
                    ['迁移', null, '/admin/migrations/default/index', 'circle', 998, ''],
                    ['调试', null, '/debug/default/index', 'circle', 999, ''],
                ]
            );
        }
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->delete('{{%yp_desktop_user}}', [
            'id' => 1
        ]);
        $this->delete('{{%yp_desktop_menu}}', [
            'id' => [1, 2, 3,4,5,6,7,8,9,10]
        ]);
    }
}
