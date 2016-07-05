package com.yiyun.controller.base;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.system.tools.SessionUtils;
import com.yiyun.entity.system.Log;
import com.yiyun.entity.system.Page;
import com.yiyun.listener.SpringContextHolder;
import com.yiyun.service.system.LogService;
import com.yiyun.util.Logger;
import com.yiyun.util.PageData;
import com.yiyun.util.Tools;
import com.yiyun.util.UuidUtil;

public class BaseController {
	
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;

//	SpringContextHolder.getBean('xxxx')的静态方法得到
	
	private LogService logService;
	
	public LogService getLogService() {
		if(null==logService){
			logService=(LogService)SpringContextHolder.getBean("logService");
		}
		return logService;
	}

	public void setLogService(LogService logService) {
		this.logService = logService;
	}

	/**
	 * 得到PageData
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**
	 * 得到ModelAndView
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}

	
	/**
	 * 得到request对象
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		
		return request;
	}

	/**
	 * 得到32位的uuid
	 * @return
	 */
	public static String get32UUID(){
		
		return UuidUtil.get32UUID();
	}
	
	/**
	 * 得到分页列表的信息 
	 */
	public Page getPage(){
		
		return new Page();
	}
	
	public  void logBefore(Logger logger,String logMenu, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
		this.logIn(logMenu, interfaceName);
		
	}
	
	public  void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	/**
	 * @param logUser  操作用户
	 * @param logType  操作类型
	 * @param logMenu  操作菜单
	 * @param logContent 操作内容
	 */
	public  void logIn(String logMenu,String logContent){
		logIn(SessionUtils.getSessionUserId(),logMenu,logContent);
	}
	public  void logIn(String userId,String logMenu,String logContent){
		Log log = new Log();
		log.setLogId(get32UUID());
		log.setLogTime(Tools.date2Str(new Date()));
		log.setLogUser(userId);
		log.setLogMenu(logMenu);
		log.setLogContent(logContent);
		try {
			log.setLogStatus("1");
			getLogService().save(log);
			logger.info("===logIn==="+log.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("===logIn Error=="+e.getMessage());
		}
	}
	
}
