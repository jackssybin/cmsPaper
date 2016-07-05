package com.yiyun.controller.app.appuser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yiyun.controller.base.BaseController;
import com.yiyun.entity.business.SysBookinfo;
import com.yiyun.service.system.AppuserService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.PageData;
import com.yiyun.util.Tools;

import net.sf.json.JSONArray;


/**
  * 会员-接口类 
  *    
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整    
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appuser")
public class IntAppuserController extends BaseController {
    
	@Resource(name="appuserService")
	private AppuserService appuserService;
	
	/**
	 * 根据用户名获取会员信息
	 */
	@RequestMapping(value="/getAppuserByUm")
	@ResponseBody
	public Object getAppuserByUsernmae(){
		logBefore(logger,"测试接口", "");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		
		try{
			if(Tools.checkKey("USERNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("getAppuserByUsernmae", pd)){	//检查参数
					pd = appuserService.findByUId(pd);
					map.put("pd", pd);
					result = (null == pd) ?  "02" :  "01";
					
				}else {
					result = "03";
				}
			}else{
				result = "05";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 根据用户名获取会员信息
	 */
	@RequestMapping(value="/judgeUserByUsernmae")
	@ResponseBody
	public Object judgeUserByUsernmae(){
		logBefore(logger,"测试接口", "根据用户名密码返回是否正确");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		
		try{
			if(Tools.checkKey("USERNAME", pd.getString("FKEY"))){	//检验请求key值是否合法
				if(AppUtil.checkParam("judgeUserByUsernmae", pd)){	//检查参数
					pd = appuserService.findByUId(pd);
					map.put("pd", pd);
					result = (null == pd) ?  "02" :  "01";
					
				}else {
					result = "03";
				}
			}else{
				result = "05";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	
	/**
	 * 根据用户名获取会员信息
	 */
	@RequestMapping(value="/getBookList")
	@ResponseBody
	public Object getBookList(){
		logBefore(logger,"测试接口", "getBookList");
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		List<PageData> list;
		JSONArray json=null ;
		try {
			list = new ArrayList();
			json = JSONArray.fromObject(list);
			List<SysBookinfo> booksList = (List<SysBookinfo>)JSONArray.toCollection(json, SysBookinfo.class);
			System.out.println(booksList.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return json;
	}
	
}
	
 