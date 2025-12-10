import Main from '@/components/main';
// e_community路由
export const community = [
    {
        path: '/community',
        name: 'Community',
        component: Main,
        meta: {
            title: '社区管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  列表
            {
                path: '/community/community-list',
                name: 'CommunityList',
                meta: {
                    title: '社区管理',
                    icon: 'ios-home',
                    privilege: [
                        { title: '查询', name: 'community-list-query' },
                        { title: '新增', name: 'community-list-add' },
                        { title: '编辑', name: 'community-list-update' },
                        { title: '批量删除', name: 'community-list-batch-delete' },
                        { title: '批量导出', name: 'community-list-batch-export' },
                        { title: '导出全部', name: 'community-list-export-all' }
                    ]
                },
                component: () => import('@/views/enroll/community/community-list.vue')
             }
        ]
    }
];
