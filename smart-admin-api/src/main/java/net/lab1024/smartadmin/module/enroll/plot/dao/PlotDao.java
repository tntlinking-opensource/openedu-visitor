package net.lab1024.smartadmin.module.enroll.plot.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotQueryDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.entity.PlotEntity;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotVO;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotExcelVO;
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
 * @date 2021-06-03 14:09:01
 * @since JDK1.8
 */
@Mapper
@Component
public interface PlotDao extends BaseMapper<PlotEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return PlotVO
    */
    IPage<PlotVO> queryByPage(Page page, @Param("queryDTO") PlotQueryDTO queryDTO);

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
    List<PlotExcelVO> queryAllExportData(@Param("queryDTO") PlotQueryDTO queryDTO);

    /**
     * 查询批量导出数据
     * @param idList
     * @return
     */
    List<PlotExcelVO> queryBatchExportData(@Param("idList") List<Long> idList);

    /**
     * 小区列表
     * @return
     */
    List<PlotVO> getAll();
}
