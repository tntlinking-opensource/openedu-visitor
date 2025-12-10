package net.lab1024.smartadmin.module.enroll.community.domain.entity;

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
 * @date 2021-06-03 11:40:12
 * @since JDK1.8
 */
@Data
@TableName("e_community")
public class CommunityEntity extends BaseEntity{


    /**
     * name
     */
    private String name;

    /**
     * remark
     */
    private String remark;



}
