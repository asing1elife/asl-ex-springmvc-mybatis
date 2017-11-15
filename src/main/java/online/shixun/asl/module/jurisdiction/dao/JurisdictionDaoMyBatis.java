/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.jurisdiction.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import online.shixun.asl.core.MyBatisRepository;
import online.shixun.asl.dto.JurisdictionDTO;

@MyBatisRepository
public interface JurisdictionDaoMyBatis {

	/**
	 * 获取权限列表
	 * @return
	 */
	List<JurisdictionDTO> getJurisdictions();
	
	/**
	 * 获取权限基本信息列表
	 * @return
	 */
	List<JurisdictionDTO> getSimpleJurisdictions();
	
	/**
	 * 根据id获取权限
	 * @param id
	 * @return
	 */
	JurisdictionDTO getJurisdiction(@Param("id") Long id);
	
	/**
	 * 新增或更新权限
	 * @param jurisdiction
	 */
	void saveOrUpdateJurisdiction(JurisdictionDTO jurisdiction);
	
	/**
	 * 根据id删除权限
	 * @param jurisdictionId
	 */
	void removeJurisdiction(@Param("jurisdictionId") Long jurisdictionId);
	
	/**
	 * 根据id删除多个权限
	 * @param jurisdictionId
	 */
	void removeJurisdictions(@Param("jurisdictionIds") String jurisdictionIds);
	
}
