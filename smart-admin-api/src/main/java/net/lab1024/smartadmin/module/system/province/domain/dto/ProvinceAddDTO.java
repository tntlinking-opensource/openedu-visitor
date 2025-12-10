package net.lab1024.smartadmin.module.system.province.domain.dto;

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
 * @date  2021-07-14 13:29:54
 * @since JDK1.8
 */
@Data
public class ProvinceAddDTO {
    @ApiModelProperty("省份名称")
    private String name;

    @ApiModelProperty("备注")
    private String remark;


}
