package com.yiyun.service.business;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.yiyun.controller.system.tools.YiYunCacheManager;
import com.yiyun.dao.DaoSupport;
import com.yiyun.entity.business.SysArticle;
import com.yiyun.entity.system.Page;
import com.yiyun.util.PageData;


@Service("articleService")
public class ArticleService {
	
	@Resource(name="yiYunCacheManager")
	private YiYunCacheManager yiYunCacheManager;

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("ArticleMapper.save", pd);
	}
	
	public void saveAuditMsg(PageData pd)throws Exception{
		dao.save("ArticleMapper.saveAuditMsg", pd);
	}

	
	
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("ArticleMapper.delete", pd);
	}
	
	public void deleteArticleChannel(PageData pd)throws Exception{
		dao.delete("ArticleMapper.deleteArticleChannel", pd);
	}
	
	public void batchAddArticleChannel(List list)throws Exception{
		this.dao.batchSave("ArticleMapper.batchAddArticleChannel", list);
		
	}
	
	public void addDeleteBak(PageData pd)throws Exception{
		dao.save("ArticleMapper.addDeleteBak", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("ArticleMapper.edit", pd);
	}
	public void editStatus(PageData pd)throws Exception{
		dao.update("ArticleMapper.editStatus", pd);
	}
	
	/*
	*列表
	*/
	public List<SysArticle> list(Page page)throws Exception{
		List<SysArticle> list=(List<SysArticle>)dao.findForList("ArticleMapper.datalistPage", page);
			for(SysArticle article:list){
				if(!StringUtils.isEmpty(article.getStatus())){
					article.setSysAudit(this.yiYunCacheManager.getSysAudit(article.getStatus()));
				}
			}
		return list;
	}
	
//	"auditMsglistPage"
	public List<PageData>  auditMsglistPage(Page page)throws Exception{
		List<PageData> list=(List<PageData>)dao.findForList("ArticleMapper.auditMsglistPage", page);
	return list;
	}
	
	/*
	*列表(全部)
	*/
	public List<SysArticle> listAll(PageData pd)throws Exception{
		return (List<SysArticle>)dao.findForList("ArticleMapper.listAll", pd);
	}
	
	
	public void deleteArticleRef(PageData pd)throws Exception{
		dao.delete("ArticleMapper.deleteArticleRef", pd);
	}
	
	public List<PageData> showContentRefId(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("ArticleMapper.showContentRefId", pd);
	}
	
	public void batchAddArticleRef(List list)throws Exception{
		dao.batchSave("ArticleMapper.batchAddArticleRef", list);
	}
	
	
	/*
	* 通过id获取数据
	*/
	public SysArticle findById(PageData pd)throws Exception{
		return (SysArticle)dao.findForObject("ArticleMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("ArticleMapper.deleteAll", ArrayDATA_IDS);
	}
	
	public void addDeleteAllBak(String[] ArrayDATA_IDS)throws Exception{
		dao.save("ArticleMapper.addDeleteAllBak", ArrayDATA_IDS);
	}
	
}

