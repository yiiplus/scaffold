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
            ['id', 'name', 'parent', 'route', 'order', 'data'],
            [
                [1, '仪表盘', null, '/', 100, '{"icon":"dashboard"}'],
                [2, '系统设置', null, null, 200, '{"icon":"cog"}'],
                [3, '菜单列表', 2, '/admin/menu/index', 1, '{"icon":"list"}'],
                [4, '操作日志', 2, '/admin/log/index', 2, '{"icon":"file"}'],
                [5, '用户管理', 2, '/admin/user/index', 2, '{"icon":"user"}'],
                [6, '角色列表', 2, '/admin/role/index', 3, '{"icon":"users"}'],
                [7, '访问控制', 2, null, 4, '{"icon":"laptop"}'],
                [8, '路由列表', 7, '/admin/route/index', 61, '{"icon":"circle"}'],
                [9, '规则列表', 7, '/admin/rule/index', 62, '{"icon":"circle"}'],
                [10, '权限列表', 7, '/admin/permission/index', 63, '{"icon":"circle"}'],
            ]
        );

        if(YII_ENV_DEV) {
            $this->batchInsert('{{%yp_desktop_menu}}', 
                ['name', 'parent', 'route', 'order', 'data'],
                [
                    ['GII', null, '/gii/default/index', 997, ''],
                    ['迁移', null, '/migration/default/index', 998, ''],
                    ['调试', null, '/debug/default/index', 999, ''],
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
