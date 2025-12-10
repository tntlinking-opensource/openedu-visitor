package net.lab1024.smartadmin.module.system.province.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import net.lab1024.smartadmin.common.domain.BaseEntity;
import lombok.Data;

/**
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-14 13:29:54
 * @since JDK1.8
 */
@Data
@TableName("vis_province")
public class ProvinceEntity extends BaseEntity{


    /**
     * 省份名称
     */
    private String name;

    /**
     * 备注
     */
    private String remark;

}
