package net.lab1024.smartadmin.module.enroll.plot.controller;

import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotAddDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotUpdateDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotQueryDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotVO;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotExcelVO;
import net.lab1024.smartadmin.module.enroll.plot.service.PlotService;
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
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-06-03 14:09:01
 * @since JDK1.8
 */
@RestController
@Api(tags = {""})
public class PlotController extends BaseController {

    @Autowired
    private PlotService plotService;

    @ApiOperation(value = "分页查询",notes = "@author wang")
    @PostMapping("/plot/page/query")
    public ResponseDTO<PageResultDTO<PlotVO>> queryByPage(@RequestBody PlotQueryDTO queryDTO) {
        return plotService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加",notes = "@author wang")
    @PostMapping("/plot/add")
    public ResponseDTO<String> add(@RequestBody @Validated PlotAddDTO addTO){
        return plotService.add(addTO);
    }

    @ApiOperation(value="修改",notes = "@author wang")
    @PostMapping("/plot/update")
    public ResponseDTO<String> update(@RequestBody @Validated PlotUpdateDTO updateDTO){
        return plotService.update(updateDTO);
    }

    @ApiOperation(value="批量删除",notes = "@author wang")
    @PostMapping("/plot/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return plotService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/plot/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<PlotExcelVO> plotList = plotService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, PlotExcelVO.class, plotList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/plot/export/all")
    public void exportAll(@RequestBody @Validated PlotQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<PlotExcelVO> plotList = plotService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, PlotExcelVO.class, plotList);
        downloadExcel("", workbook, response);
    }

}
