
package com.yiyun.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.druid.util.StringUtils;
import com.yiyun.controller.base.BaseController;
import com.yiyun.dao.DaoSupport;
import com.yiyun.util.FileDownload;
import com.yiyun.util.FileUtil;
import com.yiyun.util.FileZip;
import com.yiyun.util.Freemarker;
import com.yiyun.util.PageData;
import com.yiyun.util.PathUtil;

/** 
 * 类名称：FreemarkerController
 */
@Controller
@RequestMapping(value="/createCode")
public class CreateCodeController extends BaseController {
	
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	/**
	 * 生成代码
	 * mysql中获取对应表的字段信息
	 * 
	 * select table_schema,table_name,column_name,is_nullable,data_type from 
	 * information_schema.columns where table_schema ='cmsbook' and table_name='sys_user';
	 * 
	 * var dname = $("#dname").val(); 	 		 //属性名
		var dtype = $("#dtype").val(); 	 		 //类型
		var dbz	  = $("#dbz").val();   	 		 //备注
		var isQian = $("#isQian").val(); 		 //是否前台录入
		var ddefault = $("#ddefault").val(); 	 //默认值
		var msgIndex = $("#msgIndex").val(); 	 //msgIndex不为空时是修改
		dbz = dbz == '' ? '无':dbz;
		var fields = dname//属性名 + ',' + dtype//类型 + ',' + dbz//备注 + ',' + isQian//是否前台录入 + ',' + ddefault//默认值;
	 * 
	 */
	@RequestMapping(value="/proCode")
	public void proCode(HttpServletResponse response) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		/* ============================================================================================= */
		String packageName = pd.getString("packageName");  			//包名				========1
		String objectName = pd.getString("objectName");	   			//类名				========2
		String tabletop = pd.getString("tabletop");	   				//表前缀				========3
		String logMenu = pd.getString("logMenu");	   				//表前缀				========3
		tabletop = null == tabletop?"":tabletop.toUpperCase();		//表前缀转大写
		String zindext = pd.getString("zindex");	   	   			//属性总数
		String primaryIndexId = pd.getString("primaryIndexId");	   	   			//主键id
		int zindex = 0;
		if(null != zindext && !"".equals(zindext)){
			zindex = Integer.parseInt(zindext);
		}
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========4
		for(int i=0; i< zindex; i++){
			fieldList.add(pd.getString("field"+i).split(","));	//属性放到集合里面
		}
		
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("packageName", packageName);						//包名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("tabletop", tabletop);								//表前缀	
		root.put("nowDate", new Date());							//当前日期
		root.put("logMenu", logMenu);								//菜单名称
		root.put("primaryIndexId", primaryIndexId);					//自定义主键
		
		exportTemplate(response, packageName, objectName, tabletop, root);
		
	}

	private void exportTemplate(HttpServletResponse response, String packageName, String objectName, String tabletop,
			Map<String, Object> root) throws Exception {
		FileUtil.delFolder(PathUtil.getClasspath()+"admin/ftl"); //生成代码前,先清空之前生成的代码
		/* ============================================================================================= */
		
		String filePath = "admin/ftl/code/";						//存放路径
		String ftlPath = "createCode";								//ftl路径
		
		/*生成controller*/
		Freemarker.printFile("controllerTemplate.ftl", root, "controller/"+packageName+"/"+objectName+"Controller.java", filePath, ftlPath);
		
		/*生成service*/
		Freemarker.printFile("serviceTemplate.ftl", root, "service/"+packageName+"/"+objectName+"Service.java", filePath, ftlPath);

		/*生成mybatis xml*/
		Freemarker.printFile("mapperMysqlTemplate.ftl", root, "mybatis_mysql/"+packageName+"/"+objectName+"Mapper.xml", filePath, ftlPath);
		
		/*生成jsp页面*/
		Freemarker.printFile("jsp_list_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_list.jsp", filePath, ftlPath);
		Freemarker.printFile("jsp_edit_Template.ftl", root, "jsp/"+packageName+"/"+objectName.toLowerCase()+"/"+objectName.toLowerCase()+"_edit.jsp", filePath, ftlPath);
		
		//this.print("jsp_list_Template.ftl", root);  控制台打印
		/*生成的全部代码压缩成zip文件*/
		FileZip.zip(PathUtil.getClasspath()+"admin/ftl/code", PathUtil.getClasspath()+"admin/ftl/gen"+objectName.toLowerCase()+"Code.zip");
		
		/*下载代码*/
		FileDownload.fileDownload(response, PathUtil.getClasspath()+"admin/ftl/gen"+objectName.toLowerCase()+"Code.zip", "gen"+objectName.toLowerCase()+"Code.zip");
	}
	
	
	@RequestMapping(value="/genCode")
	public void genCode(HttpServletResponse response) throws Exception{
		String sql ="ParamMapper.findTableParamsList";
		List list =(List) dao.findForList(sql, "sys_article");
		String autoGenFlag ="ARTICLE_ID";
//		SYS_FAVORITE
		String packageName = "business";  			//包名				========1
//		String packageName = "system";  			//包名				========1
		String objectName = "Article";	   			//类名				========2
		String logMenu = "文章内容信息表";	   			//类名				========2
		String tabletop = "SYS_";	   				//表前缀				========3
		int zindex = 0;							//属性总数
		List<String[]> fieldList = new ArrayList<String[]>();   	//属性集合			========4
//		for(int i=0; i< zindex; i++){
//			fieldList.add(pd.getString("field"+i).split(","));	//属性放到集合里面
//		}
		for(int i=0;i<list.size();i++){
			PageData pd=(PageData)list.get(i);
			fieldList.add(getDetail(pd,autoGenFlag));	//属性放到集合里面
		}
		Map<String,Object> root = new HashMap<String,Object>();		//创建数据模型
		root.put("fieldList", fieldList);
		root.put("autoGenFlag", autoGenFlag);
		root.put("packageName", packageName);						//包名
		root.put("objectName", objectName);							//类名
		root.put("objectNameLower", objectName.toLowerCase());		//类名(全小写)
		root.put("objectNameUpper", objectName.toUpperCase());		//类名(全大写)
		root.put("tabletop", tabletop);								//表前缀	
		root.put("nowDate", new Date());							//当前日期
		root.put("logMenu", logMenu);							//当前日期
		exportTemplate(response, packageName, objectName, tabletop, root);
	}
	
	
	/**
	 * 0是 属性名
1是 类型
2是 中文
3是 是否前台录入
4是 备注
5是 最大值
	 * String  Integer Date
	 * @param pg
	 * @return
	 */
//	var fields = dname//属性名 + ',' + dtype//类型 + ',' + dbz//备注 + ',' + isQian//是否前台录入 + ',' + ddefault//默认值;
	public static String[] getDetail(PageData pg,String autoGenFlag){
		String[] strs= new String[6];
		String data_type=pg.getString("data_type");
		if("varchar".equals(data_type)||"char".equals(data_type)){
			data_type="String";
		}
		if("int".equals(data_type)){
			data_type="Integer";
		}
		strs[0]=pg.getString("column_name");//属性名
		strs[1]=data_type;//类型
		strs[2]=StringUtils.isEmpty(pg.getString("column_comment"))?pg.getString("column_name"):pg.getString("column_comment");//备注
		if(!"".equals(autoGenFlag)){
			if(autoGenFlag.equalsIgnoreCase(strs[0])){
				strs[3]="否";
			}else{
				strs[3]="是";
			}
		}else{
			strs[3]=((strs[0].indexOf("_id")!=-1)||(strs[0].indexOf("_ID")!=-1))?"否":"是";
		}
		strs[4]=pg.getString("column_name");
		strs[5]=String.valueOf(pg.get("character_maximum_length"));
		return strs;
	}
	
	
	public static void main(String[] args) {
		
		
		
	}
	
}
