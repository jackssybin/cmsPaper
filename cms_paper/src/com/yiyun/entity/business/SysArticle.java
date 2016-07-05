package com.yiyun.entity.business;

public class SysArticle {
	
	private String articleId;//文章id
	private String title;//标题
	private String subtitle;//副标题
	private String shortContent;//摘要
	private String pic;//缩略图
	private String topPic;//置顶缩略图
	private String articleContent;//文章内容
	private String staticUrl;//静态链接
	private String updateDate;//更新时间
	private String editorId;//编辑人员
	private String status;//状态
	private String channelId;//栏目id
	private String channelName;//栏目id
	private String isTransfer;//是否转载
	
	private String contentExt;//内容挂架
	private String contentTags;//内容标签
	private String author;//作者
	private String attribute;//属性
	private String weight;//权重
	private String isComment;//是否可以评论
	private String contentRef;//内容相关
	private String onlineTime;//上线时间
	private String offlineTime;//下线时间
	private String sourceTitle;//来源标题
	private String sourceLink;//来源链接
	private String topType;//置顶类型
	private String refColumn1;//扩展字段1
	
	private boolean checkFlag =false;;
	
	private SysAudit sysAudit;

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
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getShortContent() {
		return shortContent;
	}
	public void setShortContent(String shortContent) {
		this.shortContent = shortContent;
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
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public String getStaticUrl() {
		return staticUrl;
	}
	public void setStaticUrl(String staticUrl) {
		this.staticUrl = staticUrl;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getEditorId() {
		return editorId;
	}
	public void setEditorId(String editorId) {
		this.editorId = editorId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getChannelId() {
		return channelId;
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	
	public String getChannelName() {
		return channelName;
	}
	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	public String getIsTransfer() {
		return isTransfer;
	}
	public void setIsTransfer(String isTransfer) {
		this.isTransfer = isTransfer;
	}
	public String getContentExt() {
		return contentExt;
	}
	public void setContentExt(String contentExt) {
		this.contentExt = contentExt;
	}
	public String getContentTags() {
		return contentTags;
	}
	public void setContentTags(String contentTags) {
		this.contentTags = contentTags;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getIsComment() {
		return isComment;
	}
	public void setIsComment(String isComment) {
		this.isComment = isComment;
	}
	public String getContentRef() {
		return contentRef;
	}
	public void setContentRef(String contentRef) {
		this.contentRef = contentRef;
	}
	public String getRefColumn1() {
		return refColumn1;
	}
	public void setRefColumn1(String refColumn1) {
		this.refColumn1 = refColumn1;
	}
	public String getOnlineTime() {
		return onlineTime;
	}
	public void setOnlineTime(String onlineTime) {
		this.onlineTime = onlineTime;
	}
	public String getOfflineTime() {
		return offlineTime;
	}
	public void setOfflineTime(String offlineTime) {
		this.offlineTime = offlineTime;
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
	public String getTopType() {
		return topType;
	}
	public void setTopType(String topType) {
		this.topType = topType;
	}
	public SysAudit getSysAudit() {
		return sysAudit;
	}
	public void setSysAudit(SysAudit sysAudit) {
		this.sysAudit = sysAudit;
	}
	public boolean isCheckFlag() {
		return checkFlag;
	}
	public void setCheckFlag(boolean checkFlag) {
		this.checkFlag = checkFlag;
	}
	
}
