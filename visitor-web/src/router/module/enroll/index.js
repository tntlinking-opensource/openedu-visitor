
import Main from '@/components/main';


import { community } from './community';
import { plot } from './plot';
import { student } from './student';
// 业务
export const enroll = [
  {
    path: '/enroll',
    name: 'Enroll',
    component: Main,
    meta: {
      title: '新生报名',
      topMenu: true,
      icon: 'icon iconfont iconjiekouwendang'
    },
    children: [
      ...community,
      ...plot,
      ...student
    ]
  }
];
