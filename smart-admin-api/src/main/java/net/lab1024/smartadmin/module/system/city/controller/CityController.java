package net.lab1024.smartadmin.module.system.city.controller;

import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.controller.BaseController;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.common.domain.ValidateList;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityAddDTO;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityUpdateDTO;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityQueryDTO;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityVO;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityExcelVO;
import net.lab1024.smartadmin.module.system.city.service.CityService;
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
 * @date 2021-07-14 13:59:00
 * @since JDK1.8
 */
@RestController
@Api(tags = {""})
public class CityController extends BaseController {

    @Autowired
    private CityService cityService;

    @ApiOperation(value = "分页查询",notes = "@author wang")
    @PostMapping("/city/page/query")
    public ResponseDTO<PageResultDTO<CityVO>> queryByPage(@RequestBody CityQueryDTO queryDTO) {
        return cityService.queryByPage(queryDTO);
    }

    @ApiOperation(value = "添加",notes = "@author wang")
    @PostMapping("/city/add")
    public ResponseDTO<String> add(@RequestBody @Validated CityAddDTO addTO){
        return cityService.add(addTO);
    }

    @ApiOperation(value="修改",notes = "@author wang")
    @PostMapping("/city/update")
    public ResponseDTO<String> update(@RequestBody @Validated CityUpdateDTO updateDTO){
        return cityService.update(updateDTO);
    }

    @ApiOperation(value="删除",notes = "@author wang")
    @PostMapping("/city/deleteById/{id}")
    public ResponseDTO<String> delete(@PathVariable Long id) {
        return cityService.deleteById(id);
    }

    @ApiOperation(value = "批量导出", notes = "@author wang")
    @PostMapping("/city/export/batch")
    public void batchExport(@RequestBody @Validated ValidateList<Long> idList, HttpServletResponse response) {
        //查询数据
        List<CityExcelVO> cityList = cityService.queryBatchExportData(idList);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, CityExcelVO.class, cityList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "导出全部", notes = "@author wang")
    @PostMapping("/city/export/all")
    public void exportAll(@RequestBody @Validated CityQueryDTO queryDTO, HttpServletResponse response) {
        //查询数据
        List<CityExcelVO> cityList = cityService.queryAllExportData(queryDTO);
        //导出操作
        ExportParams ex = new ExportParams("", "Sheet1");
        Workbook workbook = ExcelExportUtil.exportExcel(ex, CityExcelVO.class, cityList);
        downloadExcel("", workbook, response);
    }

    @ApiOperation(value = "查询所有(对应省份)", notes = "@author wang")
    @GetMapping("/city/getAll/{provinceId}")
    public ResponseDTO<List<CityVO>> getAllCity(@PathVariable Long provinceId) {
        return cityService.getAll(provinceId);
    }

}
