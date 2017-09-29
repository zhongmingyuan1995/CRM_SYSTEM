/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.28 : Database - crm_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm_system`;

/*Table structure for table `assort` */

DROP TABLE IF EXISTS `assort`;

CREATE TABLE `assort` (
  `atv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `atv_cust_no` char(17) DEFAULT NULL COMMENT '客户编号(cst_customer表cust_no)',
  `atv_date` datetime DEFAULT NULL COMMENT '时间',
  `atv_place` varchar(200) NOT NULL COMMENT '地点',
  `atv_title` varchar(500) NOT NULL COMMENT '概要',
  `atv_desc` varchar(2000) NOT NULL COMMENT '描述',
  PRIMARY KEY (`atv_id`),
  KEY `atv_cust_no` (`atv_cust_no`),
  CONSTRAINT `assort_ibfk_1` FOREIGN KEY (`atv_cust_no`) REFERENCES `customer` (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `assort` */

/*Table structure for table `bas_dict` */

DROP TABLE IF EXISTS `bas_dict`;

CREATE TABLE `bas_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `dict_type` varchar(50) NOT NULL COMMENT '数据字典类别',
  `dict_item` varchar(50) NOT NULL COMMENT '数据字典条目',
  `dict_value` varchar(50) NOT NULL COMMENT '数据字典数据（所要得到的值）',
  `dict_is_editable` bit(1) NOT NULL COMMENT '是否可以添加（1、是。0、否。）',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bas_dict` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cust_no` char(17) NOT NULL COMMENT '客户编号(主键)',
  `cust_name` varchar(100) NOT NULL COMMENT '客户姓名（公司名称）',
  `cust_region` varchar(50) DEFAULT NULL COMMENT '客户地区',
  `cust_manager_id` bigint(20) DEFAULT NULL COMMENT '客户经理编号',
  `cust_manager_name` varchar(50) DEFAULT NULL COMMENT '客户经理姓名',
  `cust_level` int(11) DEFAULT NULL COMMENT '客户等级（数字）',
  `cust_level_label` varchar(50) DEFAULT NULL COMMENT '客户等级（等级描述）',
  `cust_satisfy` int(11) DEFAULT NULL COMMENT '客户满意度',
  `cust_credit` int(11) DEFAULT NULL COMMENT '客户信用度',
  `cust_addr` varchar(300) DEFAULT NULL COMMENT '客户地址',
  `cust_zip` char(10) DEFAULT NULL COMMENT '客户邮政编码',
  `cust_tel` varchar(50) DEFAULT NULL COMMENT '客户电话',
  `cust_fax` varchar(50) DEFAULT NULL COMMENT '客户传真',
  `cust_website` varchar(50) DEFAULT NULL COMMENT '客户网址',
  `cust_licence_no` varchar(50) DEFAULT NULL COMMENT '营业执照注册号',
  `cust_chieftain` varchar(50) DEFAULT NULL COMMENT '法人',
  `cust_bankroll` bigint(20) DEFAULT NULL COMMENT '注册资金',
  `cust_turnover` bigint(20) DEFAULT NULL COMMENT '年营业额',
  `cust_bank` varchar(200) DEFAULT NULL COMMENT '开户银行',
  `cust_bank_account` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `cust_local_tax_no` varchar(50) DEFAULT NULL COMMENT '地税登记号',
  `cust_national_tax_no` varchar(50) DEFAULT NULL COMMENT '国税登记号',
  `cust_status` char(1) DEFAULT NULL COMMENT '客户状态',
  PRIMARY KEY (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

/*Table structure for table `linkman` */

DROP TABLE IF EXISTS `linkman`;

CREATE TABLE `linkman` (
  `lkm_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(联系人编号)系统自动生成(标识列、主键)',
  `lkm_cust_no` char(17) NOT NULL COMMENT '客户编号(cst_customer表cust_no)',
  `lkm_name` varchar(50) NOT NULL COMMENT '联系人姓名',
  `lkm_sex` varchar(50) DEFAULT NULL COMMENT '联系人性别',
  `lkm_postion` varchar(50) DEFAULT NULL COMMENT '联系人职位',
  `lkm_tel` varchar(50) NOT NULL COMMENT '办公电话',
  `lkm_mobile` varchar(50) DEFAULT NULL COMMENT '联系人手机',
  `lkm_memo` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`lkm_id`),
  KEY `lkm_cust_no` (`lkm_cust_no`),
  CONSTRAINT `linkman_ibfk_1` FOREIGN KEY (`lkm_cust_no`) REFERENCES `customer` (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `linkman` */

/*Table structure for table `lost` */

DROP TABLE IF EXISTS `lost`;

CREATE TABLE `lost` (
  `lst_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(流失客户编号)系统自动生成(标识列、主键)',
  `lst_cust_no` char(17) NOT NULL COMMENT '客户编号(cst_customer表cust_no)',
  `lst_cust_manager_id` bigint(20) NOT NULL COMMENT '使用者编号',
  `lst_cust_manager_name` varchar(50) NOT NULL COMMENT '使用者',
  `lst_last_order_date` datetime DEFAULT NULL COMMENT '上次下单时间',
  `lst_lost_date` datetime DEFAULT NULL COMMENT '确认流失时间',
  `lst_delay` varchar(4000) DEFAULT NULL COMMENT '暂缓措施',
  `lst_reason` varchar(2000) DEFAULT NULL COMMENT '流失原因',
  `lst_status` varchar(10) NOT NULL COMMENT '状态（暂缓流失、确认流失）',
  PRIMARY KEY (`lst_id`),
  KEY `lst_cust_no` (`lst_cust_no`),
  CONSTRAINT `lost_ibfk_1` FOREIGN KEY (`lst_cust_no`) REFERENCES `customer` (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lost` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `odr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(订单编号)系统自动生成(标识列、主键)',
  `odr_cust_no` char(17) NOT NULL COMMENT '客户编号(cst_customer表cust_no)',
  `odr_date` datetime NOT NULL COMMENT '订单时间',
  `odr_addr` varchar(200) DEFAULT NULL COMMENT '订单所在地址',
  `odr_status` char(1) NOT NULL COMMENT '订单状态（是否回款0、未回款。1、已回款）',
  PRIMARY KEY (`odr_id`),
  KEY `odr_cust_no` (`odr_cust_no`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`odr_cust_no`) REFERENCES `customer` (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `odd_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `odd_order_id` bigint(20) NOT NULL COMMENT '订单编号（cst_order表odr_id）',
  `odd_prod_id` bigint(20) NOT NULL COMMENT '产品编号（pro_product表prod_id）',
  `odd_count` int(11) NOT NULL COMMENT '数量',
  `odd_unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `odd_price` double DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`odd_id`),
  KEY `odd_order_id` (`odd_order_id`),
  KEY `odd_prod_id` (`odd_prod_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`odd_order_id`) REFERENCES `order` (`odr_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`odd_prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

/*Table structure for table `plan` */

DROP TABLE IF EXISTS `plan`;

CREATE TABLE `plan` (
  `pla_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `pla_chc_id` bigint(20) NOT NULL COMMENT '机会编号（外键sys_chance表chc_id）',
  `pla_date` varchar(50) NOT NULL COMMENT '计划时间',
  `pla_todo` varchar(500) NOT NULL COMMENT '计划内容',
  `pla_result` varchar(500) DEFAULT NULL COMMENT '执行效果',
  PRIMARY KEY (`pla_id`),
  KEY `pla_chc_id` (`pla_chc_id`),
  CONSTRAINT `plan_ibfk_1` FOREIGN KEY (`pla_chc_id`) REFERENCES `sal_chance` (`chc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `plan` */

insert  into `plan`(`pla_id`,`pla_chc_id`,`pla_date`,`pla_todo`,`pla_result`) values (1,1,'2017-09-11','初步接触，了解客户意向。','客户有购买需求'),(2,1,'2017-09-11','推介产品。','444'),(3,2,'2017-09-11','4','666'),(10,2,'2017-09-12','9','777');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `prod_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(产品编号)系统自动生成(标识列、主键)',
  `prod_name` varchar(200) NOT NULL COMMENT '产品名称',
  `prod_type` varchar(100) NOT NULL COMMENT '产品型号',
  `prod_batch` varchar(100) DEFAULT NULL COMMENT '等级、批次',
  `prod_unit` varchar(10) DEFAULT NULL COMMENT '产品单位',
  `prod_price` double DEFAULT NULL COMMENT '产品价格',
  `prod_memo` varchar(200) DEFAULT NULL COMMENT '产品备注',
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `right` */

DROP TABLE IF EXISTS `right`;

CREATE TABLE `right` (
  `right_code` varchar(50) NOT NULL COMMENT '菜单编码(主键)',
  `right_parent_code` varchar(50) DEFAULT NULL COMMENT '父菜单编码',
  `right_type` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `right_text` varchar(50) DEFAULT NULL COMMENT '菜单文本',
  `right_url` varchar(100) DEFAULT NULL COMMENT '菜单访问路径',
  `right_tip` varchar(50) DEFAULT NULL COMMENT '菜单提示',
  PRIMARY KEY (`right_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `right` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `role_flag` int(11) DEFAULT NULL COMMENT '角色状态（1或0，1表示可用）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_desc`,`role_flag`) values (1,'系统管理员','系统管理员',1),(2,'销售主管','销售主管',1),(3,'客户经理','客户经理',1),(4,'高管','高管',1);

/*Table structure for table `role_right` */

DROP TABLE IF EXISTS `role_right`;

CREATE TABLE `role_right` (
  `rf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `rf_role_id` bigint(20) NOT NULL COMMENT '角色编号（外键sys_role表role_id）',
  `rf_right_code` varchar(50) NOT NULL COMMENT '菜单编码（外键sys_right表right_code）',
  PRIMARY KEY (`rf_id`),
  KEY `rf_role_id` (`rf_role_id`),
  KEY `rf_right_code` (`rf_right_code`),
  CONSTRAINT `role_right_ibfk_1` FOREIGN KEY (`rf_role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_right_ibfk_2` FOREIGN KEY (`rf_right_code`) REFERENCES `right` (`right_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_right` */

/*Table structure for table `sal_chance` */

DROP TABLE IF EXISTS `sal_chance`;

CREATE TABLE `sal_chance` (
  `chc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `chc_source` varchar(50) DEFAULT NULL COMMENT '机会来源',
  `chc_cust_name` varchar(100) NOT NULL COMMENT '客户名称',
  `chc_title` varchar(200) NOT NULL COMMENT '概要(对销售机会的简要描述)',
  `chc_rate` int(11) NOT NULL COMMENT '成功机率',
  `chc_linkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `chc_tel` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `chc_desc` varchar(2000) NOT NULL COMMENT '机会描述',
  `chc_create_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人编号',
  `chc_create_name` varchar(50) NOT NULL COMMENT '创建人姓名',
  `chc_create_date` varchar(20) NOT NULL COMMENT '创建时间(默认为当前系统时间)',
  `chc_due_id` bigint(20) DEFAULT NULL COMMENT '指派给的人编号',
  `chc_due_name` varchar(50) DEFAULT NULL COMMENT '指派给的人姓名',
  `chc_due_date` varchar(20) DEFAULT NULL COMMENT '指派时间',
  `chc_status` char(10) NOT NULL DEFAULT '未分配' COMMENT '销售机会状态为“已指派”、“未分配”或“已归档”。已指派或者叫开发中。已归档有两种状态：1、开发成功。2、开发失败。',
  PRIMARY KEY (`chc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sal_chance` */

insert  into `sal_chance`(`chc_id`,`chc_source`,`chc_cust_name`,`chc_title`,`chc_rate`,`chc_linkman`,`chc_tel`,`chc_desc`,`chc_create_id`,`chc_create_name`,`chc_create_date`,`chc_due_id`,`chc_due_name`,`chc_due_date`,`chc_status`) values (1,'道听途说','吕承昌','买一部华为手机',10,'钟有禄','15083523312','买一部华为手机',0,'bank','2017-09-07 18:10:06',4,'朱杰','2017-09-08 16:56:17','开发失败'),(2,'从微信和空间吸引','程锦辉','想要参加java培训',100,'高波','15083523312','想要参加java培训',0,'bank','2017-09-07 19:57:18',6,'何文胜','2017-09-08 16:58:57','已指派'),(3,'多媒体宣传','中科创达','中科创达采购云服务器意向',50,'钟有禄','15083523312','中科创达采购部人员咨询我公司云服务器信息',0,'admin','2017-09-08 09:56:00',NULL,'bank','2017-09-08 12:38:20','已指派'),(4,'熟人介绍','马磊','小马哥想买个游戏鼠标',90,'朱杰','15083523312','小马哥想买个游戏鼠标',0,'bank','2017-09-08 12:39:45',NULL,'admin','2017-09-08 13:06:39','已指派'),(5,'QQ空间推广','天猫国际王总','天猫国际信息化建设部搭建中心机房意向',50,'朱杰','15083523312','天猫国际信息化建设部搭建中心机房意向',0,'bank','2017-09-11 11:02:46',1,'bank','2017-09-11 23:32:26','已指派');

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `svr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(客户服务编号)系统自动生成(标识列、主键)',
  `svr_type` varchar(20) NOT NULL COMMENT '服务类型',
  `svr_title` varchar(500) NOT NULL COMMENT '服务概要',
  `svr_cust_no` char(17) DEFAULT NULL COMMENT '客户编号(cst_customer表cust_no)',
  `svr_status` varchar(10) NOT NULL COMMENT '服务状态(新创建、已分配、已处理、已归档)',
  `svr_request` varchar(3000) NOT NULL COMMENT '服务请求',
  `svr_create_id` bigint(20) NOT NULL COMMENT '服务创建人编号(客户经理)',
  `svr_create_name` varchar(50) NOT NULL COMMENT '服服务创建人姓名',
  `svr_create_date` datetime NOT NULL COMMENT '服务创建时间',
  `svr_due_id` bigint(20) DEFAULT NULL COMMENT '服务分配给的人编号',
  `svr_due_name` varchar(50) DEFAULT NULL COMMENT '服务分配给的人姓名',
  `svr_due_date` datetime DEFAULT NULL COMMENT '服务分配时间',
  `svr_deal` varchar(3000) DEFAULT NULL COMMENT '服务处理',
  `svr_deal_id` bigint(20) DEFAULT NULL COMMENT '服务处理人编号',
  `svr_deal_name` varchar(50) DEFAULT NULL COMMENT '服务处理人姓名',
  `svr_deal_date` datetime DEFAULT NULL COMMENT '服务处理时间',
  `svr_result` varchar(500) DEFAULT NULL COMMENT '服务处理结果',
  `svr_satisfy` int(11) DEFAULT NULL COMMENT '服务满意度',
  PRIMARY KEY (`svr_id`),
  KEY `svr_cust_no` (`svr_cust_no`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`svr_cust_no`) REFERENCES `customer` (`cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `service` */

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stk_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '(库存编号)系统自动生成(标识列、主键)',
  `stk_prod_id` bigint(20) NOT NULL COMMENT '产品编号（pro_product表prod_id）',
  `stk_warehouse` varchar(50) NOT NULL COMMENT '仓库',
  `stk_ware` varchar(50) NOT NULL COMMENT '货位',
  `stk_count` int(11) NOT NULL COMMENT '件数',
  `stk_memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`stk_id`),
  KEY `stk_prod_id` (`stk_prod_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`stk_prod_id`) REFERENCES `product` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stock` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统自动生成(标识列、主键)',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `user_password` varchar(50) NOT NULL COMMENT '用户密码',
  `user_role_id` bigint(20) DEFAULT NULL COMMENT '用户权限（外键sys_role表role_id）',
  `user_flag` int(11) NOT NULL COMMENT '用户状态（1或0，0是禁用，1是正常）',
  PRIMARY KEY (`user_id`),
  KEY `user_role_id` (`user_role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_password`,`user_role_id`,`user_flag`) values (1,'bank','123',3,1),(2,'admin','123',3,1),(3,'钟有禄','123',1,1),(4,'朱杰','123',3,1),(5,'辜益凡','123',2,1),(6,'何文胜','123',3,1),(7,'zhujie','123',4,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
