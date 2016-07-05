package com.yiyun.controller.business;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.controller.system.tools.YiYunCacheManager;
import com.yiyun.entity.system.Page;
import com.yiyun.service.business.FavoriteService;
import com.yiyun.service.business.FserService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.PageData;

@Controller
@RequestMapping(value="/fser")
public class FserController extends BaseController {
	
	String menuUrl = "fser/list.do"; //菜单地址(权限地址)
	String logMenu ="前台用户信息";
	@Resource(name="fserService")
	private FserService fserService;
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger,logMenu, "新增Fser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", this.get32UUID());	//主键
		fserService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger,logMenu, "删除Fser");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			fserService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger,logMenu, "修改Fser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		fserService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 修改用户状态
	 */
	@RequestMapping(value="/editState")
	public void editState(PrintWriter out,String USER_STATE,String USER_ID) throws Exception {
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("USER_ID", USER_ID);
			if(null != USER_STATE && !"".equals(USER_STATE)){
				USER_STATE = USER_STATE.trim();
				if("Y".equals(USER_STATE)){
					pd.put("USER_STATE", "N");
				}else{
					pd.put("USER_STATE", "Y");
				}
			}
			fserService.editState(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger,logMenu, "列表Fser");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String NICK_NAME = pd.getString("NICK_NAME");
			if(null != NICK_NAME && !"".equals(NICK_NAME)){
				NICK_NAME = NICK_NAME.trim();
				pd.put("NICK_NAME", NICK_NAME);
			}
			String USER_STATE = pd.getString("USER_STATE");
			if(null != USER_STATE && !"".equals(USER_STATE)){
				USER_STATE = USER_STATE.trim();
				pd.put("USER_STATE", USER_STATE);
			}
			page.setPd(pd);
			List<PageData>	varList = fserService.list(page);	//列出Fser列表
			List<PageData> list = favoriteService.listAll(pd);  //列出Favorite列表
			mv.addObject("listFavorite", list);
			mv.setViewName("business/fser/fser_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger,logMenu, "去新增Fser页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("business/fser/fser_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger,logMenu, "去修改Fser页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = fserService.findById(pd);	//根据ID读取
			mv.setViewName("business/fser/fser_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger,logMenu, "批量删除Fser");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				fserService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView queryBuserBy() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pd1 = fserService.findById(pd);
		mv.addObject("pd", pd1);
		mv.setViewName("business/fser/fser_detail");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
