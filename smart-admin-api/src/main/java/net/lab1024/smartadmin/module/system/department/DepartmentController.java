package net.lab1024.smartadmin.module.system.department;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.anno.OperateLog;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.constant.SwaggerTagConst;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.service.ReviewerService;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityPlotCascadeVo;
import net.lab1024.smartadmin.module.system.department.domain.dto.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.lab1024.smartadmin.module.system.employee.EmployeeService;
import net.lab1024.smartadmin.module.system.employee.domain.entity.EmployeeEntity;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

/**
 * 部门管理路由器
 *
 * @author listen
 * @date 2017/12/19 14:29
 */
@Api(tags = {SwaggerTagConst.Admin.MANAGER_DEPARTMENT})
@OperateLog
@RestController
public class DepartmentController extends BaseController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private ReviewerService reviewerService;

    @ApiOperation(value = "查询部门树形列表", notes = "查询部门列表")
    @GetMapping("/department/list")
    public ResponseDTO<List<DepartmentVO>> listDepartment() {
        return departmentService.listDepartment();
    }

    @ApiOperation(value = "查询部门及员工列表", notes = "查询部门及员工列表")
    @GetMapping("/department/listEmployee")
    public ResponseDTO<List<DepartmentVO>> listDepartmentEmployee() {
        return departmentService.listAllDepartmentEmployee(null);
    }

    @ApiOperation(value = "根据部门名称查询部门及员工列表", notes = "根据部门名称查询部门及员工列表")
    @GetMapping("/department/listEmployeeByDepartmentName")
    public ResponseDTO<List<DepartmentVO>> listDepartmentEmployee(String departmentName) {
        return departmentService.listAllDepartmentEmployee(departmentName);
    }

    @ApiOperation(value = "根据部门id查询部门及员工列表", notes = "根据部门名称查询部门及员工列表")
    @GetMapping("/department/listEmployeeByDepartmentId/{id}")
    public ResponseDTO<List<EmployeeVO>> getListEmployeeByDepartmentId(@PathVariable Long id) {
        return employeeService.getEmployeeByDeptId(id);
    }

    @ApiOperation(value = "添加部门", notes = "添加部门")
    @PostMapping("/department/add")
    public ResponseDTO<String> addDepartment(@Valid @RequestBody DepartmentCreateDTO departmentCreateDTO) {
        return departmentService.addDepartment(departmentCreateDTO);
    }

    @ApiOperation(value = "更新部门信息", notes = "更新部门信息")
    @PostMapping("/department/update")
    public ResponseDTO<String> updateDepartment(@Valid @RequestBody DepartmentUpdateDTO departmentUpdateDTO) {
        return departmentService.updateDepartment(departmentUpdateDTO);
    }

    @ApiOperation(value = "删除部门", notes = "删除部门")
    @PostMapping("/department/delete/{deptId}")
    public ResponseDTO<String> delDepartment(@PathVariable Long deptId) {
        return departmentService.delDepartment(deptId);
    }

    @ApiOperation(value = "获取部门信息", notes = "获取部门")
    @GetMapping("/department/query/{deptId}")
    public ResponseDTO<DepartmentVO> getDepartment(@PathVariable Long deptId) {
        return departmentService.getDepartmentById(deptId);
    }

    @ApiOperation(value = "添加审核人", notes = "添加审核人")
    @GetMapping("/department/setReviewer/{id}/{ids}")
    public ResponseDTO<String> setReviewer(@PathVariable Long id, @PathVariable List<Long> ids) {
        return reviewerService.addReviewer(id,ids);
    }

    @ApiOperation(value = "查询部门列表", notes = "查询部门列表")
    @GetMapping("/department/listAll")
    public ResponseDTO<List<DepartmentVO>> listAll() {
        return departmentService.listAll();
    }


    @ApiOperation(value = "上下移动")
    @GetMapping("/department/upOrDown/{deptId}/{swapId}")
    public ResponseDTO<String> upOrDown(@PathVariable Long deptId, @PathVariable Long swapId) {
        return departmentService.upOrDown(deptId, swapId);
    }

    @ApiOperation(value = "升级")
    @GetMapping("/department/upgrade/{deptId}")
    public ResponseDTO<String> upgrade(@PathVariable Long deptId) {
        return departmentService.upgrade(deptId);
    }

    @ApiOperation(value = "降级")
    @GetMapping("/department/downgrade/{deptId}/{preId}")
    public ResponseDTO<String> downgrade(@PathVariable Long deptId, @PathVariable Long preId) {
        return departmentService.downgrade(deptId, preId);
    }


    /**
     * [ 部门表 ]
     *
     * @author wang
     * @version 1.0
     * @company 彦致信息
     * @copyright (c)  彦致信息Inc. All rights reserved.
     * @date 2021-07-08 18:58:27
     * @since JDK1.8
     */

    @ApiOperation(value = "分页查询部门表", notes = "@author wang")
    @PostMapping("/department/page/query")
    public ResponseDTO<PageResultDTO<DepartmentVO>> queryByPage(@RequestBody DepartmentQueryDTO queryDTO) {
        return departmentService.queryByPage(queryDTO);
    }

//    @ApiOperation(value = "添加部门表", notes = "@author wang")
//    @PostMapping("/department/add")
//    public ResponseDTO<String> add(@RequestBody @Validated DepartmentAddDTO addTO) {
//        return departmentService.add(addTO);
//    }

//    @ApiOperation(value = "修改部门表", notes = "@author wang")
//    @PostMapping("/department/update")
//    public ResponseDTO<String> update(@RequestBody @Validated DepartmentUpdateDTO updateDTO) {
//        return departmentService.update(updateDTO);
//    }

    @ApiOperation(value = "批量删除部门表", notes = "@author wang")
    @PostMapping("/department/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return departmentService.deleteByIds(idList);
    }

//    @ApiOperation(value = "批量设置审核人", notes = "@author wang")
//    @PostMapping("/department/setReviewerByids")
//    public ResponseDTO<String> setReviewerByIds(@RequestBody @Validated ValidateList<Long> idList) {
//        return departmentService.setReviewerByIds(idList);
//    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/department/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<DepartmentExcelVO> departmentList = departmentService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("部门表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, DepartmentExcelVO.class, departmentList);
        downloadExcel("部门表", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/department/export/all")
    public void exportAll(@RequestBody @Validated DepartmentQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<DepartmentExcelVO> departmentList = departmentService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("部门表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, DepartmentExcelVO.class, departmentList);
        downloadExcel("部门表", workbook, response);
    }

    @ApiOperation(value = "部门详情", notes = "@author wang")
    @GetMapping("/department/getRealDetails/{id}")
    public ResponseDTO<DepartmentQueryDTO> getRealDetails(@PathVariable Long id){
        return departmentService.getRealDetails(id);
    }

    @NoNeedLogin
    @ApiOperation(value = "部门教师级联数据",notes = "@author wang")
    @PostMapping("/department/getDepartmentTeacherCascades")
    public List<DepartmentTeacherCascadeVo> getDepartmentTeacherCascades(String accessType) {
        return departmentService.getDepartmentTeacherCascades(accessType);
    }

    @ApiOperation(value = "根据部门名称查询部门")
    @GetMapping("/department/getDepartmentByDepartmentName")
    public ResponseDTO<List<DepartmentVO>> getDepartmentByDepartmentName(String departmentName) {
        return departmentService.getDepartmentByDeptName(departmentName);
    }

}
