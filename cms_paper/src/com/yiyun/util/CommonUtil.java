package com.yiyun.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import net.sf.json.JSONObject;

public class CommonUtil {
	private static Logger log = Logger.getLogger(CommonUtil.class);

	public static String getOpenIdUrl(String code){
		String result = Constants.OPENID_URL;
		result = result.replace("APPID", enodeUTF8(Constants.APPID));
		result = result.replace("SECRET", enodeUTF8(Constants.SECRET));
		result = result.replace("CODE", enodeUTF8(code));
		return result;
	}
	
	public static String getUserInfoUrl(String access_token , String openid){
		String result = Constants.USERINFO_URL;
		result = result.replace("ACCESS_TOKEN", enodeUTF8(access_token));
		result = result.replace("OPENID", enodeUTF8(openid));
		return result;
	}
	
	public static String enodeUTF8(String str){ 
        String result = str; 
        try { 
            result = URLEncoder.encode(str,"UTF-8"); 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
        return result; 
    } 
	
	/**
	 * @param requestUrl 请求的url
	 * @param requestMethod “POST”|“GET”
	 * @param output null|要输出的字符串
	 * @return 响应结果的JSON对象
	 */
	public static JSONObject httpsRequestToJsonObject(String requestUrl, String requestMethod, String outputStr) {
		JSONObject jsonObject = null;
		try {
			StringBuffer buffer = httpsRequest(requestUrl, requestMethod, outputStr);
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (Exception e) {
			log.error("https请求异常：" + e.getMessage());
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * @param requestUrl 请求的url
	 * @param requestMethod “POST”|“GET”
	 * @param output null|要输出的字符处
	 * @return 响应结果
	 */
	
	public static StringBuffer httpsRequest(String requestUrl, String requestMethod, String output){
		StringBuffer buffer = null;
		HttpsURLConnection connection = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		try {
			URL url = new URL(requestUrl);
			connection = (HttpsURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setRequestMethod(requestMethod);
			if (null != output) {
				OutputStream outputStream = connection.getOutputStream();
				outputStream.write(output.getBytes("UTF-8"));
				outputStream.flush();
				outputStream.close();
			}
			inputStream = connection.getInputStream();
			inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			buffer = new StringBuffer();
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			close(inputStream,inputStreamReader,bufferedReader,connection);
		}
		
		return buffer;
	}
	
	private static void close(InputStream inputStream,InputStreamReader inputStreamReader
			,BufferedReader bufferedReader,HttpsURLConnection connection){
		try {
			if(inputStream!=null){
				inputStream.close();
			}
			if(inputStreamReader!=null){
				inputStreamReader.close();
			}
			if(bufferedReader!=null){
				bufferedReader.close();
			}
			if(connection!=null){
				connection.disconnect();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		String url = "https://mp.weixin.qq.com";
		System.out.println(httpsRequest(url,"POST",null).toString());;
	}
}
