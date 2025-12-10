package net.lab1024.smartadmin.module.enroll.plot.domain.entity;

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
 * @date 2021-06-03 14:09:01
 * @since JDK1.8
 */
@Data
@TableName("e_plot")
public class PlotEntity extends BaseEntity{


    /**
     * 社区id
     */
    private Long communityId;

    /**
     * 名称
     */
    private String name;

    /**
     * 备注
     */
    private String remark;



}
