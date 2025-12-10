package net.lab1024.smartadmin.module.system.department.domain.dto;

import net.lab1024.smartadmin.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;
import java.util.List;

/**
 * [ 部门表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-08 18:58:27
 * @since JDK1.8
 */
@Data
public class DepartmentQueryDTO extends PageParamDTO {

    @ApiModelProperty("部门主键id")
    private Long id;

    @ApiModelProperty("部门名称")
    private String name;

    @ApiModelProperty("部门简称")
    private String shortName;

    @ApiModelProperty("部门负责人id")
    private Long managerId;

    @ApiModelProperty("部门负责人名字")
    private String managerName;

    @ApiModelProperty("部门编号")
    private String code;

    @ApiModelProperty("部门英文名称")
    private String engName;

    @ApiModelProperty("创建时间-开始")
    private Date createTimeBegin;

    @ApiModelProperty("创建时间-截止")
    private Date createTimeEnd;

    @ApiModelProperty("上次更新时间-开始")
    private Date updateTimeBegin;

    @ApiModelProperty("上次更新创建时间-开始")
    private Date updateTimeEnd;

    @ApiModelProperty("部门审核人")
    private List<String> reviewers;

}
