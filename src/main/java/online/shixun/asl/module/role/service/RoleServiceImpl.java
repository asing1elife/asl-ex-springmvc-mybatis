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
import online.shixun.asl.module.jurisdiction.service.JurisdictionServiceImpl;
import online.shixun.asl.module.role.dao.RoleDaoMyBatis;

@Service
public class RoleServiceImpl {
	
	@Autowired
	private RoleDaoMyBatis roleDao;
	
	@Autowired
	private JurisdictionServiceImpl jurisdictionService;
	
	/**
	 * 获取角色列表
	 * @return
	 */
	public List<RoleDTO> getRoles() {
		return roleDao.getRoles();
	}
	
	/**
	 * 根据id获取角色
	 * @param roleId
	 * @return
	 */
	public RoleDTO getRole(Long roleId) {
		return roleDao.getRole(roleId);
	}
	
	/**
	 * 获取角色完整信息
	 * @param roleId
	 * @return
	 */
	public RoleDTO getFullRole(Long roleId) {
		// 获取角色信息
		RoleDTO role = getRole(roleId);
		
		// 新增时没有角色信息
		if (role == null) {
			return new RoleDTO();
		}
		
		// 填充角色权限关联
		role.setJurisdictions(jurisdictionService.getRoleJurisdictions(roleId));
		
		return role;
	}
	
	/**
	 * 新增或更新角色
	 * 新增：先新增主表内容，再新增级联关系
	 * @param role
	 */
	@Transactional
	public void saveOrUpdateRole(RoleDTO role) {
		// 新增或更新角色
		// 对于新增角色，需要在新增后获取到该角色的id
		roleDao.saveOrUpdateRole(role);
		
		// 判断是否为更新，执行角色更新之前，需要先删除原始的角色权限关联
		if (role.getId() != 0L) {
			roleDao.removeRoleJurisdictions(role.getId());
		}
		
		// 新增角色权限关联
		roleDao.saveRoleJurisdictions(role);
	}
	
	/**
	 * 删除角色
	 * @param roleId
	 */
	@Transactional
	public void removeRole(Long roleId) {
		// 先删除角色权限关联
		roleDao.removeRoleJurisdictions(roleId);
		
		// 再删除角色
		roleDao.removeRole(roleId);
	}
	
	/**
	 * 删除多个角色
	 * @param roleIds
	 */
	@Transactional
	public void removeRoles(String roleIds) {
		// 先删除多个角色的多个权限关联
		roleDao.removeRolesJurisdictions(roleIds);
		
		// 再删除多个角色
		roleDao.removeRoles(roleIds);
	}
}
