package com.yiyun.controller.business;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.yiyun.controller.base.BaseController;
import com.yiyun.controller.system.tools.YiYunCacheManager;
import com.yiyun.entity.business.ChannelUser;
import com.yiyun.entity.business.Department;
import com.yiyun.entity.business.DepartmentUser;
import com.yiyun.entity.system.Page;
import com.yiyun.service.business.DepartmentService;
import com.yiyun.service.system.UserService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.PageData;

@Controller
@RequestMapping(value="/department")
public class DepartmentController extends BaseController{
	String menuUrl = "department/list.do"; //菜单地址(权限地址)
	String logMenu ="部门内容信息表";
	@Resource(name="departmentService")
	private DepartmentService departmentService;
	
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger,logMenu, "新增Department");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String department_id = pd.get("department_id").toString();
		if(StringUtils.isEmpty(department_id)){
		pd.put("department_id", this.yiYunCacheManager.findMaxNumberSeq("部门"));	//主键
		pd.put("department_id",department_id);
		departmentService.save(pd);
		}else{
		departmentService.edit(pd);
		}
		
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return new ModelAndView("forward:/department/list.do");
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger,logMenu, "删除Department");
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			int csize = departmentService.countDepartmentByParentId(pd.get("department_id").toString());
			if(csize == 0){
			departmentService.delete(pd);
			out.write("success");
			}else{
				out.write("false");
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger,logMenu, "修改Department");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		departmentService.edit(pd);	
		return new ModelAndView("forward:/department/list.do");
	}
	/**去增加人员
	 * 
	 */
	@RequestMapping(value="/goAddUser")
	@ResponseBody
	public Object goAddUser(Page page){
		logBefore(logger,logMenu, "去增加department人员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			page.setPd(pd);
			List<PageData>	userList = userService.listPdPageUser(page);
			String department_id = pd.getString("department_id");
			List<DepartmentUser>departmentUserList = departmentService.listDepartmentUser(department_id);
			mv.addObject("departmentUserList",departmentUserList);
			mv.addObject("userList",userList);
			mv.setViewName("business/department/department_addUser");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	
	}
	/**
	 * 列表
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger,logMenu, "列表Department");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			page.setPd(pd);
			String parent_id = pd.getString("parent_id");
			if(StringUtils.isEmpty(parent_id)){
				parent_id = "0";
			}
			pd.put("parent_id", parent_id);
			List<Department> deptList =  departmentService.datalistPage(page);
			mv.addObject("parent",parent_id);;//传入父部门ID
			mv.addObject("MSG", null == pd.get("MSG")?"list":pd.get("MSG").toString());
			mv.addObject("deptList", deptList);			
			mv.setViewName("business/department/department_list");
			mv.addObject("pd", pd);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger,logMenu, "去新增Department页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String parent_id  = pd.getString("parent_id");
			if(StringUtils.isEmpty(parent_id)){
				parent_id = "0";
			}
			pd.put("parent_id",parent_id);
			mv.addObject("pds", departmentService.getDepartmentById(parent_id));	//传入父部门所有信息
			mv.addObject("msg", "save");
			mv.setViewName("business/department/department_edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger,logMenu, "批量删除Department");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			String DATA_IDS = pd.getString("DATA_IDS");
			boolean flag =true;
			if(null != DATA_IDS && !"".equals(DATA_IDS)){ 
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				for(String departmentId: ArrayDATA_IDS){
					int count = departmentService.countDepartmentByParentId(departmentId);
					if(count > 0 ){
						Department department = departmentService.getDepartmentById(departmentId);
						map.put("name",department.getDepartment_name().toString());
						flag = false;
						break;
					}
				}
				if(flag){
					map.put("msg","ok");
					departmentService.deleteAll(ArrayDATA_IDS);
				}else{
					map.put("msg", "exist");
				}
			}else{
				map.put("msg", "no");
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	/**
	 * 去修改页面
	 * @return
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
		logBefore(logger,logMenu, "去修改Department页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String parent_id = pd.getString("parent_id");
			pd = departmentService.getDepartment(pd);	//根据ID读取
			mv.addObject("pds",departmentService.getDepartmentById(pd.get("parent_id").toString()));
			mv.setViewName("business/department/department_edit");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	/** 增加人员
	 * 
	 */
	@RequestMapping(value="/addUser")
	@ResponseBody
	public Object addUser(Page page){
		logBefore(logger,logMenu, "增加Department人员");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			String department_id = pd.getString("department_id");
			String UserList = pd.getString("userIdList");	
			if(!StringUtils.isEmpty(UserList)){
				saveDepartmentUser(department_id,UserList);
			}
			
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}	
		mv.setViewName("save_result");
		return mv;
	
	}
	
	public void saveDepartmentUser(String department_id,String userIdArrays) throws Exception{
		List list = new ArrayList();
		String[] tmps =userIdArrays.split(",");
		if(!StringUtils.isEmpty(userIdArrays)&&tmps.length>0){
			PageData pd = new PageData();
			pd.put("department_id", department_id);
			this.departmentService.deleteDepartmentUser(department_id);
			for(String userId:tmps){
				if(StringUtils.isEmpty(userId)){
					continue;
				}
				PageData param = new PageData();
				param.put("department_id", department_id);
				param.put("userId", userId);
				list.add(param);
			}
			this.departmentService.batchDepartmentUser(list);
		}
	}
}
