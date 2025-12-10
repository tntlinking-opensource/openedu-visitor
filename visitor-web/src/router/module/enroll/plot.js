import Main from '@/components/main';
// e_plot路由
export const plot = [
    {
        path: '/plot',
        name: 'Plot',
        component: Main,
        meta: {
            title: '小区管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  列表
            {
                path: '/plot/plot-list',
                name: 'PlotList',
                meta: {
                    title: '小区管理',
                    icon: 'ios-home-outline',
                    privilege: [
                        { title: '查询', name: 'plot-list-query' },
                        { title: '新增', name: 'plot-list-add' },
                        { title: '编辑', name: 'plot-list-update' },
                        { title: '批量删除', name: 'plot-list-batch-delete' },
                        { title: '批量导出', name: 'plot-list-batch-export' },
                        { title: '导出全部', name: 'plot-list-export-all' }
                    ]
                },
                component: () => import('@/views/enroll/plot/plot-list.vue')
             }
        ]
    }
];
