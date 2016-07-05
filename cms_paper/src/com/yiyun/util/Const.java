package com.yiyun.util;

import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
*/
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";
	public static final String SESSION_USER = "sessionUser";
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	public static final String SESSION_userpds = "userpds";			
	public static final String SESSION_USERROL = "USERROL";				//用户对象
	public static final String SESSION_USERNAME = "USERNAME";			//用户名
	public static final String LUNCENE_INDEXDIR="D:\\resourcesfile\\lucene_index";
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login.do";				//登录地址
	public static final String SYS_EPUB_PATH="sys_epub_path";           //系统参数 epub的地址
	public static final String SYS_IMAGE_URL="sys_image_url";          //系统参数 image的地址
	public static final String SYS_IMAGE_REAL_PATH="sys_image_real_path"; //D:\resourcesfile
	
	public static final String FILE_IMG_PATH = "sys_image_path";	//图片上传路径
	public static final String FILE_EPUB_PATH = "sys_epub_path";		//文件上传路径
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(code)|(app)|(weixin)|(static)|(plugins)|(mobile_data)).*";	//不对匹配该值的访问路径拦截（正则）

	public static final String INVITE_CACHE="INVITE_CACHE";
	public static final String INVITE_CACHE_ID="100010001000";
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	
	public static final String SYS_AUDIT_KEY="SYS_AUDIT_KEY";
	
	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title"};
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static final String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_judgeUser_PARAM_ARRAY = new String[]{"USERNAME","USERPASS"};
	public static final String[] APP_judgeUser_VALUE_ARRAY = new String[]{"用户名","密码"};
	
	
}
