package net.lab1024.smartadmin.module.system.user.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;
import java.util.Date;

/**
 *  [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-06 17:25:00
 * @since JDK1.8
 */
@Data
public class UserExcelVO {
    @Excel(name = "主键")
    private Long id;

    @Excel(name = "登录帐号")
    private String loginName;

    @Excel(name = "登录密码")
    private String loginPwd;

    @Excel(name = "员工名称")
    private String actualName;

    @Excel(name = "别名")
    private String nickName;

    @Excel(name = "手机号码")
    private String phone;

    @Excel(name = "身份证")
    private String idCard;

    @Excel(name = "出生日期", format = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;

    @Excel(name = "邮箱")
    private String email;

    @Excel(name = "部门id")
    private Long departmentId;

    @Excel(name = "是否离职1是")
    private Integer isLeave;

    @Excel(name = "是否被禁用 0否1是")
    private Integer isDisabled;

    @Excel(name = "备注")
    private String remark;

    @Excel(name = "创建者id")
    private Integer createUser;

    @Excel(name = "更新时间", format = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    @Excel(name = "创建时间", format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Excel(name = "是否删除0否 1是")
    private Integer isDelete;

    @Excel(name = "身份 1学生 2老师")
    private Long identity;



}
