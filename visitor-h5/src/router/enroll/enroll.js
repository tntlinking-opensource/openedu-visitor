import { ROUTER_PERMISSION_TYPE } from '@/router/router-const';

export const enrollRouter = [
  {
    path: '/enroll',
    component: () => import('@/views/dashboard/dashboard'),
    children: [
      {
        path: '/enroll/apply',
        name: 'enrollApply',
        meta: {
          title: '新生报名',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/enroll/apply')
      },
      {
        path: '/enroll/success',
        name: 'enrollSuccess',
        meta: {
          title: '报名成功',
          permissionType: ROUTER_PERMISSION_TYPE.NO_VALID.value
        },
        component: () =>
          import('views/enroll/success')
      }
    ]
  }
];

