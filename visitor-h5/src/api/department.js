import { postAxios, getAxios } from '@/lib/http';
export const departmentApi = {
  // 加载所有的部门子部门
  getLoadDepartment: () => {
    return getAxios('/department/list');
  },
  // 查询部门及员工列表
  getDepartmentEmployeeList: () => {
    return getAxios('/department/listEmployee');
  },
  // 添加部门
  addDepartment: (data) => {
    return postAxios('/department/add', data);
  },
  // 编辑部门
  updateDepartment: (data) => {
    return postAxios('/department/update', data);
  },
  // 删除部门
  deleteDepartment: (data) => {
    return postAxios('/department/delete/' + data);
  },
  // 根据id获取部门信息
  getDepartmentById: (data) => {
    return getAxios('/department/query/' + data);
  },
  // 查询部门列表
  getDepartmentAll: () => {
    return getAxios('/department/listAll');
  },
  // 根据部门名称获取员工列表
  getListEmployeeByDepartmentName: (departmentName) => {
    return getAxios('/department/listEmployeeByDepartmentName?departmentName=' + departmentName);
  },

  // 根据部门id获取员工列表
  getListEmployeeByDepartmentId: (id) => {
    return getAxios('/department/listEmployeeByDepartmentId?id=' + id);
  },

  // 添加审核人
  setReviewer: (id,ids) => {
    return getAxios('/department/setReviewer/'+id+'/'+ids);
  },

  // 上下移动
  upOrDown: (departmentId, swapId) => {
    return getAxios('/department/upOrDown/' + departmentId + '/' + swapId);
  },
  // 升级
  upGrade: (departmentId) => {
    return getAxios('/department/upgrade/' + departmentId);
  },
  // 降级
  downGrade: (departmentId, preId) => {
    return getAxios('/department/downgrade/' + departmentId + '/' + preId);
  },

  
// 分页查询部门表 @author wang
queryDepartment: (data) => {
    return postAxios('/department/page/query', data);
},
// 批量删除部门表 @author wang
batchDeleteDepartment: (idList) => {
    return postAxios('/department/deleteByIds', idList);
},

// 批量设置审核人 @author wang
// batchSetReviewer: (idList) => {
//   return postAxios('/department/setReviewerByIds', idList);
// },

// 修改部门表  @author wang
updateDepartment: (data) => {
    return postAxios('/department/update',data);
},
// 导出全部  @author wang
exportAll:(data)=>{
    return postDownloadAxios('/department/export/all',data);
},
// 批量导出  @author wang
batchExport: (idList) => {
    return postDownloadAxios('/department/export/batch', idList);
},
// 部门级联教师(员工表)
getDepartmentTeacherCascades: (accessType) => {
    return postAxios('/department/getDepartmentTeacherCascades?accessType='+accessType);
}
};
