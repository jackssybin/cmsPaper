package com.yiyun.controller.business;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yiyun.controller.base.BaseController;
import com.yiyun.entity.business.ChannelzTree;
import com.yiyun.entity.business.MobileData;
import com.yiyun.entity.system.Page;
import com.yiyun.service.business.MobileDataService;
import com.yiyun.util.Constants;
import com.yiyun.util.PageData;

import net.sf.json.JSONArray;
/**
 * 提供移动端数据接口
 * @author liuchang 2016-07-01
 *
 */
@Controller
@RequestMapping(value="/mobile_data")
public class MobileDataController extends BaseController {
	String menuUrl = "mobiledata/"; //菜单地址(权限地址)
	String logMenu ="移动数据接口";
	@Resource(name="mobileDataService")
	private MobileDataService mobileDataService;
	/**
	 * 移动端文章列表接口函数
	 * 通过请求中的参数返回不同的文章列表
	 * get请求参数列表：
	 * topType：1--首页置顶文章  2--栏目页置顶文章  3--普通文章
	 * channelId：频道ID（参数为空则只按文章上线先后顺序返回，不考虑栏目）
	 * currentPage：当前页码
	 * lastId：移动端当前文章列表的最后一篇文章ID（用户上滑加载更多功能，如果加载前文章有更新，
	 * 整个队列会受到影响，翻页程序返回的数据列表有可能和上一页返回的内容有重复，此字段主要用于去重。）
	 * showCount：每页请求条数（如果不传参数，默认10条）
	 * @param out
	 * @throws Exception
	 * @return json
	 */
	@RequestMapping(value="/content_list")
	public void contentList(PrintWriter out) throws Exception{
		logBefore(logger,logMenu, "列表MobileData");
		PageData pd = new PageData();
		Map<String,Object> returnMap = new HashMap<String,Object>();
		try{
			pd = this.getPageData();
			Page page = new Page();
			//如果请求中没有showCount参数，按默认一页10条显示
			if(null!=(String)pd.get(Constants.MOBILE_PARAM_SHOW_COUNT_KEY)&&!"".equals((String)pd.get(Constants.MOBILE_PARAM_SHOW_COUNT_KEY))){
				page.setShowCount(Integer.parseInt((String)pd.get(Constants.MOBILE_PARAM_SHOW_COUNT_KEY)));
			}
			//将请求中当前页参数传给page对象
			page.setCurrentPage(Integer.parseInt((String)pd.get(Constants.MOBILE_PARAM_CURRENT_PAGE_KEY)));
			page.setPd(pd);
			//获取上一页最后一条记录的ID  
			String flagId = (String)pd.get(Constants.MOBILE_PARAM_LAST_ID_KEY)==null?"":(String)pd.get(Constants.MOBILE_PARAM_LAST_ID_KEY);
			//定义索引位置
			int flagNo = -1;
			List<MobileData> dataList = mobileDataService.getContestList(page);
			//便利返回结果集，定位到上一页最后一条记录
			MobileData md = new MobileData();
			for(int i=0;i<dataList.size();i++){
				md = dataList.get(i);
				if(flagId.equals(md.getArticleId())){
					flagNo=dataList.indexOf(md);
				}
			}
			//把列表中定位到的记录以及它之前的记录清掉
			for(int j=flagNo;j>=0;j--){
				dataList.remove(j);
			}
			
			returnMap.put(Constants.MOBILE_PARAM_DATA_LIST_KEY,dataList);
			returnMap.put(Constants.MOBILE_PARAM_RESP_CODE_KEY, Constants.MOBILE_PARAM_RESP_CODE_SUCCESS);//结果成功返回码
			returnMap.put(Constants.MOBILE_PARAM_RESP_MSG_KEY, Constants.MOBILE_PARAM_RESP_MSG_SUCCESS);
			JSONArray arr = JSONArray.fromObject(returnMap);
			out.write(arr.toString());
			
		} catch(Exception e){
			returnMap.put(Constants.MOBILE_PARAM_RESP_CODE_KEY, Constants.MOBILE_PARAM_RESP_CODE_ERROR);
			returnMap.put(Constants.MOBILE_PARAM_RESP_MSG_KEY, e.toString());
			JSONArray arr = JSONArray.fromObject(returnMap);
			out.write(arr.toString());
			logger.error(e.toString(), e);
		}finally{
			out.close();
		}
		
	}
	
	/**
	 * 移动端获取频道列表接口函数
	 * 参数列表：
	 * channelNo:渠道号（预留参数，目前无用，后续如果需要区分渠道送不同数据，再另行扩展）
	 * 返回所有栏目，子栏目list为父栏目对象的属性之一
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/channel")
	public void getChannel(PrintWriter out) throws Exception{
		logBefore(logger,logMenu, "栏目MobileData");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		try{
			List<ChannelzTree> channelList = mobileDataService.getChannel();
			returnMap.put(Constants.MOBILE_PARAM_DATA_LIST_KEY,channelList);
			returnMap.put(Constants.MOBILE_PARAM_RESP_CODE_KEY, Constants.MOBILE_PARAM_RESP_CODE_SUCCESS);//结果成功返回码
			returnMap.put(Constants.MOBILE_PARAM_RESP_MSG_KEY, Constants.MOBILE_PARAM_RESP_MSG_SUCCESS);
			JSONArray arr = JSONArray.fromObject(returnMap);
			out.write(arr.toString());
			
		} catch(Exception e){   
			returnMap.put(Constants.MOBILE_PARAM_RESP_CODE_KEY, Constants.MOBILE_PARAM_RESP_CODE_ERROR);
			returnMap.put(Constants.MOBILE_PARAM_RESP_MSG_KEY, e.toString());
			JSONArray arr = JSONArray.fromObject(returnMap);
			out.write(arr.toString());
			logger.error(e.toString(), e);
		}finally{
			out.close();
		}
	}
}
