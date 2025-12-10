package net.lab1024.smartadmin.module.system.department.domain.dto;

import lombok.Data;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotCascadeVo;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeCascadeVo;

import java.util.List;

/**
 *  部门教师级联实体类
 */
@Data
public class DepartmentTeacherCascadeVo {

    private String text;

    private String value;

    List<EmployeeCascadeVo> children;
}
