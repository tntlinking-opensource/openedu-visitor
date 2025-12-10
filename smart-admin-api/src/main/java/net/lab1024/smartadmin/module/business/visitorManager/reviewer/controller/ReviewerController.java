package net.lab1024.smartadmin.module.business.visitorManager.reviewer.controller;

import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerAddDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerUpdateDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerVO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerExcelVO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.service.ReviewerService;
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
 * [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-07 16:33:42
 * @since JDK1.8
 */
@RestController
@Api(tags = {"部门审核人表"})
public class ReviewerController extends BaseController {

    @Autowired
    private ReviewerService reviewerService;

    @ApiOperation(value = "分页查询部门审核人表",notes = "@author wang")
    @PostMapping("/reviewer/page/query")
    public ResponseDTO<PageResultDTO<ReviewerVO>> queryByPage(@RequestBody ReviewerQueryDTO queryDTO) {
        return reviewerService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加部门审核人表",notes = "@author wang")
    @PostMapping("/reviewer/add")
    public ResponseDTO<String> add(@RequestBody @Validated ReviewerAddDTO addTO){
        return reviewerService.add(addTO);
    }

    @ApiOperation(value="修改部门审核人表",notes = "@author wang")
    @PostMapping("/reviewer/update")
    public ResponseDTO<String> update(@RequestBody @Validated ReviewerUpdateDTO updateDTO){
        return reviewerService.update(updateDTO);
    }

    @ApiOperation(value="批量删除部门审核人表",notes = "@author wang")
    @PostMapping("/reviewer/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return reviewerService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/reviewer/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<ReviewerExcelVO> reviewerList = reviewerService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("部门审核人表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, ReviewerExcelVO.class, reviewerList);
        downloadExcel("部门审核人表", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/reviewer/export/all")
    public void exportAll(@RequestBody @Validated ReviewerQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<ReviewerExcelVO> reviewerList = reviewerService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("部门审核人表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, ReviewerExcelVO.class, reviewerList);
        downloadExcel("部门审核人表", workbook, response);
    }

}
