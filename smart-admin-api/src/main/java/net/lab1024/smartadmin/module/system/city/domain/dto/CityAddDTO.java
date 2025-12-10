package net.lab1024.smartadmin.module.system.city.domain.dto;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 * 新建 [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-14 13:59:00
 * @since JDK1.8
 */
@Data
public class CityAddDTO {
    @ApiModelProperty("城市名")
    private String name;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("省份id")
    private Long provinceId;


}
