import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const provinceApi = {
    // 添加 @author wang
    addProvince: (data) => {
        return postAxios('/province/add', data);
    },
    // 分页查询 @author wang
    queryProvince: (data) => {
        return postAxios('/province/page/query', data);
    },
    // 批量删除 @author wang
    deleteProvince: (id) => {
        return postAxios('/province/deleteById/'+id);
    },
    // 修改  @author wang
    updateProvince: (data) => {
        return postAxios('/province/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/province/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/province/export/batch', idList);
    },
    // 查询所有省份
    getAllProvince:() => {
        return getAxios('/province/getAll');
    }
};
