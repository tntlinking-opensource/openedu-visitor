package net.lab1024.smartadmin.module.enroll.community.controller;

import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityAddDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityUpdateDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityQueryDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityPlotCascadeVo;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityVO;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityExcelVO;
import net.lab1024.smartadmin.module.enroll.community.service.CommunityService;
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
 * @date 2021-06-03 11:40:12
 * @since JDK1.8
 */
@RestController
@Api(tags = {""})
public class CommunityController extends BaseController {

    @Autowired
    private CommunityService communityService;

    @ApiOperation(value = "分页查询",notes = "@author wang")
    @PostMapping("/community/page/query")
    public ResponseDTO<PageResultDTO<CommunityVO>> queryByPage(@RequestBody CommunityQueryDTO queryDTO) {
        return communityService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加",notes = "@author wang")
    @PostMapping("/community/add")
    public ResponseDTO<String> add(@RequestBody @Validated CommunityAddDTO addTO){
        return communityService.add(addTO);
    }

    @ApiOperation(value="修改",notes = "@author wang")
    @PostMapping("/community/update")
    public ResponseDTO<String> update(@RequestBody @Validated CommunityUpdateDTO updateDTO){
        return communityService.update(updateDTO);
    }

    @ApiOperation(value="批量删除",notes = "@author wang")
    @PostMapping("/community/deleteByIds")
    public ResponseDTO<String> delete(@RequestBody @Validated ValidateList<Long> idList) {
        return communityService.deleteByIds(idList);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/community/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<CommunityExcelVO> communityList = communityService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, CommunityExcelVO.class, communityList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/community/export/all")
    public void exportAll(@RequestBody @Validated CommunityQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<CommunityExcelVO> communityList = communityService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, CommunityExcelVO.class, communityList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "社区列表",notes = "@author wang")
    @PostMapping("/community/getAll")
    public List<CommunityVO> getAll() {
        return communityService.getAll();
    }

    @NoNeedLogin
    @ApiOperation(value = "社区小区级联数据",notes = "@author wang")
    @PostMapping("/community/getCommunityPlotCascades")
    public List<CommunityPlotCascadeVo> getCommunityPlotCascades() {
        return communityService.getCommunityPlotCascades();
    }
}
