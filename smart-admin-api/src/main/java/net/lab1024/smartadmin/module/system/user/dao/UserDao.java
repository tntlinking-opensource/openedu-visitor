package net.lab1024.smartadmin.module.system.user.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.metadata.IPage;
import net.lab1024.smartadmin.module.system.user.domain.dto.UserQueryDTO;
import net.lab1024.smartadmin.module.system.user.domain.entity.UserEntity;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserVO;
import net.lab1024.smartadmin.module.system.user.domain.vo.UserExcelVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

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
@Mapper
@Component
public interface UserDao extends BaseMapper<UserEntity> {

    /**
     * 分页查询
     * @param queryDTO
     * @return UserVO
    */
    IPage<UserVO> queryByPage(Page page, @Param("queryDTO") UserQueryDTO queryDTO);

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
    List<UserExcelVO> queryAllExportData(@Param("queryDTO") UserQueryDTO queryDTO);

        /**
         * 查询批量导出数据
         * @param idList
         * @return
         */
    List<UserExcelVO> queryBatchExportData(@Param("idList") List<Long> idList);
}
