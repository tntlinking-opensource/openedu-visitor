import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const reviewerApi = {
    // 添加部门审核人表 @author wang
    addReviewer: (data) => {
        return postAxios('/reviewer/add', data);
    },
    // 分页查询部门审核人表 @author wang
    queryReviewer: (data) => {
        return postAxios('/reviewer/page/query', data);
    },
    // 批量删除部门审核人表 @author wang
    batchDeleteReviewer: (idList) => {
        return postAxios('/reviewer/deleteByIds', idList);
    },
    // 修改部门审核人表  @author wang
    updateReviewer: (data) => {
        return postAxios('/reviewer/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/reviewer/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/reviewer/export/batch', idList);
    },
};
