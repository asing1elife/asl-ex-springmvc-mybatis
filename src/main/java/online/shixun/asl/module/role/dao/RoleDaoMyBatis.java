/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.role.dao;

import java.util.List;

import online.shixun.asl.core.MyBatisRepository;
import online.shixun.asl.dto.RoleDTO;

@MyBatisRepository
public interface RoleDaoMyBatis {
	
	/**
	 * 获取角色列表
	 * @return
	 */
	List<RoleDTO> getRoles();
	
	/**
	 * 新增或更新角色，并填充角色id
	 * @param role
	 */
	void saveOrUpdateRole(RoleDTO role);
	
	/**
	 * 新增角色权限关联
	 * @param role
	 */
	void saveRoleJurisdictions(RoleDTO role);

}
