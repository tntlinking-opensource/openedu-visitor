import { ROUTER_PERMISSION_TYPE } from '@/router/router-const';

export const developRouter = [
  {
    path: '/develop',
    component: () => import('@/views/dashboard/dashboard'),
    children: [
      {
        path: '/develop/config',
        name: 'DevelopConfig',
        meta: {
          title: '开发专用配置',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () => import('views/develop/config')
      }
    ]
  }

];

