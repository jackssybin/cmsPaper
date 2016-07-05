package com.yiyun.controller.system.tools;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.yiyun.entity.system.User;
import com.yiyun.util.Const;
import com.yiyun.util.PageData;

public class SessionUtils {
	public static String getSessionStr(String code){
		//shiro管理的session
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		return  (String)session.getAttribute(code);
	}
	
	public static void setSessionStrByCode(String code,String value){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		if(null!=session){
			session.setAttribute(code,value);
		}
	}
	
	
	public static void removeProductCartFromSession(String PRODUCT_ID){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.removeAttribute(PRODUCT_ID);
	}
	
	
	
	public static void removeProductOrderFromSession(String primaryId){
		removeProductOrderFromSession(primaryId,"");
	}
	public static void removeProductOrderFromSession(String primaryId,String type){
		if(!"".equals(type)){
			primaryId="order_"+primaryId+"_"+type;
		}
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.removeAttribute(primaryId);
	}
	
	public static User getSessionUser(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user=new User();
		if (session != null) {
			user = (User)session.getAttribute(Const.SESSION_USER);
		}
		return user;
	}
	
	
	public static void updateSessionUser(PageData pd){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		User user=new User();
		if (session != null) {
			user = (User)session.getAttribute(Const.SESSION_USER);
			if (user == null) user=new User();
			try {
				user.setNAME(pd.getString("NAME"));
				user.setSEX(pd.getString("SEX"));
				user.setPHONE(pd.getString("PHONE"));
				user.setSIGNATURE(pd.getString("SIGNATURE"));
				user.setEMAIL(pd.getString("EMAIL"));
				user.setUSERNAME(pd.getString("USERNAME"));
				session.setAttribute(Const.SESSION_USER, user);
			} catch (InvalidSessionException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static String getSessionUserId(){
		User user=getSessionUser();
		if(null!=user){
			return user.getUSERNAME();	
		}
		return "admin";
	}
	
	public static String getSessionUserIsRead(){
		User user=getSessionUser();
		if(null!=user){
			return user.getIS_READ();	
		}
		return "0";
	}
	
	public static void updateSessionIsRead(){
		User user=getSessionUser();
		user.setIS_READ("1");
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		session.setAttribute(Const.SESSION_USER, user);
	}
	public static String getSessionOpenId(){
		User user=getSessionUser();
		if(null!=user){
			return user.getOpenid();//返回的是 测试人员的
//			return user.getOpenid();	
		}
		return "o5pDLwg2CkwLIbQ-DcvCT0XsHCr4";//返回的是 测试人员的
	}
}
