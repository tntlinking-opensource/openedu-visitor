package net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

/**
 *  [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-07 16:33:42
 * @since JDK1.8
 */
@Data
public class ReviewerExcelVO {
    @Excel(name = "自增id")
    private Long id;

    @Excel(name = "部门id")
    private Long departmentId;

    @Excel(name = "审核人id 关联用户表")
    private Long employeeId;



}
