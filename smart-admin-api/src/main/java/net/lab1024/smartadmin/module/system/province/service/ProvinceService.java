package net.lab1024.smartadmin.module.system.province.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.city.dao.CityDao;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityCascsdeVo;
import net.lab1024.smartadmin.module.system.city.domain.vo.CityVO;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentTeacherCascadeVo;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentVO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeCascadeVo;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import net.lab1024.smartadmin.module.system.province.dao.ProvinceDao;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceAddDTO;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceUpdateDTO;
import net.lab1024.smartadmin.module.system.province.domain.dto.ProvinceQueryDTO;
import net.lab1024.smartadmin.module.system.province.domain.entity.ProvinceEntity;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceCityCascadeVo;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceVO;
import net.lab1024.smartadmin.module.system.province.domain.vo.ProvinceExcelVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
@Service
public class ProvinceService {

    @Autowired
    private ProvinceDao provinceDao;

    @Autowired
    private CityDao cityDao;

    /**
     * 根据id查询
     */
    public ProvinceEntity getById(Long id){
        return  provinceDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    public ResponseDTO<PageResultDTO<ProvinceVO>> queryByPage(ProvinceQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<ProvinceVO> voList = provinceDao.queryByPage(page, queryDTO);
        PageResultDTO<ProvinceVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    public ResponseDTO<String> add(ProvinceAddDTO addDTO) {
        ProvinceEntity entity = SmartBeanUtil.copy(addDTO, ProvinceEntity.class);
        provinceDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(ProvinceUpdateDTO updateDTO) {
        ProvinceEntity entity = SmartBeanUtil.copy(updateDTO, ProvinceEntity.class);
        provinceDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteById(Long id) {
        provinceDao.deleteById(id);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    public List<ProvinceExcelVO> queryAllExportData(ProvinceQueryDTO queryDTO) {
        return provinceDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-07-14 13:29:54
     */
    public List<ProvinceExcelVO> queryBatchExportData(List<Long> idList) {
        return provinceDao.queryBatchExportData(idList);
    }

    /**
     * 获取所有省份
     * @return
     */
    public ResponseDTO<List<ProvinceVO>> getAll() {
        List<ProvinceVO> list =  provinceDao.getAll();
        return ResponseDTO.succData(list);
    }

    /**
     * 省份级联城市
     */
    public List<ProvinceCityCascadeVo> getProvinceCityCascades(){
        List<ProvinceCityCascadeVo> list = new ArrayList<>();
        List<ProvinceVO> provinceVOS = provinceDao.listAll();
        List<CityVO> cityVOS = cityDao.selectAll();

        if(provinceVOS != null){
            for(ProvinceVO provinceVO : provinceVOS){
                ProvinceCityCascadeVo provinceCityCascadeVo = new ProvinceCityCascadeVo();
                provinceCityCascadeVo.setText(provinceVO.getName());
                provinceCityCascadeVo.setValue(provinceVO.getId() + "");

                List<CityCascsdeVo> cityCascsdeVos = new ArrayList<>();
                if(cityVOS != null){
                    for(CityVO cityVO : cityVOS){
                        if(provinceVO.getId().equals(cityVO.getProvinceId())){
                            CityCascsdeVo cityCascsdeVo = new CityCascsdeVo();
                            cityCascsdeVo.setText(cityVO.getName());
                            cityCascsdeVo.setValue(cityVO.getId() + "");
                            cityCascsdeVos.add(cityCascsdeVo);
                        }
                    }
                }
                provinceCityCascadeVo.setChildren(cityCascsdeVos);
                list.add(provinceCityCascadeVo);
            }
        }
        return list;
    }
}

