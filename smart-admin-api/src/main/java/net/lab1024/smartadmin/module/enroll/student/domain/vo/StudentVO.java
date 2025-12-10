package net.lab1024.smartadmin.module.enroll.student.domain.vo;

import lombok.Data;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

/**
 *  [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 彦致信息Inc. All rights reserved.
 * @date  2021-06-03 13:38:06
 * @since JDK1.8
 */
@Data
public class StudentVO {
    @ApiModelProperty("id")
    private Long id;

    @ApiModelProperty("姓名")
    private String name;

    @ApiModelProperty("性别")
    private Integer gender;

    @ApiModelProperty("生日")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date birthday;

    @ApiModelProperty("民族")
    private String nation;

    @ApiModelProperty("户籍所在地详细地址")
    private String koseki;

    @ApiModelProperty("实际居住地详细地址（包含门栋号）")
    private String address;

    @ApiModelProperty("小区")
    private Integer plotid;

    @ApiModelProperty("小区名称")
    private String plotName;

    @ApiModelProperty("社区名称")
    private String communityName;

    @ApiModelProperty("房产证户主姓名")
    private String householdHead;

    @ApiModelProperty("与新生的关系")
    private String relation;

    @ApiModelProperty("房产证号")
    private String premisesPermitCode;

    @ApiModelProperty("幼儿园")
    private String kindergarten;

    @ApiModelProperty("身份证号")
    private String idCard;

    @ApiModelProperty("新生特点")
    private String feature;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("姓名 -----父亲")
    private String nameFather;

    @ApiModelProperty("工作单位-----父亲")
    private String workUnitFather;

    @ApiModelProperty("工作单位详细地址-----父亲")
    private String workAddressFather;

    @ApiModelProperty("单位电话-----父亲")
    private String workTelephoneFather;

    @ApiModelProperty("住宅电话-----父亲")
    private String homePhoneFather;

    @ApiModelProperty("手机-----父亲")
    private String phoneFather;

    @ApiModelProperty("姓名 -----母亲")
    private String nameMather;

    @ApiModelProperty("工作单位 -----母亲")
    private String workUnitMather;

    @ApiModelProperty("工作单位详细地址 -----母亲")
    private String workAddressMather;

    @ApiModelProperty("单位电话 -----母亲")
    private String workTelephoneMather;

    @ApiModelProperty("住宅电话 -----母亲")
    private String homePhoneMather;

    @ApiModelProperty("手机 -----母亲")
    private String phoneMather;

    @ApiModelProperty("create_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    @ApiModelProperty("update_time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    public String getGenderStr(){
        String str = "男";
        if(this.gender == 2){
            str = "女";
        }
        return str;
    }

    public String getBirthdayStr(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(this.birthday != null){
            return sdf.format(this.birthday);
        }
        return "";
    }

    public String getCreateTimeStr(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if(this.createTime != null){
            return sdf.format(this.createTime);
        }
        return "";
    }

}
