package net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto;

import lombok.Data;

/**
 * 更新 [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-12 09:50:19
 * @since JDK1.8
 */
@Data
public class VisitorsRecordUpdateDTO extends VisitorsRecordAddDTO {

    private Long id;

    /**
     * 审核状态
     */
    private Integer shzt;

    /**
     * 审核意见
     */
    private String shyj;

    /**
     * 一人一码 二维码
     */
    private String qrCode;
}
