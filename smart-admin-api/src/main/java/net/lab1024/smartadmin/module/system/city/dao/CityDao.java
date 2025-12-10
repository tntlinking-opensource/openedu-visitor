package net.lab1024.smartadmin.module.system.city.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityQueryDTO;
import net.lab1024.smartadmin.module.system.city.domain.entity.CityEntity;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityVO;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityExcelVO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
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
 * @date 2021-07-14 13:59:00
 * @since JDK1.8
 */
@Mapper
@Component
public interface CityDao extends BaseMapper<CityEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return CityVO
    */
    IPage<CityVO> queryByPage(Page page, @Param("queryDTO") CityQueryDTO queryDTO);

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
    List<CityExcelVO> queryAllExportData(@Param("queryDTO")CityQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<CityExcelVO> queryBatchExportData(@Param("idList")List<Long> idList);

    /**
     * 查询对应省份的所有城市
     * @param provinceId
     * @return
     */
    List<CityVO> getAll(Long provinceId);

    List<CityVO> selectAll();
}
