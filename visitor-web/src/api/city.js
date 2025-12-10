import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const cityApi = {
    // 添加 @author wang
    addCity: (data) => {
        return postAxios('/city/add', data);
    },
    // 分页查询 @author wang
    queryCity: (data) => {
        return postAxios('/city/page/query', data);
    },
    // 批量删除 @author wang
    deleteById: (id) => {
        return postAxios('/city/deleteById/'+id);
    },
    // 修改  @author wang
    updateCity: (data) => {
        return postAxios('/city/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/city/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/city/export/batch', idList);
    },
    // 查询城市
    getAllCity: (provinceId) => {
        return getAxios('/city/getAll/'+ provinceId);
    },
};
