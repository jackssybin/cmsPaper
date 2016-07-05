package com.yiyun.entity.business;

import java.util.List;

public class ChannelzTree {
	
	private String ChannelID;
	private String ParentID;
	private String ChannelName;

	private List<ChannelzTree> subChannel;
	public List<ChannelzTree> getSubChannel() {
		return subChannel;
	}
	public void setSubChannel(List<ChannelzTree> subChannel) {
		this.subChannel = subChannel;
	}
	
	public String getChannelID() {
		return ChannelID;
	}
	public void setChannelID(String channelID) {
		ChannelID = channelID;
	}
	public String getParentID() {
		return ParentID;
	}
	public void setParentID(String parentID) {
		ParentID = parentID;
	}
	public String getChannelName() {
		return ChannelName;
	}
	public void setChannelName(String channelName) {
		ChannelName = channelName;
	}

	
}
