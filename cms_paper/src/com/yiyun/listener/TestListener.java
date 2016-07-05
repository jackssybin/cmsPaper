package com.yiyun.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class TestListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent paramServletContextEvent) {
		// TODO Auto-generated method stub
		System.out.println("1111contextInitialized");
	}

	@Override
	public void contextDestroyed(ServletContextEvent paramServletContextEvent) {
		// TODO Auto-generated method stub
		System.out.println("222contextDestroyed");
		
	}

}
