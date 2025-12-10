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
public class VisitorsRecordConfirmDTO extends VisitorsRecordAddDTO {

    private Long id;

    /**
     * 温度
     */
    private String temp;
}
