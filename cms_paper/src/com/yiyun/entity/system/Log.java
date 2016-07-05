package com.yiyun.entity.system;

public class Log {
	
	
	/*DROP TABLE IF EXISTS `SYS_LOG`;
CREATE TABLE `SYS_LOG` (
 		`LOG_ID` varchar(100) NOT NULL,
		`LOG_USER` varchar(255) DEFAULT NULL COMMENT '操作用户',
		`LOG_TIME` varchar(255) DEFAULT NULL COMMENT '操作时间',
		`LOG_TYPE` varchar(255) DEFAULT NULL COMMENT '日志类型',
		`LOG_CONTENT` varchar(255) DEFAULT NULL COMMENT '日志内容',
		`LOG_MENU` varchar(255) DEFAULT NULL COMMENT '日志菜单',
  		PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
	private String logId;//
	private String logUser;//操作用户
	private String logTime;//操作时间
	private String logType;//操作类型
	private String logContent;//操作内容
	private String logMenu;//操作菜单
	private String logStatus;
	
	public String getLogStatus() {
		return logStatus;
	}
	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getLogUser() {
		return logUser;
	}
	public void setLogUser(String logUser) {
		this.logUser = logUser;
	}
	public String getLogTime() {
		return logTime;
	}
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public String getLogContent() {
		return logContent;
	}
	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}
	public String getLogMenu() {
		return logMenu;
	}
	public void setLogMenu(String logMenu) {
		this.logMenu = logMenu;
	}
	@Override
	public String toString() {
		return "Log [logUser=" + logUser + ", logTime=" + logTime + ", logType=" + logType + ", logContent="
				+ logContent + ", logMenu=" + logMenu + "]";
	}
	
}
