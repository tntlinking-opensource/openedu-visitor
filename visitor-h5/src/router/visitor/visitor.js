import { ROUTER_PERMISSION_TYPE } from '@/router/router-const';

export const visitorRouter = [
  {
    path: '/visitor',
    component: () => import('@/views/dashboard/dashboard'),
    children: [
      {
        path: '/visitor/loading',
        name: 'applyLoading',
        meta: {
          title: '访校申请',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitor/loading')
      },
      {
        path: '/visitor/qrCode',
        name: 'applyQrCode',
        meta: {
          title: '访校申请',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitor/qrCode')
      },
      {
        path: '/visitor/index',
        name: 'applyIndex',
        meta: {
          title: '访校申请',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitor/index')
      },
      {
        path: '/visitor/apply',
        name: 'apply',
        meta: {
          title: '访校申请',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitor/apply')
      },
      {
        path: '/visitor/applyList',
        name: 'applyList',
        meta: {
          title: '申请列表',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitor/applyList')
      },
      {
        path: '/visitor/applyResult',
        name: 'applyResult',
        meta: {
          title: '申请结果',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () => import('views/visitor/applyResult')
      }
    ]
  }
];
