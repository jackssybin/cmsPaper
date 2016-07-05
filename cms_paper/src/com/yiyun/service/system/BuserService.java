package com.yiyun.service.system;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.system.Buser;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;

@Service("buserService")
public class BuserService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	 * 查询所有的前台微信登录用户
	 */
	public List<Buser> ListBuser(Page page) throws Exception {
		return (List<Buser>)dao.findForList("BuserMapper.ListAllBuser", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BuserMapper.listAll", page);
	}
	
	/*
	 * 通过用户的ID查询单个用户
	 */
	public PageData findBuserById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("BuserMapper.findBuserById", pd);
	}
	
	/*
	 * 保存单个用户
	 */
	public void save(PageData pd) throws Exception {
		dao.save("BuserMapper.saveBuser", pd);
	}
	
	/*
	 * 删除单个用户
	 */
	public void del(PageData pd) throws Exception {
		dao.delete("BuserMapper.delBuser", pd);
	}
	
	/*
	 * 修改用户的信息
	 */
	public void update(PageData pd) throws Exception {
		dao.update("BuserMapper.updateBuser", pd);
	}
	
}
