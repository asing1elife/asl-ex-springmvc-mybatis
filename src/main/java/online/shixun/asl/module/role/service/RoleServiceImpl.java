/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.role.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import online.shixun.asl.dto.RoleDTO;
import online.shixun.asl.module.role.dao.RoleDaoMyBatis;

@Service
public class RoleServiceImpl {
	
	@Autowired
	private RoleDaoMyBatis roleDao;
	
	/**
	 * 获取角色列表
	 * @return
	 */
	public List<RoleDTO> getRoles() {
		return roleDao.getRoles();
	}
	
	/**
	 * 新增或更新角色
	 * @param role
	 */
	@Transactional
	public void saveOrUpdateRole(RoleDTO role) {
		// 新增或更新角色
		// 对于新增角色，需要在新增后获取到该角色的id
		roleDao.saveOrUpdateRole(role);
		
		// 新增角色权限关联
		roleDao.saveRoleJurisdictions(role);
	}
}
