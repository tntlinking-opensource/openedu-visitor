import Main from '@/components/main';
// t_department路由
export const department = [
    {
        path: '/department',
        name: 'Department',
        component: Main,
        meta: {
            title: '部门表管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  部门表列表
            {
                path: '/department/department-list',
                name: 'DepartmentList',
                meta: {
                    title: '部门表列表',
                    privilege: [
                        { title: '查询', name: 'department-list-query' },
                        { title: '新增', name: 'department-list-add' },
                        { title: '设置审核人', name: 'department-list-set' },
                        { title: '编辑', name: 'department-list-update' },
                        { title: '批量删除', name: 'department-list-batch-delete' },
                        { title: '批量导出', name: 'department-list-batch-export' },
                        { title: '导出全部', name: 'department-list-export-all' }
                    ]
                },
                component: () => import('@/views/system/employee/department/department-list.vue')
             }
        ]
    }
];
