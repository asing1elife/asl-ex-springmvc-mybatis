/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.department.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import online.shixun.asl.dto.DepartmentDTO;
import online.shixun.asl.module.department.dao.DepartmentDaoMyBatis;

@Service
public class DepartmentServiceImpl {
	
	@Autowired
	private DepartmentDaoMyBatis departmentDao;
	
	/**
	 * 获取部门列表
	 * @return
	 */
	public List<DepartmentDTO> getDepartments() {
		return departmentDao.getDepartments();
	}

}
