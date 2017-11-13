/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.department.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	/**
	 * 根据id获取部门
	 * @param id
	 * @return
	 */
	public DepartmentDTO getDepartment(Long id) {
		// 有效性验证
		if (id == -1L) {
			return new DepartmentDTO();
		}

		return departmentDao.getDepartment(id);
	}

	/**
	 * 保存部门
	 * @param department
	 */
	public void saveOrUpdateDepartment(DepartmentDTO department) {
		departmentDao.saveOrUpdateDepartment(department);
	}
	
	/**
	 * 根据id删除部门
	 * @param departmentId
	 */
	public void removeDepartment(Long departmentId) {
		departmentDao.removeDepartment(departmentId);
	}

}
