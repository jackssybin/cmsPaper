package com.yiyun.service.system;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;


@Service("addressService")
public class AddressService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("AddressMapper.save", pd);
	}
	public void saveCopy(PageData pd)throws Exception{
		dao.save("AddressMapper.saveCopy", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("AddressMapper.delete", pd);
	}
	
	public void deleteOrderAddressCopy(PageData pd)throws Exception{
		dao.delete("AddressMapper.deleteOrderAddressCopy", pd);
	}
	
	
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("AddressMapper.edit", pd);
	}
	public void editDefault(PageData pd)throws Exception{
		dao.update("AddressMapper.editDefault", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("AddressMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("AddressMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AddressMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("AddressMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

