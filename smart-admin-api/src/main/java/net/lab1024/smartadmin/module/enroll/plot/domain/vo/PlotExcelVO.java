package net.lab1024.smartadmin.module.enroll.plot.domain.vo;

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
 * @date  2021-06-03 14:09:01
 * @since JDK1.8
 */
@Data
public class PlotExcelVO {
    @Excel(name = "id")
    private Long id;

    @Excel(name = "社区id")
    private Long communityId;

    @Excel(name = "名称")
    private String name;

    @Excel(name = "备注")
    private String remark;

    @Excel(name = "create_time", format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    @Excel(name = "update_time", format = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;



}
