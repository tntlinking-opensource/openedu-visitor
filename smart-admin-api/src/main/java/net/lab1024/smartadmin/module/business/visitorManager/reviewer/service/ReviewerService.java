package net.lab1024.smartadmin.module.business.visitorManager.reviewer.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.dao.ReviewerDao;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerAddDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerUpdateDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.dto.ReviewerQueryDTO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.entity.ReviewerEntity;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerVO;
import net.lab1024.smartadmin.module.business.visitorManager.reviewer.domain.vo.ReviewerExcelVO;
import net.lab1024.smartadmin.module.system.department.domain.dto.DepartmentVO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * [ 部门审核人表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-07 16:33:42
 * @since JDK1.8
 */
@Service
public class ReviewerService {

    @Autowired
    private ReviewerDao reviewerDao;

    /**
     * 根据id查询
     */
    public ReviewerEntity getById(Long id){
        return  reviewerDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    public ResponseDTO<PageResultDTO<ReviewerVO>> queryByPage(ReviewerQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<ReviewerVO> voList = reviewerDao.queryByPage(page, queryDTO);
        PageResultDTO<ReviewerVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    public ResponseDTO<String> add(ReviewerAddDTO addDTO) {
        ReviewerEntity entity = SmartBeanUtil.copy(addDTO, ReviewerEntity.class);
        reviewerDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(ReviewerUpdateDTO updateDTO) {
        ReviewerEntity entity = SmartBeanUtil.copy(updateDTO, ReviewerEntity.class);
        reviewerDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        reviewerDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    public List<ReviewerExcelVO> queryAllExportData(ReviewerQueryDTO queryDTO) {
        return reviewerDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-07-07 16:33:42
     */
    public List<ReviewerExcelVO> queryBatchExportData(List<Long> idList) {
        return reviewerDao.queryBatchExportData(idList);
    }

    public ResponseDTO<String> addReviewer(Long id, List<Long> ids) {
        reviewerDao.deleteByDepartmentId(id);
        reviewerDao.addReviewer(id,ids);

        return ResponseDTO.succ();
    }

    /**
     * 获取部门下审核人信息
     * @param departmentId
     * @return
     */
    List<EmployeeVO> getShrByDeptId(Long departmentId){
        return reviewerDao.getShrByDeptId(departmentId);
    }
}
