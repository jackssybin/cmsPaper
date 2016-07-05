package com.yiyun.controller.system.tools;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.entity.system.Page;
import com.yiyun.service.tools.PicturesService;
import com.yiyun.util.AppUtil;
import com.yiyun.util.Const;
import com.yiyun.util.DateUtil;
import com.yiyun.util.FileUpload;
import com.yiyun.util.FileUtil;
import com.yiyun.util.PageData;
import com.yiyun.util.Tools;

@Controller
@RequestMapping(value="/pictures")
public class PicturesController extends BaseController {
	
	String menuUrl = "pictures/list.do"; //菜单地址(权限用)
	@Resource(name="picturesService")
	private PicturesService picturesService;
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	
	
	/**
	 * 新增
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public Object save(
			@RequestParam(required=false) MultipartFile file
			) throws Exception{
		logBefore(logger,"图片管理", "新增Pictures");
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtil.getDays(), fileName = "";
		String picId=this.get32UUID();
		PageData pd = new PageData();
			if (null != file && !file.isEmpty()) {
				String filePath = yiYunCacheManager.getImagePath("image")+ffile;		//文件上传路径
				fileName = FileUpload.fileUp(file, filePath, picId);				//执行上传
			}else{
				logger.info("上传失败");
			}
			
			pd.put("PICTURES_ID", picId);			//主键
			pd.put("TITLE", "图片");								//标题
			pd.put("NAME", fileName);							//文件名
			pd.put("PATH", ffile + "/" + fileName);				//路径
			pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
			pd.put("MASTER_ID", "1");							//附属与
			pd.put("BZ", "测试上传");						//备注
			picturesService.save(pd);
		map.put("result", "ok");
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out){
		logBefore(logger,"图片管理", "删除Pictures");
		PageData pd = new PageData();
		try{
				pd = this.getPageData();
				FileUtil.delFolder(yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH) + pd.getString("PATH")); //删除图片
				picturesService.delete(pd);
			out.write("success");
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(
			HttpServletRequest request,
			@RequestParam(value="tp",required=false) MultipartFile file,
			@RequestParam(value="tpz",required=false) String tpz,
			@RequestParam(value="PICTURES_ID",required=false) String PICTURES_ID,
			@RequestParam(value="TITLE",required=false) String TITLE,
			@RequestParam(value="MASTER_ID",required=false) String MASTER_ID,
			@RequestParam(value="BZ",required=false) String BZ
			) throws Exception{
		logBefore(logger, "图片管理","修改Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
			pd.put("PICTURES_ID", PICTURES_ID);		//图片ID
			pd.put("TITLE", TITLE);					//标题
			pd.put("MASTER_ID", MASTER_ID);			//属于ID
			pd.put("BZ", BZ);						//备注
			
			if(null == tpz){tpz = "";}
			String  ffile = DateUtil.getDays(), fileName = "";
			if (null != file && !file.isEmpty()) {
//				String filePath = yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH) + ffile;		//文件上传路径
				String filePath = yiYunCacheManager.getImagePath("image")+ffile;	
				fileName = FileUpload.fileUp(file, filePath, this.get32UUID());				//执行上传
				pd.put("PATH", ffile + "/" + fileName);				//路径
				pd.put("NAME", fileName);
			}else{
				pd.put("PATH", tpz);
			}
			picturesService.edit(pd);				//执行修改数据库
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 列表
	 * @throws Exception 
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) {
		logBefore(logger, "图片管理","列表Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String KEYW = pd.getString("keyword");
			if(null != KEYW && !"".equals(KEYW)){
				KEYW = KEYW.trim();
				pd.put("KEYW", KEYW);
			}
			page.setPd(pd);
			List<PageData>	varList = picturesService.list(page);	//列出Pictures列表
			pd.put("imageUrl", yiYunCacheManager.getImageUrl("images"));
			mv.setViewName("system/tools/pictures_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 列表
	 * @throws Exception 
	 */
	@RequestMapping(value="/h5show")
	public ModelAndView h5show(Page page) {
		logBefore(logger, "图片管理","列表Pictures");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String KEYW = pd.getString("keyword");
			if(null != KEYW && !"".equals(KEYW)){
				KEYW = KEYW.trim();
				pd.put("KEYW", KEYW);
			}
			page.setPd(pd);
			List<PageData>	varList = picturesService.list(page);	//列出Pictures列表
			pd.put("imageUrl", yiYunCacheManager.getImageUrl("images"));
			mv.setViewName("system/tools/picture_h5show");
			mv.addObject("varList", varList);
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
		logBefore(logger,"图片管理", "去新增Pictures页面");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("system/tools/pictures_add");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 去修改页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		logBefore(logger,"图片管理", "去修改Pictures页面");
		ModelAndView mv = this.getModelAndView();
		String sysImageUrl=yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_URL);
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = picturesService.findById(pd);	//根据ID读取
			mv.setViewName("system/tools/pictures_edit");
			pd.put("imageUrl", yiYunCacheManager.getImageUrl("images"));
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			mv.addObject("sysImageUrl",sysImageUrl);
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
		logBefore(logger,"图片管理", "批量删除Pictures");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			List<PageData> pathList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				pathList = picturesService.getAllById(ArrayDATA_IDS);
				//删除图片
				for(int i=0;i<pathList.size();i++){
					FileUtil.delFolder(yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH) + pathList.get(i).getString("PATH"));
				}
				picturesService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	
	//删除图片
	@RequestMapping(value="/deltp")
	public void deltp(PrintWriter out) {
		logBefore(logger,"图片管理", "删除图片");
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("PATH");													 		//图片路径
			FileUtil.delFolder(yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH)+ pd.getString("PATH")); 	//删除图片
			if(PATH != null){
				picturesService.delTp(pd);																//删除数据中图片数据
			}	
			out.write("success");
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
