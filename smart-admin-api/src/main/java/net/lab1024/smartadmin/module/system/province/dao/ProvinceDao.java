package net.lab1024.smartadmin.module.system.province.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentVO;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceQueryDTO;
import net.lab1024.smartadmin.module.system.province.domain.entity.ProvinceEntity;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceVO;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceExcelVO;
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
 * @date 2021-07-14 13:29:54
 * @since JDK1.8
 */
@Mapper
@Component
public interface ProvinceDao extends BaseMapper<ProvinceEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return ProvinceVO
    */
    IPage<ProvinceVO> queryByPage(Page page, @Param("queryDTO") ProvinceQueryDTO queryDTO);

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

        /**
     * 查询所有导出数据
     * @param queryDTO
     * @return
     */
    List<ProvinceExcelVO> queryAllExportData(@Param("queryDTO")ProvinceQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<ProvinceExcelVO> queryBatchExportData(@Param("idList")List<Long> idList);

    List<ProvinceVO> getAll();

    List<ProvinceVO> listAll();

}
