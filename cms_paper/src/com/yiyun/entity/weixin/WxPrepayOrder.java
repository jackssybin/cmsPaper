package com.yiyun.entity.weixin;

public class WxPrepayOrder {
	//商户系统内部的订单号,确保唯一
	private String out_trade_no;
	//微信分配的公众账号ID
	private String appid;
	//微信支付分配的商户号
	private String mch_id;
	//随机字符串，不长于32位
	private String nonce_str;
	//签名
	private String sign;
	//交易类型JSAPI、 NATIVE、 APP
	private String trade_type;
	//预支付ID
	private String prepay_id;
	//状态：参见Constants.ORADER_STATUS_MAP
	private String status;
	//用户在商户appid下的唯一标识
	private String openid;
	
	//用户是否关注公众账号， Y-关注， N-未关注
	private String is_subscribe;
    //付款银行,银行类型，采用字符串类型的银行标识
	private String bank_type;
	//订单总金额，单位为分
	private String total_fee;
	//微信支付订单号
	private String transaction_id;
	//商家数据包，原样返回
	private String attach;
	//支付完成时间，格式为yyyyMMddhhmmss
	private String time_end;
	
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
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
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}
	public String getPrepay_id() {
		return prepay_id;
	}
	public void setPrepay_id(String prepay_id) {
		this.prepay_id = prepay_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getIs_subscribe() {
		return is_subscribe;
	}
	public void setIs_subscribe(String is_subscribe) {
		this.is_subscribe = is_subscribe;
	}
	public String getBank_type() {
		return bank_type;
	}
	public void setBank_type(String bank_type) {
		this.bank_type = bank_type;
	}
	public String getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(String total_fee) {
		this.total_fee = total_fee;
	}
	public String getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(String transaction_id) {
		this.transaction_id = transaction_id;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getTime_end() {
		return time_end;
	}
	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	
}
