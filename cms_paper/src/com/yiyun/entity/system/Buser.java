package com.yiyun.entity.system;

public class Buser {
	private String USERID; // 用户id
	private String OPENID; // 微信公众号openid
	private String NICKNAME; // 用户昵称
	private String HEADIMGURL; // 用户头像地址
	private String NAME; // 用户姓名
	private String SEX; // 用户性别
	private String PHONE; // 用户手机号
	private String QQ; // 用户的qq号
	private String EMAIL; // 用户邮箱
	private String ADDRESS; // 用户地址
	private String INTRODUCTION;// 用户的个人介绍
	private String REGISTER_TIME; // 注册时间
	private String LAST_LOGIN_TIME;// 最后的登录时间
	private String LAST_IP; // 最后登录的IP
	private String COMMON_IP; // 用户常用登录IP
	private String USER_STATE; // 状态

	private Page page; // 分页对象

	public String getUSERID() {
		return USERID;
	}

	public void setUSER_ID(String uSERID) {
		USERID = uSERID;
	}

	public String getOPENID() {
		return OPENID;
	}

	public void setOPENID(String oPENID) {
		OPENID = oPENID;
	}

	public String getNICKNAME() {
		return NICKNAME;
	}

	public void setNICKNAME(String nICKNAME) {
		NICKNAME = nICKNAME;
	}

	public String getHEADIMGURL() {
		return HEADIMGURL;
	}

	public void setHEADIMGURL(String hEADIMGURL) {
		HEADIMGURL = hEADIMGURL;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getSEX() {
		return SEX;
	}

	public void setSEX(String sEX) {
		SEX = sEX;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getQQ() {
		return QQ;
	}

	public void setQQ(String qQ) {
		QQ = qQ;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public String getINTRODUCTION() {
		return INTRODUCTION;
	}

	public void setINTRODUCTION(String iNTRODUCTION) {
		INTRODUCTION = iNTRODUCTION;
	}

	public String getREGISTER_TIME() {
		return REGISTER_TIME;
	}

	public void setREGISTER_TIME(String rEGISTER_TIME) {
		REGISTER_TIME = rEGISTER_TIME;
	}

	public String getLAST_LOGIN_TIME() {
		return LAST_LOGIN_TIME;
	}

	public void setLAST_LOGIN_TIME(String lAST_LOGIN_TIME) {
		LAST_LOGIN_TIME = lAST_LOGIN_TIME;
	}

	public String getLAST_IP() {
		return LAST_IP;
	}

	public void setLAST_IP(String lAST_IP) {
		LAST_IP = lAST_IP;
	}

	public String getCOMMON_IP() {
		return COMMON_IP;
	}

	public void setCOMMON_IP(String cOMMON_IP) {
		COMMON_IP = cOMMON_IP;
	}

	public String getUSER_STATE() {
		return USER_STATE;
	}

	public void setUSER_STATE(String uSER_STATE) {
		USER_STATE = uSER_STATE;
	}

	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
