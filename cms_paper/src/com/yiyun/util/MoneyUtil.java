package com.yiyun.util;

import java.math.BigDecimal;

import org.springframework.util.StringUtils;

public class MoneyUtil {
	
	
	public static String getTotalPrice(String sale,String count){
		BigDecimal b_sale=new BigDecimal(sale);
		BigDecimal b_count=new BigDecimal(count);
		return String.valueOf(b_sale.multiply(b_count));
	}
	
	public static String sumPrice(String sale,String sale2){
		BigDecimal b_sale=new BigDecimal(sale);
		BigDecimal b_sale2=new BigDecimal(sale2);
		return String.valueOf(b_sale.add(b_sale2));
	}
	
	public static String subPrice(String sale,String sale2){
		BigDecimal b_sale=new BigDecimal(sale);
		BigDecimal b_sale2=new BigDecimal(sale2);
		return String.valueOf(b_sale.subtract(b_sale2));
	}
	
	public  static int multPrice(String sale,String sale2){
		boolean flag =false ;
		BigDecimal b_sale=new BigDecimal(sale);
		BigDecimal b_sale2=new BigDecimal(sale2);
		return b_sale.compareTo(b_sale2) ;
	}
	
	
	
	public static String yuanToFen(String yuan){
		if(StringUtils.isEmpty(yuan))return "1";
		java.text.DecimalFormat myformat=new java.text.DecimalFormat("0");
		BigDecimal yuan_big=new BigDecimal(yuan);
		yuan_big=yuan_big.multiply(new BigDecimal(100));
		return myformat.format(yuan_big);
	}
	
	public static void main(String[] args) {
		String tmp="YQZHOUBINAVTZ1530";
		MoneyUtil mu = new MoneyUtil();
		;
		System.out.println(mu.subPrice("10", "1"));
	}
}
