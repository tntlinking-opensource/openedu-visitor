package net.lab1024.smartadmin.module.system.user.domain.dto;

import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 * 新建 [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-06 17:25:00
 * @since JDK1.8
 */
@Data
public class UserAddDTO {
    @ApiModelProperty("登录帐号")
    private String loginName;

    @ApiModelProperty("登录密码")
    private String loginPwd;

    @ApiModelProperty("员工名称")
    private String actualName;

    @ApiModelProperty("别名")
    private String nickName;

    @ApiModelProperty("手机号码")
    private String phone;

    @ApiModelProperty("身份证")
    private String idCard;

    @ApiModelProperty("出生日期")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date birthday;

    @ApiModelProperty("邮箱")
    private String email;

    @ApiModelProperty("部门id")
    private Long departmentId;

    @ApiModelProperty("是否离职1是")
    private Integer isLeave;

    @ApiModelProperty("是否被禁用 0否1是")
    private Integer isDisabled;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("创建者id")
    private Integer createUser;

    @ApiModelProperty("更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    @ApiModelProperty("创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @ApiModelProperty("是否删除0否 1是")
    private Integer isDelete;

    @ApiModelProperty("身份 1学生 2老师")
    private Long identity;


}
