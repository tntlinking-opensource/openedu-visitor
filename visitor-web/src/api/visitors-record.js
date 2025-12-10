import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const visitorsRecordApi = {
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
    //修改访客记录表  @author wang
    updateVisitorsRecord: (data) => {
        return postAxios('/visitorsRecord/update',data);
    },
    // 导出全部  @author wang
    exportAll:(data)=>{
        return postDownloadAxios('/visitorsRecord/export/all',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/visitorsRecord/export/batch', idList);
    },
    // 根据 id 查询
    selectById: (id) => {
        return getAxios('/visitorsRecord/selectById/' + id);
    },
    // 导出Excel
    // 导出excel  @author wang
    exportExcel:(data)=>{
        return postDownloadAxios('/visitorsRecord/export/excel',data);
    },
    //访客统计
    visitorCount:(data)=>{
        return getAxios('/visitorsRecord/count',data);
    },
};
