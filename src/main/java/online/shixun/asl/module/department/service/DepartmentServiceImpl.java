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
	 * 获取部门基本信息列表
	 * @return
	 */
	public List<DepartmentDTO> getSimpleDepartments() {
		return departmentDao.getSimpleDepartments();
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
	 * 根据部门id获取部门编码
	 * @param departmentId
	 * @return
	 */
	public String getDepartmentCode(Long departmentId) {
		return departmentDao.getDepartmentCode(departmentId);
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
	
	/**
	 * 根据id删除多个部门
	 * @param departmentId
	 */
	public void removeDepartments(String departmentIds) {
		departmentDao.removeDepartments(departmentIds);
	}

}
