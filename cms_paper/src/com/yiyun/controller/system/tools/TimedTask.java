package com.yiyun.controller.system.tools;

import javax.annotation.Resource;

import com.yiyun.dao.DaoSupport;
import com.yiyun.util.PageData;

public class TimedTask {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	

	public void execute() throws Exception {
    	//定时清理系统中 没有付款的订单
		PageData pd = new PageData();
		pd.put("ORDER_STATUS", "un_fukuan");//待付款的订单查询出来
		pd.put("IS_DEL", "0");
//		 IS_DEL="0";	//0属于正常,1是属于取消，2是 手动删除,3属于属于超时关闭
		try {
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }  
    
    public static void main(String[] args) {
    	TimedTask tt = new TimedTask();
    	try {
			tt.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
