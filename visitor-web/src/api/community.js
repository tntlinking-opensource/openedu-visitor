import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const communityApi = {
    // 添加 @author wang
    addCommunity: (data) => {
        return postAxios('/community/add', data);
    },
    // 分页查询 @author wang
    queryCommunity: (data) => {
        return postAxios('/community/page/query', data);
    },
    // 批量删除 @author wang
    batchDeleteCommunity: (idList) => {
        return postAxios('/community/deleteByIds', idList);
    },
    // 修改  @author wang
    updateCommunity: (data) => {
        return postAxios('/community/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/community/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/community/export/batch', idList);
    },
};
