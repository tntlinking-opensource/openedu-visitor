package net.lab1024.smartadmin.module.system.city.domain.vo;

import lombok.Data;
import io.swagger.annotations.ApiModelProperty;

/**
 *  [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-14 13:59:00
 * @since JDK1.8
 */
@Data
public class CityVO {
    @ApiModelProperty("城市自增id")
    private Long id;

    @ApiModelProperty("城市名")
    private String name;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("省份id")
    private Long provinceId;



}
