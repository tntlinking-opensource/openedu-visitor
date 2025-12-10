package net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 * 新建 [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-07 16:33:42
 * @since JDK1.8
 */
@Data
public class ReviewerAddDTO {
    @ApiModelProperty("部门id")
    private Long departmentId;

    @ApiModelProperty("审核人id 关联用户表")
    private Long employeeId;


}
