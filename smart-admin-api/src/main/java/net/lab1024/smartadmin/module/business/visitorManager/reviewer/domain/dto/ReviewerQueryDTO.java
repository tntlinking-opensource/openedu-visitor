package net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto;

import net.lab1024.smartadmin.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

/**
 * [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-07 16:33:42
 * @since JDK1.8
 */
@Data
public class ReviewerQueryDTO extends PageParamDTO {

    @ApiModelProperty("自增id")
    private Long id;

    @ApiModelProperty("部门id")
    private Long departmentId;

    @ApiModelProperty("审核人id 关联用户表")
    private Long employeeId;

    @ApiModelProperty("创建时间-开始")
    private Date createTimeBegin;

    @ApiModelProperty("创建时间-截止")
    private Date createTimeEnd;

    @ApiModelProperty("上次更新时间-开始")
    private Date updateTimeBegin;

    @ApiModelProperty("上次更新创建时间-开始")
    private Date updateTimeEnd;
}
