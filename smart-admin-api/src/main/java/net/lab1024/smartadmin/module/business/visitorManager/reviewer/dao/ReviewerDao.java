package net.lab1024.smartadmin.module.business.visitorManager.reviewer.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.entity.ReviewerEntity;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerVO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerExcelVO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-07 16:33:42
 * @since JDK1.8
 */
@Mapper
@Component
public interface ReviewerDao extends BaseMapper<ReviewerEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return ReviewerVO
    */
    IPage<ReviewerVO> queryByPage(Page page, @Param("queryDTO") ReviewerQueryDTO queryDTO);

    /**
     * 根据id删除
     * @param id
     * @return
    */
    void deleteById(@Param("id") Long id);

    /**
     * 根据id批量删除
     * @param idList
     * @return
    */
    void deleteByIdList(@Param("idList") List<Long> idList);

        /**
     * 查询所有导出数据
     * @param queryDTO
     * @return
     */
    List<ReviewerExcelVO> queryAllExportData(@Param("queryDTO") ReviewerQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<ReviewerExcelVO> queryBatchExportData(@Param("idList") List<Long> idList);

    public void addReviewer(Long id, List<Long> ids);

    public void deleteByDepartmentId(Long id);

    /**
     * 获取部门审核人信息
     * @param departmentId
     * @return
     */
    List<EmployeeVO> getShrByDeptId(Long departmentId);
}
