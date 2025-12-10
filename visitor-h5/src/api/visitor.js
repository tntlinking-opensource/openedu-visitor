import { postAxios, getAxios } from '@/lib/http';

export const visitorApi = {
  // 添加访客记录表 @author wang
  addVisitorsRecord: (data) => {
    return postAxios('/visitorsRecord/add', data);
  },
  // 分页查询访客记录表 @author wang
  queryVisitorsRecord: (data) => {
    return postAxios('/visitorsRecord/page/query', data);
  },
  // 批量删除访客记录表 @author wang
  batchDeleteVisitorsRecord: (idList) => {
    return postAxios('/visitorsRecord/deleteByIds', idList);
  },
  // 修改访客记录表  @author wang
  updateVisitorsRecord: (data) => {
    return postAxios('/visitorsRecord/update', data);
  },
  // 通过 openid 获取 申请结果
  getResultsByOpenId: (openId) => {
    return getAxios('/visitorsRecord/getByOpenId/' + openId);
  },
  // 通过 id 获取 申请结果
  getResultsById: (id) => {
    return getAxios('/visitorsRecord/getById/' + id);
  },
  // 获取openid
  getCode: (code) => {
    return postAxios('/visitorsRecord/getCode/' + code);
  },
  // 获取访问记录数
  getApplyCount: (openid) => {
    return getAxios('/visitorsRecord/getApplyCount/' + openid);
  },
  // 上传行程码
  uploadImg: (data) => {
    return postAxios('/visitorsRecord/uploadItineraryCode', data);
  },
  // 下载行程码
  downloadImg: (fileName) => {
    return getAxios('/visitorsRecord/downloadImg/' + fileName);
  },
  // 访客确认 保安扫码
  visitorsComfirm: (data) => {
    return postAxios('/visitorsRecord/confirm', data);
  }
};
