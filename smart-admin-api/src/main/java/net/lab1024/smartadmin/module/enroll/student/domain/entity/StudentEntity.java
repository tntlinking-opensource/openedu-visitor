package net.lab1024.smartadmin.module.enroll.student.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import net.lab1024.smartadmin.common.domain.BaseEntity;
import java.util.Date;
import lombok.Data;

/**
 * [  ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-06-03 13:38:06
 * @since JDK1.8
 */
@Data
@TableName("e_student")
public class StudentEntity extends BaseEntity{


    /**
     * 姓名
     */
    private String name;

    /**
     * 性别
     */
    private Integer gender;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 民族
     */
    private String nation;

    /**
     * 户籍所在地详细地址
     */
    private String koseki;

    /**
     * 实际居住地详细地址（包含门栋号）
     */
    private String address;

    /**
     * 小区
     */
    private Integer plotid;


    /**
     * 房产证户主姓名
     */
    private String householdHead;
    /**
     * 与新生的关系
     */
    private String relation;

    /**
     * 房产证号
     */
    private String premisesPermitCode;

    /**
     * 幼儿园
     */
    private String kindergarten;

    /**
     * 身份证号
     */
    private String idCard;

    /**
     * 新生特点
     */
    private String feature;

    /**
     * 备注
     */
    private String remark;

    /**
     * 姓名 -----父亲
     */
    private String nameFather;

    /**
     * 工作单位-----父亲
     */
    private String workUnitFather;

    /**
     * 工作单位详细地址-----父亲
     */
    private String workAddressFather;

    /**
     * 单位电话-----父亲
     */
    private String workTelephoneFather;

    /**
     * 住宅电话-----父亲
     */
    private String homePhoneFather;

    /**
     * 手机-----父亲
     */
    private String phoneFather;

    /**
     * 姓名 -----母亲
     */
    private String nameMather;

    /**
     * 工作单位 -----母亲
     */
    private String workUnitMather;

    /**
     * 工作单位详细地址 -----母亲
     */
    private String workAddressMather;

    /**
     * 单位电话 -----母亲
     */
    private String workTelephoneMather;

    /**
     * 住宅电话 -----母亲
     */
    private String homePhoneMather;

    /**
     * 手机 -----母亲
     */
    private String phoneMather;



}
