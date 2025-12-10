import { ROUTER_PERMISSION_TYPE } from '@/router/router-const';

/**
 * dashboard首页
 */
export const dashboardRouter = [
  {
    path: '/',
    // redirect: '/dashboard/visitorManage',
    redirect: '/visitor/index',
    meta: {
      title: '首页',
      keepAlive: true,
      permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
    },
    component: () => import('@/views/dashboard/dashboard'),
    children: [
      {
        path: '/dashboard/user',
        name: 'Mine',
        meta: {
          title: '我的',
          keepAlive: false,
          showTabbar: true,
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () => import('@/views/user/index')
      },
      {
        path: '/dashboard/enroll',
        name: 'Enroll',
        meta: {
          title: '新生报名',
          keepAlive: false,
          showTabbar: true,
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () => import('@/views/enroll/index')
      },
      {
        path: '/dashboard/visitorManage',
        name: 'visitorManage',
        meta: {
          title: '访校管理',//审核人端
          keepAlive: false,
          showTabbar: true,
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () => import('@/views/visitorManage/index')
      }
    ]
  }
];
