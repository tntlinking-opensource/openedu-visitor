package net.lab1024.smartadmin.module.enroll.community.domain.vo;

import lombok.Data;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotCascadeVo;

import java.util.List;

/**
 * 社区小区级联VO
 * @author wangQiang
 * @date 2021/6/6 14:38
 */
@Data
public class CommunityPlotCascadeVo {

    private String text;

    private String value;

    List<PlotCascadeVo> children;

}
