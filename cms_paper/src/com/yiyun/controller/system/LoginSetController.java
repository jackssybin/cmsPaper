package com.yiyun.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
@Controller
@RequestMapping(value="/login_setting")
public class LoginSetController extends BaseController {
	
	@RequestMapping(value="/list")
	public ModelAndView viewSetting() throws Exception {
		ModelAndView mv = this.getModelAndView();
		
		mv.setViewName("system/loginSet/login_set");
		return mv;
	}
	
}
