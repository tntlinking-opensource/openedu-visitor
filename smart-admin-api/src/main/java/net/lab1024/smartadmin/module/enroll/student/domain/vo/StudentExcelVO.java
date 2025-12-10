package net.lab1024.smartadmin.module.enroll.student.domain.vo;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;
import java.util.Date;

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
public class StudentExcelVO {
    @Excel(name = "id")
    private Long id;

    @Excel(name = "姓名")
    private String name;

    @Excel(name = "性别")
    private Integer gender;

    @Excel(name = "生日", format = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;

    @Excel(name = "民族")
    private String nation;

    @Excel(name = "户籍所在地详细地址")
    private String koseki;

    @Excel(name = "实际居住地详细地址（包含门栋号）")
    private String address;

    @Excel(name = "小区")
    private Integer plotid;

    @Excel(name = "房产证户主姓名及新生的关系")
    private String relation;

    @Excel(name = "房产证号")
    private String premisesPermitCode;

    @Excel(name = "幼儿园")
    private String kindergarten;

    @Excel(name = "身份证号")
    private String idCard;

    @Excel(name = "新生特点")
    private String feature;

    @Excel(name = "备注")
    private String remark;

    @Excel(name = "父亲姓名")
    private String pName;

    @Excel(name = "工作单位-----父亲")
    private String pWorkUnit;

    @Excel(name = "工作单位详细地址-----父亲")
    private String pWorkAddress;

    @Excel(name = "单位电话-----父亲")
    private String pWorkTelephone;

    @Excel(name = "住宅电话-----父亲")
    private String pHomePhone;

    @Excel(name = "手机-----父亲")
    private String pPhone;

    @Excel(name = "姓名 -----母亲")
    private String mName;

    @Excel(name = "工作单位 -----母亲")
    private String mWorkUnit;

    @Excel(name = "工作单位详细地址 -----母亲")
    private String mWorkAddress;

    @Excel(name = "单位电话 -----母亲")
    private String mWorkTelephone;

    @Excel(name = "住宅电话 -----母亲")
    private String mHomePhone;

    @Excel(name = "手机 -----母亲")
    private String mPhone;

    @Excel(name = "create_time", format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Excel(name = "update_time", format = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;



}
