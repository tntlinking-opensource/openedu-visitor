package net.lab1024.smartadmin.module.enroll.plot.domain.vo;

import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 *  [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-06-03 14:09:01
 * @since JDK1.8
 */
@Data
public class PlotVO {
    @ApiModelProperty("id")
    private Long id;

    @ApiModelProperty("社区id")
    private Long communityId;

    @ApiModelProperty("社区名称")
    private String communityName;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("create_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @ApiModelProperty("update_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;



}
