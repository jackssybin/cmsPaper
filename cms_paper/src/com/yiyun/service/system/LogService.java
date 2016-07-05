package com.yiyun.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.system.Log;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;

@Service("logService")
public class LogService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public DaoSupport getDao() {
		return dao;
	}

	public void setDao(DaoSupport dao) {
		this.dao = dao;
	}

	/*
	* 新增
	*/
	public void save(Log log)throws Exception{
		dao.save("LogMapper.save", log);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("LogMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("LogMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("LogMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("LogMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("LogMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("LogMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

