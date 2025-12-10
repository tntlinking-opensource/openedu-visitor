import { postAxios,getAxios } from '@/lib/http';

export const enrollApi = {
  getSession: () => {
    return getAxios('/session/get');
  },
   // 添加 报名信息
  addStudent: (data) => {
    return postAxios('/student/add', data);
  },  
  // 社区小区级联数据
  getCommunityPlotCascades: () => {
    return postAxios('/community/getCommunityPlotCascades');
  },

};
