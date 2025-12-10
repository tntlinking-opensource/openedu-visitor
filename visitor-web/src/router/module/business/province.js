import Main from '@/components/main';
// vis_province路由
export const province = [
    {
        path: '/province',
        name: 'Province',
        component: Main,
        meta: {
            title: '管理',
            icon: 'icon iconfont iconyoujianguanli'
        },
        children: [
            //  列表
            {
                path: '/province/province-list',
                name: 'ProvinceList',
                meta: {
                    title: '列表',
                    privilege: [
                        { title: '新增', name: 'province-list-add' },
                        { title: '编辑', name: 'province-list-update' },
                    ]
                },
                component: () => import('@/views/business/province/province-list.vue')
            }
        ]
    }
];
