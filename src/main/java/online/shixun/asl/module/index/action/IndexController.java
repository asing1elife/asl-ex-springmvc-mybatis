/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.index.action;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private MessageSource messageSource;

	@RequestMapping("")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) {
		// 设置语言格式
		setLanguage(model, request, response, Locale.getDefault());
		
		return "/index";
	}
	
	@RequestMapping("/{language}")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response, @PathVariable String language) {
		// 分割参数
		String[] languages = language.split("_");
		
		// 设置系统语言
		setLanguage(model, request, response, new Locale(languages[0], languages[1]));
		
		return "/index";
	}
	
	/**
	 * 设定语言格式
	 * @param model
	 * @param request
	 * @param response
	 * @param locale
	 */
	private void setLanguage(Model model, HttpServletRequest request, HttpServletResponse response, Locale locale) {
		// 获取LocaleResolver
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
		
		// 设置Locale信息
		localeResolver.setLocale(request, response, locale);
		
		// 传递正确的Locale信息到页面
		model.addAttribute("encoding", messageSource.getMessage("encoding", new Object[0], locale));
	}
	
}
