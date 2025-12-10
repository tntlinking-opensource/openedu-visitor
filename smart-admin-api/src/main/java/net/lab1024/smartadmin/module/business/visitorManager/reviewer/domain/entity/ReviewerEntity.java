package net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import net.lab1024.smartadmin.common.domain.BaseEntity;
import lombok.Data;

/**
 * [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-07 16:33:42
 * @since JDK1.8
 */
@Data
@TableName("vis_department_reviewer")
public class ReviewerEntity extends BaseEntity{


    /**
     * 部门id
     */
    private Long departmentId;

    /**
     * 审核人id 关联用户表
     */
    private Long employeeId;

}
