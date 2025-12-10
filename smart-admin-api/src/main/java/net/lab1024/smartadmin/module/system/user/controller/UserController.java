package net.lab1024.smartadmin.module.system.user.controller;

import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserAddDTO;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserUpdateDTO;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserQueryDTO;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserVO;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserExcelVO;
import net.lab1024.smartadmin.module.system.user.service.UserService;
import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import org.apache.poi.ss.usermodel.Workbook;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-06 17:25:00
 * @since JDK1.8
 */
@RestController
@Api(tags = {"员工表"})
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @ApiOperation(value = "分页查询员工表",notes = "@author wang")
    @PostMapping("/user/page/query")
    public ResponseDTO<PageResultDTO<UserVO>> queryByPage(@RequestBody UserQueryDTO queryDTO) {
        return userService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加员工表",notes = "@author wang")
    @PostMapping("/user/add")
    public ResponseDTO<String> add(@RequestBody @Validated UserAddDTO addTO){
        return userService.add(addTO);
    }

    @ApiOperation(value="修改员工表",notes = "@author wang")
    @PostMapping("/user/update")
    public ResponseDTO<String> update(@RequestBody @Validated UserUpdateDTO updateDTO){
        return userService.update(updateDTO);
    }

    @ApiOperation(value="批量删除员工表",notes = "@author wang")
    @PostMapping("/user/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return userService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/user/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<UserExcelVO> userList = userService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("员工表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, UserExcelVO.class, userList);
        downloadExcel("员工表", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/user/export/all")
    public void exportAll(@RequestBody @Validated UserQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<UserExcelVO> userList = userService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("员工表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, UserExcelVO.class, userList);
        downloadExcel("员工表", workbook, response);
    }

}
