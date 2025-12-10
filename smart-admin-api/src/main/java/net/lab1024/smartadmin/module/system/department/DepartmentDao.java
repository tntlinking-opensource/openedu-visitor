package net.lab1024.smartadmin.module.system.department;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.module.support.heartbeat.HeartBeatRecordEntity;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentExcelVO;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentQueryDTO;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentVO;
import net.lab1024.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * t_department dao接口
 *
 * @author listen
 * @date 2017/12/19 10:58
 */
@Component
@Mapper
public interface DepartmentDao extends BaseMapper<DepartmentEntity> {

    /**
     * 根据部门id，查询此部门直接子部门的数量
     *
     * @param deptId
     * @return int 子部门的数量
     */
    Integer countSubDepartment(@Param("deptId") Long deptId);

    /**
     * 获取全部部门列表
     *
     * @return List<DepartmentVO>
     */
    List<DepartmentVO> listAll();

    /**
     * 功能描述: 根据父部门id查询
     *
     * @param
     * @return
     * @auther yandanyang
     * @date 2018/8/25 0025 上午 9:46
     */
    List<DepartmentVO> selectByParentId(@Param("departmentId") Long departmentId);


    /**
     * 分页查询
     * @param queryDTO
     * @return DepartmentVO
     */
    IPage<DepartmentVO> queryByPage(Page page, @Param("queryDTO") DepartmentQueryDTO queryDTO);

    /**
     * 根据id删除
     * @param id
     * @return
     */
    void deleteById(@Param("id")Long id);

    /**
     * 根据id批量删除
     * @param idList
     * @return
     */
    void deleteByIdList(@Param("idList") List<Long> idList);

//    /**
//     * 根据id批量设置审核人
//     * @param idList
//     * @return
//     */
//    void setReviewerByIds(@Param("idList") List<Long> idList);

    /**
     * 查询所有导出数据
     * @param queryDTO
     * @return
     */
    List<DepartmentExcelVO> queryAllExportData(@Param("queryDTO")DepartmentQueryDTO queryDTO);

    /**
     * 查询批量导出数据
     * @param idList
     * @return
     */
    List<DepartmentExcelVO> queryBatchExportData(@Param("idList")List<Long> idList);

    /**
     * 部门详情
     */
    List<Integer> getReviewer(Long id);

    List<DepartmentVO> getDepartmentByDeptName(String departmentName);


    /**
     * 新增部门信息 id不自增
     * @param departmentEntity
     */
    void insertDepartmentNoAuto(DepartmentEntity departmentEntity);

}
