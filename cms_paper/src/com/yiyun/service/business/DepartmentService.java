package com.yiyun.service.business;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.business.Channel;
import com.yiyun.entity.business.ChannelUser;
import com.yiyun.entity.business.Department;
import com.yiyun.entity.business.DepartmentUser;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;
@Service("departmentService")
public class DepartmentService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("DepartmentMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("DepartmentMapper.delete", pd);
	}
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("DepartmentMapper.edit", pd);
	}
	/*
	 * 通过父id获取数据
	 */
	public List<Department> datalistPage(Page page) throws Exception {
		return (List<Department>) dao.findForList("DepartmentMapper.datalistPage", page);
		
	}
	/*
	 * 通过id获取数据
	 */
	public Department getDepartmentById(String department_id) throws Exception {
		return (Department) dao.findForObject("DepartmentMapper.getDepartmentById", department_id);
		
	}
	/*
	* 通过id获取数据
	*/
	public PageData getDepartment(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DepartmentMapper.getDepartment", pd);
	}
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DepartmentMapper.deleteAll", ArrayDATA_IDS);
	}
	/*
	 * 获取数据数量
	 */
	public int countDepartmentByParentId(String parentId) throws Exception{
		return (Integer)this.dao.findForObject("DepartmentMapper.countDepartmentByParentId", parentId);
	}
	
	
	public List<DepartmentUser> listDepartmentUser(String department_id) throws Exception{
		return (List<DepartmentUser>) dao.findForList("DepartmentMapper.listDepartmentUser", department_id);
	}
	public void deleteDepartmentUser(String department_id) throws Exception{
		dao.delete("DepartmentMapper.deleteDepartmentUser", department_id);
	}
	/*批量插入User
	 * 
	 */
	public void batchDepartmentUser(List list) throws Exception{
		this.dao.batchSave("DepartmentMapper.batchDepartmentUser", list);
		
	}
}
