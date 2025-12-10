package net.lab1024.smartadmin.module.enroll.community.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.enroll.community.dao.CommunityDao;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityAddDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityUpdateDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.dto.CommunityQueryDTO;
import net.lab1024.smartadmin.module.enroll.community.domain.entity.CommunityEntity;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityPlotCascadeVo;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityVO;
import net.lab1024.smartadmin.module.enroll.community.domain.vo.CommunityExcelVO;
import net.lab1024.smartadmin.module.enroll.plot.dao.PlotDao;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotCascadeVo;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
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
@Service
public class CommunityService {

    @Autowired
    private CommunityDao communityDao;

    @Autowired
    private PlotDao plotDao;

    /**
     * 根据id查询
     */
    public CommunityEntity getById(Long id){
        return  communityDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    public ResponseDTO<PageResultDTO<CommunityVO>> queryByPage(CommunityQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<CommunityVO> voList = communityDao.queryByPage(page, queryDTO);
        PageResultDTO<CommunityVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    public ResponseDTO<String> add(CommunityAddDTO addDTO) {
        CommunityEntity entity = SmartBeanUtil.copy(addDTO, CommunityEntity.class);
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        communityDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(CommunityUpdateDTO updateDTO) {
        CommunityEntity entity = SmartBeanUtil.copy(updateDTO, CommunityEntity.class);
        entity.setUpdateTime(new Date());
        communityDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        communityDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    public List<CommunityExcelVO> queryAllExportData(CommunityQueryDTO queryDTO) {
        return communityDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    public List<CommunityExcelVO> queryBatchExportData(List<Long> idList) {
        return communityDao.queryBatchExportData(idList);
    }

    /**
     * 社区列表
     * @author wang
     * @date 2021-06-03 11:40:12
     */
    public List<CommunityVO> getAll() {
        return communityDao.getAll();
    }

    /**
     * 社区小区级联数据
     * @return
     */
    public List<CommunityPlotCascadeVo> getCommunityPlotCascades(){
        List<CommunityPlotCascadeVo> CommunityPlotCascades = new ArrayList<>();

        List<CommunityVO> communityVOS = communityDao.getAll();
        List<PlotVO> plotVOS = plotDao.getAll();

        if(communityVOS != null){
            for (CommunityVO communityVO :communityVOS) {

                CommunityPlotCascadeVo communityPlotCascadeVo = new CommunityPlotCascadeVo();
                communityPlotCascadeVo.setText(communityVO.getName());
                communityPlotCascadeVo.setValue(communityVO.getId()+"");

                List<PlotCascadeVo> plotCascadeVos = new ArrayList<>();
                if(plotVOS != null){
                    for (PlotVO plotVO:plotVOS) {
                        if(communityVO.getId().equals(plotVO.getCommunityId())){
                            PlotCascadeVo plotCascadeVo = new PlotCascadeVo();
                            plotCascadeVo.setText(plotVO.getName());
                            plotCascadeVo.setValue(plotVO.getId()+"");
                            plotCascadeVos.add(plotCascadeVo);
                        }
                    }
                }

                communityPlotCascadeVo.setChildren(plotCascadeVos);
                CommunityPlotCascades.add(communityPlotCascadeVo);
            }
        }


        return CommunityPlotCascades;
    }
}
