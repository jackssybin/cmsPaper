package com.yiyun.controller.system.tools;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.business.ChannelzTree;
import com.yiyun.entity.business.SysAudit;
import com.yiyun.entity.system.Page;
import com.yiyun.entity.system.ZTreeDO;
import com.yiyun.service.business.ChannelService;
import com.yiyun.util.Const;
import com.yiyun.util.DateUtil;
import com.yiyun.util.Logger;
import com.yiyun.util.PageData;

import net.sf.json.JSONArray;

@Service("yiYunCacheManager")
public class YiYunCacheManager {
	  protected Logger logger = Logger.getLogger(this.getClass());
		 private Map cacheData = new ConcurrentHashMap();  
		 
		 private static String logMenu="缓存管理";
		 private static String  CACHE_PARAM_LIST ="paramList";
		 
		 @Resource(name = "daoSupport")
		 private DaoSupport dao;
		 
		 @Resource(name="channelService")
		 private ChannelService channelService;
		 
		 
		 /**
		     * 根据系统参数code从缓存中获取
		     * @return
		     * @throws Exception 
		     */
		    public String getSysValueByCode(String PARAM_CODE) {
		    	String PARAM_NAME="";
		    	try {
					List<PageData> list = getSysParamList();
					 for(PageData pg  :list){
						if(PARAM_CODE.equals(pg.getString("PARAM_CODE"))){
							return pg.getString("PARAM_VALUE");
						} 
					 }
					 Page pg = new Page();
					 pg.getPd().put("PARAM_CODE",PARAM_CODE);
					 list= (List<PageData>)dao.findForList("ParamMapper.datalistPage", pg);
					 if(null!=list&&list.size()>0){
						 return list.get(0).getString("PARAM_VALUE");
					 }
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	return "";
		    }
		    
		    /**
		     * 根据type类型获取对应的参数map 
		     * @param PARAM_TYPE
		     * @return
		     * @throws Exception
		     */
		    public Map getParamMapByTypeCode(String PARAM_TYPE) throws Exception{
		    	Map map = new HashMap();
		    	List<PageData> list = getSysParamList();
				 for(PageData pg  :list){
					if(PARAM_TYPE.equals(pg.getString("PARAM_TYPE"))){
						map.put(pg.getString("PARAM_CODE"), pg.getString("PARAM_NAME"));
					} 
				 }
		    	return map;
		    }
		    public String getParamValByParamCode(String PARAM_CODE) throws Exception{
		    	String value = (String)this.dao.findForObject("ParamMapper.findById",PARAM_CODE);
		    	return value;
		    }
		    
		    public List getParamListByTypeCode(String PARAM_TYPE) throws Exception{
		    	List list = new ArrayList();
		    	Map map = new HashMap();
		    	
		    	List<PageData> tplist = getSysParamList();
				 for(PageData pg  :tplist){
					if(PARAM_TYPE.equals(pg.getString("PARAM_TYPE"))){
						map.put(pg.getString("PARAM_CODE"), pg.getString("PARAM_NAME"));
						list.add(pg);
					} 
				 }
				 
		    	return list;
		    }
		    
		    public String getImagePath(String pathType){
		    	String path=this.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH) +File.separator;		//文件上传路径
		    	if("image".equals(pathType)||"".equals(pathType)){
		    		path+=this.getSysValueByCode(Const.FILE_IMG_PATH)+File.separator;
		    	}else if("epub".equals(pathType)){
		    		path+=this.getSysValueByCode(Const.FILE_EPUB_PATH)+File.separator;
		    	}
		    return path;
		    }
		    
		    public String getImageUrl(String pathType){
		    	String imageUrl=this.getSysValueByCode(Const.SYS_IMAGE_URL);
				if("images".equals(pathType)||"".equals(pathType)){
					imageUrl+="images";
				}else{
					imageUrl+="epub";
				}
				return imageUrl;
		    }
		    
		    public List getParamsByType(String PARAM_TYPE) throws Exception{
		    	List<PageData> templist = getSysParamList();
		    	List  list = new ArrayList();
				 for(PageData pg  :templist){
					if(PARAM_TYPE.equals(pg.getString("PARAM_TYPE"))){
						list.add(pg);
					} 
				 }
		    	return list;
		    }
		    
		    @Cacheable(value="yiyunCache", key="getSysParamList")  
		    public List<PageData> getSysParamList() throws Exception{
		    	 List<PageData> list= (List<PageData>)dao.findForList("ParamMapper.listAll", new PageData());
		    	 System.out.println("从数据库中查找的全部参数列表");
		    	return list;
		    }
		    public Object getObjectFromCacheMap(String key) throws Exception{
		    	return getObjectFromCacheMap(key,"");
		    }
		    
		    
		    /**
		     * 缓存map 缓存中可以存放 任何信息  产品的 类型列表，产品的品牌列表，map集合
		     * @param key
		     * @return
		     * @throws Exception 
		     */
		    public Object getObjectFromCacheMap(String key,String ref) throws Exception{
		    	Object object =new Object();
		    	if(this.cacheData.containsKey(key)){
		    		object=this.cacheData.get(key);
		    	}else{
		    		PageData pd = new PageData();
		    		
		    		this.cacheData.put(key, object);
		    	}
		    	return object;
		    }
		    
		    public List<SysAudit> getSysAuditList() throws Exception{
		    	List<SysAudit> list =new ArrayList<SysAudit>();
		    	if(this.cacheData.containsKey(Const.SYS_AUDIT_KEY)){
		    		list=(List<SysAudit>)this.cacheData.get(Const.SYS_AUDIT_KEY);
		    	}else{
		    		list=(List<SysAudit>)this.dao.findForList("ToolsMapper.listAllAudit", new PageData());
		    		this.cacheData.put(Const.SYS_AUDIT_KEY, list);
		    	}
		    	
		    	return list;
		    }
		    
		    public SysAudit getSysAudit(String cur_status) throws Exception{
		    	List<SysAudit> list =getSysAuditList();
		    	for(SysAudit audit:list){
		    		if(null!=audit&&cur_status.equals(audit.getCurStatus())){
		    			return audit;
		    		}
		    	}
		    	return null;
		    }
		    
		    /********************************************************************************************/
		    
		    public String listAllChannelTree() throws Exception{
		    	List<ChannelzTree> channelList =  (List<ChannelzTree>) channelService.listAllChannel();	
				JSONArray arr = JSONArray.fromObject(channelList);
				String json = arr.toString();
				json = json.replaceAll("channelID", "id").replaceAll("parentID", "pId").replaceAll("channelName", "name").replaceAll("subChannel", "nodes");
		    	return json;
		    }
		    
		    public String commonTree(String pId)throws Exception{
		    	PageData pd = new PageData();
		    	pd.put("pId", pId);
		    	List list =(List) this.dao.findForList("ToolsMapper.queryCommonTree", pId);
		    	JSONArray arr = JSONArray.fromObject(list);
		    	
		    	return arr.toString();
		    }
		    
		    public JSONArray listToStr(List list) {
				JSONArray array = new JSONArray();
				Map map = new HashMap();
				Map treeMap = new HashMap();
				for (int i = 0; i < list.size(); i++) {
					treeMap = new HashMap();
					if(list.get(i) instanceof ZTreeDO){
						ZTreeDO zt = (ZTreeDO) list.get(i);
						treeMap.put("id", zt.getId());
						treeMap.put("pId", zt.getpId());
						treeMap.put("name", zt.getName());
						treeMap.put("isParent",zt.getIsParent());
						treeMap.put("checked",zt.getChecked());
						treeMap.put("open", zt.getOpen());
						treeMap.put("nocheck", zt.getNocheck());
						array.add(treeMap);
					}
				}
				return array;
			}
		    
		    /********************************************************************************************/
		    
		    //查询当天最大的生成 文章号码  
		    public String findMaxNumberSeq() throws Exception{
		    	return findMaxNumberSeq("","","","");
			}
		    
		    
		  //查询当天最大的生成 文章号码  
		    public String findMaxNumberSeq(String curType) throws Exception{
		    	return findMaxNumberSeq(curType,curType,curType,curType);
			}
		    
		    
		    
		    /**
		     * 
		     * @param curDate 传入当前日期
		     * @param curTime 传入当前时间
		     * @param reType  返回类型 ：支持两种返回类型：1.日期+时间+序列号 （默认） 2.直接返回序列号
		     * @return
		     * @throws Exception
		     */
		    public String findMaxNumberSeq(String curDate,String curTime,String reType,String curType) throws Exception{
		    	
		    	String ORDER_DATE="";
				String ORDER_TIME="";
		    	if(StringUtils.isEmpty(curDate)){
		    		ORDER_DATE=DateUtil.getDays();
		    	}else{
		    		ORDER_DATE=curDate;
		    	}
		    	
		    	if(StringUtils.isEmpty(curTime)){
		    		ORDER_TIME=DateUtil.getTimes();
		    	}else{
		    		ORDER_TIME=curTime;
		    	}
				String ORDER_SEQ = findMaxNumberDetail(ORDER_DATE, ORDER_TIME,curType);
				if("".equals(reType)){
					return ORDER_DATE+ORDER_TIME+ORDER_SEQ;
				}else{
					return ORDER_SEQ;
				}
			}

			private String findMaxNumberDetail(String ORDER_DATE, String ORDER_TIME,String curType) throws Exception {
				PageData pd = new PageData();
				pd.put("CUR_DATE", ORDER_DATE);
				String ORDER_SEQ=findMaxNumberSeq(pd);
				pd.put("CUR_TIME", ORDER_TIME);
				pd.put("CUR_SEQ", ORDER_SEQ);
				if(!StringUtils.isEmpty(curType)){
					pd.put("CUR_TYPE", curType);
				}
				if("1000".equals(ORDER_SEQ)){
					this.saveGenSeq(pd);
				}else{
					this.editGenSeq(pd);
				}
				return ORDER_SEQ;
			}
		    
		    
			/*
			 * 新增订单单号
			 */
			public void saveGenSeq(PageData pd)throws Exception{
				dao.save("ToolsMapper.saveGenSeq", pd);
			}
			/*
			 * 修改订单单号
			 */
			public void editGenSeq(PageData pd)throws Exception{
				dao.save("ToolsMapper.editGenSeq", pd);
			}
			
			/*
			* 查询当天的最大订单单号获取数据
			*/
			public String findMaxNumberSeq(PageData pd)throws Exception{
				return (String)dao.findForObject("ToolsMapper.findMaxOrderSeq", pd);
			}
			  /********************************************************************************************/
		    
		    
	
}
