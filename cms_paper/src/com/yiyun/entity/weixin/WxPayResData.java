package com.yiyun.entity.weixin;

import net.sf.json.JSONObject;

/**
 * 微信公众号预支付返回对象
 *
 */
public class WxPayResData {
	
	public WxPayResData(String appId,String timestamp,String nonceStr,
			String packages,String sign,String prepayId,String jsonStr){
		setAppId(appId);
		setTimestamp(timestamp);
		setNonceStr(nonceStr);
		setPackages(packages);
		setSign(sign);
		setPrepayId(prepayId);
		setJsonStr(jsonStr);
	}
	
	public WxPayResData(){
		
	}
	
	
	
	private String appId;
	private String timestamp;
	private String nonceStr;
	private String packages;
	private String sign;
	private String prepayId;
	private String jsonStr;
	
	private String returnMsg;//返回错误信息
	private String errCode;
	private String errCodeDes;
	
	public String getReturnMsg() {
		return returnMsg;
	}

	public void setReturnMsg(String returnMsg) {
		this.returnMsg = returnMsg;
	}

	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrCodeDes() {
		return errCodeDes;
	}

	public void setErrCodeDes(String errCodeDes) {
		this.errCodeDes = errCodeDes;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getNonceStr() {
		return nonceStr;
	}
	public void setNonceStr(String nonceStr) {
		this.nonceStr = nonceStr;
	}
	public String getPackages() {
		return packages;
	}
	public void setPackages(String packages) {
		this.packages = packages;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getPrepayId() {
		return prepayId;
	}
	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}

	public String getJsonStr() {
		return jsonStr;
	}

	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}

}
