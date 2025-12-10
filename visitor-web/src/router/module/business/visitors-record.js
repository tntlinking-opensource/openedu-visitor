import Main from '@/components/main';
// vis_visitors_record路由
export const visitorsRecord = [
    {
        path: '/visitors-record',
        name: 'VisitorsRecord',
        component: Main,
        meta: {
            title: '访客记录表管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  访客记录表列表
            {
                path: '/visitors-record/visitors-record-list',
                name: 'VisitorsRecordList',
                meta: {
                    title: '访客记录表列表',
                    privilege: [
                        { title: '查询', name: 'visitors-record-list-query' },
                        { title: '编辑', name: 'visitors-record-list-update' },
                        { title: '批量导出excel', name:'visitor-list-batch-export'}
                    ]
                },
                component: () => import('@/views/business/visitors-record/visitors-record-list.vue')
            }
        ]
    }
];
