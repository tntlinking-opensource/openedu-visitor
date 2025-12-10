import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const plotApi = {
    // 添加 @author wang
    addPlot: (data) => {
        return postAxios('/plot/add', data);
    },
    // 分页查询 @author wang
    queryPlot: (data) => {
        return postAxios('/plot/page/query', data);
    },
    // 批量删除 @author wang
    batchDeletePlot: (idList) => {
        return postAxios('/plot/deleteByIds', idList);
    },
    // 修改  @author wang
    updatePlot: (data) => {
        return postAxios('/plot/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/plot/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/plot/export/batch', idList);
    },
    // 社区列表
    getCommunitys: () => {
        return postAxios('/community/getAll');
    },
};
