package net.lab1024.smartadmin.module.system.province.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

/**
 *  [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-14 13:29:54
 * @since JDK1.8
 */
@Data
public class ProvinceExcelVO {
    @Excel(name = "自增id")
    private Long id;

    @Excel(name = "省份名称")
    private String name;

    @Excel(name = "备注")
    private String remark;



}
