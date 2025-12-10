package net.lab1024.smartadmin.module.enroll.student.domain.dto;

import net.lab1024.smartadmin.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

/**
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-06-03 13:38:06
 * @since JDK1.8
 */
@Data
public class StudentQueryDTO extends PageParamDTO {

    @ApiModelProperty("id")
    private Long id;

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("性别")
    private Integer gender;

    @ApiModelProperty("身份证号")
    private String idCard;

    @ApiModelProperty("社区信息")
    private String plot;

    @ApiModelProperty("家长姓名")
    private String parentName;

    @ApiModelProperty("创建时间-开始")
    private Date createTimeBegin;

    @ApiModelProperty("创建时间-截止")
    private Date createTimeEnd;

    @ApiModelProperty("上次更新时间-开始")
    private Date updateTimeBegin;

    @ApiModelProperty("上次更新创建时间-开始")
    private Date updateTimeEnd;
}
