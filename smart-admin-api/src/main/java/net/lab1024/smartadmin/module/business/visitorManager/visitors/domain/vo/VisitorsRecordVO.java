package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import net.lab1024.smartadmin.util.encrypt.EncryptUtilForBase64;
import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Base64;
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
public class VisitorsRecordVO {
    @ApiModelProperty("自增id")
    private Long id;

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

    @ApiModelProperty("部门名")
    private String departmentName;

    @ApiModelProperty("教师id")
    private Long employeeId;

    @ApiModelProperty("教师名")
    private String employeeName;

    @ApiModelProperty("教师(工号)")
    private String employeeLoginName;

    @ApiModelProperty("部门/教师(工号)")
    private String deptEmp;

    @ApiModelProperty("说明信息")
    private String remark;

    @ApiModelProperty("0 待审核 1 已通过 -1未通过")
    private Integer shzt;

    @ApiModelProperty("审核意见")
    private String shyj;

    @ApiModelProperty("微信openid")
    private String openid;

    @ApiModelProperty("更新时间")
    private Date updateTime;

    @ApiModelProperty("创建时间")
    private Date createTime;

    @ApiModelProperty("确认状态")
    private Integer affirmStatus;

    @ApiModelProperty("温度")
    private String temp;

    @ApiModelProperty("一人一码")
    private String qrCode;

    public String getDeptEmp(){
        return this.departmentName+"/"+employeeName+"("+this.employeeLoginName+")";
    }

    /**
     * 获取加密后的身份证号 身份证号码保留前4位，后4位
     * @return String
     */
    public String getIdCardEncryption(){
        String idCardEncryption = EncryptUtilForBase64.decode(this.idCard);
        if(!StringUtils.isEmpty(idCardEncryption)){
            idCardEncryption = idCardEncryption.replaceAll("(\\d{4})\\d{10}(\\d{4})", "$1****$2");
        }
        return idCardEncryption;
    }

    /**
     * 获取解密后的身份证号码
     * @return
     */
    public String getIdCard() {
        return EncryptUtilForBase64.decode(idCard);
    }

    /**
     * 获取解密后的手机
     * @return
     */
    public String getPhone() {
        return EncryptUtilForBase64.decode(phone);
    }

    /**
     * 获取解密后的手机
     * @return
     */
    public boolean getOnTime() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        if(this.visitorsTime != null){
            String visitorsTimeStr = simpleDateFormat.format(this.visitorsTime);
            String todayStr = simpleDateFormat.format(new Date());
            if(visitorsTimeStr.equals(todayStr)){
                return true;
            }
        }
        return false;
    }

}
