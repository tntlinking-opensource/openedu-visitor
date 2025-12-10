package net.lab1024.smartadmin.module.system.department.domain.dto;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;
import java.util.Date;

/**
 *  [ 部门表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-08 18:58:27
 * @since JDK1.8
 */
@Data
public class DepartmentExcelVO {
    @Excel(name = "部门主键id")
    private Long id;

    @Excel(name = "部门名称")
    private String name;

    @Excel(name = "部门简称")
    private String shortName;

    @Excel(name = "部门负责人id")
    private Long managerId;

    @Excel(name = "部门的父级id//无需")
    private Long parentId;

    @Excel(name = "部门排序//无需")
    private Integer sort;

    @Excel(name = "更新时间", format = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    @Excel(name = "创建时间", format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Excel(name = "部门编号")
    private String code;

    @Excel(name = "部门英文名称")
    private String engName;



}
