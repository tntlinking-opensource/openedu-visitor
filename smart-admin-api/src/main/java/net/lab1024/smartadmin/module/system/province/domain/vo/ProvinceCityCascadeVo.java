package net.lab1024.smartadmin.module.system.province.domain.vo;

import lombok.Data;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityCascsdeVo;

import java.util.List;

/**
 * 省份级联城市 vo 实体类
 */
@Data
public class ProvinceCityCascadeVo {
    private String text;

    private String value;

    List<CityCascsdeVo> children;
}
