package net.lab1024.smartadmin.module.enroll.plot.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.enroll.plot.dao.PlotDao;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotAddDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotUpdateDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.dto.PlotQueryDTO;
import net.lab1024.smartadmin.module.enroll.plot.domain.entity.PlotEntity;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotVO;
import net.lab1024.smartadmin.module.enroll.plot.domain.vo.PlotExcelVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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
@Service
public class PlotService {

    @Autowired
    private PlotDao plotDao;

    /**
     * 根据id查询
     */
    public PlotEntity getById(Long id){
        return  plotDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    public ResponseDTO<PageResultDTO<PlotVO>> queryByPage(PlotQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<PlotVO> voList = plotDao.queryByPage(page, queryDTO);
        PageResultDTO<PlotVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    public ResponseDTO<String> add(PlotAddDTO addDTO) {
        PlotEntity entity = SmartBeanUtil.copy(addDTO, PlotEntity.class);
        entity.setCreateTime(new Date());
        entity.setUpdateTime(new Date());
        plotDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(PlotUpdateDTO updateDTO) {
        PlotEntity entity = SmartBeanUtil.copy(updateDTO, PlotEntity.class);
        entity.setUpdateTime(new Date());
        plotDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        plotDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    public List<PlotExcelVO> queryAllExportData(PlotQueryDTO queryDTO) {
        return plotDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-06-03 14:09:01
     */
    public List<PlotExcelVO> queryBatchExportData(List<Long> idList) {
        return plotDao.queryBatchExportData(idList);
    }

    /**
     * 小区列表
     * @return
     */
    List<PlotVO> getAll(){
        return  plotDao.getAll();
    }


}
