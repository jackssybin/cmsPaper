package com.yiyun.controller.system.tools;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yiyun.controller.base.BaseController;
import com.yiyun.util.Const;
import com.yiyun.util.FileUpload;
import com.yiyun.util.PageData;
import com.yiyun.util.PathUtil;

@Controller
@RequestMapping(value="/video")
public class VideoPlayTestController extends BaseController {
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;
	
	String menuUrl = "video/testplay.do"; //菜单地址(权限用)
	@RequestMapping(value="/testplay")
	public ModelAndView testplay(HttpServletResponse response) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/video/testplay");
		return mv;
	}
	
	/**
	 * 打开上传EXCEL页面
	 */
	@RequestMapping(value="/uploadevideo")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/video/uploadevideo");
		return mv;
	}
	
	
	/**
	 * 将上传的MP4文件保存到服务器
	 */
	@RequestMapping(value="/upload")
	public ModelAndView readExcel(
			@RequestParam(value="videoFile",required=false) MultipartFile file
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if (null != file && !file.isEmpty()) {
			String filePath = yiYunCacheManager.getSysValueByCode(Const.SYS_IMAGE_REAL_PATH);								//文件上传路径
			String uploadName="usermp4";
			String fileName =  FileUpload.fileUp(file, filePath, uploadName);							//执行上传
			mv.addObject("msg","success");
		}
		
		mv.setViewName("save_result");
		return mv;
	}
	
	
}
