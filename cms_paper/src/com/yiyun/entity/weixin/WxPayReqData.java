package com.yiyun.entity.weixin;

public class WxPayReqData {
	//微信分配的公众账号ID
	private String appid;
	//微信支付分配的商户号
	private String mch_id;
	//随机字符串，不长于32位
	private String nonce_str;
	//签名
	private String sign;
	//商品描述
	private String body;
	//附加数据，原样返回
	private String attach;
	//商户系统内部的订单号,32个字符内、 可包含字母,确保	在商户系统唯一
	private String out_trade_no;
	//订单总金额，单位为分，不能带小数点
	private int total_fee;
	//订单生成的机器IP
	private String spbill_create_ip;
	//通知地址，接收微信支付成功通知
	private String notify_url;
	//JSAPI、 NATIVE、 APP
	private String trade_type;
	//用户在商户appid下的唯一标识， trade_type为JSAPI	时，此参数必传
	private String openid;
	
	private String jsonStr;
	
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public int getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	public String getNotify_url() {
		return notify_url;
	}
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getJsonStr() {
		return jsonStr;
	}
	public void setJsonStr(String jsonStr) {
		this.jsonStr = jsonStr;
	}

}
