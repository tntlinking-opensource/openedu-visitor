import Main from '@/components/main';
// auditManagement
export const auditManagement = [
    {
        path: '/auditManagement',
        name: 'AuditManagement',
        component: Main,
        meta: {
            title: '访校审核管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  申请记录表列表
            {
                path: '/auditManagement/auditManagement-list',
                name: 'AditManagementList',
                meta: {
                    title: '申请记录表',
                    privilege: [
                        { title: '查询', name: 'auditManagement-list-query' }, 
                        { title: '审核', name: 'auditManagement-list-set' },
                    ]
                },
                component: () => import('@/views/business/auditManagement/auditManagement-list.vue')
            },
        ]
    }
];
