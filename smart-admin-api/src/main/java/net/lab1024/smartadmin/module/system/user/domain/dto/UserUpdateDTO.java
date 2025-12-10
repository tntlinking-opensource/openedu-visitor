package net.lab1024.smartadmin.module.system.user.domain.dto;

import lombok.Data;

/**
 * 更新 [ 员工表 ]
 *
 * @author wang
 * @version 1.0
 * @company 彦致信息
 * @copyright (c) 2018 彦致信息Inc. All rights reserved.
 * @date  2021-07-06 17:25:00
 * @since JDK1.8
 */
@Data
public class UserUpdateDTO extends UserAddDTO {

    private Long id;

}
