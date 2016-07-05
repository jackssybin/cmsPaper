package com.yiyun.service.business;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.business.Channel;
import com.yiyun.entity.business.ChannelUser;
import com.yiyun.entity.business.ChannelzTree;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;

@Service("channelService")
public class ChannelService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ChannelMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ChannelMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ChannelMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ChannelMapper.datalistPage", page);
	}
	public List<PageData> datalistPageChannelUser(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ChannelMapper.datalistPageChannelUser", page);
	}
	public void changeChannelParentId(PageData pd)throws Exception{
		dao.update("ChannelMapper.changeChannelParentId", pd);
	}
	public List<Channel> listChannelByParentIdc(String channel_id)throws Exception{
		return (List<Channel>)dao.findForList("ChannelMapper.listChannelByParentIdc", channel_id);
	}
	public List<ChannelUser> listChannelUser(String channel_id) throws Exception{
		return (List<ChannelUser>) dao.findForList("ChannelMapper.listChannelUser", channel_id);
	}
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ChannelMapper.listAll", pd);
	}
	/*
	 * 通过父id获取数据
	 */
	public List<Channel> datalistPage(Page page) throws Exception {
		return (List<Channel>) dao.findForList("ChannelMapper.datalistPage", page);
		
	}
	
	public int countChannelByParentId(String parentId) throws Exception{
		return (Integer)this.dao.findForObject("ChannelMapper.countChannelByParentId", parentId);
	}
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("ChannelMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ChannelMapper.deleteAll", ArrayDATA_IDS);
	}
	/*批量插入User
	 * 
	 */
	public void batchChannelUser(List list) throws Exception{
		this.dao.batchSave("ChannelMapper.batchChannelUser", list);
		
	}
	public Channel getChannelById(String channel_id) throws Exception {
		return (Channel) dao.findForObject("ChannelMapper.getChannelById", channel_id);
		
	}
	public List<ChannelzTree> listSubChannelByParentId(String parentId) throws Exception {
		return (List<ChannelzTree>) dao.findForList("ChannelMapper.listSubChannelByParentId", parentId);
		
	}
	public List<ChannelzTree> listAllChannel() throws Exception{
		List<ChannelzTree> list = this.listAllParentChannel();
		//循环怎么写？
		for(ChannelzTree channelzTree : list){
			List<ChannelzTree> subList = this.listSubChannelByParentId(channelzTree.getChannelID());
			
			channelzTree.setSubChannel(subList);
		}
		//return (List<ChannelzTree>) dao.findForList("ChannelMapper.getChannel",new PageData() );
		return list;
		
	}
	/*
	 * 删除Channel的User
	 */
	public void deleteChannelUser(String channel_id) throws Exception{
		dao.delete("ChannelMapper.deleteChannelUser", channel_id);
	}
	
	private List<ChannelzTree> listAllParentChannel() throws Exception {
		
		return (List<ChannelzTree>) dao.findForList("ChannelMapper.listAllParentChannel", null);
	}
}
