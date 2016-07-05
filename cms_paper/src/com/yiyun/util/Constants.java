package com.yiyun.util;

import java.util.HashMap;
import java.util.Map;

public class Constants {
	/******************************鏁版嵁鎺ュ彛甯搁噺寮�濮�********************************************/
	
	public final static String MOBILE_PARAM_SHOW_COUNT_KEY = "showCount";
	public final static String MOBILE_PARAM_CURRENT_PAGE_KEY = "currentPage";
	public final static String MOBILE_PARAM_LAST_ID_KEY = "lastId";
	public final static String MOBILE_PARAM_DATA_LIST_KEY = "dataList";
	public final static String MOBILE_PARAM_RESP_CODE_KEY = "respCode";
	public final static String MOBILE_PARAM_RESP_CODE_SUCCESS = "AAAAAAA";
	public final static String MOBILE_PARAM_RESP_CODE_ERROR = "ERROR";
	public final static String MOBILE_PARAM_RESP_MSG_KEY = "respMsg";
	public final static String MOBILE_PARAM_RESP_MSG_SUCCESS = "SUCCESS";
	public final static String MOBILE_PARAM_CHANNEL_ID_KEY = "channelId";
	/******************************鏁版嵁鎺ュ彛甯搁噺缁撴潫********************************************/
	public static String PICTURE_VISIT_FILE_PATH = "";//鍥剧墖璁块棶鐨勮矾寰�
	
	public static String PICTURE_SAVE_FILE_PATH = "";//鍥剧墖瀛樻斁鐨勮矾寰�
	
	public static String SUCCESS = "SUCCESS";
	
	public static String FAIL = "FAIL";
	
	//寰俊棰勮鍗曞垱寤�-鎴愬姛鐘舵��
	public static String PREODER_CREATE_SUCCESS = "0";
	
	//寰俊璁㈠崟鏀粯-鎴愬姛鐘舵��
	public static String ORDER_PAY_SUCCESS = "1";
	
	//寰俊璁㈠崟鏀粯-鏀粯澶辫触(鍏朵粬鍘熷洜锛屽閾惰杩斿洖澶辫触)鐘舵��
	public static String ORDER_PAY_PAYERROR = "2";
	
	//寰俊璁㈠崟鏀粯-杞叆閫�娆剧姸鎬�
	public static String ORDER_PAY_REFUND = "3";
	
	//寰俊璁㈠崟鏀粯鈥旀湭鏀粯鐘舵��
	public static String ORDER_PAY_NOTPAY = "4";
	
	//寰俊璁㈠崟鏀粯鈥斿凡鍏抽棴鐘舵��
	public static String ORDER_PAY_CLOSED = "5";
	
	//寰俊璁㈠崟鏀粯鈥斿凡鎾ら攢鐘舵��
	public static String ORDER_PAY_REVOKED = "6";
	
	//寰俊璁㈠崟鏀粯-鐢ㄦ埛鏀粯涓姸鎬�
	public static String ORDER_PAY_USERPAYING = "7";
	
	//寰俊璁㈠崟鏀粯-鏈敮浠�(杈撳叆瀵嗙爜鎴栫‘璁ゆ敮浠樿秴鏃�)鐘舵��
	public static String ORDER_PAY_NOPAY = "8";
	
	//寰俊璁㈠崟鏌ヨ鎺ュ彛涓�渢rade_state鈥濆弬鏁颁笌鏈郴缁熺姸鎬佸叧绯�
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
	
	//榛樿role_id
	public static String DEFAULT_ROLE_ID="2";//TODO
	public static String DEFAULT_PWD="123456";//TODO
	
	//寰俊璇佷功璺緞
	public static String CREDENTIAL_PATH = "/root/wxpay/cert/apiclient_cert.p12";//TODO
//	public static String CREDENTIAL_PATH = "D:\\resourcesfile\\wxpay\\cert\\apiclient_cert.p12";//TODO
	
	
	//鏈満IP
	public static String LOCAL_IP = "127.0.0.1";//TODO
	
	
	//寰俊鏀粯鍒嗛厤鐨勫晢鎴峰彿
	public static String MCHID = "1335782401";//TODO
	
	//鍟嗘埛鏀粯瀵嗛挜Key
	public static String KEY = "eyeglass258EYEGLASS258jackssybin";//TODO
	
	//寰俊鍒嗛厤鐨勫叕浼楄处鍙稩D--閫傜洰浠ユ埓
	public static String APPID = "wx462d349421581949";//姝ｇ‘
//	public static String APPID = "wxb821cf72430cc89b";//娴嬭瘯
	
	//鍏紬鍙风殑appsecret--閫傜洰浠ユ埓
//	public static String SECRET = "f86038291998d39380ca56573f7da7c5";//娴嬭瘯
	public static String SECRET = "e387ce551838bc7232bd9e21858daa34";//姝ｇ‘
	
	//娑堟伅鍔犲瘑瀵嗛挜
	public static String ENCODINGAESKEY = "oU0nPKZd2wGXDIleqOaB8vLnVMbGzHIbdtAW2IXbwWx";
	
	//鍏紬鍙风殑token
	public static String TOKEN = "dfgertery4578vcbt76afbfu67";//TODO

	//閫氱煡鍦板潃锛屾帴鏀跺井淇℃敮浠樻垚鍔熼�氱煡
	public static String NOTIFY_URL = "http://www.yiku-yiku.com/eyeTest/weixin/wxpaynotify";//TODO

	//鎺堟潈鍚庨噸瀹氬悜鐨勫洖璋冮摼鎺ュ湴鍧�
	public static String REDIRECT_URI = "http://www.yiku-yiku.com/eyeTest/weixin/autoLogin";//TODO
//	public static String REDIRECT_URI = "http://ecloudtime.com/eyeTest/weixin/autoLogin";//TODO
	//搴熷純
//	public static String SCOPE_BASE = "snsapi_base";
	//搴熷純
//	public static String SCOPE_USERINFO = "snsapi_userinfo";
	//搴熷純
	//寰俊鑾峰彇code url,鐢╟ode鎹penid
//	public static String  CODE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect"; 

	//寰俊鑾峰彇openid url
	public static String  OPENID_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	//寰俊鑾峰彇鐢ㄦ埛淇℃伅url
	public static String  USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";
	
	//寰俊缁熶竴鏀粯鎺ュ彛url
	public static String UNIFIEDORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";//涓嶈兘淇敼
	
	//寰俊璁㈠崟鏌ヨ鎺ュ彛url
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
