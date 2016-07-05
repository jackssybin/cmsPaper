package com.yiyun.controller.system.tools;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yiyun.controller.base.BaseController;
import com.yiyun.util.AppUtil;
import com.yiyun.util.DateUtil;
import com.yiyun.util.PageData;
import com.yiyun.util.Tools;

@Controller
@RequestMapping(value="/ueditor")
public class UeditorController extends BaseController {
	
	@RequestMapping(value="/uploadimage")
	@ResponseBody
	public Object uploadimage() throws Exception{
		logBefore(logger,"图片管理", "新增Pictures");
		Map<String,String> map = new HashMap<String,String>();
		String  ffile = DateUtil.getDays(), fileName = "";
		String picId=this.get32UUID();
		PageData pd = new PageData();
		
			
			pd.put("PICTURES_ID", picId);			//主键
			pd.put("TITLE", "图片");								//标题
			pd.put("NAME", fileName);							//文件名
			pd.put("PATH", ffile + "/" + fileName);				//路径
			pd.put("CREATETIME", Tools.date2Str(new Date()));	//创建时间
			pd.put("MASTER_ID", "1");							//附属与
			pd.put("BZ", "测试上传");						//备注
		map.put("result", "ok");
		return AppUtil.returnObject(pd, map);
	}
	

}
