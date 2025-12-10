package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import net.lab1024.smartadmin.common.domain.BaseEntity;
import java.util.Date;
import lombok.Data;

/**
 * [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
@TableName("vis_visitors_record")
public class VisitorsRecordEntity extends BaseEntity{


    /**
     * 姓名
     */
    private String name;

    /**
     * 身份证号
     */
    private String idCard;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 电话
     */
    private String phone;

    /**
     * 所在地区
     */
    private String area;

    /**
     * 行程码
     */
    private String itineraryCode;

    /**
     * 健康码
     */
    private String healthCode;

    /**
     * 情况说明
     * 1本人未离开上海/抵达上海14天以上
     * 2本人抵达上海不满14天
     */
    private Integer specialCase;

    /**
     * 是否发热 1 是 0 否
     */
    private Integer isFr;

    /**
     * 访校时间
     */
    private Date visitorsTime;

    /**
     * 部门id
     */
    private Long departmentId;

    /**
     * 教师id关联用户表
     */
    private Long employeeId;

    /**
     * 说明信息
     */
    private String remark;

    /**
     * 0 待审核 1 已通过 -1未通过
     */
    private Integer shzt;

    /**
     * 审核意见
     */
    private String shyj;

    /**
     * 微信openid
     */
    private String openid;

    /**
     * 确认状态
     */
    private Integer affirmStatus;

    /**
     * 温度
     */
    private String temp;

    /**
     * 一人一码 二维码
     */
    private String qrCode;

}
