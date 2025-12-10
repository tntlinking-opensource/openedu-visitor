import { postAxios, getAxios, postDownloadAxios } from '@/lib/http';

export const studentApi = {
    // 添加 @author wang
    addStudent: (data) => {
        return postAxios('/student/add', data);
    },
    // 分页查询 @author wang
    queryStudent: (data) => {
        return postAxios('/student/page/query', data);
    },
    // 批量删除 @author wang
    batchDeleteStudent: (idList) => {
        return postAxios('/student/deleteByIds', idList);
    },
    // 修改  @author wang
    updateStudent: (data) => {
        return postAxios('/student/update',data);
    },
    // 导出excel  @author wang
    exportExcel:(data)=>{
        return postDownloadAxios('/student/export/excel',data);
    },
    // 导出word  @author wang
    exportWord:(data)=>{
        return postDownloadAxios('/student/export/word',data);
    },
    // 批量导出  @author wang
    batchExport: (idList) => {
        return postDownloadAxios('/student/export/batch', idList);
    },
};
