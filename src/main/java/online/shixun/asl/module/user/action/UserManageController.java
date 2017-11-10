/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.user.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/manage")
public class UserManageController {

	/**
	 * 用户列表
	 * @return
	 */
	@RequestMapping("/list")
	public String main() {
		return "/user/manage/list";
	}
	
}
