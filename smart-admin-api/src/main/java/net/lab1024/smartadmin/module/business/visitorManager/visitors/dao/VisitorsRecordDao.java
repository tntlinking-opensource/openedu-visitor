package net.lab1024.smartadmin.module.business.visitorManager.visitors.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordCountQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.dto.VisitorsRecordQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.entity.VisitorsRecordEntity;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordVO;
import net.lab1024.smartadmin.module.business.visitorManager.visitors.domain.vo.VisitorsRecordExcelVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * [ 访客记录表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-12 09:50:19
 * @since JDK1.8
 */
@Mapper
@Component
public interface VisitorsRecordDao extends BaseMapper<VisitorsRecordEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return VisitorsRecordVO
    */
    IPage<VisitorsRecordVO> queryByPage(Page page, @Param("queryDTO") VisitorsRecordQueryDTO queryDTO);

    /**
     * 根据id删除
     * @param id
     * @return
    */
    void deleteById(@Param("id")Long id);

    /**
     * 获取所有访客信息
     * @return
     */
    List<VisitorsRecordVO> getAll();
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
    List<VisitorsRecordExcelVO> queryAllExportData(@Param("queryDTO")VisitorsRecordQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<VisitorsRecordExcelVO> queryBatchExportData(@Param("idList")List<Long> idList);

    void update(@Param("id")Long id, @Param("shzt")Integer shzt, @Param("shyj") String shyj,@Param("qrCode") String qrCode);

    List<VisitorsRecordVO> getByOpenId(String openId);

    VisitorsRecordVO getById(Long id);

    Integer getApplyCount(String openId);

    /**
     * 修改温度
     * @param id
     * @param temp
     */
    void updateTemp(@Param("id")Long id, @Param("temp")String temp );

    /**
     * 访客统计
     * @param countQueryDTO
     * @return
     */
    List<VisitorsRecordVO> visitorCount(@Param("queryDTO") VisitorsRecordCountQueryDTO countQueryDTO);
}
