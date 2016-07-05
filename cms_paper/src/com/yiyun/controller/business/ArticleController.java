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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.controller.system.tools.SessionUtils;
import com.yiyun.controller.system.tools.YiYunCacheManager;
import com.yiyun.entity.business.SysArticle;
import com.yiyun.entity.system.Page;
import com.yiyun.service.business.ArticleService;
import com.yiyun.service.business.ChannelService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.PageData;
import com.yiyun.util.Tools;

@Controller
@RequestMapping(value="/article")
public class ArticleController extends BaseController {
	
	String menuUrl = "article/list.do"; //菜单地址(权限地址)
	String logMenu ="文章内容信息表";
	@Resource(name="articleService")
	private ArticleService articleService;
	
	@Resource(name="channelService")
	private ChannelService channelService;
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger,logMenu, "新增Article");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("articleId", this.yiYunCacheManager.findMaxNumberSeq());	//主键
		pd.put("updateDate", Tools.date2Str(new Date()));
//		pd.put("status", "draft");//新增 默认为 草稿状态   也可以是 发布状态
		articleService.save(pd);
		saveChannelArticle(pd.getString("articleId"),pd.getString("channelId"));
		return new ModelAndView("redirect:/article/list.do");
	}
	
	public void saveChannelArticle(String articleId,String channelIdArrays) throws Exception{
		List list = new ArrayList();
		String[] tmps =channelIdArrays.split(",");
		if(!StringUtils.isEmpty(channelIdArrays)&&tmps.length>0){
			PageData pd = new PageData();
			pd.put("articleId", articleId);
			this.articleService.deleteArticleChannel(pd);
			for(String channelId:tmps){
				if(StringUtils.isEmpty(channelId)){
					continue;
				}
				PageData param = new PageData();
				param.put("article_id", articleId);
				param.put("channel_id", channelId);
				list.add(param);
			}
			this.articleService.batchAddArticleChannel(list);
		}
	}
	
	public void saveArticleRef(String articleId,String articleRefs) throws Exception{
		List list = new ArrayList();
		String[] tmps =articleRefs.split(",");
		if(!StringUtils.isEmpty(articleRefs)&&tmps.length>0){
			PageData pd = new PageData();
			pd.put("articleId", articleId);
			this.articleService.deleteArticleRef(pd);
			for(String refId:tmps){
				if(StringUtils.isEmpty(refId)){
					continue;
				}
				PageData param = new PageData();
				param.put("article_id", articleId);
				param.put("ref_id", refId);
				list.add(param);
			}
			this.articleService.batchAddArticleRef(list);
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger,logMenu, "删除Article");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			articleService.addDeleteBak(pd);
			articleService.delete(pd);//原表删除  添加目标表
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	
	 @RequestMapping(value="/saveAuditMsg" ,produces="application/json;charset=UTF-8")
		@ResponseBody
		public Object saveAuditMsg() throws Exception{
			Map<String,String> map = new HashMap<String,String>();
			PageData pd = new PageData();
			pd = this.getPageData();
			String errInfo="";
			String operArticleId=pd.getString("operArticleId");
			pd.put("msg_id", this.get32UUID());
			pd.put("audit_user", SessionUtils.getSessionUserId());
			pd.put("audit_time", Tools.date2Str(new Date()));
			pd.put("cur_status", pd.getString("curStatusInfo"));
			pd.put("audit_status", pd.getString("auditStatusInfo"));
			pd.put("msg_info", pd.getString("auditMsgInfo"));
			pd.put("article_id", operArticleId);
			try {
				this.articleService.saveAuditMsg(pd);//添加审核信息
				//更改审核状态
				PageData param = new PageData();
				param.put("articleId", operArticleId);
				param.put("status", pd.getString("auditStatusInfo"));
				this.articleService.editStatus(param);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				errInfo="error";
			}
			if(StringUtils.isEmpty(errInfo)){
				errInfo="success";
			}
			map.put("result", errInfo);
			return AppUtil.returnObject(new PageData(), map);
		}
	 
	 
		
	 @RequestMapping(value="/showContentRefId" ,produces="application/json;charset=UTF-8")
		@ResponseBody
		public Object showContentRefId() throws Exception{
			Map<String,String> map = new HashMap<String,String>();
			PageData pd = new PageData();
			pd = this.getPageData();
			String errInfo="";
			try {
				map.put("contentRefId",getContenRefId(pd.getString("articleId")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				errInfo="error";
			}
			if(StringUtils.isEmpty(errInfo)){
				errInfo="success";
			}
			
			map.put("result", errInfo);
			return AppUtil.returnObject(new PageData(), map);
		}
	
	 
	 public String getContenRefId(String articleId) throws Exception{
		 PageData pd =new PageData();
		 pd.put("articleId", articleId);
		 List<PageData> parmList =this.articleService.showContentRefId(pd);
			StringBuffer sb = new StringBuffer();
			for(PageData pg :parmList){
				sb.append(pg.getString("ref_id"));
				sb.append(",");
			}
			
			return sb.toString();
	 }
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger,logMenu, "修改Article");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		logger.info(pd.getString("articleContent"));
		pd.put("updateDate", Tools.date2Str(new Date()));
		articleService.edit(pd);	
		saveChannelArticle(pd.getString("articleId"),pd.getString("channelId"));
		saveArticleRef(pd.getString("articleId"),pd.getString("contentRefId"));
		return new ModelAndView("redirect:/article/list.do");
	}
	
	@RequestMapping(value="/showRefReading")
	public ModelAndView showRefReading() throws Exception{
		logBefore(logger,logMenu, "相关阅读");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("notArticleId", pd.getString("articleId"));
		String contentRefId=pd.getString("contentRefId");
		List<SysArticle>  refList = articleService.listAll(pd);	//列出Article列表
		if(!StringUtils.isEmpty(contentRefId)){
			for(SysArticle arc:refList){
				if(contentRefId.indexOf(arc.getArticleId())!=-1){
//					arc.setCheckFlag(true);
				}
			}
		}
		
		
		mv.addObject("refList",refList);
		mv.addObject("pd",pd);
		mv.setViewName("business/article/showRefReading");
		
		return mv;
	}
	
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger,logMenu, "列表Article");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			String oper_status =pd.getString("oper_status");//
			if(!StringUtils.isEmpty(oper_status)){
				pd.put("status",oper_status);
			}
			String channelId =pd.getString("channelId");
			pd.put("channelId", channelId);
			List<SysArticle>  varList = articleService.list(page);	//列出Article列表
			pd.put("operTypeList", yiYunCacheManager.getParamsByType("oper_type"));
			pd.put("operTypeMap", yiYunCacheManager.getParamMapByTypeCode("oper_type"));
			mv.setViewName("business/article/article_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	@RequestMapping(value="/auditMsglistPage")
	public ModelAndView auditMsglistPage(Page page){
		logBefore(logger,logMenu, "审核列表Article");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData>  varList = articleService.auditMsglistPage(page);	//列出Article列表
			pd.put("operTypeMap", yiYunCacheManager.getParamMapByTypeCode("oper_type"));
			mv.setViewName("business/article/auditMsglistPage");
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
		logBefore(logger,logMenu, "去新增Article页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.addObject("treeJson",this.yiYunCacheManager.listAllChannelTree());
			mv.setViewName("business/article/article_edit");
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
		logBefore(logger,logMenu, "去修改Article页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.addObject("treeJson",this.yiYunCacheManager.listAllChannelTree());
			SysArticle article = articleService.findById(pd);	//根据ID读取
			pd.put("contentRefId", getContenRefId(article.getArticleId()));
			mv.setViewName("business/article/article_edit");
			mv.addObject("msg", "edit");
			mv.addObject("article", article);
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	@RequestMapping(value="/goView")
	public ModelAndView goView(){
		logBefore(logger,logMenu, "去查看Article页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			SysArticle article = articleService.findById(pd);	//根据ID读取
			mv.setViewName("business/article/article_view");
			mv.addObject("msg", "edit");
			mv.addObject("article", article);
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
		logBefore(logger,logMenu, "批量删除Article");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				articleService.deleteAll(ArrayDATA_IDS);
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
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
