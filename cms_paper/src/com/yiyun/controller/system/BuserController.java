package com.yiyun.controller.system;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.entity.system.Page;
import com.yiyun.entity.system.Buser;
import com.yiyun.service.system.BuserService;
import com.yiyun.util.PageData;

@Controller
@RequestMapping(value="/management_user")
public class BuserController extends BaseController {
	
	@Resource(name="buserService")
	private BuserService buserService;
	
	/**
	 * 显示所有的前台登录用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
			String NICKNAME = pd.getString("NICKNAME");
			
			if(null != NICKNAME && !"".equals(NICKNAME)){
				NICKNAME = NICKNAME.trim();
				pd.put("NICKNAME", NICKNAME);
			}
			
			page.setPd(pd);
			List<Buser> buserList = buserService.ListBuser(page);
//			List<PageData> buserList = buserService.listAll(page);
			mv.addObject("buserList", buserList);
			System.out.println(page.getPageStr());
			mv.setViewName("system/buser/buser_list");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 去新增用户界面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView toadd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.addObject("msg","add");
		mv.setViewName("system/buser/buser_edit");
		return mv;
	}
	
	/**
	 * 去修改用户界面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goedit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pd1 = buserService.findBuserById(pd);
		pd1.put("USERID", pd.getString("USERID"));
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd1);
		mv.setViewName("system/buser/buser_edit");
		return mv;
	}
	
	/**
	 * 保存用户的信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/add")
	public String add() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("USERID", this.get32UUID());
			buserService.save(pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return "redirect:/management_user/list.do";
	}
	
	/**
	 * 修改用户信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{	
			buserService.update(pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除用户
	 * @param out
	 */
	@RequestMapping(value="/del")
	public void deleteU(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			buserService.del(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 查看用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toBuserDetail")
	public ModelAndView queryBuserBy() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pd1 = buserService.findBuserById(pd);
		System.out.println(pd.getString("USERID"));
		pd1.put("USERID", pd.getString("USERID"));
		mv.addObject("pd", pd1);
		mv.setViewName("system/buser/buser_detail");
		return mv;
	}
	
}
