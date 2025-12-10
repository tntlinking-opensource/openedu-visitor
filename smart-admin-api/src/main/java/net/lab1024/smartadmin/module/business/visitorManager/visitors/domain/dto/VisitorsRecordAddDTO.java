package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto;

import lombok.Data;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import net.lab1024.smartadmin.util.encrypt.EncryptUtilForBase64;

/**
 * 新建 [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
public class VisitorsRecordAddDTO {
    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("身份证号")
    private String idCard;

    @ApiModelProperty("公司名称")
    private String companyName;

    @ApiModelProperty("电话")
    private String phone;

    @ApiModelProperty("所在地区")
    private String area;

    @ApiModelProperty("行程码")
    private String itineraryCode;

    @ApiModelProperty("健康码")
    private String healthCode;

    @ApiModelProperty("情况说明 ")
    private Integer specialCase;

    @ApiModelProperty("是否发热 1 是 0 否")
    private Integer isFr;

    @ApiModelProperty("访校时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    private Date visitorsTime;

    @ApiModelProperty("部门id")
    private Long departmentId;

    @ApiModelProperty("教师id关联用户表")
    private Long employeeId;

    @ApiModelProperty("说明信息")
    private String remark;

    @ApiModelProperty("0 待审核 1 已通过 -1未通过")
    private Integer shzt;

    @ApiModelProperty("审核意见")
    private String shyj;

    @ApiModelProperty("微信openid")
    private String openid;

    @ApiModelProperty("确认状态")
    private Integer affirmStatus;

    @ApiModelProperty("温度")
    private String temp;

    @ApiModelProperty("一人一码")
    private String qrCode;
}
