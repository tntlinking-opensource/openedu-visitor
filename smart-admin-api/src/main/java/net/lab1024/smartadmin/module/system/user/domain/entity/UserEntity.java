package net.lab1024.smartadmin.module.system.user.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import net.lab1024.smartadmin.common.domain.BaseEntity;
import java.util.Date;
import lombok.Data;

/**
 * [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-06 17:25:00
 * @since JDK1.8
 */
@Data
@TableName("t_user")
public class UserEntity extends BaseEntity{


    /**
     * 登录帐号
     */
    private String loginName;

    /**
     * 登录密码
     */
    private String loginPwd;

    /**
     * 员工名称
     */
    private String actualName;

    /**
     * 别名
     */
    private String nickName;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 身份证
     */
    private String idCard;

    /**
     * 出生日期
     */
    private Date birthday;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 部门id
     */
    private Long departmentId;

    /**
     * 是否离职1是
     */
    private Integer isLeave;

    /**
     * 是否被禁用 0否1是
     */
    private Integer isDisabled;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建者id
     */
    private Integer createUser;



    /**
     * 是否删除0否 1是
     */
    private Integer isDelete;

    /**
     * 身份 1学生 2老师
     */
    private Long identity;

}
