package com.yiyun.controller.business;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;


@Controller
@RequestMapping(value="/ftl")
public class HelloFreeMarkerController extends BaseController{

	
	@RequestMapping(value="/test")
	public ModelAndView list(Page page) {
		logBefore(logger, "图片管理","列表Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String KEYW = pd.getString("keyword");
			if(null != KEYW && !"".equals(KEYW)){
				KEYW = KEYW.trim();
				pd.put("KEYW", KEYW);
			}
			page.setPd(pd);
//			List<PageData>	varList = picturesService.list(page);	//列出Pictures列表
			List<PageData> varList = new ArrayList<PageData>();
//			pd.put("imageUrl", yiYunCacheManager.getImageUrl("images"));
//			mv.setViewName("system/tools/pictures_list");
			mv.addObject("objectNameLower","objectNameLower111");
			mv.setViewName("jsp_list_Template");
//			jsp_list_Template.ftl
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
}
