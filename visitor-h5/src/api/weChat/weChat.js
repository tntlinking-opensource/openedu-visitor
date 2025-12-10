import { getAxios } from '@/lib/http';

export const weChatApi = {
  getConfig: () => {
    return getAxios('/api/wx/getConfig');
  },
  // 获取openid by code
  getOpenId: (code) => {
    return getAxios('/api/wx/getOpenId/' + code);
  },
  // 获取openid 并更新当前用户openid信息
  getOpenIdAndSave: (code) => {
    return getAxios('/api/wx/getOpenIdAndSave/' + code);
  },
  // 更新当前用户openid信息
  updeteOpenid: (openid) => {
    return getAxios('/api/wx/updeteOpenid/' + openid);
  }
};
