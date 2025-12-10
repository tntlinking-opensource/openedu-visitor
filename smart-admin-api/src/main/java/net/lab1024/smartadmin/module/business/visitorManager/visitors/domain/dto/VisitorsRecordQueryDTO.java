package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto;

import net.lab1024.smartadmin.common.domain.PageParamDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

/**
 * [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
public class VisitorsRecordQueryDTO extends PageParamDTO {

    @ApiModelProperty("自增id")
    private Long id;

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("身份证号")
    private String idCard;

    @ApiModelProperty("电话")
    private String phone;

    @ApiModelProperty("审核状态")
    private Integer shzt;

    @ApiModelProperty("部门id")
    private Long departmentId;

}
