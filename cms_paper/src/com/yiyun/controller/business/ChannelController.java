package com.yiyun.controller.business;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.controller.system.tools.YiYunCacheManager;
import com.yiyun.entity.business.Channel;
import com.yiyun.entity.business.ChannelUser;
import com.yiyun.entity.system.Page;
import com.yiyun.service.business.ChannelService;
import com.yiyun.service.system.UserService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.PageData;

@Controller
@RequestMapping(value="/channel")
public class ChannelController extends BaseController{
	String menuUrl = "channel/list.do"; //菜单地址(权限地址)
	String logMenu ="栏目管理";
	
	@Resource(name="channelService")
	private ChannelService channelService;	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger,logMenu, "新增Channel");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String  channel_id =pd.getString("channel_id");
		if(StringUtils.isEmpty(channel_id)){
			String channelId = pd.getString("channel_pinyin")+pd.getString("pinyin_first")+this.yiYunCacheManager.findMaxNumberSeq("栏目");
			pd.put("channel_id", channelId);	//主键
			channelService.save(pd);
		}else{
			channelService.edit(pd);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		//return mv;
		return new ModelAndView("forward:/channel/list.do");
	}
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger,logMenu, "删除Channel");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			int csize = channelService.countChannelByParentId(pd.get("channel_id").toString());
			if(csize == 0){
			channelService.delete(pd);
			out.write("success");
			}else{
			out.write("false");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */

	/**
	 * 初始界面
	 */
	@RequestMapping(value="/frame")
	public ModelAndView frame(Page page){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("business/channel/channel_frameset");
		return mv;
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger,logMenu, "列表Channel");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			page.setPd(pd);
			String parent_id = pd.getString("parent_id");
			if(StringUtils.isEmpty(parent_id)){
				parent_id="0";
			}
			pd.put("parent_id", parent_id);
			List<Channel> channelList =  channelService.datalistPage(page);
			//mv.addObject("parent_id", parent_id);
			mv.addObject("parent",parent_id);
			mv.addObject("MSG", null == pd.get("MSG")?"list":pd.get("MSG").toString());
			mv.addObject("channellist", channelList);
			mv.setViewName("business/channel/channel_list");
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
		logBefore(logger,logMenu, "去新增Channel页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String parent_id = pd.getString("parent_id");
			if(StringUtils.isEmpty(parent_id)){
				parent_id="0";
			}
			pd.put("parent_id",parent_id);
			mv.addObject("pds", channelService.getChannelById(parent_id));	//传入父菜单所有信息
			mv.addObject("msg", "save");					
			mv.setViewName("business/channel/channel_edit");
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
		logBefore(logger,logMenu, "去修改Channel页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = channelService.findById(pd);	//根据ID读取
			mv.addObject("pds",channelService.getChannelById(pd.get("parent_id").toString()));
			mv.setViewName("business/channel/channel_edit");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	/**
	 * 单个栏目查询
	 */
	@RequestMapping(value="/selectById")
	public ModelAndView selectById(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pd = channelService.findById(pd);//列出Comment列表		
			mv.setViewName("business/channel/channel_list");
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**去增加人员
	 * 
	 */
	@RequestMapping(value="/goAddUser")
	@ResponseBody
	public Object goAddUser(Page page){
		logBefore(logger,logMenu, "去增加Channel人员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			List<PageData>	userList = userService.listPdPageUser(page);
			String channel_id = pd.getString("channel_id");
			List<ChannelUser>	channelUserList = channelService.listChannelUser(channel_id);
			mv.addObject("channelUserList",channelUserList);
			mv.addObject("userList",userList);
			mv.setViewName("business/channel/channel_addUser");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	
	}
	/** 增加人员
	 * 
	 */
	@RequestMapping(value="/addUser")
	@ResponseBody
	public Object addUser(Page page){
		logBefore(logger,logMenu, "增加Channel人员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String channel_id = pd.getString("channel_id");
			String UserList = pd.getString("userIdList");
			//channelService.deleteChannelUser(channel_id);			
			if(!StringUtils.isEmpty(UserList)){
			saveChannelUser(channel_id,UserList);
			}
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		mv.setViewName("save_result");
		return mv;
	
	}
	
	public void saveChannelUser(String channelId,String userIdArrays) throws Exception{
		List list = new ArrayList();
		String[] tmps =userIdArrays.split(",");
		if(!StringUtils.isEmpty(userIdArrays)&&tmps.length>0){
			PageData pd = new PageData();
			pd.put("channelId", channelId);
			this.channelService.deleteChannelUser(channelId);
			for(String userId:tmps){
				if(StringUtils.isEmpty(userId)){
					continue;
				}
				PageData param = new PageData();
				param.put("channelId", channelId);
				param.put("userId", userId);
				list.add(param);
			}
			this.channelService.batchChannelUser(list);
		}
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger,logMenu, "批量删除Channel");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){

				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				boolean delFlag =true;
				int count=0;
				for(String channelId:ArrayDATA_IDS){
					count=this.channelService.countChannelByParentId(channelId);
					if(count>0){
					Channel chan=channelService.getChannelById(channelId);
					map.put("name",chan.getChannel_name());
					delFlag=false;
						break;
					}
				}

				if(delFlag){
					map.put("msg", "ok");
					channelService.deleteAll(ArrayDATA_IDS);
				}else{
					map.put("msg","exist");
				}
			}else{
				map.put("msg", "no");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * zTree树结构
	 */
	@RequestMapping(value="/channelTree")
	public ModelAndView channelTree(Model model)throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			mv.addObject("List",channelService.listChannelByParentIdc(pd.getString("channel_id")));
			mv.addObject("channel_id",pd.getString("channel_id"));
			mv.addObject("parent_id",pd.getString("parent_id"));
//			mv.addAttribute("zTreeNodes", json);			
			mv.addObject("zTreeNodes", this.yiYunCacheManager.listAllChannelTree());		
			mv.setViewName("business/channel/channelTree");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	@RequestMapping(value="/commonTree" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public ModelAndView commonTree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String treeStr = "";
		try {
				treeStr = this.yiYunCacheManager.commonTree(null);
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(treeStr);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (response.getWriter() != null) {
					response.getWriter().close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 改变栏目位置
	 */
	@RequestMapping(value="/change")
	public ModelAndView change (Page page){
		logBefore(logger,logMenu, "改变Channel位置");
		PageData pd = new PageData();
		ModelAndView mv = this.getModelAndView();
		try{
			pd = this.getPageData();
			channelService.changeChannelParentId(pd);
			mv.addObject("msg","success");
			mv.setViewName("save_result");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	 @RequestMapping(value="/changeAjax" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object changeAjax(){
		logBefore(logger,logMenu, "改变Channel位置");
			Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		ModelAndView mv = this.getModelAndView();
		try{
			pd = this.getPageData();
			channelService.changeChannelParentId(pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
