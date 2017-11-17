/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.dto;

public class UserDTO extends BaseDTO {
	
	// 编码
	private String code;
	
	// 姓名
	private String name;
	
	// 密码
	private String password;
	
	// 手机
	private String mobile;
	
	// 所属部门
	private DepartmentDTO department;

	// 所属角色
	private RoleDTO role;
	
	// 性别
	private String gender;
	
	// 状态 
	private Boolean status = true;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public DepartmentDTO getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentDTO department) {
		this.department = department;
	}

	public RoleDTO getRole() {
		return role;
	}

	public void setRole(RoleDTO role) {
		this.role = role;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Boolean getStatus() {
		return status;
	}
	
	/**
	 * 判断并输出状态值
	 * @return
	 */
	public String getStatusStr() {
		return status ? "启用" : "禁用";
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

}
