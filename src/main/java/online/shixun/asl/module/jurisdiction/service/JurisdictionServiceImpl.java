/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.jurisdiction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import online.shixun.asl.core.ResponseData;
import online.shixun.asl.dto.JurisdictionDTO;
import online.shixun.asl.module.jurisdiction.dao.JurisdictionDaoMyBatis;
import online.shixun.asl.module.role.service.RoleServiceImpl;

@Service
public class JurisdictionServiceImpl {

	@Autowired
	private JurisdictionDaoMyBatis jurisdictionDao;
	
	@Autowired
	private RoleServiceImpl roleService;

	/**
	 * 获取权限列表
	 * @return
	 */
	@Cacheable(value = "jurisdictionService")
	public List<JurisdictionDTO> getJurisdictions() {
		return jurisdictionDao.getJurisdictions();
	}
	
	/**
	 * 获取权限基本信息列表
	 * @return
	 */
	public List<JurisdictionDTO> getSimpleJurisdictions() {
		return jurisdictionDao.getSimpleJurisdictions();
	}
	
	/**
	 * 通过角色id获取角色权限关联
	 * @param roleId
	 * @return
	 */
	public List<JurisdictionDTO> getRoleJurisdictions(Long roleId) {
		return jurisdictionDao.getRoleJurisdictions(roleId);
	}


	/**
	 * 根据id获取权限
	 * @param id
	 * @return
	 */
	@Cacheable(value = "jurisdictionService")
	public JurisdictionDTO getJurisdiction(Long id) {
		// 有效性验证
		if (id == -1L) {
			return new JurisdictionDTO();
		}

		return jurisdictionDao.getJurisdiction(id);
	}

	/**
	 * 保存权限
	 * @param jurisdiction
	 */
	@CacheEvict(value = "jurisdictionService", key = "#jurisdiction.getId()")
	public void saveOrUpdateJurisdiction(JurisdictionDTO jurisdiction) {
		jurisdictionDao.saveOrUpdateJurisdiction(jurisdiction);
	}
	
	/**
	 * 根据id删除权限
	 * @param jurisdictionId
	 */
	@CacheEvict(value = "jurisdictionService", allEntries = true)
	public ResponseData removeJurisdiction(Long jurisdictionId) {
		ResponseData responseData = new ResponseData();
		
		// 判断权限是否被使用
		if (!roleService.checkRoleJurisdiction(jurisdictionId)) {
			responseData.setError("权限已被使用，无法删除！");
			return responseData;
		}
		
		// 删除权限
		jurisdictionDao.removeJurisdiction(jurisdictionId);
		
		return responseData;
	}
	
	/**
	 * 根据id删除多个权限
	 * @param jurisdictionId
	 */
	@CacheEvict(value = "jurisdictionService", allEntries = true)
	public ResponseData removeJurisdictions(String jurisdictionIds) {
		ResponseData responseData = new ResponseData();
				
		// 解析id字符串
		String[] idArray = jurisdictionIds.split(",");
		// 未被使用的id
		String unusedIds = "";
		
		// 循环判断每个id是否被角色关联
		for (String id : idArray) {
			// 对于未被使用的id重新加入到新的字符串中
			if (roleService.checkRoleJurisdiction(Long.valueOf(id))) {
				unusedIds += id + ",";
			}
		}
		
		// 判断可以被删除的id字符串是否为空
		if (unusedIds.equals("")) {
			responseData.setError("选择的权限均已被使用，无法删除！");
			return responseData;
		}
		
		// 截取多余字符
		unusedIds = unusedIds.substring(0, unusedIds.length() -1);
		
		// 根据过滤后的id字符串，进行删除
		jurisdictionDao.removeJurisdictions(unusedIds);
		
		return responseData;
	}

}
