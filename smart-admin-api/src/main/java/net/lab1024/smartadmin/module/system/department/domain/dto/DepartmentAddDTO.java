package net.lab1024.smartadmin.module.system.department.domain.dto;

import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 * 新建 [ 部门表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-08 18:58:27
 * @since JDK1.8
 */
@Data
public class DepartmentAddDTO {
    @ApiModelProperty("部门名称")
    private String name;

    @ApiModelProperty("部门简称")
    private String shortName;

    @ApiModelProperty("部门负责人id")
    private Long managerId;

    @ApiModelProperty("部门的父级id//无需")
    private Long parentId;

    @ApiModelProperty("部门排序//无需")
    private Integer sort;

    @ApiModelProperty("更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @ApiModelProperty("部门编号")
    private String code;

    @ApiModelProperty("部门英文名称")
    private String engName;


}
