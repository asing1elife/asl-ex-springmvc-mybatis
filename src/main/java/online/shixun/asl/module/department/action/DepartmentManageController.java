/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.department.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import online.shixun.asl.module.department.service.DepartmentServiceImpl;

@Controller
@RequestMapping("/department/manage")
public class DepartmentManageController {

	@Autowired
	private DepartmentServiceImpl departmentService;
	
	/**
	 * 部门列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String main(Model model) {
		model.addAttribute("departments", departmentService.getDepartments());
		
		return "/department/manage/list";
	}
	
}
