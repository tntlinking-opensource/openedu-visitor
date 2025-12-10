package net.lab1024.smartadmin.module.enroll.student.controller;

import cn.afterturn.easypoi.word.WordExportUtil;
import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentAddDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentUpdateDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentQueryDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentVO;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentExcelVO;
import net.lab1024.smartadmin.module.enroll.student.service.StudentService;
import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import net.lab1024.smartadmin.util.RequestUtils;
import org.apache.commons.codec.net.BCodec;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-06-03 13:38:06
 * @since JDK1.8
 */
@RestController
@Api(tags = {""})
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    @ApiOperation(value = "分页查询",notes = "@author wang")
    @PostMapping("/student/page/query")
    public ResponseDTO<PageResultDTO<StudentVO>> queryByPage(@RequestBody StudentQueryDTO queryDTO) {
        return studentService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加",notes = "@author wang")
    @PostMapping("/student/add")
    @NoNeedLogin
    public ResponseDTO<String> add(@RequestBody @Validated StudentAddDTO addTO){
        return studentService.add(addTO);
    }

    @ApiOperation(value="修改",notes = "@author wang")
    @PostMapping("/student/update")
    public ResponseDTO<String> update(@RequestBody @Validated StudentUpdateDTO updateDTO){
        return studentService.update(updateDTO);
    }

    @ApiOperation(value="批量删除",notes = "@author wang")
    @PostMapping("/student/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return studentService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/student/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<StudentExcelVO> studentList = studentService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, StudentExcelVO.class, studentList);
        downloadExcel("", workbook, response);
    }

   /* @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/student/export/all")
    public void exportAll(@RequestBody @Validated StudentQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<StudentExcelVO> studentList = studentService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, StudentExcelVO.class, studentList);
        downloadExcel("", workbook, response);
    }*/

    @ApiOperation(value = "导出excel", notes = "@author wang")
    @PostMapping("/student/export/excel")
    public String exportExcel(@RequestBody @Validated StudentQueryDTO queryDTO, HttpServletResponse response,HttpServletRequest request) {

        //查询数据
        List<StudentVO> studentList = studentService.queryAllExportData(queryDTO);

        String fileName = "新生入学报名登记表";

        XSSFWorkbook workbook=new XSSFWorkbook();
        XSSFSheet sheet=workbook.createSheet();

        sheet.setColumnWidth(0,15*256);
        sheet.setColumnWidth(1,8*256);
        sheet.setColumnWidth(2,15*256);
        sheet.setColumnWidth(3,8*256);
        sheet.setColumnWidth(4,20*256);
        sheet.setColumnWidth(5,20*256);
        sheet.setColumnWidth(6,30*256);
        sheet.setColumnWidth(7,10*256);
        sheet.setColumnWidth(8,15*256);
        sheet.setColumnWidth(9,25*256);
        sheet.setColumnWidth(10,15*256);
        sheet.setColumnWidth(11,10*256);
        sheet.setColumnWidth(12,15*256);
        sheet.setColumnWidth(13,25*256);
        sheet.setColumnWidth(14,15*256);
        sheet.setColumnWidth(15,15*256);
        sheet.setColumnWidth(16,15*256);
        sheet.setColumnWidth(17,15*256);
        sheet.setColumnWidth(18,15*256);
        sheet.setColumnWidth(19,15*256);
        sheet.setColumnWidth(20,15*256);
        sheet.setColumnWidth(21,15*256);
        sheet.setColumnWidth(22,15*256);
        sheet.setColumnWidth(23,20*256);

        XSSFFont fontT1=workbook.createFont();
        fontT1.setFontName("微软雅黑");
        fontT1.setFontHeightInPoints((short)12);
        XSSFCellStyle titleStyle1=workbook.createCellStyle();
        titleStyle1.setFont(fontT1);
        titleStyle1.setAlignment(HorizontalAlignment.CENTER);
        titleStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        titleStyle1.setWrapText(true);

        XSSFFont titleFont=workbook.createFont();
        titleFont.setFontHeightInPoints((short)10);
        titleFont.setColor(new XSSFColor(java.awt.Color.white));
        titleFont.setFontName("微软雅黑");
        XSSFCellStyle titleStyle=workbook.createCellStyle();
        titleStyle.setFont(titleFont);
        titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        titleStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(71, 119, 231)));
        titleStyle.setAlignment(HorizontalAlignment.CENTER);
        titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        titleStyle.setWrapText(true);

        XSSFFont font=workbook.createFont();
        font.setFontName("微软雅黑");
        font.setFontHeightInPoints((short)10);
        XSSFCellStyle cellStyle=workbook.createCellStyle();
        cellStyle.setFont(font);
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        cellStyle.setWrapText(true);

        String[]titleArr = new String[]{
                "姓名","性别","出生年月日","民族","身份证号","户籍所在地详细地址","实际居住地详细地址",
                "父亲姓名","父亲工作单位","父亲工作单位详细地址","父亲移动电话",
                "母亲姓名","母亲工作单位","母亲工作单位详细地址","母亲移动电话",
                "所属社区","小区名称","房产证户主姓名","与新生的关系","房产证号",
                "幼儿园名称","新生特点","备注","报名时间"
        };

        int num = 0;
        XSSFRow row = sheet.createRow(num);
        row.setHeight((short)500);
        for (int i = 0; i < titleArr.length ; i++) {
            row.createCell(i).setCellStyle(titleStyle1);
        }

        sheet.addMergedRegion(new CellRangeAddress(0,0,0,23));
        row.getCell(0).setCellValue(fileName);

        num++;

        row = sheet.createRow(num);
        for (int i = 0; i < titleArr.length ; i++) {
            row.createCell(i).setCellStyle(titleStyle);
            row.getCell(i).setCellValue(titleArr[i]);
        }

        for (StudentVO studentVO:studentList) {

            num++;
            row = sheet.createRow(num);
            for (int i = 0; i < titleArr.length ; i++) {
                row.createCell(i).setCellStyle(cellStyle);
                row.getCell(i).setCellValue(titleArr[i]);
            }

            row.getCell(0).setCellValue(getTrimStr(studentVO.getName()+""));
            row.getCell(1).setCellValue(getTrimStr(studentVO.getGenderStr()+""));
            row.getCell(2).setCellValue(getTrimStr(studentVO.getBirthdayStr()+""));
            row.getCell(3).setCellValue(getTrimStr(studentVO.getNation()+""));
            row.getCell(4).setCellValue(getTrimStr(studentVO.getIdCard()+""));
            row.getCell(5).setCellValue(getTrimStr(studentVO.getKoseki()+""));
            row.getCell(6).setCellValue(getTrimStr(studentVO.getAddress()+""));

            row.getCell(7).setCellValue(getTrimStr(studentVO.getNameFather()+""));
            row.getCell(8).setCellValue(getTrimStr(studentVO.getWorkUnitFather()+""));
            row.getCell(9).setCellValue(getTrimStr(studentVO.getWorkAddressFather()+""));
//            row.getCell(10).setCellValue(getTrimStr(studentVO.getWorkTelephoneFather()+""));
//            row.getCell(11).setCellValue(getTrimStr(studentVO.getHomePhoneFather()+""));
            row.getCell(10).setCellValue(getTrimStr(studentVO.getPhoneFather()+""));

            row.getCell(11).setCellValue(getTrimStr(studentVO.getNameMather()+""));
            row.getCell(12).setCellValue(getTrimStr(studentVO.getWorkUnitMather()+""));
            row.getCell(13).setCellValue(getTrimStr(studentVO.getWorkAddressMather()+""));
//            row.getCell(16).setCellValue(getTrimStr(studentVO.getWorkTelephoneMather()+""));
//            row.getCell(17).setCellValue(getTrimStr(studentVO.getHomePhoneMather()+""));
            row.getCell(14).setCellValue(getTrimStr(studentVO.getPhoneMather()+""));

            row.getCell(15).setCellValue(getTrimStr(studentVO.getCommunityName()+""));
            row.getCell(16).setCellValue(getTrimStr(studentVO.getPlotName()+""));
            row.getCell(17).setCellValue(getTrimStr(studentVO.getHouseholdHead()+""));
            row.getCell(18).setCellValue(getTrimStr(studentVO.getRelation()+""));
            row.getCell(19).setCellValue(getTrimStr(studentVO.getPremisesPermitCode()+""));

            row.getCell(20).setCellValue(getTrimStr(studentVO.getKindergarten()+""));
            row.getCell(21).setCellValue(getTrimStr(studentVO.getFeature()+""));
            row.getCell(22).setCellValue(getTrimStr(studentVO.getRemark()+""));
            row.getCell(23).setCellValue(getTrimStr(studentVO.getCreateTimeStr()));

        }


        try {
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

    public String getTrimStr(String str){
        if(StringUtils.isEmpty(str)||"null".equals(str)){
            return "";
        }
        return str.trim();
    }

    @ApiOperation(value = "导出word", notes = "@author wang")
    @PostMapping("/student/export/word")
    public String exportWord(@RequestBody StudentQueryDTO queryDTO, HttpServletResponse response,HttpServletRequest request) {
        //查询数据
        List<StudentVO> studentList = studentService.queryAllExportData(queryDTO);
        studentService.exportWord(studentList,response,request);
        return null;
    }


}
