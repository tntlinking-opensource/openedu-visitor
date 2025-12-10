package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

/**
 *  [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
public class VisitorsRecordExcelVO {
    @Excel(name = "自增id")
    private Long id;

    @Excel(name = "姓名")
    private String name;

    @Excel(name = "身份证号")
    private String idCard;

    @Excel(name = "公司名称")
    private String companyName;

    @Excel(name = "电话")
    private String phone;

    @Excel(name = "所在地区")
    private String area;

    @Excel(name = "行程码")
    private String itineraryCode;

    @Excel(name = "健康码")
    private String healthCode;

    @Excel(name = "情况说明 ")
    private Integer specialCase;

    @Excel(name = "是否发热 1 是 0 否")
    private Integer isFr;

    @Excel(name = "访校时间", format = "yyyy-MM-dd")
    private Date visitorsTime;

    @Excel(name = "部门id")
    private Long departmentId;

    @Excel(name = "教师id关联用户表")
    private Long employeeId;

    @Excel(name = "说明信息")
    private String remark;

    @Excel(name = "0 待审核 1 已通过 -1未通过")
    private Integer shzt;

    @Excel(name = "审核意见")
    private String shyj;

    @Excel(name = "微信openid")
    private String openid;

    @ApiModelProperty("省份名")
    private String provinceName;

    @ApiModelProperty("城市名")
    private String cityName;

    @ApiModelProperty("地区")
    private String position;

    @ApiModelProperty("部门名")
    private String departmentName;

    @ApiModelProperty("教师名")
    private String employeeName;

    @ApiModelProperty("教师(工号)")
    private String employeeLoginName;

    @ApiModelProperty("部门/教师(工号)")
    private String deptEmp;

    @ApiModelProperty("确认状态")
    private Integer affirmStatus;

    @ApiModelProperty("温度")
    private String temp;

    @ApiModelProperty("一人一码")
    private String qrCode;
}
