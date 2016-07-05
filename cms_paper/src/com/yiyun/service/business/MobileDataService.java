package com.yiyun.service.business;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.business.ChannelzTree;
import com.yiyun.entity.business.MobileData;
import com.yiyun.entity.system.Page;

import net.sf.json.JSONArray;

/**
 * 给移动端信息提供数据
 * @author liuchang 2016-07-01
 *
 */
@Service("mobileDataService")
public class MobileDataService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	
	@Resource(name="channelService")
	private ChannelService channelService;
	/**
	 * 文章内容列表数据
	 * @param page
	 * @return list
	 * @throws Exception
	 */
	public List<MobileData> getContestList(Page page)throws Exception{
		return (List<MobileData>)dao.findForList("MobileDataMapper.datalistPageMobile", page);
	}
	
	public List<ChannelzTree> getChannel(){
		
		return null;
	}
	
	public void structureChannel(ChannelzTree cm,List<ChannelzTree> children)throws Exception{
		channelService.countChannelByParentId("0");
	}
	
}

