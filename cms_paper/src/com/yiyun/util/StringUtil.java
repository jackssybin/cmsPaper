package com.yiyun.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;

/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	//序列化对象为String字符串，先对序列化后的结果进行BASE64编码，否则不能直接进行反序列化  
    public static String writeObject(Object o) throws Exception {  
        ByteArrayOutputStream bos = new ByteArrayOutputStream();  
        ObjectOutputStream oos = new ObjectOutputStream(bos);  
        oos.writeObject(o);  
        oos.flush();  
        oos.close();  
        bos.close();  
        //return new BASE64Encoder().encode(bos.toByteArray());  
        return new String(bos.toByteArray(), "ISO-8859-1");  
    }  
    
  //反序列化String字符串为对象  
    
    public static Object readObject(String object) throws Exception{  
        //ByteArrayInputStream bis = new ByteArrayInputStream(new BASE64Decoder().decodeBuffer(object));  
        ByteArrayInputStream bis = new ByteArrayInputStream(object.getBytes("ISO-8859-1"));  
        ObjectInputStream ois = new ObjectInputStream(bis);  
        Object o = null;  
        try {  
            o = ois.readObject();  
        } catch(EOFException e) {  
            System.err.print("read finished");  
        }  
        bis.close();  
        ois.close();  
        return o;  
   }  
	
	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
	    int i = 0;
	    String TempStr = valStr;
	    String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
	    valStr = valStr + ",";
	    while (valStr.indexOf(',') > 0)
	    {
	        returnStr[i] = valStr.substring(0, valStr.indexOf(','));
	        valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());
	        i++;
	    }
	    return returnStr;
	}
	
	/**
	 * 判断字符串 str是否在数组array中存在
	 * @param str
	 * @param array
	 * @return
	 */
	public static boolean judgeStrInArray(String str ,String[] array){
		for(String temp:array){
			if(temp.trim().equals(str))return true;
		}
		return false ;
	}
	
	
	/*
	 * address=
//			{ADDRESS_ID=07618fe5b3a94007af6fa39578584729, DETAIL_ADDRESS=333, PHONE=12121,
			LINKER=zhoujackssy, IS_DEFAULT=11, 
			AREA=3333, USER_ID=admin, MOBILE=14521019859, EMAIL=333, ZONE_DETAIL=33, ZONE=33, ALIAS=33},
	 */
	public static Map StringToMap(String str){
		Map map  = new HashMap();
		if(!StringUtils.isEmpty(str)){
			str=str.replace("{", "").replace("}", "");
			String[] array =str.split(",");
			String[] temp=null;
			for(String ts:array){
				temp=ts.split("=");
				map.put(temp[0].trim(), temp[1].trim());
			}
		}
		return map;
	}
	
	
	public static String getDetailFromArray(String[] array){
//		String[] arr =new String[]{"1","2","3","4","1",};
//		String str=Arrays.asList(arr).toString() ;
//		System.out.println(str);
//		System.out.println(Arrays.toString(array).replace("[", "").replace("]", ""));
		return Arrays.toString(array).replace("[", "").replace("]", "").replace(", ", ",").trim();
	}
	
	public static void main(String[] args) throws Exception {
		
//		getDetailFromArray(null);
		StringUtil su = new StringUtil();
		String stest=su.writeObject("12134");
		System.out.println(stest);
		stest="¬í";
		stest=(String)su.readObject(stest);
		System.out.println(stest);
		
	}
	

}
