package net.lab1024.smartadmin.module.enroll.student.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.enroll.student.domain.dto.StudentQueryDTO;
import net.lab1024.smartadmin.module.enroll.student.domain.entity.StudentEntity;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentVO;
import net.lab1024.smartadmin.module.enroll.student.domain.vo.StudentExcelVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

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
@Mapper
@Component
public interface StudentDao extends BaseMapper<StudentEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return StudentVO
    */
    IPage<StudentVO> queryByPage(Page page, @Param("queryDTO") StudentQueryDTO queryDTO);

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
    List<StudentVO> queryAllExportData(@Param("queryDTO") StudentQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<StudentExcelVO> queryBatchExportData(@Param("idList") List<Long> idList);

    /**
     * 通过身份证号获取学生信息
     * @param idCard
     * @return
     */
    StudentVO getByIdCard(@Param("idCard") String idCard);
}
