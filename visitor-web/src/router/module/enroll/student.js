import Main from '@/components/main';
// e_student路由
export const student = [
    {
        path: '/student',
        name: 'Student',
        component: Main,
        meta: {
            title: '报名信息管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  列表
            {
                path: '/student/student-list',
                name: 'StudentList',
                meta: {
                    title: '报名信息管理',
                    icon: 'ios-create',
                    privilege: [
                        { title: '查询', name: 'student-list-query' },
                        { title: '新增', name: 'student-list-add' },
                        { title: '编辑', name: 'student-list-update' },
                        { title: '批量删除', name: 'student-list-batch-delete' },
                        { title: '批量导出', name: 'student-list-batch-export' },
                        { title: '导出全部', name: 'student-list-export-all' }
                    ]
                },
                component: () => import('@/views/enroll/student/student-list.vue')
             }
        ]
    }
];
