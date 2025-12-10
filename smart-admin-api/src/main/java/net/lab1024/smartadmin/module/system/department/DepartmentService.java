package net.lab1024.smartadmin.module.system.department;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.department.domain.dto.*;
import net.lab1024.smartadmin.module.system.department.domain.entity.DepartmentEntity;
import net.lab1024.smartadmin.module.system.employee.EmployeeDao;
import net.lab1024.smartadmin.module.system.employee.domain.dto.EmployeeDTO;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeCascadeVo;
import net.lab1024.smartadmin.module.system.employee.domain.vo.EmployeeVO;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import net.lab1024.smartadmin.util.SmartPageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 部门管理业务类
 *
 * @author listen
 * @date 2017/12/19 14:25
 */
@Service
public class DepartmentService{

    @Autowired
    private DepartmentDao departmentDao;

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentTreeService departmentTreeService;

    /**
     * 获取部门树形结构
     *
     * @return
     */
    public ResponseDTO<List<DepartmentVO>> listDepartment() {
        List<DepartmentVO> departmentVOList = departmentDao.listAll();
        List<DepartmentVO> result = departmentTreeService.buildTree(departmentVOList);
        return ResponseDTO.succData(result);
    }

    /**
     * 获取所有部门和员工信息
     *
     * @param departmentName
     * @return
     */
    public ResponseDTO<List<DepartmentVO>> listAllDepartmentEmployee(String departmentName) {

        // 获取全部部门列表
        List<DepartmentVO> departmentVOList = departmentDao.listAll();
        if (StringUtils.isNotBlank(departmentName)) {
            // 检索条件不为空的时候 过滤部门列表
            departmentVOList = filterDepartment(departmentVOList, departmentName);
        }

        Map<Long, DepartmentVO> departmentMap = departmentVOList.stream().collect(Collectors.toMap(DepartmentVO::getId, Function.identity()));
        // 获取全部员工列表
        List<EmployeeDTO> employeeList = employeeDao.listAll();
        employeeList.forEach(employeeDTO -> {

            DepartmentVO departmentVO = departmentMap.get(employeeDTO.getDepartmentId());
            if (null == departmentVO) {
                return;
            }
            List<EmployeeDTO> employeeDTOList = departmentVO.getEmployees();
            if (null == employeeDTOList) {
                employeeDTOList = new ArrayList<>();
            }
            employeeDTOList.add(employeeDTO);
            departmentVO.setEmployees(employeeDTOList);
        });
        List<DepartmentVO> result = departmentTreeService.buildTree(departmentVOList);
        return ResponseDTO.succData(result);
    }


    /**
     * 获取所有部门和员工信息 根据部门id
     *
     * @param id
     * @return
     */
    public ResponseDTO<List<DepartmentVO>> listAllDepartmentEmployeeById(Integer id) {

        // 获取全部部门列表
        List<DepartmentVO> departmentVOList = departmentDao.listAll();
            // 检索条件不为空的时候 过滤部门列表


        Map<Long, DepartmentVO> departmentMap = departmentVOList.stream().collect(Collectors.toMap(DepartmentVO::getId, Function.identity()));
        // 获取全部员工列表
        List<EmployeeDTO> employeeList = employeeDao.listAll();
        employeeList.forEach(employeeDTO -> {

            DepartmentVO departmentVO = departmentMap.get(employeeDTO.getDepartmentId());
            if (null == departmentVO) {
                return;
            }
            List<EmployeeDTO> employeeDTOList = departmentVO.getEmployees();
            if (null == employeeDTOList) {
                employeeDTOList = new ArrayList<>();
            }
            employeeDTOList.add(employeeDTO);
            departmentVO.setEmployees(employeeDTOList);
        });
        List<DepartmentVO> result = departmentTreeService.buildTree(departmentVOList);
        return ResponseDTO.succData(result);
    }

    /**
     * 过滤部门名称，获取过滤后的结果
     *
     * @author lidoudou
     * @date 2019/4/28 20:17
     */
    private List<DepartmentVO> filterDepartment(List<DepartmentVO> departmentVOList, String departmentName) {
        Map<Long, DepartmentVO> departmentMap = new HashMap<>();
        departmentVOList.forEach(item -> {
            if (item.getName().indexOf(departmentName) < 0) {
                return;
            }
            // 当前部门包含关键字
            departmentMap.put(item.getId(), item);
            Long parentId = item.getParentId();
            if (null != parentId) {
                List<DepartmentVO> filterResult = new ArrayList<>();
                getParentDepartment(departmentVOList, parentId, filterResult);
                for (DepartmentVO dto : filterResult) {
                    if (!departmentMap.containsKey(dto.getId())) {
                        departmentMap.put(dto.getId(), dto);
                    }
                }
            }
        });
        return departmentMap.values().stream().collect(Collectors.toList());
    }

    private List<DepartmentVO> getParentDepartment(List<DepartmentVO> departmentVOList, Long parentId, List<DepartmentVO> result) {
        List<DepartmentVO> deptList = departmentVOList.stream().filter(e -> e.getId().equals(parentId)).collect(Collectors.toList());
        for (DepartmentVO item : deptList) {
            result.add(item);
            if (item.getParentId() != 0 && item.getParentId() != null) {
                result.addAll(getParentDepartment(departmentVOList, item.getParentId(), result));
            }
        }
        return result;
    }

    /**
     * 新增添加部门
     *
     * @param departmentCreateDTO
     * @return AjaxResult
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> addDepartment(DepartmentCreateDTO departmentCreateDTO) {
        DepartmentEntity departmentEntity = SmartBeanUtil.copy(departmentCreateDTO, DepartmentEntity.class);
        departmentEntity.setSort(0L);
        departmentDao.insert(departmentEntity);
        departmentEntity.setSort(departmentEntity.getId());
        departmentDao.updateById(departmentEntity);
        return ResponseDTO.succ();
    }

    /**
     * 更新部门信息
     *
     * @param updateDTO
     * @return AjaxResult<String>
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> updateDepartment(DepartmentUpdateDTO updateDTO) {
//        if (updateDTO.getParentId() == null) {
////            return ResponseDTO.wrap(DepartmentResponseCodeConst.PARENT_ID_ERROR);
////        }
        DepartmentEntity entity = departmentDao.selectById(updateDTO.getId());
        if (entity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        DepartmentEntity departmentEntity = SmartBeanUtil.copy(updateDTO, DepartmentEntity.class);
        departmentEntity.setSort(entity.getSort());
        departmentDao.updateById(departmentEntity);
        return ResponseDTO.succ();
    }

    /**
     * 根据id删除部门
     * 1、需要判断当前部门是否有子部门,有子部门则不允许删除
     * 2、需要判断当前部门是否有员工，有员工则不能删除
     *
     * @param deptId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> delDepartment(Long deptId) {
        DepartmentEntity departmentEntity = departmentDao.selectById(deptId);
        if (null == departmentEntity) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.DEPT_NOT_EXISTS);
        }
        // 是否有子级部门
        int subDepartmentNum = departmentDao.countSubDepartment(deptId);
        if (subDepartmentNum > 0) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.CANNOT_DEL_DEPARTMENT_WITH_CHILD);
        }

        // 是否有未删除员工
        int employeeNum = employeeDao.countByDepartmentId(deptId, false);
        if (employeeNum > 0) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.CANNOT_DEL_DEPARTMENT_WITH_EMPLOYEE);
        }
        departmentDao.deleteById(deptId);
        return ResponseDTO.succ();
    }

    /**
     * 根据id获取部门信息
     *
     * @param departmentId
     * @return AjaxResult<DepartmentVO>
     */
    public ResponseDTO<DepartmentVO> getDepartmentById(Long departmentId) {
        DepartmentEntity departmentEntity = departmentDao.selectById(departmentId);
        if (departmentEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.DEPT_NOT_EXISTS);
        }
        DepartmentVO departmentVO = SmartBeanUtil.copy(departmentEntity, DepartmentVO.class);
        return ResponseDTO.succData(departmentVO);
    }

    /**
     * 获取所有部门
     *
     * @return
     */
    public ResponseDTO<List<DepartmentVO>> listAll() {
        List<DepartmentVO> departmentVOList = departmentDao.listAll();
        return ResponseDTO.succData(departmentVOList);
    }

    /**
     * 上下移动
     *
     * @param departmentId
     * @param swapId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> upOrDown(Long departmentId, Long swapId) {
        DepartmentEntity departmentEntity = departmentDao.selectById(departmentId);
        if (departmentEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        DepartmentEntity swapEntity = departmentDao.selectById(swapId);
        if (swapEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        Long departmentSort = departmentEntity.getSort();
        departmentEntity.setSort(swapEntity.getSort());
        departmentDao.updateById(departmentEntity);
        swapEntity.setSort(departmentSort);
        departmentDao.updateById(swapEntity);
        return ResponseDTO.succ();
    }

    /**
     * 部门升级
     *
     * @param departmentId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> upgrade(Long departmentId) {
        DepartmentEntity departmentEntity = departmentDao.selectById(departmentId);
        if (departmentEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        if (departmentEntity.getParentId() == null || departmentEntity.getParentId().equals(0)) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.ERROR_PARAM, "此部门已经是根节点无法移动");
        }
        DepartmentEntity parentEntity = departmentDao.selectById(departmentEntity.getParentId());

        departmentEntity.setParentId(parentEntity.getParentId());
        departmentDao.updateById(departmentEntity);
        return ResponseDTO.succ();
    }

    /**
     * 部门降级
     *
     * @param departmentId
     * @param preId
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> downgrade(Long departmentId, Long preId) {
        DepartmentEntity departmentEntity = departmentDao.selectById(departmentId);
        if (departmentEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        DepartmentEntity preEntity = departmentDao.selectById(preId);
        if (preEntity == null) {
            return ResponseDTO.wrap(DepartmentResponseCodeConst.NOT_EXISTS);
        }
        departmentEntity.setParentId(preEntity.getId());
        departmentDao.updateById(departmentEntity);
        return ResponseDTO.succ();
    }




    /**
     * 根据id查询
     */
    public DepartmentEntity getById(Long id){
        return  departmentDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    public ResponseDTO<PageResultDTO<DepartmentVO>> queryByPage(DepartmentQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<DepartmentVO> voList = departmentDao.queryByPage(page, queryDTO);
        PageResultDTO<DepartmentVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    public ResponseDTO<String> add(DepartmentAddDTO addDTO) {
        DepartmentEntity entity = SmartBeanUtil.copy(addDTO, DepartmentEntity.class);
        departmentDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(DepartmentUpdateDTO updateDTO) {
        DepartmentEntity entity = SmartBeanUtil.copy(updateDTO, DepartmentEntity.class);
        departmentDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        departmentDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    public List<DepartmentExcelVO> queryAllExportData(DepartmentQueryDTO queryDTO) {
        return departmentDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-07-08 18:58:27
     */
    public List<DepartmentExcelVO> queryBatchExportData(List<Long> idList) {
        return departmentDao.queryBatchExportData(idList);
    }

    /**
     * 部门界面的详情按钮封装
     * @param id
     * @return
     */
    public ResponseDTO<DepartmentQueryDTO> getRealDetails(Long id){
        // 选获取部门信息
        DepartmentEntity departmentEntity = departmentDao.selectById(id);
        DepartmentQueryDTO departmentQueryDTO = SmartBeanUtil.copy(departmentEntity, DepartmentQueryDTO.class);
        // 把审核员装入部门信息中
        List<Integer> ids = departmentDao.getReviewer(id);
        List<String> reviewers = new ArrayList<String>();
        if(ids.size() != 0){
            List<EmployeeDTO> employees = employeeDao.getEmployeeByIds(ids);
            for(EmployeeDTO employeeDTO : employees){
                reviewers.add(employeeDTO.getActualName() + "(" + employeeDTO.getLoginName() + ")");
            }
        }
        departmentQueryDTO.setReviewers(reviewers);
        return ResponseDTO.succData(departmentQueryDTO);
    }

    /**
     * 部门级联教师
     */
    public List<DepartmentTeacherCascadeVo> getDepartmentTeacherCascades(String accessType){
        List<DepartmentTeacherCascadeVo> list = new ArrayList<>();
        List<DepartmentVO> departmentVOS = departmentDao.listAll();
        List<EmployeeVO> employeeVOS = employeeDao.selectAll();

        //扫码登陆只显示 培训科李华星
        if(departmentVOS != null){
            for(DepartmentVO departmentVO : departmentVOS){

                if("qrCode".equals(accessType)){
                    if(!"培训科".equals(departmentVO.getName())){
                        continue;
                    }
                }

                DepartmentTeacherCascadeVo departmentTeacherCascadeVo = new DepartmentTeacherCascadeVo();
                departmentTeacherCascadeVo.setText(departmentVO.getName());
                departmentTeacherCascadeVo.setValue(departmentVO.getId() + "");


                List<EmployeeCascadeVo> employeeCascadeVos = new ArrayList<>();
                if(employeeVOS != null){
                    for(EmployeeVO employeeVO : employeeVOS){

                        if("qrCode".equals(accessType)){
                            if(!"李华星".equals(employeeVO.getActualName())){
                                continue;
                            }
                        }

                        if(departmentVO.getId().equals(employeeVO.getDepartmentId())){
                            EmployeeCascadeVo employeeCascadeVo = new EmployeeCascadeVo();
                            employeeCascadeVo.setText(employeeVO.getActualName());
                            employeeCascadeVo.setValue(employeeVO.getId() + "");
                            employeeCascadeVos.add(employeeCascadeVo);
                        }
                    }
                }
                departmentTeacherCascadeVo.setChildren(employeeCascadeVos);
                list.add(departmentTeacherCascadeVo);
            }

        }
        return list;
    }

    public ResponseDTO<List<DepartmentVO>> getDepartmentByDeptName(String departmentName) {
        return ResponseDTO.succData(departmentDao.getDepartmentByDeptName(departmentName));
    }
}
