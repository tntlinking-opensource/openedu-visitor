package net.lab1024.smartadmin.module.enroll.plot.domain.dto;

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
 * @date 2021-06-03 14:09:01
 * @since JDK1.8
 */
@Data
public class PlotQueryDTO extends PageParamDTO {

    @ApiModelProperty("id")
    private Long id;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("社区id")
    private Long communityId;

    @ApiModelProperty("创建时间-开始")
    private Date createTimeBegin;

    @ApiModelProperty("创建时间-截止")
    private Date createTimeEnd;

    @ApiModelProperty("上次更新时间-开始")
    private Date updateTimeBegin;

    @ApiModelProperty("上次更新创建时间-开始")
    private Date updateTimeEnd;
}
