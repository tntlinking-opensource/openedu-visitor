package net.lab1024.smartadmin.module.system.user.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import net.lab1024.smartadmin.common.domain.PageResultDTO;
import net.lab1024.smartadmin.common.domain.ResponseDTO;
import net.lab1024.smartadmin.module.system.user.dao.UserDao;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserAddDTO;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserUpdateDTO;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserQueryDTO;
import net.lab1024.smartadmin.module.system.user.domain.entity.UserEntity;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserVO;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserExcelVO;
import net.lab1024.smartadmin.util.SmartPageUtil;
import net.lab1024.smartadmin.util.SmartBeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c)  彦致信息Inc. All rights reserved.
 * @date 2021-07-06 17:25:00
 * @since JDK1.8
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    /**
     * 根据id查询
     */
    public UserEntity getById(Long id){
        return  userDao.selectById(id);
    }

    /**
     * 分页查询
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    public ResponseDTO<PageResultDTO<UserVO>> queryByPage(UserQueryDTO queryDTO) {
        Page page = SmartPageUtil.convert2QueryPage(queryDTO);
        IPage<UserVO> voList = userDao.queryByPage(page, queryDTO);
        PageResultDTO<UserVO> pageResultDTO = SmartPageUtil.convert2PageResult(voList);
        return ResponseDTO.succData(pageResultDTO);
    }

    /**
     * 添加
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    public ResponseDTO<String> add(UserAddDTO addDTO) {
        UserEntity entity = SmartBeanUtil.copy(addDTO, UserEntity.class);
        userDao.insert(entity);
        return ResponseDTO.succ();
    }

    /**
     * 编辑
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> update(UserUpdateDTO updateDTO) {
        UserEntity entity = SmartBeanUtil.copy(updateDTO, UserEntity.class);
        userDao.updateById(entity);
        return ResponseDTO.succ();
    }

    /**
     * 删除
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    @Transactional(rollbackFor = Exception.class)
    public ResponseDTO<String> deleteByIds(List<Long> idList) {
        userDao.deleteByIdList(idList);
        return ResponseDTO.succ();
    }

    /**
     * 查询全部导出对象
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    public List<UserExcelVO> queryAllExportData(UserQueryDTO queryDTO) {
        return userDao.queryAllExportData( queryDTO);
    }

    /**
     * 批量查询导出对象
     * @author wang
     * @date 2021-07-06 17:25:00
     */
    public List<UserExcelVO> queryBatchExportData(List<Long> idList) {
        return userDao.queryBatchExportData(idList);
    }
}
