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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.shixun.asl.dto.DepartmentDTO;
import online.shixun.asl.module.department.service.DepartmentServiceImpl;

@Controller
@RequestMapping("/department/content")
public class DepartmentContentController {
	
	@Autowired
	private DepartmentServiceImpl departmentService;

	/**
	 * 新增部门页面
	 * @return
	 */
	@RequestMapping("/add")
	public String main(Model model, @RequestParam("departmentId") Long departmentId) {
		model.addAttribute("department", departmentService.getDepartment(departmentId));
		
		return "/department/content/add";
	}
	
	/**
	 * 保存部门
	 * @param department
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute DepartmentDTO department) {
		departmentService.saveOrUpdateDepartment(department);
		
		return "success";
	}
	
}
