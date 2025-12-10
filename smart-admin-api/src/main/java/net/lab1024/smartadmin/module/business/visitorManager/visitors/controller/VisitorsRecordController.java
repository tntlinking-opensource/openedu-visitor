package net.lab1024.smartadmin.module.business.visitorManager.visitors.controller;

import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.anno.OperateLog;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.*;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordVO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordExcelVO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.service.VisitorsRecordService;
import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import net.lab1024.smartadmin.util.RequestUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.poi.ss.usermodel.Workbook;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@RestController
@Api(tags = {"访客记录表"})
@OperateLog
public class VisitorsRecordController extends BaseController {

    @Autowired
    private VisitorsRecordService visitorsRecordService;

    @ApiOperation(value = "分页查询访客记录表", notes = "@author wang")
    //@NoNeedLogin
    @PostMapping("/visitorsRecord/page/query")
    public ResponseDTO<PageResultDTO<VisitorsRecordVO>> queryByPage(@RequestBody VisitorsRecordQueryDTO queryDTO) {
        return visitorsRecordService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加访客记录表", notes = "@author wang")
    @PostMapping("/visitorsRecord/add")
    @NoNeedLogin
    public ResponseDTO<String> add(@RequestBody @Validated VisitorsRecordAddDTO addTO, MultipartFile itineraryCodeFile) {
        return visitorsRecordService.add(addTO);
    }

//    @ApiOperation(value="修改访客记录表",notes = "@author wang")
//    @PostMapping("/visitorsRecord/update")
//    public ResponseDTO<String> update(@RequestBody @Validated VisitorsRecordUpdateDTO updateDTO){
//        return visitorsRecordService.update(updateDTO);
//    }

    @ApiOperation(value = "修改访客记录表", notes = "@author wang")
    @PostMapping("/visitorsRecord/update")
    public ResponseDTO<String> updateById(@RequestBody @Validated VisitorsRecordUpdateDTO updateDTO) {
        return visitorsRecordService.updateById(updateDTO);
    }

    @ApiOperation(value = "批量删除访客记录表", notes = "@author wang")
    @PostMapping("/visitorsRecord/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return visitorsRecordService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/visitorsRecord/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<VisitorsRecordExcelVO> visitorsRecordList = visitorsRecordService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("访客记录表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, VisitorsRecordExcelVO.class, visitorsRecordList);
        downloadExcel("访客记录表", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/visitorsRecord/export/all")
    public void exportAll(@RequestBody @Validated VisitorsRecordQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<VisitorsRecordExcelVO> visitorsRecordList = visitorsRecordService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("访客记录表", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, VisitorsRecordExcelVO.class, visitorsRecordList);
        downloadExcel("访客记录表", workbook, response);
    }

    @ApiOperation(value = "根据id查询申请详情", notes = "@author wang")
    @GetMapping("/visitorsRecord/getById/{id}")
    @NoNeedLogin
    public ResponseDTO<VisitorsRecordVO> selectById(@PathVariable Long id) {
        return visitorsRecordService.getById(id);
    }

    @ApiOperation(value = "根据openId查询申请列表", notes = "@author wang")
    @GetMapping("/visitorsRecord/getByOpenId/{openId}")
    @NoNeedLogin
    public ResponseDTO<List<VisitorsRecordVO>> getByOpenId(@PathVariable String openId) {
        return visitorsRecordService.getByOpenId(openId);
    }

    @ApiOperation(value = "获取申请记录数")
    @GetMapping("/visitorsRecord/getApplyCount/{openId}")
    @NoNeedLogin
    public ResponseDTO<Integer> getApplyCount(@PathVariable String openId) {
        return visitorsRecordService.getApplyCount(openId);
    }

    @ApiOperation(value = "导出excel")
    @PostMapping("/visitorsRecord/export/excel")
    public String exprtExcel(@RequestBody @Validated VisitorsRecordQueryDTO visitorsRecordQueryDTO, HttpServletResponse response, HttpServletRequest request){
        try {
            String fileName = "访校审核记录表";
            XSSFWorkbook workbook = visitorsRecordService.getWorkbook(visitorsRecordQueryDTO);
            fileName += ".xlsx";
            fileName = RequestUtils.encodeAttachName(request,fileName);
            response.setContentType("multipart/form-data;charset=UTF-8");
            response.setHeader("Content-Disposition","attachment;filename="+ fileName);
            workbook.write(response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @ApiOperation(value = "行程码上传", notes = "行程码上传")
    @PostMapping("/visitorsRecord/uploadItineraryCode")
    @NoNeedLogin
    public ResponseDTO<String> uploadItineraryCode(MultipartFile file) {
        return visitorsRecordService.uploadItineraryCode(file);
    }

    @ApiOperation(value = "下载行程码")
    @GetMapping("/visitorsRecord/downloadImg/{fileName}")
    @NoNeedLogin
    public void downloadImg(@PathVariable String fileName, HttpServletResponse response){
        visitorsRecordService.downloadImg(fileName,response);
    }

    @ApiOperation(value = "访客确认", notes = "@author wang")
    @PostMapping("/visitorsRecord/confirm")
    public ResponseDTO<String> confirm(@RequestBody VisitorsRecordConfirmDTO confirmDTO) {
        return visitorsRecordService.confirm(confirmDTO.getId(),confirmDTO.getTemp());
    }

    @ApiOperation(value = "访客统计", notes = "@author wang")
    @GetMapping("/visitorsRecord/count")
    @NoNeedLogin
    public ResponseDTO<Map<String,Object>> count( VisitorsRecordCountQueryDTO countQueryDTO) {
        return visitorsRecordService.visitorCount(countQueryDTO);
    }

}
