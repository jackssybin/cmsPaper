package com.yiyun.entity.system;

import org.springframework.util.StringUtils;

public class ZTreeDO {

	private String id;
	private String name;
	private String pId;
	private String isParent;
	private String open;
	private String checked;
	private String displayName;
	private String displayId;
	private String orderBy;
	private String nocheck;
	
	
	public ZTreeDO(){
	}

	public ZTreeDO(String id, String name, String pId, String isParent,
			String open, String checked){
		this.id = id;
		this.name = name;
		this.pId = pId;
		this.isParent = isParent;
		this.open = open;
		this.checked = checked;
	}
	
	public ZTreeDO(String id, String name, String pId, String isParent,
			String open, String checked,String orderBy,String nocheck){
		this.id = id;
		this.name = name;
		this.pId = pId;
		this.isParent = isParent;
		this.open = open;
		this.checked = checked;
		this.orderBy = orderBy;
		this.nocheck = nocheck;
	}

	public String getId(){
		return id;
	}

	public void setId(String id){
		this.id = id;
	}

	public String getpId(){
		return pId;
	}

	public void setpId(String pId){
		this.pId = pId;
	}

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getIsParent(){
		return isParent;
	}

	public void setIsParent(String isParent){
		this.isParent = isParent;
	}

	public String getOpen(){
		return open;
	}

	public void setOpen(String open){
		this.open = open;
	}

	public String getChecked(){
		return checked;
	}

	public void setChecked(String checked){
		this.checked = checked;
	}
	public String getDisplayId(){
		return id;
	}
	
	public void setDisplayName(String displayName){
		this.displayName = displayName;
	}
	
	public void setDisplayId(String displayId){
		this.displayId = displayId;
	}
	
	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	public String getNocheck() {
		return nocheck;
	}

	public void setNocheck(String nocheck) {
		this.nocheck = nocheck;
	}

	public String getDisplayName(){
		if(StringUtils.isEmpty(id)||StringUtils.isEmpty(name)){
			return null;
		}
		return "[" + id + "]" + name;
	}
}
