package net.lab1024.smartadmin.module.system.province.controller;

import net.lab1024.smartadmin.common.anno.NoNeedLogin;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentTeacherCascadeVo;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceAddDTO;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceUpdateDTO;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceQueryDTO;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceCityCascadeVo;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceVO;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceExcelVO;
import net.lab1024.smartadmin.module.system.province.service.ProvinceService;
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
 * @date 2021-07-14 13:29:54
 * @since JDK1.8
 */
@RestController
@Api(tags = {""})
public class ProvinceController extends BaseController {

    @Autowired
    private ProvinceService provinceService;

    @ApiOperation(value = "分页查询",notes = "@author wang")
    @PostMapping("/province/page/query")
    public ResponseDTO<PageResultDTO<ProvinceVO>> queryByPage(@RequestBody ProvinceQueryDTO queryDTO) {
        return provinceService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加",notes = "@author wang")
    @PostMapping("/province/add")
    public ResponseDTO<String> add(@RequestBody @Validated ProvinceAddDTO addTO){
        return provinceService.add(addTO);
    }

    @ApiOperation(value="修改",notes = "@author wang")
    @PostMapping("/province/update")
    public ResponseDTO<String> update(@RequestBody @Validated ProvinceUpdateDTO updateDTO){
        return provinceService.update(updateDTO);
    }

    @ApiOperation(value="删除",notes = "@author wang")
    @PostMapping("/province/deleteById/{id}")
    public ResponseDTO<String> delete(@PathVariable Long id) {
        return provinceService.deleteById(id);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/province/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<ProvinceExcelVO> provinceList = provinceService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, ProvinceExcelVO.class, provinceList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/province/export/all")
    public void exportAll(@RequestBody @Validated ProvinceQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<ProvinceExcelVO> provinceList = provinceService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, ProvinceExcelVO.class, provinceList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "查询全部", notes = "@author wang")
    @GetMapping("/province/getAll")
    public ResponseDTO<List<ProvinceVO>> getAll(){
        return provinceService.getAll();
    }


    @NoNeedLogin
    @ApiOperation(value = "省份城市级联数据",notes = "@author wang")
    @PostMapping("/province/getProvinceCityCascades")
    public List<ProvinceCityCascadeVo> getProvinceCityCascades() {
        return provinceService.getProvinceCityCascades();
    }
}
