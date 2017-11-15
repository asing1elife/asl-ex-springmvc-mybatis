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
	
	/**
	 * 判断外部传入的权限是否属于该角色
	 * @param jurisdiction
	 * @return
	 */
	public Boolean isHaveJurisdiction(JurisdictionDTO jurisdiction) {
		// 循环遍历角色权限关联
		for (JurisdictionDTO currentJurisdiction : jurisdictions) {
			// 两个权限的id相等，表示该权限属于该角色
			if (currentJurisdiction.getId() == jurisdiction.getId()) {
				return true;
			}
		}
		
		// 循环完毕依旧没有找到，说明该权限不属于该角色
		return false;
	}
	
}
