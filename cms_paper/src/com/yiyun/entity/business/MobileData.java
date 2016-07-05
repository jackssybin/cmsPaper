package com.yiyun.entity.business;

public class MobileData {
	private String articleId;//文章id
	private String title;//标题
	private String pic;//缩略图
	private String topPic;//置顶缩略图
	private String sourceTitle;//来源标题
	private String sourceLink;//来源链接
	private String commentNum;//评论数
	
	
	

	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getTopPic() {
		return topPic;
	}
	public void setTopPic(String topPic) {
		this.topPic = topPic;
	}
	public String getSourceTitle() {
		return sourceTitle;
	}
	public void setSourceTitle(String sourceTitle) {
		this.sourceTitle = sourceTitle;
	}
	public String getSourceLink() {
		return sourceLink;
	}
	public void setSourceLink(String sourceLink) {
		this.sourceLink = sourceLink;
	}
	public String getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(String commentNum) {
		this.commentNum = commentNum;
	}
}
