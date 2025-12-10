package net.lab1024.smartadmin.module.enroll.community.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityQueryDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.entity.CommunityEntity;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityVO;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityExcelVO;
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
 * @date 2021-06-03 11:40:12
 * @since JDK1.8
 */
@Mapper
@Component
public interface CommunityDao extends BaseMapper<CommunityEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return CommunityVO
    */
    IPage<CommunityVO> queryByPage(Page page, @Param("queryDTO") CommunityQueryDTO queryDTO);

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
    List<CommunityExcelVO> queryAllExportData(@Param("queryDTO") CommunityQueryDTO queryDTO);

    /**
     * 查询批量导出数据
     * @param idList
     * @return
     */
    List<CommunityExcelVO> queryBatchExportData(@Param("idList") List<Long> idList);

    /**
     * 社区列表
     * @return
     */
    List<CommunityVO> getAll();

}
