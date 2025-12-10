package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import net.lab1024.smartadmin.common.domain.PageParamDTO;

/**
 * [ 访客记录统计 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
public class VisitorsRecordCountQueryDTO{

    @ApiModelProperty("开始时间")
    private String startDate;

    @ApiModelProperty("结束时间")
    private String endDate;

}
