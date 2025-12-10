package net.lab1024.smartadmin.module.system.city.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.city.dao.CityDao;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityAddDTO;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityUpdateDTO;
import net.lab1024.smartadmin.module.system.city.domain.dto.CityQueryDTO;
import net.lab1024.smartadmin.module.system.city.domain.entity.CityEntity;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityVO;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityExcelVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Service
public class CityService {

    @Autowired
    private CityDao cityDao;

    /**
     * 根据id查询
     */
    public CityEntity getById(Long id){
        return  cityDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    public ResponseDTO<PageResultDTO<CityVO>> queryByPage(CityQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<CityVO> voList = cityDao.queryByPage(page, queryDTO);
        PageResultDTO<CityVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    public ResponseDTO<String> add(CityAddDTO addDTO) {
        CityEntity entity = SmartBeanUtil.copy(addDTO, CityEntity.class);
        cityDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(CityUpdateDTO updateDTO) {
        CityEntity entity = SmartBeanUtil.copy(updateDTO, CityEntity.class);
        cityDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteById(Long id) {
        cityDao.deleteById(id);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    public List<CityExcelVO> queryAllExportData(CityQueryDTO queryDTO) {
        return cityDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-07-14 13:59:00
     */
    public List<CityExcelVO> queryBatchExportData(List<Long> idList) {
        return cityDao.queryBatchExportData(idList);
    }

    public ResponseDTO<List<CityVO>> getAll(Long provinceId) {
        List<CityVO> list = cityDao.getAll(provinceId);
        return ResponseDTO.succData(list);
    }
}
