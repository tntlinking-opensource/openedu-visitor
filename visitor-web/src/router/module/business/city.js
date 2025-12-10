import Main from '@/components/main';
// vis_city路由
export const city = [
    {
        path: '/city',
        name: 'City',
        component: Main,
        meta: {
            title: '管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  列表
            {
                path: '/city/city-list',
                name: 'CityList',
                meta: {
                    title: '列表',
                    privilege: [
                        { title: '查询', name: 'city-list-query' },
                        { title: '新增', name: 'city-list-add' },
                        { title: '编辑', name: 'city-list-update' }
                    ]
                },
                component: () => import('@/views/business/city/city-list.vue')
             }
        ]
    }
];
