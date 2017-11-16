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

import online.shixun.asl.dto.JurisdictionDTO;
import online.shixun.asl.module.jurisdiction.dao.JurisdictionDaoMyBatis;

@Service
public class JurisdictionServiceImpl {

	@Autowired
	private JurisdictionDaoMyBatis jurisdictionDao;

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
	public void removeJurisdiction(Long jurisdictionId) {
		jurisdictionDao.removeJurisdiction(jurisdictionId);
	}
	
	/**
	 * 根据id删除多个权限
	 * @param jurisdictionId
	 */
	public void removeJurisdictions(String jurisdictionIds) {
		jurisdictionDao.removeJurisdictions(jurisdictionIds);
	}

}
