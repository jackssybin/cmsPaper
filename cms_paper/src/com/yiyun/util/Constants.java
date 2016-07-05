package com.yiyun.util;

import java.util.HashMap;
import java.util.Map;

public class Constants {
	/******************************数据接口常量开始********************************************/
	
	public final static String MOBILE_PARAM_SHOW_COUNT_KEY = "showCount";
	public final static String MOBILE_PARAM_CURRENT_PAGE_KEY = "currentPage";
	public final static String MOBILE_PARAM_LAST_ID_KEY = "lastId";
	public final static String MOBILE_PARAM_DATA_LIST_KEY = "dataList";
	public final static String MOBILE_PARAM_RESP_CODE_KEY = "respCode";
	public final static String MOBILE_PARAM_RESP_CODE_SUCCESS = "AAAAAAA";
	public final static String MOBILE_PARAM_RESP_CODE_ERROR = "ERROR";
	public final static String MOBILE_PARAM_RESP_MSG_KEY = "respMsg";
	public final static String MOBILE_PARAM_RESP_MSG_SUCCESS = "SUCCESS";
	/******************************数据接口常量结束********************************************/
	public static String PICTURE_VISIT_FILE_PATH = "";//图片访问的路径
	
	public static String PICTURE_SAVE_FILE_PATH = "";//图片存放的路径
	
	public static String SUCCESS = "SUCCESS";
	
	public static String FAIL = "FAIL";
	
	//微信预订单创建-成功状态
	public static String PREODER_CREATE_SUCCESS = "0";
	
	//微信订单支付-成功状态
	public static String ORDER_PAY_SUCCESS = "1";
	
	//微信订单支付-支付失败(其他原因，如银行返回失败)状态
	public static String ORDER_PAY_PAYERROR = "2";
	
	//微信订单支付-转入退款状态
	public static String ORDER_PAY_REFUND = "3";
	
	//微信订单支付—未支付状态
	public static String ORDER_PAY_NOTPAY = "4";
	
	//微信订单支付—已关闭状态
	public static String ORDER_PAY_CLOSED = "5";
	
	//微信订单支付—已撤销状态
	public static String ORDER_PAY_REVOKED = "6";
	
	//微信订单支付-用户支付中状态
	public static String ORDER_PAY_USERPAYING = "7";
	
	//微信订单支付-未支付(输入密码或确认支付超时)状态
	public static String ORDER_PAY_NOPAY = "8";
	
	//微信订单查询接口中“trade_state”参数与本系统状态关系
	public static Map<String , String> ORADER_STATUS_MAP = new HashMap<String , String>(){
		private static final long serialVersionUID = -223374791341026460L;
		{
			put("PREODER_CREATE_SUCCESS",PREODER_CREATE_SUCCESS);
			put("SUCCESS",ORDER_PAY_SUCCESS);
			put("PAYERROR)",ORDER_PAY_PAYERROR);
			put("REFUND",ORDER_PAY_REFUND);
			put("NOTPAY",ORDER_PAY_NOTPAY);
			put("CLOSED",ORDER_PAY_CLOSED);
			put("REVOKED",ORDER_PAY_REVOKED);
			put("USERPAYING",ORDER_PAY_USERPAYING);
		}
	};
	
	//默认role_id
	public static String DEFAULT_ROLE_ID="2";//TODO
	public static String DEFAULT_PWD="123456";//TODO
	
	//微信证书路径
	public static String CREDENTIAL_PATH = "/root/wxpay/cert/apiclient_cert.p12";//TODO
//	public static String CREDENTIAL_PATH = "D:\\resourcesfile\\wxpay\\cert\\apiclient_cert.p12";//TODO
	
	
	//本机IP
	public static String LOCAL_IP = "127.0.0.1";//TODO
	
	
	//微信支付分配的商户号
	public static String MCHID = "1335782401";//TODO
	
	//商户支付密钥Key
	public static String KEY = "eyeglass258EYEGLASS258jackssybin";//TODO
	
	//微信分配的公众账号ID--适目以戴
	public static String APPID = "wx462d349421581949";//正确
//	public static String APPID = "wxb821cf72430cc89b";//测试
	
	//公众号的appsecret--适目以戴
//	public static String SECRET = "f86038291998d39380ca56573f7da7c5";//测试
	public static String SECRET = "e387ce551838bc7232bd9e21858daa34";//正确
	
	//消息加密密钥
	public static String ENCODINGAESKEY = "oU0nPKZd2wGXDIleqOaB8vLnVMbGzHIbdtAW2IXbwWx";
	
	//公众号的token
	public static String TOKEN = "dfgertery4578vcbt76afbfu67";//TODO

	//通知地址，接收微信支付成功通知
	public static String NOTIFY_URL = "http://www.yiku-yiku.com/eyeTest/weixin/wxpaynotify";//TODO

	//授权后重定向的回调链接地址
	public static String REDIRECT_URI = "http://www.yiku-yiku.com/eyeTest/weixin/autoLogin";//TODO
//	public static String REDIRECT_URI = "http://ecloudtime.com/eyeTest/weixin/autoLogin";//TODO
	//废弃
//	public static String SCOPE_BASE = "snsapi_base";
	//废弃
//	public static String SCOPE_USERINFO = "snsapi_userinfo";
	//废弃
	//微信获取code url,用code换openid
//	public static String  CODE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect"; 

	//微信获取openid url
	public static String  OPENID_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	//微信获取用户信息url
	public static String  USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	//微信统一支付接口url
	public static String UNIFIEDORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";//不能修改
	
	//微信订单查询接口url
	public static String ORDERQUERY_URL = "https://api.mch.weixin.qq.com/pay/orderquery";//TODO
	
	public static String getPICTURE_VISIT_FILE_PATH() {
		return PICTURE_VISIT_FILE_PATH;
	}

	public static void setPICTURE_VISIT_FILE_PATH(String pICTURE_VISIT_FILE_PATH) {
		PICTURE_VISIT_FILE_PATH = pICTURE_VISIT_FILE_PATH;
	}

	public static String getPICTURE_SAVE_FILE_PATH() {
		return PICTURE_SAVE_FILE_PATH;
	}

	public static void setPICTURE_SAVE_FILE_PATH(String pICTURE_SAVE_FILE_PATH) {
		PICTURE_SAVE_FILE_PATH = pICTURE_SAVE_FILE_PATH;
	}

	public static void main(String[] args) {
		Constants.setPICTURE_SAVE_FILE_PATH("D:/Tomcat 6.0/webapps/jk/topic/");
		Constants.setPICTURE_VISIT_FILE_PATH("http://192.168.1.225:8888/jk/topic/");
	}
	
}
