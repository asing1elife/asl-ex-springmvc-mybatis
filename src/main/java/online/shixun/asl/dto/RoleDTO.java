/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.dto;

import java.util.ArrayList;
import java.util.List;

public class RoleDTO extends BaseDTO {
	
	// 名称
	private String name;
	
	// 描述
	private String description;
	
	// 权限列表
	private List<JurisdictionDTO> jurisdictions = new ArrayList<>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<JurisdictionDTO> getJurisdictions() {
		return jurisdictions;
	}

	public void setJurisdictions(List<JurisdictionDTO> jurisdictions) {
		this.jurisdictions = jurisdictions;
	}
	
}
