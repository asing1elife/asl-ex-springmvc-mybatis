/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.department.dao;

import java.util.List;

import online.shixun.asl.core.MyBatisRepository;
import online.shixun.asl.dto.DepartmentDTO;

@MyBatisRepository
public interface DepartmentDaoMyBatis {

	/**
	 * 获取部门
	 * @return
	 */
	List<DepartmentDTO> getDepartments();
	
	/**
	 * 保存部门
	 * @param department
	 */
	void saveDepartment(DepartmentDTO department);
}
