/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.jurisdiction.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.shixun.asl.dto.JurisdictionDTO;
import online.shixun.asl.module.jurisdiction.service.JurisdictionServiceImpl;

@Controller
@RequestMapping("/jurisdiction/content")
public class JurisdictionContentController {
	
	@Autowired
	private JurisdictionServiceImpl jurisdictionService;

	/**
	 * 新增权限页面
	 * @return
	 */
	@RequestMapping("/add")
	public String main(Model model, @RequestParam("jurisdictionId") Long jurisdictionId) {
		model.addAttribute("jurisdiction", jurisdictionService.getJurisdiction(jurisdictionId));
		
		return "/jurisdiction/content/add";
	}
	
	/**
	 * 保存权限
	 * @param jurisdiction
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute JurisdictionDTO jurisdiction) {
		jurisdictionService.saveOrUpdateJurisdiction(jurisdiction);
		
		return "success";
	}
	
	/**
	 * 删除权限
	 * @param jurisdictionId
	 * @return
	 */
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@ResponseBody
	public String remove(@RequestParam("jurisdictionId") Long jurisdictionId) {
		jurisdictionService.removeJurisdiction(jurisdictionId);
		
		return "success";
	}
	
	/**
	 * 删除多个权限
	 * @param jurisdictionIds
	 * @return
	 */
	@RequestMapping(value = "/removes", method = RequestMethod.POST)
	@ResponseBody
	public String removes(@RequestParam("jurisdictionIds") String jurisdictionIds) {
		jurisdictionService.removeJurisdictions(jurisdictionIds);
		
		return "success";
	}
	
}
