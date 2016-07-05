-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.10-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cms_news
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ cms_news;
USE cms_news;

--
-- Table structure for table `cms_news`.`sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `LOG_ID` varchar(100) NOT NULL,
  `LOG_USER` varchar(255) DEFAULT NULL COMMENT '操作用户',
  `LOG_TIME` varchar(255) DEFAULT NULL COMMENT '操作时间',
  `LOG_CONTENT` varchar(1000) DEFAULT NULL COMMENT '日志内容',
  `LOG_MENU` varchar(255) DEFAULT NULL COMMENT '日志菜单',
  `LOG_STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_log`
--

/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`LOG_ID`,`LOG_USER`,`LOG_TIME`,`LOG_CONTENT`,`LOG_MENU`,`LOG_STATUS`) VALUES 
 ('05e657b3b4454984b20d3d94ee1d5e17','admin','2016-06-01 17:50:03','成功','首页','1'),
 ('10b93f79b7784d2c82fa6ff3fe549427','admin','2016-06-12 10:49:29','列表Log','日志管理','1'),
 ('1ad3fd018c964dd9aee6fb553e3a53dd','admin','2016-06-01 17:52:31','列表Param','参数管理','1'),
 ('228e323a503d47beb8f8f27f21c44f58','admin','2016-06-01 17:52:44','去新增Pictures页面','图片管理','1'),
 ('31a8f9593571428dac2ca38946dfce0a','admin','2016-06-06 10:21:31','成功','首页','1'),
 ('582c7f61efc041c2a543e78a39ade7e8','admin','2016-06-06 09:38:31','成功','首页','1'),
 ('73fe5d13133944eda8572b8dfb8b62bf','admin','2016-06-01 17:53:00','新增Pictures','图片管理','1'),
 ('7b379ec3a85c4313a3a4ca85e28d5be3','admin','2016-06-06 09:38:03','成功','首页','1'),
 ('81bdfad67fc44079a9ff3d6eb3593625','admin','2016-06-01 17:53:00','新增Pictures','图片管理','1'),
 ('8bbf43f8ba6348ec981320bbccf4fcab','admin','2016-06-01 17:52:23','列表Param','参数管理','1'),
 ('93ead43dc01543a98a8836701e671bf4','admin','2016-06-06 10:20:58','成功','首页','1');
INSERT INTO `sys_log` (`LOG_ID`,`LOG_USER`,`LOG_TIME`,`LOG_CONTENT`,`LOG_MENU`,`LOG_STATUS`) VALUES 
 ('9ed0991aedd94cec8f5c41f63c624b44','admin','2016-06-12 10:49:28','列表Param','参数管理','1'),
 ('9f373774f05b4f6896f368c4491b48fb','admin','2016-06-01 17:52:30','删除Param','参数管理','1'),
 ('acdbe1caa02d4887b402f0232a6d63eb','admin','2016-06-01 17:53:03','列表Pictures','图片管理','1'),
 ('afef622b5fef448badb027613a42f3b3','admin','2016-06-01 17:52:42','列表Pictures','图片管理','1'),
 ('b7706ff3ffb745f68b3bbbb20b19f466','admin','2016-06-12 10:12:06','成功','首页','1'),
 ('b928ea960e8a4ebc86b2aa78b44e7ebb','admin','2016-06-12 10:12:55','列表Log','日志管理','1'),
 ('ba2b8bded8de4e02bbffd56a87d265bd','admin','2016-06-01 17:50:48','成功','首页','1'),
 ('bb85d9fd562d44e7b12a193eb69624f7','admin','2016-06-06 10:21:17','成功','首页','1'),
 ('cf510a5445374c4caf7c13489883905c','admin','2016-06-01 17:52:34','列表Log','日志管理','1'),
 ('d0f750c13e23431c8db24ae6e7c17bbf','admin','2016-06-01 17:53:00','新增Pictures','图片管理','1'),
 ('d60c9c1c4fa24db8b15fdd753019413d','admin','2016-06-01 17:49:25','成功','首页','1');
INSERT INTO `sys_log` (`LOG_ID`,`LOG_USER`,`LOG_TIME`,`LOG_CONTENT`,`LOG_MENU`,`LOG_STATUS`) VALUES 
 ('dedb52f18f8b463f979f506b8ff76642','admin','2016-06-06 10:19:59','成功','首页','1'),
 ('e40191bc7e00454ea773f8d131c25102','admin','2016-06-06 09:38:51','列表Param','参数管理','1'),
 ('e51f8a8b9ab2405884eab9709b5991e3','admin','2016-06-06 09:38:36','列表Param','参数管理','1'),
 ('f47f9ca4a13c40559d19acef7a272827','admin','2016-06-12 10:12:44','成功','首页','1'),
 ('f7e528986d8d48368fc2c8c417c3781b','admin','2016-06-12 10:12:48','列表Param','参数管理','1');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;


--
-- Table structure for table `cms_news`.`sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `IS_SHOW` char(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_menu`
--

/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`MENU_ID`,`MENU_NAME`,`MENU_URL`,`PARENT_ID`,`MENU_ORDER`,`MENU_ICON`,`MENU_TYPE`,`IS_SHOW`) VALUES 
 (1,'系统管理','#','0','1','menu-icon fa fa-adjust black','1','1'),
 (2,'系统工具','#','0','2','menu-icon fa fa-bolt black','1','1'),
 (11,'角色管理','role.do','1','2','menu-icon fa fa-gift black','1','1'),
 (12,'系统用户','user/listUsers.do','1','3','menu-icon fa fa-glass black','1','1'),
 (13,'栏目管理','menu/list.do','1','4','menu-icon fa fa-globe black','1','1'),
 (21,'接口测试','tool/interfaceTest.do','2','1',NULL,'1','1'),
 (22,'视频测试','video/testplay.do','2','2',NULL,'1','1'),
 (24,'系统参数','param/list.do','1','4','menu-icon fa fa-users black','1','1'),
 (28,'图片管理','pictures/list.do','2','3',NULL,'1','1'),
 (30,'系统操作日志','log/list.do','1','5','menu-icon fa fa-hdd-o black','1','1'),
 (31,'22','1122','2','22',NULL,'1','1');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;


--
-- Table structure for table `cms_news`.`sys_param`
--

DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `PARAM_ID` varchar(100) NOT NULL,
  `PARAM_CODE` varchar(255) DEFAULT NULL COMMENT '参数code',
  `PARAM_NAME` varchar(255) DEFAULT NULL COMMENT '参数名字',
  `PARAM_VALUE` varchar(255) DEFAULT NULL COMMENT '参数值',
  `PARAM_TYPE` varchar(255) DEFAULT NULL COMMENT '参数类型',
  `PARAM_DESC` varchar(255) DEFAULT NULL COMMENT '参数描述',
  `PARAM_ORDER` varchar(255) DEFAULT NULL COMMENT '参数顺序',
  PRIMARY KEY (`PARAM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_param`
--

/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
INSERT INTO `sys_param` (`PARAM_ID`,`PARAM_CODE`,`PARAM_NAME`,`PARAM_VALUE`,`PARAM_TYPE`,`PARAM_DESC`,`PARAM_ORDER`) VALUES 
 ('100002','sys_epub_path','系统epub上传地址','epub','system','系统图片上传地址','2'),
 ('100003','sys_image_path','系统图片上传地址','images','system','系统图片上传地址','3'),
 ('100004','sys_page','每页条数','10','system','系统默认情况的每页条数','1'),
 ('100005','sys_image_real_path','图片服务器实际地址','D:/resourcesfile','system','图片服务器实际地址（服务器的实际地址路劲）','5');
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;


--
-- Table structure for table `cms_news`.`sys_pictures`
--

DROP TABLE IF EXISTS `sys_pictures`;
CREATE TABLE `sys_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_pictures`
--

/*!40000 ALTER TABLE `sys_pictures` DISABLE KEYS */;
INSERT INTO `sys_pictures` (`PICTURES_ID`,`TITLE`,`NAME`,`PATH`,`CREATETIME`,`MASTER_ID`,`BZ`) VALUES 
 ('57feff1519844cf7939cbf05ae1bd371','图片','57feff1519844cf7939cbf05ae1bd371948589.jpg','20160601/57feff1519844cf7939cbf05ae1bd371948589.jpg','2016-06-01 17:53:00','1','测试上传'),
 ('61bc3e0eb0664dea923b1f5115d130f4','图片','61bc3e0eb0664dea923b1f5115d130f4200866.jpg','20160601/61bc3e0eb0664dea923b1f5115d130f4200866.jpg','2016-06-01 17:53:00','1','测试上传'),
 ('6c54bb9aef0d44f9a6571ab836d3971f','图片','6c54bb9aef0d44f9a6571ab836d3971f501615.png','20160601/6c54bb9aef0d44f9a6571ab836d3971f501615.png','2016-06-01 17:53:00','1','测试上传');
/*!40000 ALTER TABLE `sys_pictures` ENABLE KEYS */;


--
-- Table structure for table `cms_news`.`sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_role`
--

/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`ROLE_ID`,`ROLE_NAME`,`RIGHTS`,`PARENT_ID`,`ADD_QX`,`DEL_QX`,`EDIT_QX`,`CHA_QX`,`QX_ID`) VALUES 
 ('1','系统管理员1','14694406','0','1','1','1','1','1'),
 ('2','超级管理员','2361180991826908166150','1','1048822','50','34','54','2'),
 ('81f9725251ee4d85a53e054b4445256e','微信通用角色','1353079487107193372672','1','0','0','0','0','81f9725251ee4d85a53e054b4445256e');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


--
-- Table structure for table `cms_news`.`sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL COMMENT '唯一id',
  `USERNAME` varchar(255) DEFAULT NULL COMMENT '用户登录id',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '密码',
  `NAME` varchar(255) DEFAULT NULL COMMENT '显示名称',
  `RIGHTS` varchar(255) DEFAULT NULL COMMENT '权限',
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '角色id',
  `LAST_LOGIN` varchar(255) DEFAULT NULL COMMENT '最近一次登录时间',
  `IP` varchar(100) DEFAULT NULL COMMENT '最近一次登录ip',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '扩展字段',
  `SKIN` varchar(100) DEFAULT NULL COMMENT '扩展字段（皮肤）',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '邮件',
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '编号',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '手机',
  `HEAD_IMG` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `OPENID` varchar(100) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `SIGNATURE` varchar(255) DEFAULT NULL,
  `INVITE_CODE` varchar(255) DEFAULT NULL,
  `INVITE_USER` varchar(255) DEFAULT NULL,
  `IS_READ` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_news`.`sys_user`
--

/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`USER_ID`,`USERNAME`,`PASSWORD`,`NAME`,`RIGHTS`,`ROLE_ID`,`LAST_LOGIN`,`IP`,`STATUS`,`BZ`,`SKIN`,`EMAIL`,`NUMBER`,`PHONE`,`HEAD_IMG`,`OPENID`,`SEX`,`SIGNATURE`,`INVITE_CODE`,`INVITE_USER`,`IS_READ`) VALUES 
 ('1','admin','de41b7fb99201d8334c23c014db35ecd92df81bc','admin管理员','1133671055321055258374707980945218933803269864762743594642571294','2','2016-06-12 10:12:44','0:0:0:0:0:0:0:1','0','最高统治者','undefined','admin@main.com','001','15563009680_479900','userInfo\\o5pDLwg2CkwLIbQ-DcvCT0XsHCr4.png',NULL,'man','xssssss111','YQadminLMVE1234',NULL,'1'),
 ('31b435cc02fd4705828cd0e9d3fdfac3','zhoubin','a787c5b4991082b28f8ecd60b698062834b1a374','zhoubin','','2','','','0','zhoubin','default','zhoubin@ecloudtime.com','zhoubin','15910039876',NULL,NULL,NULL,NULL,'YQzhoubinLAFY5717',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
