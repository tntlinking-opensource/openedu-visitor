import { ROUTER_PERMISSION_TYPE } from '@/router/router-const';

export const visitorManageRouter = [
  {
    path: '/visitorManage',
    component: () => import('@/views/dashboard/dashboard'),
    children: [
      {
        path: '/visitorManage/visitorApplyAudit',
        name: 'visitorApplyAudit',
        meta: {
          title: '访校申请审核',
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () =>
          import('views/visitorManage/visitorApplyAudit')
      },
      {
        path: '/visitorManage/visitorApplyList',
        name: 'visitorApplyList',
        meta: {
          title: '访校申请记录',
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () =>
          import('views/visitorManage/visitorApplyList')
      },
      {
        path: '/visitorManage/visitorApplyPending',
        name: 'visitorApplyPending',
        meta: {
          title: '待处理',//审核人端
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () => 
          import('views/visitorManage/visitorApplyPending')
      },
      {
        path: '/visitorManage/visitorApplyDetail',
        name: 'visitorApplyDetail',
        meta: {
          title: '访校申请详情',
          permissionType: ROUTER_PERMISSION_TYPE.NEED_LOGIN.value
        },
        component: () =>
          import('views/visitorManage/visitorApplyDetail')
      },
      {
        path: '/visitorManage/visitorConfirm/:id',
        name: 'visitorConfirm',
        meta: {
          title: '访校申请确认',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/visitorManage/visitorConfirm')
      }
    ]
  }
];
