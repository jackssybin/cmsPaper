DROP TABLE IF EXISTS 'sys_login_log';
CREATE TABLE
    sys_login_log
    (
        LOG_ID VARCHAR(100) NOT NULL,
        LOG_LOGIN_USER VARCHAR(255) COMMENT '登录用户',
        LOG_LAST_LOGIN_IP VARCHAR(255) COMMENT '最后登录的IP',
        LOG_LAST_LOGIN_TIME VARCHAR(255) COMMENT '最后登录的时间',
        LOG_LOGIN_RESULT CHAR(2) COMMENT '日志登录的结果',
        PRIMARY KEY (LOG_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS 'sys_buser';
	CREATE TABLE
    sys_buser
    (
        USERID VARCHAR(100) NOT NULL COMMENT '用户的唯一标识',
        OPENID VARCHAR(100) NOT NULL COMMENT '用户微信登录时需要的唯一标识',
        NICKNAME VARCHAR(255) COMMENT '用户昵称',
        HEADIMGURL VARCHAR(255) COMMENT '用户头像，最后一个数值代表正方形头像大小',
        NAME VARCHAR(255) COMMENT '用户姓名',
        SEX CHAR(1) COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
        PHONE VARCHAR(255) COMMENT '用户使用的手机号',
        QQ VARCHAR(255) COMMENT '用户使用QQ号',
        EMAIL VARCHAR(255) COMMENT '用户使用邮箱号',
        ADDRESS VARCHAR(255) COMMENT '用户地址',
        INTRODUCTION VARCHAR(255) COMMENT '用户的个人介绍',
        REGISTER_TIME VARCHAR(255) COMMENT '用户的注册时间',
        LAST_LOGIN_TIME VARCHAR(255) COMMENT '用户的最后登录时间',
        LAST_IP VARCHAR(255) COMMENT '最后登录IP',
        COMMON_IP VARCHAR(255) COMMENT '常用登录IP',
        USER_STATE CHAR(1) COMMENT '用户状态,当用户状态为N时，表示不能登录，当用户状态为Y时，表示可以登录',
        COLUMNS1 VARCHAR(255),
        COLUMNS2 VARCHAR(255),
        COLUMNS3 VARCHAR(255),
        COLUMNS4 VARCHAR(255),
        COLUMNS5 VARCHAR(255),
        COLUMNS6 VARCHAR(255),
        COLUMNS7 VARCHAR(255),
        PRIMARY KEY (USERID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
delete from sys_menu where MENU_ID IN (33,34,35,36) ;
	
INSERT INTO sys_menu (MENU_ID, MENU_NAME, MENU_URL, PARENT_ID, MENU_ORDER, MENU_ICON, MENU_TYPE, IS_SHOW) VALUES (33, '用户模块', '#', '0', '1', 'menu-icon fa fa-cog red', '2', '1');
INSERT INTO sys_menu (MENU_ID, MENU_NAME, MENU_URL, PARENT_ID, MENU_ORDER, MENU_ICON, MENU_TYPE, IS_SHOW) VALUES (34, '管理用户', 'management_user/list.do', '33', '1', null, '2', '1');
INSERT INTO sys_menu (MENU_ID, MENU_NAME, MENU_URL, PARENT_ID, MENU_ORDER, MENU_ICON, MENU_TYPE, IS_SHOW) VALUES (35, '登录日志', 'login_log/list.do', '33', '2', null, '2', '1');
INSERT INTO sys_menu (MENU_ID, MENU_NAME, MENU_URL, PARENT_ID, MENU_ORDER, MENU_ICON, MENU_TYPE, IS_SHOW) VALUES (36, '登录设置', 'login_setting/list.do', '33', '3', null, '2', '1');


DROP TABLE IF EXISTS 'sys_favorite';
CREATE TABLE
    sys_favorite
    (
        FAVORITE_ID VARCHAR(255) NOT NULL,
        USER_ID VARCHAR(255),
        ARTICAL_ID VARCHAR(255),
        CREATE_TIME VARCHAR(255),
        PRIMARY KEY (FAVORITE_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
    DROP TABLE IF EXISTS 'sys_fser';
    CREATE TABLE
    sys_fser
    (
        USER_ID VARCHAR(100) NOT NULL COMMENT '用户的唯一标识',
        OPEN_ID VARCHAR(100) NOT NULL COMMENT '用户微信登录时需要的唯一标识',
        NICK_NAME VARCHAR(255) COMMENT '用户昵称',
        HEAD_IMGURL VARCHAR(255) COMMENT '用户头像，最后一个数值代表正方形头像大小',
        NAME VARCHAR(255) COMMENT '用户姓名',
        SEX CHAR(1) COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
        PHONE VARCHAR(255) COMMENT '用户使用的手机号',
        QQ VARCHAR(255) COMMENT '用户使用QQ号',
        EMAIL VARCHAR(255) COMMENT '用户使用邮箱号',
        ADDRESS VARCHAR(255) COMMENT '用户地址',
        INTRODUCTION VARCHAR(255) COMMENT '用户的个人介绍',
        REGISTER_TIME VARCHAR(255) COMMENT '用户的注册时间',
        LAST_LOGIN_TIME VARCHAR(255) COMMENT '用户的最后登录时间',
        LAST_IP VARCHAR(255) COMMENT '最后登录IP',
        COMMON_IP VARCHAR(255) COMMENT '常用登录IP',
        USER_STATE CHAR(1) COMMENT '用户状态,当用户状态为N时，表示不能登录，当用户状态为Y时，表示可以登录',
        COLUMNS1 VARCHAR(255),
        COLUMNS2 VARCHAR(255),
        COLUMNS3 VARCHAR(255),
        COLUMNS4 VARCHAR(255),
        COLUMNS5 VARCHAR(255),
        COLUMNS6 VARCHAR(255),
        COLUMNS7 VARCHAR(255),
        PRIMARY KEY (USER_ID)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
    DROP TABLE IF EXISTS `sys_comment`;
	CREATE TABLE 
	`sys_comment` 
	(
	  `COMMENT_ID` varchar(100) NOT NULL,
	  `PRO_ID` varchar(255) DEFAULT NULL COMMENT '所属商品id',
	  `BELONG_USER` varchar(255) DEFAULT NULL COMMENT '所属用户',
	  `COMMENT_REFID` varchar(255) DEFAULT NULL COMMENT '引用评论id',
	  `COMMENT_CONTENT` varchar(255) DEFAULT NULL COMMENT '评论内容',
	  `COMMENT_TIME` varchar(255) DEFAULT NULL COMMENT '评论时间',
	  `COMMENT_STATUS` varchar(255) DEFAULT NULL COMMENT '评论状态',
	  `COMMENT_GOOD` varchar(255) DEFAULT NULL COMMENT '点赞次数',
	  `COMMENT_BAD` varchar(255) DEFAULT NULL COMMENT '点差次数',
	  `COMMENT_TOP` varchar(100) DEFAULT NULL COMMENT '置顶序号',
	  `COMMENT_TOPTIME` varchar(100) DEFAULT NULL COMMENT '置顶时间',
	  `ORDER_NUM` varchar(255) DEFAULT NULL COMMENT '序号',
 	   PRIMARY KEY (`COMMENT_ID`)
	) 
	ENGINE=InnoDB DEFAULT CHARSET=utf8;
	update sys_menu SET MENU_TYPE = 1 WHERE MENU_ID >= 33 AND MENU_ID <=38;
	delete from sys_menu where menu_id in (42,43);
	INSERT INTO sys_menu(MENU_ID,MENU_NAME,MENU_URL,PARENT_ID,MENU_ORDER,MENU_TYPE,IS_SHOW) VALUES(42,'用户评论','comment/list.do',33,6,1,1);
	INSERT INTO sys_menu(MENU_ID,MENU_NAME,MENU_URL,PARENT_ID,MENU_ORDER,MENU_TYPE,IS_SHOW) VALUES(43,'栏目树管理','channel/frame.do',41,1,1,1);	
	ALTER TABLE sys_channel ADD (channel_workflow VARCHAR(255),parent_id VARCHAR(100));
	
	
  DROP TABLE IF EXISTS `sys_article`;

  CREATE TABLE
    sys_article
    (
        article_id VARCHAR(100) NOT NULL,
        title VARCHAR(100) COMMENT '标题',
        subtitle VARCHAR(100) COMMENT '副标题',
        short_content longtext COMMENT '摘要',
        pic VARCHAR(200) COMMENT '缩略图',
        top_pic VARCHAR(200) COMMENT '置顶缩略图',
        article_content longtext COMMENT '文章内容',
        static_url VARCHAR(200) COMMENT '静态链接',
        update_date VARCHAR(20) COMMENT '更新时间',
        is_transfer CHAR(1) COMMENT '是否转载',
        editor_id VARCHAR(20) COMMENT '编辑人员',
        status VARCHAR(20) COMMENT '状态',
        channel_id VARCHAR(100) COMMENT '栏目',
        content_ext VARCHAR(200) COMMENT '内容挂架',
        content_tags VARCHAR(200) COMMENT '内容标签',
        author VARCHAR(200) COMMENT '作者',
        attribute VARCHAR(200) COMMENT '属性',
        weight VARCHAR(100) COMMENT '权重',
        is_comment CHAR(1) COMMENT '是否可以评论',
        content_ref VARCHAR(200) COMMENT '内容相关',
       	online_time VARCHAR(20) COMMENT '上线时间',
        offline_time VARCHAR(20) COMMENT '下线时间',
        source_title VARCHAR(200) COMMENT '来源标题',
        source_link VARCHAR(200) COMMENT '来源链接',
        ref_column1 VARCHAR(100) COMMENT '扩展字段1',
        ref_column2 VARCHAR(100) COMMENT '扩展字段2',
        PRIMARY KEY (article_id),
        INDEX sys_article_index1 (update_date),
        INDEX sys_article_index2 (editor_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容表';
	
    
    	
  DROP TABLE IF EXISTS `sys_number_gen`;
    CREATE TABLE
    sys_number_gen
    (
        CUR_DATE VARCHAR(100) NOT NULL,
        CUR_TIME VARCHAR(255) NOT NULL,
        CUR_SEQ VARCHAR(255) NOT NULL,
        CUR_TYPE VARCHAR(255),
        PRIMARY KEY (CUR_DATE, CUR_TIME)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
     DROP TABLE IF EXISTS `sys_audit`;
    CREATE TABLE
    sys_audit
    (
        cur_status VARCHAR(10)  comment '当前状态',
        next_status VARCHAR(10) comment '下一状态',
        prev_status VARCHAR(10) comment '上一状态'
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
      DROP TABLE IF EXISTS `sys_audit_msg`;
    CREATE TABLE
    sys_audit_msg
    (
        msg_id VARCHAR(20) NOT NULL,
        audit_user VARCHAR(20) comment  '审核人',
        audit_time VARCHAR(200) comment '审核时间',
        cur_status VARCHAR(20) comment '当前状态',
        audit_status VARCHAR(20) comment '审核之后的状态'
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
	delete from sys_param where param_id between '200001' and '200008';
    INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200001', 'draft', '草稿', '1', 'oper_type', '内容审核流程', '1');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200002', 'un_audit', '待审核', '2', 'oper_type', '内容审核流程', '2');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200003', 'un_pass', '未通过', '3', 'oper_type', '内容审核流程', '3');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200004', 'pass', '通过', '4', 'oper_type', '内容审核流程', '4');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200005', 'un_publish', '未发布', '5', 'oper_type', '内容审核流程', '5');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200006', 'publish', '已发布', '6', 'oper_type', '内容审核流程', '6');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200007', 'cancel', '已撤销', '7', 'oper_type', '内容审核流程', '7');
	INSERT INTO sys_param (PARAM_ID, PARAM_CODE, PARAM_NAME, PARAM_VALUE, PARAM_TYPE, PARAM_DESC, PARAM_ORDER) VALUES ('200008', 're_draft', '退稿', '8', 'oper_type', '内容审核流程', '8');

    
	delete from sys_menu where menu_id in (44,45,46);
	INSERT INTO sys_menu(MENU_ID,MENU_NAME,MENU_URL,PARENT_ID,MENU_ORDER,MENU_TYPE,IS_SHOW) VALUES(44,'栏目内容管理','channel/list.do',41,2,1,1);
	INSERT INTO sys_menu(MENU_ID,MENU_NAME,MENU_URL,PARENT_ID,MENU_ORDER,MENU_TYPE,IS_SHOW) VALUES(45,'部门管理','#',0,5,1,1);
	INSERT INTO sys_menu(MENU_ID,MENU_NAME,MENU_URL,PARENT_ID,MENU_ORDER,MENU_TYPE,IS_SHOW) VALUES(46,'部门内容管理','department/list.do',45,2,1,1);
	
	DROP TABLE IF EXISTS `sys_department`;
	CREATE TABLE `sys_department` (
  	 `department_id` varchar(100) NOT NULL COMMENT '部门ID',
  	 `department_name` varchar(255) DEFAULT NULL COMMENT '部门名称',
 	 `parent_id` varchar(100) DEFAULT NULL COMMENT '上级部门',
  	 `role_list` varchar(255) DEFAULT NULL COMMENT '所属角色列表',
  	 `department_manager` varchar(255) DEFAULT NULL COMMENT '主管角色',
 	 `order_by` varchar(4) DEFAULT NULL COMMENT '顺序'
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	alter TABLE sys_channel MODIFY COLUMN  order_no VARCHAR(4);
	
	DROP TABLE IF EXISTS `sys_channel_user`;
	CREATE TABLE `sys_channel_user` (
   `channel_id` varchar(100) NOT NULL,
   `user_id` varchar(100) DEFAULT NULL
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

   DROP TABLE IF EXISTS `sys_department_user`;
	CREATE TABLE `sys_department_user` (
   `department_id` varchar(100) NOT NULL,
   `user_id` varchar(100) NOT NULL,
   PRIMARY KEY (`user_id`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;