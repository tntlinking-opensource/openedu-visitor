import Main from '@/components/main';
// vis_department_reviewer路由

export const reviewer = [
    {
        path: '/reviewer',
        name: 'Reviewer',
        component: Main,
        meta: {
            title: '访客管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  城市管理
            // {
            //     path: '/province/province-list',
            //     name: 'ProvinceList',
            //     meta: {
            //         title: '省份城市管理',
            //         privilege: [
            //             { title: '添加省份', name: 'add-province' },
            //             { title: '编辑省份', name: 'update-province' },
            //             { title: '删除省份', name: 'delete-province' },
            //             { title: '添加城市', name: 'add-city' },
            //             { title: '编辑城市', name: 'update-city' },
            //             { title: '删除城市', name: 'delete-city' }
            //         ]
            //     },
            //     component: () => import('@/views/business/province/province-list.vue')
            // }
            // ,
            //  部门审核人表列表
            // {
            //     path: '/reviewer/reviewer-list',
            //     name: 'ReviewerList',
            //     meta: {
            //         title: '审核人管理',
            //         privilege: [
            //             { title: '查询', name: 'reviewer-list-query' },
            //             { title: '新增', name: 'reviewer-list-add' },
            //             { title: '批量删除', name: 'reviewer-list-batch-delete' },
            //         ]
            //     },
            //     component: () => import('@/views/business/reviewer/reviewer-list.vue')
            // },
             //  访客记录列表
            {
                path: '/visitors-record/visitors-record-list',
                name: 'VisitorsRecordList',
                meta: {
                    title: '访校申请记录',
                    privilege: [
                        { title: '查询', name: 'visitors-record-list-query' },
                        { title: '批量导出', name: 'visitor-list-batch-export' },
                    ]
                },
                component: () => import('@/views/business/visitors-record/visitors-record-list.vue')
            },
             //  申请记录表列表
            {
                path: '/auditManagement/auditManagement-list',
                name: 'AditManagementList',
                meta: {
                    title: '访校申请审核',
                    privilege: [
                        { title: '查询', name: 'auditManagement-list-query' },
                        { title: '审核', name: 'auditManagement-list-update' },
                    ]
                },
                component: () => import('@/views/business/auditManagement/auditManagement-list.vue')
            }
        ]
    },
    {
        path: '/visitors-count',
        name: 'VisitorsCount',
        component: () => import('@/views/business/visitors-count/visitors-count-list.vue'),
        meta: {
            title: '访客统计',
            icon: 'icon iconfont iconyoujianguanli',
            //hideInMenu: true,
            //noValidatePrivilege: true,
            noNeedLogin: true,
        },
    }
];
