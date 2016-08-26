-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: pmall_
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pmall_activity`
--

DROP TABLE IF EXISTS `pmall_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_activity` (
  `activity_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_title` varchar(255) NOT NULL COMMENT '标题',
  `activity_type` enum('1','2') DEFAULT NULL COMMENT '活动类型 1:商品 2:团购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动横幅大图片',
  `activity_style` varchar(255) NOT NULL COMMENT '活动页面模板样式标识码',
  `activity_desc` varchar(1000) DEFAULT NULL COMMENT '描述',
  `activity_start_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `activity_end_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `activity_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `activity_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_activity`
--

LOCK TABLES `pmall_activity` WRITE;
/*!40000 ALTER TABLE `pmall_activity` DISABLE KEYS */;
INSERT INTO `pmall_activity` VALUES (1,'abc','1','05211443745714491.png','default_style','',1467648000,1469203200,0,1);
/*!40000 ALTER TABLE `pmall_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_activity_detail`
--

DROP TABLE IF EXISTS `pmall_activity_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_activity_detail` (
  `activity_detail_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `activity_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动编号',
  `item_id` int(11) NOT NULL COMMENT '商品或团购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或团购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺编号',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activity_detail_state` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activity_detail_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`activity_detail_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动细节表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_activity_detail`
--

LOCK TABLES `pmall_activity_detail` WRITE;
/*!40000 ALTER TABLE `pmall_activity_detail` DISABLE KEYS */;
INSERT INTO `pmall_activity_detail` VALUES (1,1,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB',1,'800方o2o','0',255),(2,1,100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品',1,'800方o2o','0',255);
/*!40000 ALTER TABLE `pmall_activity_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_address`
--

DROP TABLE IF EXISTS `pmall_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_address` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `member_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `true_name` varchar(50) NOT NULL COMMENT '会员姓名',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel_phone` varchar(20) DEFAULT NULL COMMENT '座机电话',
  `mob_phone` varchar(15) DEFAULT NULL COMMENT '手机电话',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `dlyp_id` int(11) DEFAULT '0' COMMENT '自提点ID',
  `lat` decimal(9,6) DEFAULT NULL COMMENT 'ç»åº¦',
  `lng` decimal(9,6) DEFAULT NULL COMMENT 'çº¬åº¦',
  `city_code` varchar(6) DEFAULT NULL COMMENT 'åŸŽå¸‚ç¼–ç ',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_address`
--

LOCK TABLES `pmall_address` WRITE;
/*!40000 ALTER TABLE `pmall_address` DISABLE KEYS */;
INSERT INTO `pmall_address` VALUES (1,2,'庄先生',3041,289,'广东 广州市 海珠区','四季天地3楼',NULL,'13560134399','0',0,NULL,NULL,NULL),(2,3,'庄先生2',3041,289,'广东 广州市 海珠区','四季天地4楼',NULL,'13560134399','0',0,NULL,NULL,NULL),(3,7,'adfasd',3041,289,'广东 广州市 海珠区','adf asd a','','13812345678','0',0,NULL,NULL,NULL),(4,8,'测试',3146,307,'广东 潮州市 湘桥区','测试地址',NULL,'110','0',0,NULL,NULL,NULL),(5,9,'王钦',37,36,'北京 北京市 东城区','测试',NULL,'15999904305','0',0,NULL,NULL,NULL),(6,11,'王钦',3041,289,'广东 广州市 海珠区','...',NULL,'15999904305','0',0,NULL,NULL,NULL),(7,15,'庄先生',3041,289,'广东 广州市 海珠区','赤岗北路四季天地3楼八百方信息科技有限公司',NULL,'13560134397','0',0,NULL,NULL,NULL),(8,16,'马蔚丹',3040,289,'广东 广州市 天河区','赤岗北路118号四季天地三楼','','15989264655','0',0,NULL,NULL,NULL),(9,14,'的的',3041,289,'广东 广州市 海珠区','四季天地',NULL,'13560134398','0',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pmall_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_admin`
--

DROP TABLE IF EXISTS `pmall_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_avatar` varchar(100) DEFAULT NULL COMMENT '管理员头像',
  `admin_password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `admin_gid` smallint(6) DEFAULT '0' COMMENT '权限组ID',
  `admin_quick_link` varchar(400) DEFAULT NULL COMMENT '管理员常用操作',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_admin`
--

LOCK TABLES `pmall_admin` WRITE;
/*!40000 ALTER TABLE `pmall_admin` DISABLE KEYS */;
INSERT INTO `pmall_admin` VALUES (1,'admin',NULL,'f6fdffe48c908deb0f4c3bd36c032e72',1469671009,122,1,0,NULL),(2,'niub',NULL,'4a21f473413b69b05a3336892e382742',0,0,0,1,NULL),(3,'luojuan',NULL,'e10adc3949ba59abbe56e057f20f883e',0,0,0,1,NULL);
/*!40000 ALTER TABLE `pmall_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_admin_log`
--

DROP TABLE IF EXISTS `pmall_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(50) NOT NULL COMMENT '操作内容',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '发生时间',
  `admin_name` char(20) NOT NULL COMMENT '管理员',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `ip` char(15) NOT NULL COMMENT 'IP',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT 'act&op',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_admin_log`
--

LOCK TABLES `pmall_admin_log` WRITE;
/*!40000 ALTER TABLE `pmall_admin_log` DISABLE KEYS */;
INSERT INTO `pmall_admin_log` VALUES (1,'登录',1467600350,'admin',1,'192.168.0.14','login&login'),(2,'编辑防灌水设置',1467600360,'admin',1,'192.168.0.14','setting&dump'),(3,'登录',1467600367,'admin',1,'192.168.0.14','login&login'),(4,'登录',1467603806,'admin',1,'192.168.0.14','login&login'),(5,'登录',1467610378,'admin',1,'192.168.0.117','login&login'),(6,'登录',1467622442,'admin',1,'192.168.0.117','login&login'),(7,'新增外驻店铺: eshop2',1467623186,'admin',1,'192.168.0.117','store&shopwwi_add'),(8,'编辑快递公司状态[ID:15]',1467623308,'admin',1,'192.168.0.117','express&ajax'),(9,'登录',1467700167,'admin',1,'192.168.0.117','login&login'),(10,'登录',1467700207,'admin',1,'192.168.0.204','login&login'),(11,'编辑快递公司状态[ID:14]',1467700305,'admin',1,'192.168.0.204','express&ajax'),(12,'删除店铺经营类目，类目编号:1,店铺编号:2',1467700651,'admin',1,'192.168.0.117','store&store_bind_class_add'),(13,'删除店铺经营类目，类目编号:2,店铺编号:2',1467700666,'admin',1,'192.168.0.117','store&store_bind_class_add'),(14,'登录',1467721198,'admin',1,'192.168.0.204','login&login'),(15,'退款确认，退款编号405101160705201712',1467721235,'admin',1,'192.168.0.204','refund&edit'),(16,'登录',1467783675,'admin',1,'192.168.0.204','login&login'),(17,'将订单改为已收款状态,订单号:8000000000001001',1467784465,'admin',1,'192.168.0.204','order&change_state'),(18,'退货确认，退货编号414101160706133825',1467784834,'admin',1,'192.168.0.204','return&edit'),(19,'退款确认，退款编号410101160706140459',1467785152,'admin',1,'192.168.0.204','refund&edit'),(20,'将订单改为已收款状态,订单号:8000000000001401',1467785664,'admin',1,'192.168.0.204','order&change_state'),(21,'将订单改为已收款状态,订单号:8000000000001501',1467785803,'admin',1,'192.168.0.204','order&change_state'),(22,'登录',1467788201,'admin',1,'192.168.0.117','login&login'),(23,'登录',1467792791,'admin',1,'192.168.0.117','login&login'),(24,'添加类型[表盘形状]',1467792968,'admin',1,'192.168.0.117','type&type_add'),(25,'登录',1467793055,'admin',1,'192.168.0.204','login&login'),(26,'退货确认，退货编号143101160706161502',1467793067,'admin',1,'192.168.0.204','return&edit'),(27,'添加商品分类管理[中西成药]',1467793595,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(28,'添加品牌管理[白云山]',1467793681,'admin',1,'192.168.0.117','brand&brand_add'),(29,'类型[ID:1]',1467793756,'admin',1,'192.168.0.117','type&type_del'),(30,'添加类型[感冒药]',1467793788,'admin',1,'192.168.0.117','type&type_add'),(31,'编辑规格[100片/瓶]',1467793860,'admin',1,'192.168.0.117','spec&spec_edit'),(32,'添加规格[50片/瓶]',1467793875,'admin',1,'192.168.0.117','spec&spec_add'),(33,'编辑类型[感冒药]',1467793891,'admin',1,'192.168.0.117','type&type_edit'),(34,'编辑类型[感冒药]',1467793921,'admin',1,'192.168.0.117','type&type_edit'),(35,'编辑商品分类管理[中西成药]',1467793950,'admin',1,'192.168.0.117','goods_class&goods_class_edit'),(36,'删除店铺经营类目，类目编号:2,店铺编号:2',1467793991,'admin',1,'192.168.0.117','store&store_bind_class_del'),(37,'删除店铺经营类目，类目编号:1,店铺编号:2',1467793993,'admin',1,'192.168.0.117','store&store_bind_class_del'),(38,'删除店铺经营类目，类目编号:3,店铺编号:2',1467793997,'admin',1,'192.168.0.117','store&store_bind_class_add'),(39,'删除店铺经营类目，类目编号:4,店铺编号:2',1467794022,'admin',1,'192.168.0.117','store&store_bind_class_add'),(40,'删除店铺经营类目，类目编号:4,店铺编号:2',1467794047,'admin',1,'192.168.0.117','store&store_bind_class_del'),(41,'规格[ID:2]',1467794210,'admin',1,'192.168.0.117','spec&spec_del'),(42,'编辑规格[英文/拼音]',1467794229,'admin',1,'192.168.0.117','spec&spec_edit'),(43,'添加规格[通用名称]',1467794244,'admin',1,'192.168.0.117','spec&spec_add'),(44,'添加规格[化学名称]',1467794253,'admin',1,'192.168.0.117','spec&spec_add'),(45,'添加规格[批准文号]',1467794260,'admin',1,'192.168.0.117','spec&spec_add'),(46,'添加规格[本位码]',1467794267,'admin',1,'192.168.0.117','spec&spec_add'),(47,'添加规格[生产厂商]',1467794275,'admin',1,'192.168.0.117','spec&spec_add'),(48,'添加规格[生产厂商地址]',1467794284,'admin',1,'192.168.0.117','spec&spec_add'),(49,'添加规格[生产厂商国家]',1467794291,'admin',1,'192.168.0.117','spec&spec_add'),(50,'添加规格[药品属性]',1467794299,'admin',1,'192.168.0.117','spec&spec_add'),(51,'添加规格[性状]',1467794308,'admin',1,'192.168.0.117','spec&spec_add'),(52,'添加规格[剂型]',1467794316,'admin',1,'192.168.0.117','spec&spec_add'),(53,'添加规格[储藏]',1467794321,'admin',1,'192.168.0.117','spec&spec_add'),(54,'添加规格[是否进口]',1467794329,'admin',1,'192.168.0.117','spec&spec_add'),(55,'添加规格[有效期]',1467794335,'admin',1,'192.168.0.117','spec&spec_add'),(56,'添加规格[医保分类]',1467794342,'admin',1,'192.168.0.117','spec&spec_add'),(57,'添加规格[主要成分]',1467794348,'admin',1,'192.168.0.117','spec&spec_add'),(58,'退货确认，退货编号369101160706163811',1467794353,'admin',1,'192.168.0.204','return&edit'),(59,'添加规格[功能主治]',1467794354,'admin',1,'192.168.0.117','spec&spec_add'),(60,'添加规格[用法用量]',1467794359,'admin',1,'192.168.0.117','spec&spec_add'),(61,'添加规格[药理作用]',1467794364,'admin',1,'192.168.0.117','spec&spec_add'),(62,'添加规格[不良反应]',1467794370,'admin',1,'192.168.0.117','spec&spec_add'),(63,'添加规格[注意事项]',1467794376,'admin',1,'192.168.0.117','spec&spec_add'),(64,'添加规格[禁忌]',1467794382,'admin',1,'192.168.0.117','spec&spec_add'),(65,'添加规格[适用人群]',1467794387,'admin',1,'192.168.0.117','spec&spec_add'),(66,'添加规格[药物相互作用]',1467794394,'admin',1,'192.168.0.117','spec&spec_add'),(67,'添加规格[药理毒理]',1467794404,'admin',1,'192.168.0.117','spec&spec_add'),(68,'添加规格[标准SKU规格]',1467794422,'admin',1,'192.168.0.117','spec&spec_add'),(69,'添加规格[商家货号]',1467794430,'admin',1,'192.168.0.117','spec&spec_add'),(70,'添加规格[药品重量]',1467794444,'admin',1,'192.168.0.117','spec&spec_add'),(71,'添加规格[药品单位]',1467794453,'admin',1,'192.168.0.117','spec&spec_add'),(72,'添加规格[药品条形码]',1467794458,'admin',1,'192.168.0.117','spec&spec_add'),(73,'编辑类型[药品]',1467794514,'admin',1,'192.168.0.117','type&type_edit'),(74,'编辑商品分类管理[中西成药]',1467794530,'admin',1,'192.168.0.117','goods_class&goods_class_edit'),(75,'规格[ID:3]',1467794581,'admin',1,'192.168.0.117','spec&spec_del'),(76,'规格[ID:4]',1467794583,'admin',1,'192.168.0.117','spec&spec_del'),(77,'规格[ID:5]',1467794585,'admin',1,'192.168.0.117','spec&spec_del'),(78,'规格[ID:6]',1467794587,'admin',1,'192.168.0.117','spec&spec_del'),(79,'规格[ID:7]',1467794588,'admin',1,'192.168.0.117','spec&spec_del'),(80,'规格[ID:8]',1467794590,'admin',1,'192.168.0.117','spec&spec_del'),(81,'规格[ID:9]',1467794592,'admin',1,'192.168.0.117','spec&spec_del'),(82,'规格[ID:10]',1467794594,'admin',1,'192.168.0.117','spec&spec_del'),(83,'规格[ID:11]',1467794595,'admin',1,'192.168.0.117','spec&spec_del'),(84,'规格[ID:12]',1467794597,'admin',1,'192.168.0.117','spec&spec_del'),(85,'规格[ID:13]',1467794599,'admin',1,'192.168.0.117','spec&spec_del'),(86,'规格[ID:14]',1467794601,'admin',1,'192.168.0.117','spec&spec_del'),(87,'规格[ID:15]',1467794608,'admin',1,'192.168.0.117','spec&spec_del'),(88,'规格[ID:16]',1467794610,'admin',1,'192.168.0.117','spec&spec_del'),(89,'规格[ID:17]',1467794612,'admin',1,'192.168.0.117','spec&spec_del'),(90,'规格[ID:18]',1467794614,'admin',1,'192.168.0.117','spec&spec_del'),(91,'规格[ID:19]',1467794615,'admin',1,'192.168.0.117','spec&spec_del'),(92,'规格[ID:20]',1467794617,'admin',1,'192.168.0.117','spec&spec_del'),(93,'规格[ID:21]',1467794619,'admin',1,'192.168.0.117','spec&spec_del'),(94,'规格[ID:22]',1467794621,'admin',1,'192.168.0.117','spec&spec_del'),(95,'规格[ID:23]',1467794623,'admin',1,'192.168.0.117','spec&spec_del'),(96,'规格[ID:24]',1467794625,'admin',1,'192.168.0.117','spec&spec_del'),(97,'规格[ID:25]',1467794628,'admin',1,'192.168.0.117','spec&spec_del'),(98,'规格[ID:26]',1467794630,'admin',1,'192.168.0.117','spec&spec_del'),(99,'规格[ID:28]',1467794638,'admin',1,'192.168.0.117','spec&spec_del'),(100,'规格[ID:29]',1467794645,'admin',1,'192.168.0.117','spec&spec_del'),(101,'规格[ID:30]',1467794647,'admin',1,'192.168.0.117','spec&spec_del'),(102,'规格[ID:31]',1467794649,'admin',1,'192.168.0.117','spec&spec_del'),(103,'编辑规格[SKU规格]',1467794654,'admin',1,'192.168.0.117','spec&spec_edit'),(104,'编辑类型[药品]',1467794825,'admin',1,'192.168.0.117','type&type_edit'),(105,'类型[ID:2]',1467794852,'admin',1,'192.168.0.117','type&type_del'),(106,'规格[ID:27]',1467794857,'admin',1,'192.168.0.117','spec&spec_del'),(107,'商品分类管理[ID:1057]',1467794865,'admin',1,'192.168.0.117','goods_class&goods_class_del'),(108,'添加商品分类管理[中西成药]',1467794892,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(109,'添加商品分类管理[心脑血管]',1467794921,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(110,'添加商品分类管理[高血压]',1467794934,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(111,'添加商品分类管理[男科疾病]',1467794952,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(112,'商品分类管理[ID:1061]',1467794992,'admin',1,'192.168.0.117','goods_class&goods_class_del'),(113,'添加商品分类管理[男科疾病]',1467795006,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(114,'添加商品分类管理[阳痿早泄]',1467795034,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(115,'添加商品分类管理[专科用药]',1467795049,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(116,'添加商品分类管理[肝胆科]',1467795068,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(117,'添加商品分类管理[护肝片]',1467795094,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(118,'添加类型[药品]',1467795163,'admin',1,'192.168.0.117','type&type_add'),(119,'删除店铺经营类目，类目编号:5,店铺编号:2',1467795195,'admin',1,'192.168.0.117','store&store_bind_class_add'),(120,'编辑类型[药品]',1467795318,'admin',1,'192.168.0.117','type&type_edit'),(121,'添加规格[SKU规格]',1467795387,'admin',1,'192.168.0.117','spec&spec_add'),(122,'编辑类型[药品]',1467795425,'admin',1,'192.168.0.117','type&type_edit'),(123,'编辑商品分类管理[中西成药]',1467795463,'admin',1,'192.168.0.117','goods_class&goods_class_edit'),(124,'类型[ID:3]',1467795608,'admin',1,'192.168.0.117','type&type_del'),(125,'添加类型[国药准字Z44022406]',1467795995,'admin',1,'192.168.0.117','type&type_add'),(126,'编辑类型[国药准字Z44022406]',1467796016,'admin',1,'192.168.0.117','type&type_edit'),(127,'编辑商品分类管理[中西成药]',1467796037,'admin',1,'192.168.0.117','goods_class&goods_class_edit'),(128,'删除店铺经营类目，类目编号:5,店铺编号:2',1467796050,'admin',1,'192.168.0.117','store&store_bind_class_del'),(129,'删除店铺经营类目，类目编号:6,店铺编号:2',1467796058,'admin',1,'192.168.0.117','store&store_bind_class_add'),(130,'类型[ID:4]',1467796310,'admin',1,'192.168.0.117','type&type_del'),(131,'规格[ID:32]',1467796316,'admin',1,'192.168.0.117','spec&spec_del'),(132,'编辑规格[英文/拼音]',1467796471,'admin',1,'192.168.0.117','spec&spec_edit'),(133,'编辑规格[颜色]',1467796500,'admin',1,'192.168.0.117','spec&spec_edit'),(134,'添加商品分类管理[医疗器械]',1467796550,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(135,'添加商品分类管理[血压计]',1467796570,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(136,'添加商品分类管理[欧姆龙]',1467796587,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(137,'添加类型[血压计]',1467796664,'admin',1,'192.168.0.117','type&type_add'),(138,'编辑属性[测量方式]',1467796700,'admin',1,'192.168.0.117','type&attr_edit'),(139,'编辑类型[血压计]',1467796708,'admin',1,'192.168.0.117','type&type_edit'),(140,'添加规格[普通装]',1467796757,'admin',1,'192.168.0.117','spec&spec_add'),(141,'添加规格[豪华装]',1467796771,'admin',1,'192.168.0.117','spec&spec_add'),(142,'删除店铺经营类目，类目编号:7,店铺编号:2',1467796786,'admin',1,'192.168.0.117','store&store_bind_class_add'),(143,'编辑商品分类管理[医疗器械]',1467796829,'admin',1,'192.168.0.117','goods_class&goods_class_edit'),(144,'编辑类型[血压计]',1467797006,'admin',1,'192.168.0.117','type&type_edit'),(145,'编辑类型[血压计]',1467797018,'admin',1,'192.168.0.117','type&type_edit'),(146,'规格[ID:33]',1467797045,'admin',1,'192.168.0.117','spec&spec_del'),(147,'编辑规格[包装类型]',1467797091,'admin',1,'192.168.0.117','spec&spec_edit'),(148,'登录',1467797682,'admin',1,'192.168.0.75','login&login'),(149,'添加类型[批准文号]',1467797728,'admin',1,'192.168.0.75','type&type_add'),(150,'编辑类型[批准文号]',1467797752,'admin',1,'192.168.0.75','type&type_edit'),(151,'编辑商品分类管理[中西成药]',1467797764,'admin',1,'192.168.0.75','goods_class&goods_class_edit'),(152,'编辑商品分类管理[中西成药]',1467797878,'admin',1,'192.168.0.75','goods_class&goods_class_edit'),(153,'类型[ID:6]',1467799663,'admin',1,'192.168.0.117','type&type_del'),(154,'添加活动[abc]',1467800374,'admin',1,'192.168.0.204','activity&new'),(155,'登录',1467801201,'admin',1,'192.168.0.49','login&login'),(156,'登录',1467815859,'admin',1,'192.168.0.204','login&login'),(157,'登录',1467854158,'admin',1,'192.168.0.117','login&login'),(158,'登录',1467854968,'admin',1,'192.168.0.82','login&login'),(159,'登录',1467878706,'admin',1,'192.168.0.204','login&login'),(160,'登录',1467883987,'admin',1,'192.168.0.204','login&login'),(161,'登录',1467887714,'admin',1,'192.168.0.204','login&login'),(162,'登录',1467942100,'admin',1,'192.168.0.117','login&login'),(163,'登录',1467942358,'admin',1,'192.168.0.204','login&login'),(164,'登录',1467947507,'admin',1,'192.168.0.117','login&login'),(165,'将订单改为已收款状态,订单号:8000000000002801',1467947548,'admin',1,'192.168.0.117','order&change_state'),(166,'登录',1467959951,'admin',1,'192.168.0.14','login&login'),(167,'登录',1467963975,'admin',1,'192.168.0.117','login&login'),(168,'登录',1467964030,'admin',1,'192.168.0.204','login&login'),(169,'登录',1468048194,'admin',1,'192.168.0.117','login&login'),(170,'登录',1468052263,'admin',1,'192.168.0.117','login&login'),(171,'编辑快递公司状态[ID:2]',1468052548,'admin',1,'192.168.0.117','express&ajax'),(172,'编辑快递公司状态[ID:3]',1468052550,'admin',1,'192.168.0.117','express&ajax'),(173,'编辑快递公司状态[ID:4]',1468052551,'admin',1,'192.168.0.117','express&ajax'),(174,'编辑快递公司状态[ID:5]',1468052553,'admin',1,'192.168.0.117','express&ajax'),(175,'编辑快递公司状态[ID:6]',1468052554,'admin',1,'192.168.0.117','express&ajax'),(176,'编辑快递公司状态[ID:7]',1468052558,'admin',1,'192.168.0.117','express&ajax'),(177,'编辑快递公司状态[ID:8]',1468052560,'admin',1,'192.168.0.117','express&ajax'),(178,'编辑快递公司状态[ID:9]',1468052561,'admin',1,'192.168.0.117','express&ajax'),(179,'编辑快递公司状态[ID:9]',1468052564,'admin',1,'192.168.0.117','express&ajax'),(180,'编辑快递公司状态[ID:9]',1468052566,'admin',1,'192.168.0.117','express&ajax'),(181,'编辑快递公司状态[ID:10]',1468052567,'admin',1,'192.168.0.117','express&ajax'),(182,'编辑快递公司状态[ID:11]',1468052569,'admin',1,'192.168.0.117','express&ajax'),(183,'编辑快递公司状态[ID:12]',1468052572,'admin',1,'192.168.0.117','express&ajax'),(184,'编辑快递公司状态[ID:13]',1468052573,'admin',1,'192.168.0.117','express&ajax'),(185,'编辑快递公司状态[ID:14]',1468052576,'admin',1,'192.168.0.117','express&ajax'),(186,'编辑快递公司状态[ID:16]',1468052581,'admin',1,'192.168.0.117','express&ajax'),(187,'编辑快递公司状态[ID:17]',1468052583,'admin',1,'192.168.0.117','express&ajax'),(188,'编辑快递公司状态[ID:18]',1468052585,'admin',1,'192.168.0.117','express&ajax'),(189,'编辑快递公司状态[ID:19]',1468052586,'admin',1,'192.168.0.117','express&ajax'),(190,'编辑快递公司状态[ID:20]',1468052588,'admin',1,'192.168.0.117','express&ajax'),(191,'编辑快递公司状态[ID:21]',1468052590,'admin',1,'192.168.0.117','express&ajax'),(192,'编辑快递公司状态[ID:22]',1468052613,'admin',1,'192.168.0.117','express&ajax'),(193,'编辑快递公司状态[ID:23]',1468052615,'admin',1,'192.168.0.117','express&ajax'),(194,'编辑快递公司状态[ID:24]',1468052617,'admin',1,'192.168.0.117','express&ajax'),(195,'编辑快递公司状态[ID:25]',1468052618,'admin',1,'192.168.0.117','express&ajax'),(196,'编辑快递公司状态[ID:26]',1468052620,'admin',1,'192.168.0.117','express&ajax'),(197,'编辑快递公司状态[ID:27]',1468052622,'admin',1,'192.168.0.117','express&ajax'),(198,'编辑快递公司状态[ID:28]',1468052624,'admin',1,'192.168.0.117','express&ajax'),(199,'编辑快递公司状态[ID:29]',1468052626,'admin',1,'192.168.0.117','express&ajax'),(200,'编辑快递公司状态[ID:30]',1468052627,'admin',1,'192.168.0.117','express&ajax'),(201,'编辑快递公司状态[ID:31]',1468052661,'admin',1,'192.168.0.117','express&ajax'),(202,'编辑快递公司状态[ID:32]',1468052663,'admin',1,'192.168.0.117','express&ajax'),(203,'编辑快递公司状态[ID:33]',1468052666,'admin',1,'192.168.0.117','express&ajax'),(204,'编辑快递公司状态[ID:34]',1468052667,'admin',1,'192.168.0.117','express&ajax'),(205,'编辑快递公司状态[ID:35]',1468052668,'admin',1,'192.168.0.117','express&ajax'),(206,'编辑快递公司状态[ID:36]',1468052669,'admin',1,'192.168.0.117','express&ajax'),(207,'编辑快递公司状态[ID:37]',1468052670,'admin',1,'192.168.0.117','express&ajax'),(208,'编辑快递公司状态[ID:38]',1468052671,'admin',1,'192.168.0.117','express&ajax'),(209,'编辑快递公司状态[ID:39]',1468052672,'admin',1,'192.168.0.117','express&ajax'),(210,'编辑快递公司状态[ID:40]',1468052674,'admin',1,'192.168.0.117','express&ajax'),(211,'编辑快递公司状态[ID:41]',1468052675,'admin',1,'192.168.0.117','express&ajax'),(212,'编辑快递公司状态[ID:42]',1468052676,'admin',1,'192.168.0.117','express&ajax'),(213,'编辑快递公司状态[ID:43]',1468052677,'admin',1,'192.168.0.117','express&ajax'),(214,'编辑快递公司状态[ID:44]',1468052678,'admin',1,'192.168.0.117','express&ajax'),(215,'编辑快递公司状态[ID:45]',1468052680,'admin',1,'192.168.0.117','express&ajax'),(216,'编辑快递公司状态[ID:46]',1468052684,'admin',1,'192.168.0.117','express&ajax'),(217,'编辑快递公司状态[ID:47]',1468052686,'admin',1,'192.168.0.117','express&ajax'),(218,'登录',1468197575,'admin',1,'192.168.0.117','login&login'),(219,'登录',1468206268,'admin',1,'192.168.0.117','login&login'),(220,'审核新经营类目申请，店铺ID：2',1468206310,'admin',1,'192.168.0.117','store&store_bind_class_applay_check'),(221,'审核新经营类目申请，店铺ID：2',1468206314,'admin',1,'192.168.0.117','store&store_bind_class_applay_check'),(222,'登录',1468207256,'admin',1,'192.168.0.204','login&login'),(223,'将订单改为已收款状态,订单号:8000000000002601',1468207285,'admin',1,'192.168.0.204','order&change_state'),(224,'登录',1468216269,'admin',1,'192.168.0.117','login&login'),(225,'登录',1468216414,'admin',1,'192.168.0.14','login&login'),(226,'添加权限组[牛逼管理员]',1468217360,'admin',1,'192.168.0.117','admin&gadmin_add'),(227,'添加管理员[niub]',1468217479,'admin',1,'192.168.0.117','admin&admin_add'),(228,'编辑商城设置',1468220454,'admin',1,'192.168.0.117','setting&'),(229,'编辑商城设置',1468220459,'admin',1,'192.168.0.117','setting&'),(230,'编辑商城设置',1468220568,'admin',1,'192.168.0.117','setting&'),(231,'编辑商城设置',1468220705,'admin',1,'192.168.0.117','setting&'),(232,'登录',1468221663,'admin',1,'192.168.0.14','login&login'),(233,'编辑顶部广告',1468222609,'admin',1,'192.168.0.117','shopwwi&banner'),(234,'编辑商品设置',1468224147,'admin',1,'192.168.0.117','goods&goods_set'),(235,'设置店铺结算周期[eshop2]',1468225198,'admin',1,'192.168.0.117','store&bill_cycle_edit'),(236,'消费者保障服务申请[ID：1]审核状态修改为审核通过，待支付保证金',1468230039,'admin',1,'192.168.0.117','contract&applyedit'),(237,'消费者保障服务申请[ID：1]审核状态修改为保证金审核通过',1468230084,'admin',1,'192.168.0.117','contract&applyedit'),(238,'编辑统计设置',1468230766,'admin',1,'192.168.0.117','stat_general&setting'),(239,'编辑统计设置',1468230775,'admin',1,'192.168.0.117','stat_general&orderprange'),(240,'登录',1468287616,'admin',1,'192.168.0.29','login&login'),(241,'登录',1468287798,'admin',1,'192.168.0.117','login&login'),(242,'登录',1468293939,'admin',1,'192.168.0.117','login&login'),(243,'登录',1468294246,'admin',1,'192.168.0.236','login&login'),(244,'编辑店铺入驻指南，编号97',1468295236,'admin',1,'192.168.0.236','store_joinin&edit_help'),(245,'编辑店铺入驻指南，编号97',1468295247,'admin',1,'192.168.0.236','store_joinin&edit_help'),(246,'编辑店铺入驻指南，编号97',1468295267,'admin',1,'192.168.0.236','store_joinin&edit_help'),(247,'编辑店铺入驻指南，编号96',1468295279,'admin',1,'192.168.0.236','store_joinin&edit_help'),(248,'编辑店铺入驻指南，编号97',1468295288,'admin',1,'192.168.0.236','store_joinin&edit_help'),(249,'编辑店铺入驻指南，编号97',1468295328,'admin',1,'192.168.0.236','store_joinin&edit_help'),(250,'编辑店铺入驻指南，编号96',1468295337,'admin',1,'192.168.0.236','store_joinin&edit_help'),(251,'编辑店铺入驻指南，编号97',1468295345,'admin',1,'192.168.0.236','store_joinin&edit_help'),(252,'登录',1468295409,'admin',1,'192.168.0.108','login&login'),(253,'编辑店铺入驻指南，编号96',1468295441,'admin',1,'192.168.0.108','store_joinin&edit_help'),(254,'编辑店铺入驻指南，编号97',1468295450,'admin',1,'192.168.0.108','store_joinin&edit_help'),(255,'编辑店铺入驻指南，编号96',1468295458,'admin',1,'192.168.0.108','store_joinin&edit_help'),(256,'登录',1468295918,'admin',1,'192.168.0.4','login&login'),(257,'登录',1468301641,'admin',1,'192.168.0.236','login&login'),(258,'登录',1468301648,'admin',1,'192.168.0.73','login&login'),(259,'登录',1468302969,'admin',1,'192.168.0.108','login&login'),(260,'登录',1468303028,'admin',1,'192.168.0.19','login&login'),(261,'编辑店铺入驻指南，编号96',1468303534,'admin',1,'192.168.0.108','store_joinin&edit_help'),(262,'编辑店铺入驻指南，编号96',1468303704,'admin',1,'192.168.0.108','store_joinin&edit_help'),(263,'登录',1468306649,'admin',1,'192.168.0.117','login&login'),(264,'登录',1468308220,'admin',1,'192.168.0.236','login&login'),(265,'登录',1468314808,'admin',1,'192.168.0.19','login&login'),(266,'登录',1468324193,'admin',1,'192.168.0.117','login&login'),(267,'登录',1468380368,'admin',1,'192.168.0.236','login&login'),(268,'登录',1468388007,'admin',1,'192.168.0.236','login&login'),(269,'登录',1468390691,'admin',1,'192.168.0.75','login&login'),(270,'登录',1468390911,'admin',1,'192.168.0.14','login&login'),(271,'编辑防灌水设置',1468390932,'admin',1,'192.168.0.14','setting&dump'),(272,'登录',1468390981,'admin',1,'192.168.0.117','login&login'),(273,'编辑会员[ID:10]',1468390994,'admin',1,'192.168.0.117','member&member_edit'),(274,'编辑防灌水设置',1468391051,'admin',1,'192.168.0.14','setting&dump'),(275,'编辑防灌水设置',1468391157,'admin',1,'192.168.0.75','setting&dump'),(276,'登录',1468392042,'admin',1,'192.168.0.236','login&login'),(277,'登录',1468392541,'admin',1,'192.168.0.108','login&login'),(278,'登录',1468401456,'admin',1,'192.168.0.14','login&login'),(279,'登录',1468402967,'admin',1,'192.168.0.117','login&login'),(280,'退款确认，退款编号143102160713174450',1468403354,'admin',1,'192.168.0.117','refund&edit'),(281,'登录',1468409763,'admin',1,'192.168.0.14','login&login'),(282,'登录',1468458538,'admin',1,'192.168.0.117','login&login'),(283,'登录',1468464768,'admin',1,'192.168.0.117','login&login'),(284,'操作会员[eshop2]预存款[增加]，金额为100,编号为540521808925160005',1468464925,'admin',1,'192.168.0.117','member&predeposit_add'),(285,'登录',1468467231,'admin',1,'192.168.0.204','login&login'),(286,'操作会员[kit]预存款[增加]，金额为100,编号为500521811383442005',1468467383,'admin',1,'192.168.0.204','member&predeposit_add'),(287,'登录',1468468359,'admin',1,'192.168.0.14','login&login'),(288,'审核账单,账单号：4',1468471465,'admin',1,'192.168.0.117','bill&bill_check'),(289,'账单付款,账单号：4',1468471485,'admin',1,'192.168.0.117','bill&bill_pay'),(290,'登录',1468475748,'admin',1,'192.168.0.14','login&login'),(291,'登录',1468476185,'admin',1,'192.168.0.41','login&login'),(292,'添加会员[ luojuan]',1468476522,'admin',1,'192.168.0.41','member&member_add'),(293,'编辑会员[ID:12]',1468476592,'admin',1,'192.168.0.41','member&member_edit'),(294,'添加管理员[luojuan]',1468476678,'admin',1,'192.168.0.41','admin&admin_add'),(295,'登录',1468478243,'admin',1,'192.168.0.236','login&login'),(296,'编辑商城设置',1468481599,'admin',1,'192.168.0.41','setting&base'),(297,'登录',1468481618,'admin',1,'192.168.0.41','login&login'),(298,'登录',1468483080,'admin',1,'192.168.0.14','login&login'),(299,'登录',1468483420,'admin',1,'192.168.0.117','login&login'),(300,'新增外驻店铺: eshop4',1468483851,'admin',1,'192.168.0.117','store&shopwwi_add'),(301,'登录',1468488264,'admin',1,'192.168.0.117','login&login'),(302,'登录',1468545560,'admin',1,'192.168.0.117','login&login'),(303,'登录',1468549057,'admin',1,'192.168.0.41','login&login'),(304,'编辑会员[ID:2]',1468550740,'admin',1,'192.168.0.117','member&member_edit'),(305,'登录',1468568334,'admin',1,'192.168.0.41','login&login'),(306,'登录',1468580949,'admin',1,'192.168.0.204','login&login'),(307,'添加规格[颜色]',1468580985,'admin',1,'192.168.0.204','spec&spec_add'),(308,'添加规格[尺寸]',1468582333,'admin',1,'192.168.0.204','spec&spec_add'),(309,'登录',1468806178,'admin',1,'192.168.0.117','login&login'),(310,'审核新经营类目申请，店铺ID：2',1468806307,'admin',1,'192.168.0.117','store&store_bind_class_applay_check'),(311,'登录',1468810372,'admin',1,'192.168.0.14','login&login'),(312,'登录',1468811021,'admin',1,'192.168.0.75','login&login'),(313,'编辑短信设置',1468811074,'admin',1,'192.168.0.75','shopwwi&sms'),(314,'登录',1468811082,'admin',1,'192.168.0.75','login&login'),(315,'编辑消息模板',1468812420,'admin',1,'192.168.0.75','message&email_tpl_edit'),(316,'编辑消息模板',1468812442,'admin',1,'192.168.0.75','message&email_tpl_edit'),(317,'编辑消息模板',1468812502,'admin',1,'192.168.0.75','message&email_tpl_edit'),(318,'登录',1468890223,'admin',1,'192.168.0.117','login&login'),(319,'登录',1468890421,'admin',1,'192.168.0.236','login&login'),(320,'登录',1468890695,'admin',1,'192.168.0.108','login&login'),(321,'添加权限组[商务支持]',1468890873,'admin',1,'192.168.0.108','admin&gadmin_add'),(322,'添加权限组[运营人员]',1468891337,'admin',1,'192.168.0.108','admin&gadmin_add'),(323,'添加权限组[推广人员]',1468891424,'admin',1,'192.168.0.108','admin&gadmin_add'),(324,'添加权限组[会员中心]',1468891501,'admin',1,'192.168.0.108','admin&gadmin_add'),(325,'登录',1468895950,'admin',1,'192.168.0.236','login&login'),(326,'权限组[ID1]',1468896541,'admin',1,'192.168.0.236','admin&gadmin_del'),(327,'操作会员[Aidan]预存款[增加]，金额为10000000,编号为4305222416659600',1468897665,'admin',1,'192.168.0.117','member&predeposit_add'),(328,'登录',1468900410,'admin',1,'192.168.0.75','login&login'),(329,'登录',1468907929,'admin',1,'192.168.0.236','login&login'),(330,'登录',1468908255,'admin',1,'192.168.0.117','login&login'),(331,'退款确认，退款编号933102160719134019',1468908300,'admin',1,'192.168.0.236','refund&edit'),(332,'退款确认，退款编号897101160719141227',1468908814,'admin',1,'192.168.0.236','refund&edit'),(333,'编辑商城设置',1468912132,'admin',1,'192.168.0.117','setting&'),(334,'编辑默认图片',1468912430,'admin',1,'192.168.0.117','upload&default_thumb'),(335,'添加规格[类型]',1468913263,'admin',1,'192.168.0.117','spec&spec_add'),(336,'添加规格[工作模式]',1468913278,'admin',1,'192.168.0.117','spec&spec_add'),(337,'添加规格[加压方式]',1468913321,'admin',1,'192.168.0.117','spec&spec_add'),(338,'添加规格[检测方式]',1468913333,'admin',1,'192.168.0.117','spec&spec_add'),(339,'添加规格[显示方式]',1468913340,'admin',1,'192.168.0.117','spec&spec_add'),(340,'添加规格[精度]',1468913345,'admin',1,'192.168.0.117','spec&spec_add'),(341,'添加规格[测量范围]',1468913352,'admin',1,'192.168.0.117','spec&spec_add'),(342,'添加规格[记忆组数]',1468913359,'admin',1,'192.168.0.117','spec&spec_add'),(343,'添加规格[脉搏数]',1468913365,'admin',1,'192.168.0.117','spec&spec_add'),(344,'添加规格[电源类型]',1468913371,'admin',1,'192.168.0.117','spec&spec_add'),(345,'添加规格[电池寿命]',1468913377,'admin',1,'192.168.0.117','spec&spec_add'),(346,'规格[ID:47]',1468913491,'admin',1,'192.168.0.117','spec&spec_del'),(347,'规格[ID:46]',1468913494,'admin',1,'192.168.0.117','spec&spec_del'),(348,'规格[ID:45]',1468913496,'admin',1,'192.168.0.117','spec&spec_del'),(349,'规格[ID:44]',1468913499,'admin',1,'192.168.0.117','spec&spec_del'),(350,'规格[ID:43]',1468913501,'admin',1,'192.168.0.117','spec&spec_del'),(351,'规格[ID:42]',1468913503,'admin',1,'192.168.0.117','spec&spec_del'),(352,'规格[ID:41]',1468913505,'admin',1,'192.168.0.117','spec&spec_del'),(353,'规格[ID:40]',1468913507,'admin',1,'192.168.0.117','spec&spec_del'),(354,'规格[ID:39]',1468913509,'admin',1,'192.168.0.117','spec&spec_del'),(355,'规格[ID:38]',1468913511,'admin',1,'192.168.0.117','spec&spec_del'),(356,'规格[ID:37]',1468913513,'admin',1,'192.168.0.117','spec&spec_del'),(357,'规格[ID:36]',1468913515,'admin',1,'192.168.0.117','spec&spec_del'),(358,'登录',1468913739,'admin',1,'192.168.0.236','login&login'),(359,'退款确认，退款编号576102160719152013',1468913748,'admin',1,'192.168.0.236','refund&edit'),(360,'编辑类型[血压计]',1468914345,'admin',1,'192.168.0.117','type&type_edit'),(361,'编辑类型[血压计]',1468914374,'admin',1,'192.168.0.117','type&type_edit'),(362,'编辑类型[血压计]',1468914390,'admin',1,'192.168.0.117','type&type_edit'),(363,'编辑类型[血压计]',1468914418,'admin',1,'192.168.0.117','type&type_edit'),(364,'操作会员[13560134397]预存款[增加]，金额为9999,编号为91052225850867',1468914508,'admin',1,'192.168.0.117','member&predeposit_add'),(365,'登录',1468914529,'admin',1,'192.168.0.73','login&login'),(366,'商品分类管理[ID:1067]',1468914945,'admin',1,'192.168.0.117','goods_class&goods_class_del'),(367,'添加商品分类管理[医疗器械]',1468914976,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(368,'添加商品分类管理[血压计]',1468915004,'admin',1,'192.168.0.117','goods_class&goods_class_add'),(369,'审核新经营类目申请，店铺ID：2',1468915059,'admin',1,'192.168.0.117','store&store_bind_class_applay_check'),(370,'修改提现单状态,提现单号:800522258591473016',1468915793,'admin',1,'192.168.0.236','predeposit&pd_cash_pay'),(371,'登录',1468926876,'admin',1,'192.168.0.204','login&login'),(372,'登录',1468976897,'admin',1,'192.168.0.236','login&login'),(373,'登录',1468977285,'admin',1,'192.168.0.204','login&login'),(374,'将订单改为已收款状态,订单号:8000000000002301',1468977319,'admin',1,'192.168.0.204','order&change_state'),(375,'登录',1468979166,'admin',1,'192.168.0.117','login&login'),(376,'登录',1468994726,'admin',1,'192.168.0.117','login&login'),(377,'登录',1468998002,'admin',1,'192.168.0.117','login&login'),(378,'登录',1469065010,'admin',1,'192.168.0.117','login&login'),(379,'登录',1469071309,'admin',1,'192.168.0.117','login&login'),(380,'登录',1469079316,'admin',1,'192.168.0.117','login&login'),(381,'登录',1469087768,'admin',1,'192.168.0.117','login&login'),(382,'登录',1469156361,'admin',1,'192.168.0.236','login&login'),(383,'登录',1469157189,'admin',1,'192.168.0.73','login&login'),(384,'登录',1469158892,'admin',1,'192.168.0.41','login&login'),(385,'登录',1469167055,'admin',1,'192.168.0.41','login&login'),(386,'登录',1469412859,'admin',1,'192.168.0.41','login&login'),(387,'登录',1469417206,'admin',1,'192.168.0.19','login&login'),(388,'登录',1469424778,'admin',1,'192.168.0.19','login&login'),(389,'编辑商品设置',1469426437,'admin',1,'192.168.0.19','goods&goods_set'),(390,'登录',1469426458,'admin',1,'192.168.0.19','login&login'),(391,'编辑商品设置',1469426529,'admin',1,'192.168.0.19','goods&goods_set'),(392,'编辑商品设置',1469426537,'admin',1,'192.168.0.19','goods&goods_set'),(393,'登录',1469437646,'admin',1,'192.168.0.19','login&login'),(394,'登录',1469439776,'admin',1,'192.168.0.41','login&login'),(395,'登录',1469499008,'admin',1,'192.168.0.73','login&login'),(396,'登录',1469514683,'admin',1,'192.168.0.104','login&login'),(397,'登录',1469522782,'admin',1,'192.168.0.204','login&login'),(398,'登录',1469523307,'admin',1,'192.168.0.75','login&login'),(399,'将订单改为已收款状态,订单号:8000000000005301',1469524990,'admin',1,'192.168.0.204','order&change_state'),(400,'登录',1469528811,'admin',1,'192.168.0.204','login&login'),(401,'编辑商城设置',1469528830,'admin',1,'192.168.0.204','setting&'),(402,'编辑防灌水设置',1469529014,'admin',1,'192.168.0.204','setting&dump'),(403,'编辑默认图片',1469529185,'admin',1,'192.168.0.204','upload&default_thumb'),(404,'广告位添加成功[测试]',1469530169,'admin',1,'192.168.0.204','adv&ap_add'),(405,'添加推荐位[测试]',1469530256,'admin',1,'192.168.0.204','rec_position&rec_save'),(406,'编辑顶部广告',1469530412,'admin',1,'192.168.0.204','shopwwi&banner'),(407,'编辑运维控件',1469530461,'admin',1,'192.168.0.204','shopwwi&base'),(408,'操作会员[13560134397]预存款[减少]，金额为100,编号为200522875707587',1469531707,'admin',1,'192.168.0.204','member&predeposit_add'),(409,'登录',1469531843,'admin',1,'192.168.0.204','login&login'),(410,'编辑登录主题图片',1469531857,'admin',1,'192.168.0.204','setting&login'),(411,'登录',1469531878,'admin',1,'192.168.0.204','login&login'),(412,'编辑商城设置',1469531946,'admin',1,'192.168.0.204','setting&'),(413,'编辑商城频道，编号601',1469532642,'admin',1,'192.168.0.204','web_channel&set_channel'),(414,'更新tag失败',1469532843,'admin',1,'192.168.0.204','goods_class&tag_update'),(415,'重置tag',1469532848,'admin',1,'192.168.0.204','goods_class&tag_reset'),(416,'编辑TAG值成功[]',1469532873,'admin',1,'192.168.0.204','goods_class&tag_edit'),(417,'登录',1469581773,'admin',1,'192.168.0.204','login&login'),(418,'新增外驻店铺: 测试',1469582086,'admin',1,'192.168.0.204','store&shopwwi_add'),(419,'编辑店铺[测试]',1469582121,'admin',1,'192.168.0.204','store&store_edit'),(420,'登录',1469587678,'admin',1,'192.168.0.204','login&login'),(421,'添加会员标签[感冒]',1469589373,'admin',1,'192.168.0.204','sns_member&tag_add'),(422,'登录',1469598046,'admin',1,'192.168.0.204','login&login'),(423,'编辑快递公司状态[ID:1]',1469598109,'admin',1,'192.168.0.204','express&ajax'),(424,'编辑运营促销设定',1469598509,'admin',1,'192.168.0.204','operation&'),(425,'编辑运营促销设定',1469598611,'admin',1,'192.168.0.204','operation&'),(426,'修改加价购活动价格为0元',1469598876,'admin',1,'192.168.0.204','promotion_cou&cou_setting_save'),(427,'设置店铺满即送满即送价格',1469599011,'admin',1,'192.168.0.204','promotion_mansong&mansong_setting_save'),(428,'设置手机专享套餐',1469599522,'admin',1,'192.168.0.204','promotion_sole&sole_setting'),(429,'添加添加面额[10]',1469600315,'admin',1,'192.168.0.204','voucher&priceadd'),(430,'设置店铺代金券',1469600406,'admin',1,'192.168.0.204','voucher&setting'),(431,'登录',1469600950,'admin',1,'192.168.0.236','login&login'),(432,'登录',1469601001,'admin',1,'192.168.0.75','login&login'),(433,'编辑防灌水设置',1469601034,'admin',1,'192.168.0.75','setting&dump'),(434,'编辑快递公司状态[ID:1]',1469602017,'admin',1,'192.168.0.236','express&ajax'),(435,'编辑快递公司状态[ID:1]',1469602021,'admin',1,'192.168.0.236','express&ajax'),(436,'编辑快递公司状态[ID:1]',1469602034,'admin',1,'192.168.0.236','express&ajax'),(437,'编辑快递公司状态[ID:1]',1469602038,'admin',1,'192.168.0.236','express&ajax'),(438,'更新tag',1469604793,'admin',1,'192.168.0.236','goods_class&tag_update'),(439,'登录',1469615665,'admin',1,'192.168.0.75','login&login'),(440,'登录',1469667785,'admin',1,'192.168.0.236','login&login'),(441,'登录',1469668364,'admin',1,'192.168.0.75','login&login'),(442,'编辑快递公司状态[ID:1]',1469669382,'admin',1,'192.168.0.236','express&ajax'),(443,'编辑快递公司状态[ID:28]',1469669632,'admin',1,'192.168.0.236','express&ajax'),(444,'登录',1469671009,'admin',1,'192.168.0.204','login&login');
/*!40000 ALTER TABLE `pmall_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_adv`
--

DROP TABLE IF EXISTS `pmall_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_content` varchar(1000) NOT NULL COMMENT '广告内容',
  `adv_start_date` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_end_date` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `slide_sort` int(10) unsigned NOT NULL COMMENT '幻灯片排序',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员用户名',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告点击率',
  `is_allow` smallint(1) unsigned NOT NULL COMMENT '会员购买的广告是否通过审核0未审核1审核已通过2审核未通过',
  `buy_style` varchar(10) NOT NULL COMMENT '购买方式',
  `goldpay` int(10) unsigned NOT NULL COMMENT '购买所支付的金币',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_adv`
--

LOCK TABLES `pmall_adv` WRITE;
/*!40000 ALTER TABLE `pmall_adv` DISABLE KEYS */;
INSERT INTO `pmall_adv` VALUES (15,9,'首页通栏','a:2:{s:7:\"adv_pic\";s:21:\"04418235791378401.jpg\";s:11:\"adv_pic_url\";s:14:\"www.shopnc.com\";}',1388505600,1577721600,0,0,'',0,1,'',0);
/*!40000 ALTER TABLE `pmall_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_adv_position`
--

DROP TABLE IF EXISTS `pmall_adv_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `adv_num` int(10) unsigned NOT NULL COMMENT '拥有的广告数',
  `click_num` int(10) unsigned NOT NULL COMMENT '广告位点击率',
  `default_content` varchar(100) NOT NULL COMMENT '广告位默认内容',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_adv_position`
--

LOCK TABLES `pmall_adv_position` WRITE;
/*!40000 ALTER TABLE `pmall_adv_position` DISABLE KEYS */;
INSERT INTO `pmall_adv_position` VALUES (9,'首页底部通栏图片广告',0,2,1,1200,80,1,0,'04418235791378401.jpg'),(11,'首页焦点大图广告1',0,2,1,1920,481,0,0,'11.jpg'),(12,'首页焦点大图广告2',0,2,1,1920,481,0,0,'12.jpg'),(21,'首页焦点联动广告1',0,2,1,259,180,0,0,'21.jpg'),(22,'首页焦点联动广告2',0,2,1,259,180,0,0,'22.jpg'),(23,'首页焦点联动广告3',0,2,1,259,180,0,0,'23.jpg'),(35,'积分列表页中部广告位',0,2,1,900,368,0,0,'04606336969591517.jpg'),(37,'商品列表页左侧广告位',0,1,1,206,300,0,0,'7a4832d109ee46fe7677c1d3c30e067f.gif'),(38,'测试',0,1,1,100,350,0,0,'05228741691455401.png');
/*!40000 ALTER TABLE `pmall_adv_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_album_class`
--

DROP TABLE IF EXISTS `pmall_album_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_album_class` (
  `aclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `aclass_cover` varchar(255) NOT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY (`aclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_album_class`
--

LOCK TABLES `pmall_album_class` WRITE;
/*!40000 ALTER TABLE `pmall_album_class` DISABLE KEYS */;
INSERT INTO `pmall_album_class` VALUES (1,'默认相册',1,'',255,'',1387942806,1),(2,'默认相册',2,'',255,'',1467623186,1),(3,'默认相册',3,'',255,'',1468483851,1),(4,'默认相册',4,'',255,'',1468549786,1),(5,'默认相册',5,'',255,'',1469582086,1);
/*!40000 ALTER TABLE `pmall_album_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_album_pic`
--

DROP TABLE IF EXISTS `pmall_album_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_album_pic` (
  `apic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) DEFAULT '' COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`apic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_album_pic`
--

LOCK TABLES `pmall_album_pic` WRITE;
/*!40000 ALTER TABLE `pmall_album_pic` DISABLE KEYS */;
INSERT INTO `pmall_album_pic` VALUES (1,'21161DF6BD5E592D3A94A5E3557544FF','',1,'1_04752627678636481.jpg',31775,'355x355',1,1421918767),(2,'53783C85E1E735D11B50B8E6AADBF93B','',1,'1_04752627707766698.png',119422,'346x346',1,1421918770),(3,'C0EF26E1C1A949A552A145320C65DF23','',1,'1_04752627711844438.png',96959,'353x354',1,1421918771),(4,'3B82CCA070CD05DCC9A3C2A81630DEF4','',1,'1_04752627715984525.png',78921,'351x352',1,1421918771),(5,'68AE93347F0D5394B7EFE21A0C8A373F','',1,'1_04752627723007356.png',135521,'352x355',1,1421918772),(6,'D918F56D5F825D6A8D9C8C64AC7CF481','',1,'1_04752627731269795.png',79988,'351x354',1,1421918773),(7,'D9455B27C5AB258315753731F4A65EBE','',1,'1_04752627750479728.png',131574,'348x348',1,1421918774),(8,'A858B04E66C8E5041843F5B3D1D31FC7','',1,'1_04752627769865296.jpg',109093,'708x708',1,1421918776),(9,'7545A11A1387E79B48ED63959297688E','',1,'1_04752627779656765.png',121396,'338x352',1,1421918777),(10,'B1DCBB12C64F675422E8D38C82C21AF4','',1,'1_04752627799921979.jpg',33080,'353x353',1,1421918779),(11,'2281C356CDEA385A184F07A2052272E4','',1,'1_04752627802778337.jpg',27744,'350x355',1,1421918780),(12,'741DBFA4AD9D9A2BBF4E9CEC777D0000','',1,'1_04752627805681085.jpg',19598,'350x356',1,1421918780),(13,'6392478718BEF002ABFCF21FC3A3091A','',1,'1_04752627809660767.jpg',19799,'352x356',1,1421918780),(14,'090AC252A32402FF8FD00BC27550E1B9','',1,'1_04752627813773082.jpg',29187,'351x354',1,1421918781),(15,'EBD42647EFE0107599D93446FC61EC2D','',1,'1_04752627843241680.jpg',26620,'354x354',1,1421918784),(16,'1D9FD4F9D477A5A40150C2CACF9481B8','',1,'1_04752627871532105.png',166345,'353x353',1,1421918786),(17,'9F27851370384CC9E0ED9A8771973FF9','',1,'1_04752627900055146.png',162404,'347x347',1,1421918789),(18,'C7CCFC6BAC471D6594C8A96C04FAC364','',1,'1_04752627931531971.jpg',160319,'888x888',1,1421918793),(19,'87C70FD81710F085D764AD4C68D8C974','',1,'1_04752627958339099.jpg',25604,'342x342',1,1421918795),(20,'QQ20160705-0','',2,'2_05210447164396115.jpg',13408,'297x255',2,1467700716),(21,'20160218134636_401','',2,'2_05211324717488064.jpg',143808,'800x800',2,1467788471),(22,'c64661d019936aace98581e8ff73caa9','',2,'2_05213079227148488.jpg',28575,'439x264',2,1467963922),(23,'20141109125909_49_bbfm','',2,'2_05213919611710144.jpg',19388,'418x418',2,1468047961),(24,'20151029095650_952_bbfm','',2,'2_05216575160789666.jpg',36152,'418x418',2,1468313516),(25,'TB1_o8pKFXXXXcGXXXXXXXXXXXX_!!0-item_pic','',4,'4_05219124589505593.jpg',38423,'430x430',4,1468568458),(26,'TB1_o8pKFXXXXcGXXXXXXXXXXXX_!!0-item_pic','',4,'4_05219124845199514.jpg',38423,'430x430',4,1468568484),(27,'example','',2,'2_05222444906791674.jpg',17357,'317x238',2,1468900490),(28,'574cf5b2N3272930a','',2,'2_05222598068424864.jpg',214836,'750x740',2,1468915806),(29,'574cf5d3N5c59ecdb','',2,'2_05222600644047411.jpg',133482,'750x575',2,1468916064),(30,'574cf5c1Ndbe2ff22 (1)','',2,'2_05222600692894734.jpg',130601,'750x716',2,1468916069),(31,'574cf5bdNeae45655 (1)','',2,'2_05222600772248870.jpg',135439,'750x814',2,1468916077),(32,'574cf5baN3dcbf0af','',2,'2_05222600827349265.jpg',191661,'750x844',2,1468916082),(33,'574cf5d3N5c59ecdb','',2,'2_05222601051054500.jpg',133482,'750x575',2,1468916105),(34,'574cf5c1Ndbe2ff22','',2,'2_05222601053816784.jpg',130601,'750x716',2,1468916105),(35,'574cf5baN3dcbf0af','',2,'2_05222601057225340.jpg',191661,'750x844',2,1468916106),(36,'574cf5baN3dcbf0af (1)','',2,'2_05222601060816286.jpg',191661,'750x844',2,1468916106),(37,'574cf5bdNeae45655','',2,'2_05222601064091051.jpg',135439,'750x814',2,1468916106),(38,'574cf5c1Ndbe2ff22 (1)','',2,'2_05222601067019823.jpg',130601,'750x716',2,1468916106),(39,'574cf5bdNeae45655 (1)','',2,'2_05222601069826799.jpg',135439,'750x814',2,1468916107),(40,'574cf5b2N3272930a','',2,'2_05222601073489611.jpg',214836,'750x740',2,1468916107),(41,'test','',1,'1_05227691123264934.jpg',4181,'115x111',1,1469425112),(42,'test','',1,'1_05227693181029304.jpg',18760,'800x800',1,1469425317),(43,'test','',1,'1_05227694227948989.jpg',18760,'800x800',1,1469425422),(44,'test','',1,'1_05227695267124957.jpg',18760,'800x800',1,1469425526),(45,'tesy','',1,'1_05227696969486977.jpg',4283,'118x115',1,1469425696),(46,'test','',1,'1_05227697147908245.jpg',18760,'800x800',1,1469425714),(47,'tesy','',1,'1_05227697267821957.jpg',4283,'118x115',1,1469425726),(48,'tesy','',1,'1_05227701535745608.jpg',4283,'118x115',1,1469426153),(49,'tesy','',1,'1_05227702508114739.jpg',4283,'118x115',1,1469426250),(50,'test','',1,'1_05227702559122792.jpg',18760,'800x800',1,1469426255);
/*!40000 ALTER TABLE `pmall_album_pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_area`
--

DROP TABLE IF EXISTS `pmall_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区父ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度，从1开始',
  `area_region` varchar(3) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_area`
--

LOCK TABLES `pmall_area` WRITE;
/*!40000 ALTER TABLE `pmall_area` DISABLE KEYS */;
INSERT INTO `pmall_area` VALUES (1,'北京',0,0,1,'华北'),(2,'天津',0,0,1,'华北'),(3,'河北',0,0,1,'华北'),(4,'山西',0,0,1,'华北'),(5,'内蒙古',0,0,1,'华北'),(6,'辽宁',0,0,1,'东北'),(7,'吉林',0,0,1,'东北'),(8,'黑龙江',0,0,1,'东北'),(9,'上海',0,0,1,'华东'),(10,'江苏',0,0,1,'华东'),(11,'浙江',0,0,1,'华东'),(12,'安徽',0,0,1,'华东'),(13,'福建',0,0,1,'华南'),(14,'江西',0,0,1,'华东'),(15,'山东',0,0,1,'华东'),(16,'河南',0,0,1,'华中'),(17,'湖北',0,0,1,'华中'),(18,'湖南',0,0,1,'华中'),(19,'广东',0,0,1,'华南'),(20,'广西',0,0,1,'华南'),(21,'海南',0,0,1,'华南'),(22,'重庆',0,0,1,'西南'),(23,'四川',0,0,1,'西南'),(24,'贵州',0,0,1,'西南'),(25,'云南',0,0,1,'西南'),(26,'西藏',0,0,1,'西南'),(27,'陕西',0,0,1,'西北'),(28,'甘肃',0,0,1,'西北'),(29,'青海',0,0,1,'西北'),(30,'宁夏',0,0,1,'西北'),(31,'新疆',0,0,1,'西北'),(32,'台湾',0,0,1,'港澳台'),(33,'香港',0,0,1,'港澳台'),(34,'澳门',0,0,1,'港澳台'),(35,'海外',0,0,1,'海外'),(36,'北京市',1,0,2,NULL),(37,'东城区',36,0,3,NULL),(38,'西城区',36,0,3,NULL),(39,'上海市',9,0,2,NULL),(40,'天津市',2,0,2,NULL),(41,'朝阳区',36,0,3,NULL),(42,'丰台区',36,0,3,NULL),(43,'石景山区',36,0,3,NULL),(44,'海淀区',36,0,3,NULL),(45,'门头沟区',36,0,3,NULL),(46,'房山区',36,0,3,NULL),(47,'通州区',36,0,3,NULL),(48,'顺义区',36,0,3,NULL),(49,'昌平区',36,0,3,NULL),(50,'大兴区',36,0,3,NULL),(51,'怀柔区',36,0,3,NULL),(52,'平谷区',36,0,3,NULL),(53,'密云县',36,0,3,NULL),(54,'延庆县',36,0,3,NULL),(55,'和平区',40,0,3,NULL),(56,'河东区',40,0,3,NULL),(57,'河西区',40,0,3,NULL),(58,'南开区',40,0,3,NULL),(59,'河北区',40,0,3,NULL),(60,'红桥区',40,0,3,NULL),(61,'塘沽区',40,0,3,NULL),(62,'重庆市',22,0,2,NULL),(64,'东丽区',40,0,3,NULL),(65,'西青区',40,0,3,NULL),(66,'津南区',40,0,3,NULL),(67,'北辰区',40,0,3,NULL),(68,'武清区',40,0,3,NULL),(69,'宝坻区',40,0,3,NULL),(70,'宁河县',40,0,3,NULL),(71,'静海县',40,0,3,NULL),(72,'蓟县',40,0,3,NULL),(73,'石家庄市',3,0,2,NULL),(74,'唐山市',3,0,2,NULL),(75,'秦皇岛市',3,0,2,NULL),(76,'邯郸市',3,0,2,NULL),(77,'邢台市',3,0,2,NULL),(78,'保定市',3,0,2,NULL),(79,'张家口市',3,0,2,NULL),(80,'承德市',3,0,2,NULL),(81,'衡水市',3,0,2,NULL),(82,'廊坊市',3,0,2,NULL),(83,'沧州市',3,0,2,NULL),(84,'太原市',4,0,2,NULL),(85,'大同市',4,0,2,NULL),(86,'阳泉市',4,0,2,NULL),(87,'长治市',4,0,2,NULL),(88,'晋城市',4,0,2,NULL),(89,'朔州市',4,0,2,NULL),(90,'晋中市',4,0,2,NULL),(91,'运城市',4,0,2,NULL),(92,'忻州市',4,0,2,NULL),(93,'临汾市',4,0,2,NULL),(94,'吕梁市',4,0,2,NULL),(95,'呼和浩特市',5,0,2,NULL),(96,'包头市',5,0,2,NULL),(97,'乌海市',5,0,2,NULL),(98,'赤峰市',5,0,2,NULL),(99,'通辽市',5,0,2,NULL),(100,'鄂尔多斯市',5,0,2,NULL),(101,'呼伦贝尔市',5,0,2,NULL),(102,'巴彦淖尔市',5,0,2,NULL),(103,'乌兰察布市',5,0,2,NULL),(104,'兴安盟',5,0,2,NULL),(105,'锡林郭勒盟',5,0,2,NULL),(106,'阿拉善盟',5,0,2,NULL),(107,'沈阳市',6,0,2,NULL),(108,'大连市',6,0,2,NULL),(109,'鞍山市',6,0,2,NULL),(110,'抚顺市',6,0,2,NULL),(111,'本溪市',6,0,2,NULL),(112,'丹东市',6,0,2,NULL),(113,'锦州市',6,0,2,NULL),(114,'营口市',6,0,2,NULL),(115,'阜新市',6,0,2,NULL),(116,'辽阳市',6,0,2,NULL),(117,'盘锦市',6,0,2,NULL),(118,'铁岭市',6,0,2,NULL),(119,'朝阳市',6,0,2,NULL),(120,'葫芦岛市',6,0,2,NULL),(121,'长春市',7,0,2,NULL),(122,'吉林市',7,0,2,NULL),(123,'四平市',7,0,2,NULL),(124,'辽源市',7,0,2,NULL),(125,'通化市',7,0,2,NULL),(126,'白山市',7,0,2,NULL),(127,'松原市',7,0,2,NULL),(128,'白城市',7,0,2,NULL),(129,'延边朝鲜族自治州',7,0,2,NULL),(130,'哈尔滨市',8,0,2,NULL),(131,'齐齐哈尔市',8,0,2,NULL),(132,'鸡西市',8,0,2,NULL),(133,'鹤岗市',8,0,2,NULL),(134,'双鸭山市',8,0,2,NULL),(135,'大庆市',8,0,2,NULL),(136,'伊春市',8,0,2,NULL),(137,'佳木斯市',8,0,2,NULL),(138,'七台河市',8,0,2,NULL),(139,'牡丹江市',8,0,2,NULL),(140,'黑河市',8,0,2,NULL),(141,'绥化市',8,0,2,NULL),(142,'大兴安岭地区',8,0,2,NULL),(143,'黄浦区',39,0,3,NULL),(144,'卢湾区',39,0,3,NULL),(145,'徐汇区',39,0,3,NULL),(146,'长宁区',39,0,3,NULL),(147,'静安区',39,0,3,NULL),(148,'普陀区',39,0,3,NULL),(149,'闸北区',39,0,3,NULL),(150,'虹口区',39,0,3,NULL),(151,'杨浦区',39,0,3,NULL),(152,'闵行区',39,0,3,NULL),(153,'宝山区',39,0,3,NULL),(154,'嘉定区',39,0,3,NULL),(155,'浦东新区',39,0,3,NULL),(156,'金山区',39,0,3,NULL),(157,'松江区',39,0,3,NULL),(158,'青浦区',39,0,3,NULL),(159,'南汇区',39,0,3,NULL),(160,'奉贤区',39,0,3,NULL),(161,'崇明县',39,0,3,NULL),(162,'南京市',10,0,2,NULL),(163,'无锡市',10,0,2,NULL),(164,'徐州市',10,0,2,NULL),(165,'常州市',10,0,2,NULL),(166,'苏州市',10,0,2,NULL),(167,'南通市',10,0,2,NULL),(168,'连云港市',10,0,2,NULL),(169,'淮安市',10,0,2,NULL),(170,'盐城市',10,0,2,NULL),(171,'扬州市',10,0,2,NULL),(172,'镇江市',10,0,2,NULL),(173,'泰州市',10,0,2,NULL),(174,'宿迁市',10,0,2,NULL),(175,'杭州市',11,0,2,NULL),(176,'宁波市',11,0,2,NULL),(177,'温州市',11,0,2,NULL),(178,'嘉兴市',11,0,2,NULL),(179,'湖州市',11,0,2,NULL),(180,'绍兴市',11,0,2,NULL),(181,'舟山市',11,0,2,NULL),(182,'衢州市',11,0,2,NULL),(183,'金华市',11,0,2,NULL),(184,'台州市',11,0,2,NULL),(185,'丽水市',11,0,2,NULL),(186,'合肥市',12,0,2,NULL),(187,'芜湖市',12,0,2,NULL),(188,'蚌埠市',12,0,2,NULL),(189,'淮南市',12,0,2,NULL),(190,'马鞍山市',12,0,2,NULL),(191,'淮北市',12,0,2,NULL),(192,'铜陵市',12,0,2,NULL),(193,'安庆市',12,0,2,NULL),(194,'黄山市',12,0,2,NULL),(195,'滁州市',12,0,2,NULL),(196,'阜阳市',12,0,2,NULL),(197,'宿州市',12,0,2,NULL),(198,'巢湖市',12,0,2,NULL),(199,'六安市',12,0,2,NULL),(200,'亳州市',12,0,2,NULL),(201,'池州市',12,0,2,NULL),(202,'宣城市',12,0,2,NULL),(203,'福州市',13,0,2,NULL),(204,'厦门市',13,0,2,NULL),(205,'莆田市',13,0,2,NULL),(206,'三明市',13,0,2,NULL),(207,'泉州市',13,0,2,NULL),(208,'漳州市',13,0,2,NULL),(209,'南平市',13,0,2,NULL),(210,'龙岩市',13,0,2,NULL),(211,'宁德市',13,0,2,NULL),(212,'南昌市',14,0,2,NULL),(213,'景德镇市',14,0,2,NULL),(214,'萍乡市',14,0,2,NULL),(215,'九江市',14,0,2,NULL),(216,'新余市',14,0,2,NULL),(217,'鹰潭市',14,0,2,NULL),(218,'赣州市',14,0,2,NULL),(219,'吉安市',14,0,2,NULL),(220,'宜春市',14,0,2,NULL),(221,'抚州市',14,0,2,NULL),(222,'上饶市',14,0,2,NULL),(223,'济南市',15,0,2,NULL),(224,'青岛市',15,0,2,NULL),(225,'淄博市',15,0,2,NULL),(226,'枣庄市',15,0,2,NULL),(227,'东营市',15,0,2,NULL),(228,'烟台市',15,0,2,NULL),(229,'潍坊市',15,0,2,NULL),(230,'济宁市',15,0,2,NULL),(231,'泰安市',15,0,2,NULL),(232,'威海市',15,0,2,NULL),(233,'日照市',15,0,2,NULL),(234,'莱芜市',15,0,2,NULL),(235,'临沂市',15,0,2,NULL),(236,'德州市',15,0,2,NULL),(237,'聊城市',15,0,2,NULL),(238,'滨州市',15,0,2,NULL),(239,'菏泽市',15,0,2,NULL),(240,'郑州市',16,0,2,NULL),(241,'开封市',16,0,2,NULL),(242,'洛阳市',16,0,2,NULL),(243,'平顶山市',16,0,2,NULL),(244,'安阳市',16,0,2,NULL),(245,'鹤壁市',16,0,2,NULL),(246,'新乡市',16,0,2,NULL),(247,'焦作市',16,0,2,NULL),(248,'濮阳市',16,0,2,NULL),(249,'许昌市',16,0,2,NULL),(250,'漯河市',16,0,2,NULL),(251,'三门峡市',16,0,2,NULL),(252,'南阳市',16,0,2,NULL),(253,'商丘市',16,0,2,NULL),(254,'信阳市',16,0,2,NULL),(255,'周口市',16,0,2,NULL),(256,'驻马店市',16,0,2,NULL),(257,'济源市',16,0,2,NULL),(258,'武汉市',17,0,2,NULL),(259,'黄石市',17,0,2,NULL),(260,'十堰市',17,0,2,NULL),(261,'宜昌市',17,0,2,NULL),(262,'襄樊市',17,0,2,NULL),(263,'鄂州市',17,0,2,NULL),(264,'荆门市',17,0,2,NULL),(265,'孝感市',17,0,2,NULL),(266,'荆州市',17,0,2,NULL),(267,'黄冈市',17,0,2,NULL),(268,'咸宁市',17,0,2,NULL),(269,'随州市',17,0,2,NULL),(270,'恩施土家族苗族自治州',17,0,2,NULL),(271,'仙桃市',17,0,2,NULL),(272,'潜江市',17,0,2,NULL),(273,'天门市',17,0,2,NULL),(274,'神农架林区',17,0,2,NULL),(275,'长沙市',18,0,2,NULL),(276,'株洲市',18,0,2,NULL),(277,'湘潭市',18,0,2,NULL),(278,'衡阳市',18,0,2,NULL),(279,'邵阳市',18,0,2,NULL),(280,'岳阳市',18,0,2,NULL),(281,'常德市',18,0,2,NULL),(282,'张家界市',18,0,2,NULL),(283,'益阳市',18,0,2,NULL),(284,'郴州市',18,0,2,NULL),(285,'永州市',18,0,2,NULL),(286,'怀化市',18,0,2,NULL),(287,'娄底市',18,0,2,NULL),(288,'湘西土家族苗族自治州',18,0,2,NULL),(289,'广州市',19,0,2,NULL),(290,'韶关市',19,0,2,NULL),(291,'深圳市',19,0,2,NULL),(292,'珠海市',19,0,2,NULL),(293,'汕头市',19,0,2,NULL),(294,'佛山市',19,0,2,NULL),(295,'江门市',19,0,2,NULL),(296,'湛江市',19,0,2,NULL),(297,'茂名市',19,0,2,NULL),(298,'肇庆市',19,0,2,NULL),(299,'惠州市',19,0,2,NULL),(300,'梅州市',19,0,2,NULL),(301,'汕尾市',19,0,2,NULL),(302,'河源市',19,0,2,NULL),(303,'阳江市',19,0,2,NULL),(304,'清远市',19,0,2,NULL),(305,'东莞市',19,0,2,NULL),(306,'中山市',19,0,2,NULL),(307,'潮州市',19,0,2,NULL),(308,'揭阳市',19,0,2,NULL),(309,'云浮市',19,0,2,NULL),(310,'南宁市',20,0,2,NULL),(311,'柳州市',20,0,2,NULL),(312,'桂林市',20,0,2,NULL),(313,'梧州市',20,0,2,NULL),(314,'北海市',20,0,2,NULL),(315,'防城港市',20,0,2,NULL),(316,'钦州市',20,0,2,NULL),(317,'贵港市',20,0,2,NULL),(318,'玉林市',20,0,2,NULL),(319,'百色市',20,0,2,NULL),(320,'贺州市',20,0,2,NULL),(321,'河池市',20,0,2,NULL),(322,'来宾市',20,0,2,NULL),(323,'崇左市',20,0,2,NULL),(324,'海口市',21,0,2,NULL),(325,'三亚市',21,0,2,NULL),(326,'五指山市',21,0,2,NULL),(327,'琼海市',21,0,2,NULL),(328,'儋州市',21,0,2,NULL),(329,'文昌市',21,0,2,NULL),(330,'万宁市',21,0,2,NULL),(331,'东方市',21,0,2,NULL),(332,'定安县',21,0,2,NULL),(333,'屯昌县',21,0,2,NULL),(334,'澄迈县',21,0,2,NULL),(335,'临高县',21,0,2,NULL),(336,'白沙黎族自治县',21,0,2,NULL),(337,'昌江黎族自治县',21,0,2,NULL),(338,'乐东黎族自治县',21,0,2,NULL),(339,'陵水黎族自治县',21,0,2,NULL),(340,'保亭黎族苗族自治县',21,0,2,NULL),(341,'琼中黎族苗族自治县',21,0,2,NULL),(342,'西沙群岛',21,0,2,NULL),(343,'南沙群岛',21,0,2,NULL),(344,'中沙群岛的岛礁及其海域',21,0,2,NULL),(345,'万州区',62,0,3,NULL),(346,'涪陵区',62,0,3,NULL),(347,'渝中区',62,0,3,NULL),(348,'大渡口区',62,0,3,NULL),(349,'江北区',62,0,3,NULL),(350,'沙坪坝区',62,0,3,NULL),(351,'九龙坡区',62,0,3,NULL),(352,'南岸区',62,0,3,NULL),(353,'北碚区',62,0,3,NULL),(354,'双桥区',62,0,3,NULL),(355,'万盛区',62,0,3,NULL),(356,'渝北区',62,0,3,NULL),(357,'巴南区',62,0,3,NULL),(358,'黔江区',62,0,3,NULL),(359,'长寿区',62,0,3,NULL),(360,'綦江县',62,0,3,NULL),(361,'潼南县',62,0,3,NULL),(362,'铜梁县',62,0,3,NULL),(363,'大足县',62,0,3,NULL),(364,'荣昌县',62,0,3,NULL),(365,'璧山县',62,0,3,NULL),(366,'梁平县',62,0,3,NULL),(367,'城口县',62,0,3,NULL),(368,'丰都县',62,0,3,NULL),(369,'垫江县',62,0,3,NULL),(370,'武隆县',62,0,3,NULL),(371,'忠县',62,0,3,NULL),(372,'开县',62,0,3,NULL),(373,'云阳县',62,0,3,NULL),(374,'奉节县',62,0,3,NULL),(375,'巫山县',62,0,3,NULL),(376,'巫溪县',62,0,3,NULL),(377,'石柱土家族自治县',62,0,3,NULL),(378,'秀山土家族苗族自治县',62,0,3,NULL),(379,'酉阳土家族苗族自治县',62,0,3,NULL),(380,'彭水苗族土家族自治县',62,0,3,NULL),(381,'江津市',62,0,3,NULL),(382,'合川市',62,0,3,NULL),(383,'永川市',62,0,3,NULL),(384,'南川市',62,0,3,NULL),(385,'成都市',23,0,2,NULL),(386,'自贡市',23,0,2,NULL),(387,'攀枝花市',23,0,2,NULL),(388,'泸州市',23,0,2,NULL),(389,'德阳市',23,0,2,NULL),(390,'绵阳市',23,0,2,NULL),(391,'广元市',23,0,2,NULL),(392,'遂宁市',23,0,2,NULL),(393,'内江市',23,0,2,NULL),(394,'乐山市',23,0,2,NULL),(395,'南充市',23,0,2,NULL),(396,'眉山市',23,0,2,NULL),(397,'宜宾市',23,0,2,NULL),(398,'广安市',23,0,2,NULL),(399,'达州市',23,0,2,NULL),(400,'雅安市',23,0,2,NULL),(401,'巴中市',23,0,2,NULL),(402,'资阳市',23,0,2,NULL),(403,'阿坝藏族羌族自治州',23,0,2,NULL),(404,'甘孜藏族自治州',23,0,2,NULL),(405,'凉山彝族自治州',23,0,2,NULL),(406,'贵阳市',24,0,2,NULL),(407,'六盘水市',24,0,2,NULL),(408,'遵义市',24,0,2,NULL),(409,'安顺市',24,0,2,NULL),(410,'铜仁地区',24,0,2,NULL),(411,'黔西南布依族苗族自治州',24,0,2,NULL),(412,'毕节地区',24,0,2,NULL),(413,'黔东南苗族侗族自治州',24,0,2,NULL),(414,'黔南布依族苗族自治州',24,0,2,NULL),(415,'昆明市',25,0,2,NULL),(416,'曲靖市',25,0,2,NULL),(417,'玉溪市',25,0,2,NULL),(418,'保山市',25,0,2,NULL),(419,'昭通市',25,0,2,NULL),(420,'丽江市',25,0,2,NULL),(421,'思茅市',25,0,2,NULL),(422,'临沧市',25,0,2,NULL),(423,'楚雄彝族自治州',25,0,2,NULL),(424,'红河哈尼族彝族自治州',25,0,2,NULL),(425,'文山壮族苗族自治州',25,0,2,NULL),(426,'西双版纳傣族自治州',25,0,2,NULL),(427,'大理白族自治州',25,0,2,NULL),(428,'德宏傣族景颇族自治州',25,0,2,NULL),(429,'怒江傈僳族自治州',25,0,2,NULL),(430,'迪庆藏族自治州',25,0,2,NULL),(431,'拉萨市',26,0,2,NULL),(432,'昌都地区',26,0,2,NULL),(433,'山南地区',26,0,2,NULL),(434,'日喀则地区',26,0,2,NULL),(435,'那曲地区',26,0,2,NULL),(436,'阿里地区',26,0,2,NULL),(437,'林芝地区',26,0,2,NULL),(438,'西安市',27,0,2,NULL),(439,'铜川市',27,0,2,NULL),(440,'宝鸡市',27,0,2,NULL),(441,'咸阳市',27,0,2,NULL),(442,'渭南市',27,0,2,NULL),(443,'延安市',27,0,2,NULL),(444,'汉中市',27,0,2,NULL),(445,'榆林市',27,0,2,NULL),(446,'安康市',27,0,2,NULL),(447,'商洛市',27,0,2,NULL),(448,'兰州市',28,0,2,NULL),(449,'嘉峪关市',28,0,2,NULL),(450,'金昌市',28,0,2,NULL),(451,'白银市',28,0,2,NULL),(452,'天水市',28,0,2,NULL),(453,'武威市',28,0,2,NULL),(454,'张掖市',28,0,2,NULL),(455,'平凉市',28,0,2,NULL),(456,'酒泉市',28,0,2,NULL),(457,'庆阳市',28,0,2,NULL),(458,'定西市',28,0,2,NULL),(459,'陇南市',28,0,2,NULL),(460,'临夏回族自治州',28,0,2,NULL),(461,'甘南藏族自治州',28,0,2,NULL),(462,'西宁市',29,0,2,NULL),(463,'海东地区',29,0,2,NULL),(464,'海北藏族自治州',29,0,2,NULL),(465,'黄南藏族自治州',29,0,2,NULL),(466,'海南藏族自治州',29,0,2,NULL),(467,'果洛藏族自治州',29,0,2,NULL),(468,'玉树藏族自治州',29,0,2,NULL),(469,'海西蒙古族藏族自治州',29,0,2,NULL),(470,'银川市',30,0,2,NULL),(471,'石嘴山市',30,0,2,NULL),(472,'吴忠市',30,0,2,NULL),(473,'固原市',30,0,2,NULL),(474,'中卫市',30,0,2,NULL),(475,'乌鲁木齐市',31,0,2,NULL),(476,'克拉玛依市',31,0,2,NULL),(477,'吐鲁番地区',31,0,2,NULL),(478,'哈密地区',31,0,2,NULL),(479,'昌吉回族自治州',31,0,2,NULL),(480,'博尔塔拉蒙古自治州',31,0,2,NULL),(481,'巴音郭楞蒙古自治州',31,0,2,NULL),(482,'阿克苏地区',31,0,2,NULL),(483,'克孜勒苏柯尔克孜自治州',31,0,2,NULL),(484,'喀什地区',31,0,2,NULL),(485,'和田地区',31,0,2,NULL),(486,'伊犁哈萨克自治州',31,0,2,NULL),(487,'塔城地区',31,0,2,NULL),(488,'阿勒泰地区',31,0,2,NULL),(489,'石河子市',31,0,2,NULL),(490,'阿拉尔市',31,0,2,NULL),(491,'图木舒克市',31,0,2,NULL),(492,'五家渠市',31,0,2,NULL),(493,'台北市',32,0,2,NULL),(494,'高雄市',32,0,2,NULL),(495,'基隆市',32,0,2,NULL),(496,'台中市',32,0,2,NULL),(497,'台南市',32,0,2,NULL),(498,'新竹市',32,0,2,NULL),(499,'嘉义市',32,0,2,NULL),(500,'台北县',32,0,2,NULL),(501,'宜兰县',32,0,2,NULL),(502,'桃园县',32,0,2,NULL),(503,'新竹县',32,0,2,NULL),(504,'苗栗县',32,0,2,NULL),(505,'台中县',32,0,2,NULL),(506,'彰化县',32,0,2,NULL),(507,'南投县',32,0,2,NULL),(508,'云林县',32,0,2,NULL),(509,'嘉义县',32,0,2,NULL),(510,'台南县',32,0,2,NULL),(511,'高雄县',32,0,2,NULL),(512,'屏东县',32,0,2,NULL),(513,'澎湖县',32,0,2,NULL),(514,'台东县',32,0,2,NULL),(515,'花莲县',32,0,2,NULL),(516,'中西区',33,0,2,NULL),(517,'东区',33,0,2,NULL),(518,'九龙城区',33,0,2,NULL),(519,'观塘区',33,0,2,NULL),(520,'南区',33,0,2,NULL),(521,'深水埗区',33,0,2,NULL),(522,'黄大仙区',33,0,2,NULL),(523,'湾仔区',33,0,2,NULL),(524,'油尖旺区',33,0,2,NULL),(525,'离岛区',33,0,2,NULL),(526,'葵青区',33,0,2,NULL),(527,'北区',33,0,2,NULL),(528,'西贡区',33,0,2,NULL),(529,'沙田区',33,0,2,NULL),(530,'屯门区',33,0,2,NULL),(531,'大埔区',33,0,2,NULL),(532,'荃湾区',33,0,2,NULL),(533,'元朗区',33,0,2,NULL),(534,'澳门特别行政区',34,0,2,NULL),(535,'美国',45055,0,3,NULL),(536,'加拿大',45055,0,3,NULL),(537,'澳大利亚',45055,0,3,NULL),(538,'新西兰',45055,0,3,NULL),(539,'英国',45055,0,3,NULL),(540,'法国',45055,0,3,NULL),(541,'德国',45055,0,3,NULL),(542,'捷克',45055,0,3,NULL),(543,'荷兰',45055,0,3,NULL),(544,'瑞士',45055,0,3,NULL),(545,'希腊',45055,0,3,NULL),(546,'挪威',45055,0,3,NULL),(547,'瑞典',45055,0,3,NULL),(548,'丹麦',45055,0,3,NULL),(549,'芬兰',45055,0,3,NULL),(550,'爱尔兰',45055,0,3,NULL),(551,'奥地利',45055,0,3,NULL),(552,'意大利',45055,0,3,NULL),(553,'乌克兰',45055,0,3,NULL),(554,'俄罗斯',45055,0,3,NULL),(555,'西班牙',45055,0,3,NULL),(556,'韩国',45055,0,3,NULL),(557,'新加坡',45055,0,3,NULL),(558,'马来西亚',45055,0,3,NULL),(559,'印度',45055,0,3,NULL),(560,'泰国',45055,0,3,NULL),(561,'日本',45055,0,3,NULL),(562,'巴西',45055,0,3,NULL),(563,'阿根廷',45055,0,3,NULL),(564,'南非',45055,0,3,NULL),(565,'埃及',45055,0,3,NULL),(566,'其他',36,0,3,NULL),(1126,'井陉县',73,0,3,NULL),(1127,'井陉矿区',73,0,3,NULL),(1128,'元氏县',73,0,3,NULL),(1129,'平山县',73,0,3,NULL),(1130,'新乐市',73,0,3,NULL),(1131,'新华区',73,0,3,NULL),(1132,'无极县',73,0,3,NULL),(1133,'晋州市',73,0,3,NULL),(1134,'栾城县',73,0,3,NULL),(1135,'桥东区',73,0,3,NULL),(1136,'桥西区',73,0,3,NULL),(1137,'正定县',73,0,3,NULL),(1138,'深泽县',73,0,3,NULL),(1139,'灵寿县',73,0,3,NULL),(1140,'藁城市',73,0,3,NULL),(1141,'行唐县',73,0,3,NULL),(1142,'裕华区',73,0,3,NULL),(1143,'赞皇县',73,0,3,NULL),(1144,'赵县',73,0,3,NULL),(1145,'辛集市',73,0,3,NULL),(1146,'长安区',73,0,3,NULL),(1147,'高邑县',73,0,3,NULL),(1148,'鹿泉市',73,0,3,NULL),(1149,'丰南区',74,0,3,NULL),(1150,'丰润区',74,0,3,NULL),(1151,'乐亭县',74,0,3,NULL),(1152,'古冶区',74,0,3,NULL),(1153,'唐海县',74,0,3,NULL),(1154,'开平区',74,0,3,NULL),(1155,'滦南县',74,0,3,NULL),(1156,'滦县',74,0,3,NULL),(1157,'玉田县',74,0,3,NULL),(1158,'路北区',74,0,3,NULL),(1159,'路南区',74,0,3,NULL),(1160,'迁安市',74,0,3,NULL),(1161,'迁西县',74,0,3,NULL),(1162,'遵化市',74,0,3,NULL),(1163,'北戴河区',75,0,3,NULL),(1164,'卢龙县',75,0,3,NULL),(1165,'山海关区',75,0,3,NULL),(1166,'抚宁县',75,0,3,NULL),(1167,'昌黎县',75,0,3,NULL),(1168,'海港区',75,0,3,NULL),(1169,'青龙满族自治县',75,0,3,NULL),(1170,'丛台区',76,0,3,NULL),(1171,'临漳县',76,0,3,NULL),(1172,'复兴区',76,0,3,NULL),(1173,'大名县',76,0,3,NULL),(1174,'峰峰矿区',76,0,3,NULL),(1175,'广平县',76,0,3,NULL),(1176,'成安县',76,0,3,NULL),(1177,'曲周县',76,0,3,NULL),(1178,'武安市',76,0,3,NULL),(1179,'永年县',76,0,3,NULL),(1180,'涉县',76,0,3,NULL),(1181,'磁县',76,0,3,NULL),(1182,'肥乡县',76,0,3,NULL),(1183,'邯山区',76,0,3,NULL),(1184,'邯郸县',76,0,3,NULL),(1185,'邱县',76,0,3,NULL),(1186,'馆陶县',76,0,3,NULL),(1187,'魏县',76,0,3,NULL),(1188,'鸡泽县',76,0,3,NULL),(1189,'临城县',77,0,3,NULL),(1190,'临西县',77,0,3,NULL),(1191,'任县',77,0,3,NULL),(1192,'内丘县',77,0,3,NULL),(1193,'南和县',77,0,3,NULL),(1194,'南宫市',77,0,3,NULL),(1195,'威县',77,0,3,NULL),(1196,'宁晋县',77,0,3,NULL),(1197,'巨鹿县',77,0,3,NULL),(1198,'平乡县',77,0,3,NULL),(1199,'广宗县',77,0,3,NULL),(1200,'新河县',77,0,3,NULL),(1201,'柏乡县',77,0,3,NULL),(1202,'桥东区',77,0,3,NULL),(1203,'桥西区',77,0,3,NULL),(1204,'沙河市',77,0,3,NULL),(1205,'清河县',77,0,3,NULL),(1206,'邢台县',77,0,3,NULL),(1207,'隆尧县',77,0,3,NULL),(1208,'北市区',78,0,3,NULL),(1209,'南市区',78,0,3,NULL),(1210,'博野县',78,0,3,NULL),(1211,'唐县',78,0,3,NULL),(1212,'安国市',78,0,3,NULL),(1213,'安新县',78,0,3,NULL),(1214,'定兴县',78,0,3,NULL),(1215,'定州市',78,0,3,NULL),(1216,'容城县',78,0,3,NULL),(1217,'徐水县',78,0,3,NULL),(1218,'新市区',78,0,3,NULL),(1219,'易县',78,0,3,NULL),(1220,'曲阳县',78,0,3,NULL),(1221,'望都县',78,0,3,NULL),(1222,'涞水县',78,0,3,NULL),(1223,'涞源县',78,0,3,NULL),(1224,'涿州市',78,0,3,NULL),(1225,'清苑县',78,0,3,NULL),(1226,'满城县',78,0,3,NULL),(1227,'蠡县',78,0,3,NULL),(1228,'阜平县',78,0,3,NULL),(1229,'雄县',78,0,3,NULL),(1230,'顺平县',78,0,3,NULL),(1231,'高碑店市',78,0,3,NULL),(1232,'高阳县',78,0,3,NULL),(1233,'万全县',79,0,3,NULL),(1234,'下花园区',79,0,3,NULL),(1235,'宣化区',79,0,3,NULL),(1236,'宣化县',79,0,3,NULL),(1237,'尚义县',79,0,3,NULL),(1238,'崇礼县',79,0,3,NULL),(1239,'康保县',79,0,3,NULL),(1240,'张北县',79,0,3,NULL),(1241,'怀安县',79,0,3,NULL),(1242,'怀来县',79,0,3,NULL),(1243,'桥东区',79,0,3,NULL),(1244,'桥西区',79,0,3,NULL),(1245,'沽源县',79,0,3,NULL),(1246,'涿鹿县',79,0,3,NULL),(1247,'蔚县',79,0,3,NULL),(1248,'赤城县',79,0,3,NULL),(1249,'阳原县',79,0,3,NULL),(1250,'丰宁满族自治县',80,0,3,NULL),(1251,'兴隆县',80,0,3,NULL),(1252,'双桥区',80,0,3,NULL),(1253,'双滦区',80,0,3,NULL),(1254,'围场满族蒙古族自治县',80,0,3,NULL),(1255,'宽城满族自治县',80,0,3,NULL),(1256,'平泉县',80,0,3,NULL),(1257,'承德县',80,0,3,NULL),(1258,'滦平县',80,0,3,NULL),(1259,'隆化县',80,0,3,NULL),(1260,'鹰手营子矿区',80,0,3,NULL),(1261,'冀州市',81,0,3,NULL),(1262,'安平县',81,0,3,NULL),(1263,'故城县',81,0,3,NULL),(1264,'景县',81,0,3,NULL),(1265,'枣强县',81,0,3,NULL),(1266,'桃城区',81,0,3,NULL),(1267,'武强县',81,0,3,NULL),(1268,'武邑县',81,0,3,NULL),(1269,'深州市',81,0,3,NULL),(1270,'阜城县',81,0,3,NULL),(1271,'饶阳县',81,0,3,NULL),(1272,'三河市',82,0,3,NULL),(1273,'固安县',82,0,3,NULL),(1274,'大厂回族自治县',82,0,3,NULL),(1275,'大城县',82,0,3,NULL),(1276,'安次区',82,0,3,NULL),(1277,'广阳区',82,0,3,NULL),(1278,'文安县',82,0,3,NULL),(1279,'永清县',82,0,3,NULL),(1280,'霸州市',82,0,3,NULL),(1281,'香河县',82,0,3,NULL),(1282,'东光县',83,0,3,NULL),(1283,'任丘市',83,0,3,NULL),(1284,'南皮县',83,0,3,NULL),(1285,'吴桥县',83,0,3,NULL),(1286,'孟村回族自治县',83,0,3,NULL),(1287,'新华区',83,0,3,NULL),(1288,'沧县',83,0,3,NULL),(1289,'河间市',83,0,3,NULL),(1290,'泊头市',83,0,3,NULL),(1291,'海兴县',83,0,3,NULL),(1292,'献县',83,0,3,NULL),(1293,'盐山县',83,0,3,NULL),(1294,'肃宁县',83,0,3,NULL),(1295,'运河区',83,0,3,NULL),(1296,'青县',83,0,3,NULL),(1297,'黄骅市',83,0,3,NULL),(1298,'万柏林区',84,0,3,NULL),(1299,'古交市',84,0,3,NULL),(1300,'娄烦县',84,0,3,NULL),(1301,'小店区',84,0,3,NULL),(1302,'尖草坪区',84,0,3,NULL),(1303,'晋源区',84,0,3,NULL),(1304,'杏花岭区',84,0,3,NULL),(1305,'清徐县',84,0,3,NULL),(1306,'迎泽区',84,0,3,NULL),(1307,'阳曲县',84,0,3,NULL),(1308,'南郊区',85,0,3,NULL),(1309,'城区',85,0,3,NULL),(1310,'大同县',85,0,3,NULL),(1311,'天镇县',85,0,3,NULL),(1312,'左云县',85,0,3,NULL),(1313,'广灵县',85,0,3,NULL),(1314,'新荣区',85,0,3,NULL),(1315,'浑源县',85,0,3,NULL),(1316,'灵丘县',85,0,3,NULL),(1317,'矿区',85,0,3,NULL),(1318,'阳高县',85,0,3,NULL),(1319,'城区',86,0,3,NULL),(1320,'平定县',86,0,3,NULL),(1321,'盂县',86,0,3,NULL),(1322,'矿区',86,0,3,NULL),(1323,'郊区',86,0,3,NULL),(1324,'城区',87,0,3,NULL),(1325,'壶关县',87,0,3,NULL),(1326,'屯留县',87,0,3,NULL),(1327,'平顺县',87,0,3,NULL),(1328,'武乡县',87,0,3,NULL),(1329,'沁县',87,0,3,NULL),(1330,'沁源县',87,0,3,NULL),(1331,'潞城市',87,0,3,NULL),(1332,'襄垣县',87,0,3,NULL),(1333,'郊区',87,0,3,NULL),(1334,'长子县',87,0,3,NULL),(1335,'长治县',87,0,3,NULL),(1336,'黎城县',87,0,3,NULL),(1337,'城区',88,0,3,NULL),(1338,'沁水县',88,0,3,NULL),(1339,'泽州县',88,0,3,NULL),(1340,'阳城县',88,0,3,NULL),(1341,'陵川县',88,0,3,NULL),(1342,'高平市',88,0,3,NULL),(1343,'右玉县',89,0,3,NULL),(1344,'山阴县',89,0,3,NULL),(1345,'平鲁区',89,0,3,NULL),(1346,'应县',89,0,3,NULL),(1347,'怀仁县',89,0,3,NULL),(1348,'朔城区',89,0,3,NULL),(1349,'介休市',90,0,3,NULL),(1350,'和顺县',90,0,3,NULL),(1351,'太谷县',90,0,3,NULL),(1352,'寿阳县',90,0,3,NULL),(1353,'左权县',90,0,3,NULL),(1354,'平遥县',90,0,3,NULL),(1355,'昔阳县',90,0,3,NULL),(1356,'榆次区',90,0,3,NULL),(1357,'榆社县',90,0,3,NULL),(1358,'灵石县',90,0,3,NULL),(1359,'祁县',90,0,3,NULL),(1360,'万荣县',91,0,3,NULL),(1361,'临猗县',91,0,3,NULL),(1362,'垣曲县',91,0,3,NULL),(1363,'夏县',91,0,3,NULL),(1364,'平陆县',91,0,3,NULL),(1365,'新绛县',91,0,3,NULL),(1366,'永济市',91,0,3,NULL),(1367,'河津市',91,0,3,NULL),(1368,'盐湖区',91,0,3,NULL),(1369,'稷山县',91,0,3,NULL),(1370,'绛县',91,0,3,NULL),(1371,'芮城县',91,0,3,NULL),(1372,'闻喜县',91,0,3,NULL),(1373,'五台县',92,0,3,NULL),(1374,'五寨县',92,0,3,NULL),(1375,'代县',92,0,3,NULL),(1376,'保德县',92,0,3,NULL),(1377,'偏关县',92,0,3,NULL),(1378,'原平市',92,0,3,NULL),(1379,'宁武县',92,0,3,NULL),(1380,'定襄县',92,0,3,NULL),(1381,'岢岚县',92,0,3,NULL),(1382,'忻府区',92,0,3,NULL),(1383,'河曲县',92,0,3,NULL),(1384,'神池县',92,0,3,NULL),(1385,'繁峙县',92,0,3,NULL),(1386,'静乐县',92,0,3,NULL),(1387,'乡宁县',93,0,3,NULL),(1388,'侯马市',93,0,3,NULL),(1389,'古县',93,0,3,NULL),(1390,'吉县',93,0,3,NULL),(1391,'大宁县',93,0,3,NULL),(1392,'安泽县',93,0,3,NULL),(1393,'尧都区',93,0,3,NULL),(1394,'曲沃县',93,0,3,NULL),(1395,'永和县',93,0,3,NULL),(1396,'汾西县',93,0,3,NULL),(1397,'洪洞县',93,0,3,NULL),(1398,'浮山县',93,0,3,NULL),(1399,'翼城县',93,0,3,NULL),(1400,'蒲县',93,0,3,NULL),(1401,'襄汾县',93,0,3,NULL),(1402,'隰县',93,0,3,NULL),(1403,'霍州市',93,0,3,NULL),(1404,'中阳县',94,0,3,NULL),(1405,'临县',94,0,3,NULL),(1406,'交口县',94,0,3,NULL),(1407,'交城县',94,0,3,NULL),(1408,'兴县',94,0,3,NULL),(1409,'孝义市',94,0,3,NULL),(1410,'岚县',94,0,3,NULL),(1411,'文水县',94,0,3,NULL),(1412,'方山县',94,0,3,NULL),(1413,'柳林县',94,0,3,NULL),(1414,'汾阳市',94,0,3,NULL),(1415,'石楼县',94,0,3,NULL),(1416,'离石区',94,0,3,NULL),(1417,'和林格尔县',95,0,3,NULL),(1418,'回民区',95,0,3,NULL),(1419,'土默特左旗',95,0,3,NULL),(1420,'托克托县',95,0,3,NULL),(1421,'新城区',95,0,3,NULL),(1422,'武川县',95,0,3,NULL),(1423,'清水河县',95,0,3,NULL),(1424,'玉泉区',95,0,3,NULL),(1425,'赛罕区',95,0,3,NULL),(1426,'东河区',96,0,3,NULL),(1427,'九原区',96,0,3,NULL),(1428,'固阳县',96,0,3,NULL),(1429,'土默特右旗',96,0,3,NULL),(1430,'昆都仑区',96,0,3,NULL),(1431,'白云矿区',96,0,3,NULL),(1432,'石拐区',96,0,3,NULL),(1433,'达尔罕茂明安联合旗',96,0,3,NULL),(1434,'青山区',96,0,3,NULL),(1435,'乌达区',97,0,3,NULL),(1436,'海勃湾区',97,0,3,NULL),(1437,'海南区',97,0,3,NULL),(1438,'元宝山区',98,0,3,NULL),(1439,'克什克腾旗',98,0,3,NULL),(1440,'喀喇沁旗',98,0,3,NULL),(1441,'宁城县',98,0,3,NULL),(1442,'巴林右旗',98,0,3,NULL),(1443,'巴林左旗',98,0,3,NULL),(1444,'敖汉旗',98,0,3,NULL),(1445,'松山区',98,0,3,NULL),(1446,'林西县',98,0,3,NULL),(1447,'红山区',98,0,3,NULL),(1448,'翁牛特旗',98,0,3,NULL),(1449,'阿鲁科尔沁旗',98,0,3,NULL),(1450,'奈曼旗',99,0,3,NULL),(1451,'库伦旗',99,0,3,NULL),(1452,'开鲁县',99,0,3,NULL),(1453,'扎鲁特旗',99,0,3,NULL),(1454,'科尔沁区',99,0,3,NULL),(1455,'科尔沁左翼中旗',99,0,3,NULL),(1456,'科尔沁左翼后旗',99,0,3,NULL),(1457,'霍林郭勒市',99,0,3,NULL),(1458,'东胜区',100,0,3,NULL),(1459,'乌审旗',100,0,3,NULL),(1460,'伊金霍洛旗',100,0,3,NULL),(1461,'准格尔旗',100,0,3,NULL),(1462,'杭锦旗',100,0,3,NULL),(1463,'达拉特旗',100,0,3,NULL),(1464,'鄂东胜区',100,0,3,NULL),(1465,'鄂托克前旗',100,0,3,NULL),(1466,'鄂托克旗',100,0,3,NULL),(1467,'扎兰屯市',101,0,3,NULL),(1468,'新巴尔虎右旗',101,0,3,NULL),(1469,'新巴尔虎左旗',101,0,3,NULL),(1470,'根河市',101,0,3,NULL),(1471,'海拉尔区',101,0,3,NULL),(1472,'满洲里市',101,0,3,NULL),(1473,'牙克石市',101,0,3,NULL),(1474,'莫力达瓦达斡尔族自治旗',101,0,3,NULL),(1475,'鄂伦春自治旗',101,0,3,NULL),(1476,'鄂温克族自治旗',101,0,3,NULL),(1477,'阿荣旗',101,0,3,NULL),(1478,'陈巴尔虎旗',101,0,3,NULL),(1479,'额尔古纳市',101,0,3,NULL),(1480,'临河区',102,0,3,NULL),(1481,'乌拉特中旗',102,0,3,NULL),(1482,'乌拉特前旗',102,0,3,NULL),(1483,'乌拉特后旗',102,0,3,NULL),(1484,'五原县',102,0,3,NULL),(1485,'杭锦后旗',102,0,3,NULL),(1486,'磴口县',102,0,3,NULL),(1487,'丰镇市',103,0,3,NULL),(1488,'兴和县',103,0,3,NULL),(1489,'凉城县',103,0,3,NULL),(1490,'化德县',103,0,3,NULL),(1491,'卓资县',103,0,3,NULL),(1492,'商都县',103,0,3,NULL),(1493,'四子王旗',103,0,3,NULL),(1494,'察哈尔右翼中旗',103,0,3,NULL),(1495,'察哈尔右翼前旗',103,0,3,NULL),(1496,'察哈尔右翼后旗',103,0,3,NULL),(1497,'集宁区',103,0,3,NULL),(1498,'乌兰浩特市',104,0,3,NULL),(1499,'扎赉特旗',104,0,3,NULL),(1500,'科尔沁右翼中旗',104,0,3,NULL),(1501,'科尔沁右翼前旗',104,0,3,NULL),(1502,'突泉县',104,0,3,NULL),(1503,'阿尔山市',104,0,3,NULL),(1504,'东乌珠穆沁旗',105,0,3,NULL),(1505,'二连浩特市',105,0,3,NULL),(1506,'多伦县',105,0,3,NULL),(1507,'太仆寺旗',105,0,3,NULL),(1508,'正蓝旗',105,0,3,NULL),(1509,'正镶白旗',105,0,3,NULL),(1510,'苏尼特右旗',105,0,3,NULL),(1511,'苏尼特左旗',105,0,3,NULL),(1512,'西乌珠穆沁旗',105,0,3,NULL),(1513,'锡林浩特市',105,0,3,NULL),(1514,'镶黄旗',105,0,3,NULL),(1515,'阿巴嘎旗',105,0,3,NULL),(1516,'阿拉善右旗',106,0,3,NULL),(1517,'阿拉善左旗',106,0,3,NULL),(1518,'额济纳旗',106,0,3,NULL),(1519,'东陵区',107,0,3,NULL),(1520,'于洪区',107,0,3,NULL),(1521,'和平区',107,0,3,NULL),(1522,'大东区',107,0,3,NULL),(1523,'康平县',107,0,3,NULL),(1524,'新民市',107,0,3,NULL),(1525,'沈北新区',107,0,3,NULL),(1526,'沈河区',107,0,3,NULL),(1527,'法库县',107,0,3,NULL),(1528,'皇姑区',107,0,3,NULL),(1529,'苏家屯区',107,0,3,NULL),(1530,'辽中县',107,0,3,NULL),(1531,'铁西区',107,0,3,NULL),(1532,'中山区',108,0,3,NULL),(1533,'庄河市',108,0,3,NULL),(1534,'旅顺口区',108,0,3,NULL),(1535,'普兰店市',108,0,3,NULL),(1536,'沙河口区',108,0,3,NULL),(1537,'瓦房店市',108,0,3,NULL),(1538,'甘井子区',108,0,3,NULL),(1539,'西岗区',108,0,3,NULL),(1540,'金州区',108,0,3,NULL),(1541,'长海县',108,0,3,NULL),(1542,'千山区',109,0,3,NULL),(1543,'台安县',109,0,3,NULL),(1544,'岫岩满族自治县',109,0,3,NULL),(1545,'海城市',109,0,3,NULL),(1546,'立山区',109,0,3,NULL),(1547,'铁东区',109,0,3,NULL),(1548,'铁西区',109,0,3,NULL),(1549,'东洲区',110,0,3,NULL),(1550,'抚顺县',110,0,3,NULL),(1551,'新宾满族自治县',110,0,3,NULL),(1552,'新抚区',110,0,3,NULL),(1553,'望花区',110,0,3,NULL),(1554,'清原满族自治县',110,0,3,NULL),(1555,'顺城区',110,0,3,NULL),(1556,'南芬区',111,0,3,NULL),(1557,'平山区',111,0,3,NULL),(1558,'明山区',111,0,3,NULL),(1559,'本溪满族自治县',111,0,3,NULL),(1560,'桓仁满族自治县',111,0,3,NULL),(1561,'溪湖区',111,0,3,NULL),(1562,'东港市',112,0,3,NULL),(1563,'元宝区',112,0,3,NULL),(1564,'凤城市',112,0,3,NULL),(1565,'宽甸满族自治县',112,0,3,NULL),(1566,'振兴区',112,0,3,NULL),(1567,'振安区',112,0,3,NULL),(1568,'义县',113,0,3,NULL),(1569,'凌河区',113,0,3,NULL),(1570,'凌海市',113,0,3,NULL),(1571,'北镇市',113,0,3,NULL),(1572,'古塔区',113,0,3,NULL),(1573,'太和区',113,0,3,NULL),(1574,'黑山县',113,0,3,NULL),(1575,'大石桥市',114,0,3,NULL),(1576,'盖州市',114,0,3,NULL),(1577,'站前区',114,0,3,NULL),(1578,'老边区',114,0,3,NULL),(1579,'西市区',114,0,3,NULL),(1580,'鲅鱼圈区',114,0,3,NULL),(1581,'太平区',115,0,3,NULL),(1582,'彰武县',115,0,3,NULL),(1583,'新邱区',115,0,3,NULL),(1584,'海州区',115,0,3,NULL),(1585,'清河门区',115,0,3,NULL),(1586,'细河区',115,0,3,NULL),(1587,'蒙古族自治县',115,0,3,NULL),(1588,'太子河区',116,0,3,NULL),(1589,'宏伟区',116,0,3,NULL),(1590,'弓长岭区',116,0,3,NULL),(1591,'文圣区',116,0,3,NULL),(1592,'灯塔市',116,0,3,NULL),(1593,'白塔区',116,0,3,NULL),(1594,'辽阳县',116,0,3,NULL),(1595,'兴隆台区',117,0,3,NULL),(1596,'双台子区',117,0,3,NULL),(1597,'大洼县',117,0,3,NULL),(1598,'盘山县',117,0,3,NULL),(1599,'开原市',118,0,3,NULL),(1600,'昌图县',118,0,3,NULL),(1601,'清河区',118,0,3,NULL),(1602,'西丰县',118,0,3,NULL),(1603,'调兵山市',118,0,3,NULL),(1604,'铁岭县',118,0,3,NULL),(1605,'银州区',118,0,3,NULL),(1606,'凌源市',119,0,3,NULL),(1607,'北票市',119,0,3,NULL),(1608,'双塔区',119,0,3,NULL),(1609,'喀喇沁左翼蒙古族自治县',119,0,3,NULL),(1610,'建平县',119,0,3,NULL),(1611,'朝阳县',119,0,3,NULL),(1612,'龙城区',119,0,3,NULL),(1613,'兴城市',120,0,3,NULL),(1614,'南票区',120,0,3,NULL),(1615,'建昌县',120,0,3,NULL),(1616,'绥中县',120,0,3,NULL),(1617,'连山区',120,0,3,NULL),(1618,'龙港区',120,0,3,NULL),(1619,'九台市',121,0,3,NULL),(1620,'二道区',121,0,3,NULL),(1621,'农安县',121,0,3,NULL),(1622,'南关区',121,0,3,NULL),(1623,'双阳区',121,0,3,NULL),(1624,'宽城区',121,0,3,NULL),(1625,'德惠市',121,0,3,NULL),(1626,'朝阳区',121,0,3,NULL),(1627,'榆树市',121,0,3,NULL),(1628,'绿园区',121,0,3,NULL),(1629,'丰满区',122,0,3,NULL),(1630,'昌邑区',122,0,3,NULL),(1631,'桦甸市',122,0,3,NULL),(1632,'永吉县',122,0,3,NULL),(1633,'磐石市',122,0,3,NULL),(1634,'舒兰市',122,0,3,NULL),(1635,'船营区',122,0,3,NULL),(1636,'蛟河市',122,0,3,NULL),(1637,'龙潭区',122,0,3,NULL),(1638,'伊通满族自治县',123,0,3,NULL),(1639,'公主岭市',123,0,3,NULL),(1640,'双辽市',123,0,3,NULL),(1641,'梨树县',123,0,3,NULL),(1642,'铁东区',123,0,3,NULL),(1643,'铁西区',123,0,3,NULL),(1644,'东丰县',124,0,3,NULL),(1645,'东辽县',124,0,3,NULL),(1646,'西安区',124,0,3,NULL),(1647,'龙山区',124,0,3,NULL),(1648,'东昌区',125,0,3,NULL),(1649,'二道江区',125,0,3,NULL),(1650,'柳河县',125,0,3,NULL),(1651,'梅河口市',125,0,3,NULL),(1652,'辉南县',125,0,3,NULL),(1653,'通化县',125,0,3,NULL),(1654,'集安市',125,0,3,NULL),(1655,'临江市',126,0,3,NULL),(1656,'八道江区',126,0,3,NULL),(1657,'抚松县',126,0,3,NULL),(1658,'江源区',126,0,3,NULL),(1659,'长白朝鲜族自治县',126,0,3,NULL),(1660,'靖宇县',126,0,3,NULL),(1661,'干安县',127,0,3,NULL),(1662,'前郭尔罗斯蒙古族自治县',127,0,3,NULL),(1663,'宁江区',127,0,3,NULL),(1664,'扶余县',127,0,3,NULL),(1665,'长岭县',127,0,3,NULL),(1666,'大安市',128,0,3,NULL),(1667,'洮北区',128,0,3,NULL),(1668,'洮南市',128,0,3,NULL),(1669,'通榆县',128,0,3,NULL),(1670,'镇赉县',128,0,3,NULL),(1671,'和龙市',129,0,3,NULL),(1672,'图们市',129,0,3,NULL),(1673,'安图县',129,0,3,NULL),(1674,'延吉市',129,0,3,NULL),(1675,'敦化市',129,0,3,NULL),(1676,'汪清县',129,0,3,NULL),(1677,'珲春市',129,0,3,NULL),(1678,'龙井市',129,0,3,NULL),(1679,'五常市',130,0,3,NULL),(1680,'依兰县',130,0,3,NULL),(1681,'南岗区',130,0,3,NULL),(1682,'双城市',130,0,3,NULL),(1683,'呼兰区',130,0,3,NULL),(1684,'哈尔滨市道里区',130,0,3,NULL),(1685,'宾县',130,0,3,NULL),(1686,'尚志市',130,0,3,NULL),(1687,'巴彦县',130,0,3,NULL),(1688,'平房区',130,0,3,NULL),(1689,'延寿县',130,0,3,NULL),(1690,'方正县',130,0,3,NULL),(1691,'木兰县',130,0,3,NULL),(1692,'松北区',130,0,3,NULL),(1693,'通河县',130,0,3,NULL),(1694,'道外区',130,0,3,NULL),(1695,'阿城区',130,0,3,NULL),(1696,'香坊区',130,0,3,NULL),(1697,'依安县',131,0,3,NULL),(1698,'克东县',131,0,3,NULL),(1699,'克山县',131,0,3,NULL),(1700,'富拉尔基区',131,0,3,NULL),(1701,'富裕县',131,0,3,NULL),(1702,'建华区',131,0,3,NULL),(1703,'拜泉县',131,0,3,NULL),(1704,'昂昂溪区',131,0,3,NULL),(1705,'梅里斯达斡尔族区',131,0,3,NULL),(1706,'泰来县',131,0,3,NULL),(1707,'甘南县',131,0,3,NULL),(1708,'碾子山区',131,0,3,NULL),(1709,'讷河市',131,0,3,NULL),(1710,'铁锋区',131,0,3,NULL),(1711,'龙江县',131,0,3,NULL),(1712,'龙沙区',131,0,3,NULL),(1713,'城子河区',132,0,3,NULL),(1714,'密山市',132,0,3,NULL),(1715,'恒山区',132,0,3,NULL),(1716,'梨树区',132,0,3,NULL),(1717,'滴道区',132,0,3,NULL),(1718,'虎林市',132,0,3,NULL),(1719,'鸡东县',132,0,3,NULL),(1720,'鸡冠区',132,0,3,NULL),(1721,'麻山区',132,0,3,NULL),(1722,'东山区',133,0,3,NULL),(1723,'兴安区',133,0,3,NULL),(1724,'兴山区',133,0,3,NULL),(1725,'南山区',133,0,3,NULL),(1726,'向阳区',133,0,3,NULL),(1727,'工农区',133,0,3,NULL),(1728,'绥滨县',133,0,3,NULL),(1729,'萝北县',133,0,3,NULL),(1730,'友谊县',134,0,3,NULL),(1731,'四方台区',134,0,3,NULL),(1732,'宝山区',134,0,3,NULL),(1733,'宝清县',134,0,3,NULL),(1734,'尖山区',134,0,3,NULL),(1735,'岭东区',134,0,3,NULL),(1736,'集贤县',134,0,3,NULL),(1737,'饶河县',134,0,3,NULL),(1738,'大同区',135,0,3,NULL),(1739,'杜尔伯特蒙古族自治县',135,0,3,NULL),(1740,'林甸县',135,0,3,NULL),(1741,'红岗区',135,0,3,NULL),(1742,'肇州县',135,0,3,NULL),(1743,'肇源县',135,0,3,NULL),(1744,'胡路区',135,0,3,NULL),(1745,'萨尔图区',135,0,3,NULL),(1746,'龙凤区',135,0,3,NULL),(1747,'上甘岭区',136,0,3,NULL),(1748,'乌伊岭区',136,0,3,NULL),(1749,'乌马河区',136,0,3,NULL),(1750,'五营区',136,0,3,NULL),(1751,'伊春区',136,0,3,NULL),(1752,'南岔区',136,0,3,NULL),(1753,'友好区',136,0,3,NULL),(1754,'嘉荫县',136,0,3,NULL),(1755,'带岭区',136,0,3,NULL),(1756,'新青区',136,0,3,NULL),(1757,'汤旺河区',136,0,3,NULL),(1758,'红星区',136,0,3,NULL),(1759,'美溪区',136,0,3,NULL),(1760,'翠峦区',136,0,3,NULL),(1761,'西林区',136,0,3,NULL),(1762,'金山屯区',136,0,3,NULL),(1763,'铁力市',136,0,3,NULL),(1764,'东风区',137,0,3,NULL),(1765,'前进区',137,0,3,NULL),(1766,'同江市',137,0,3,NULL),(1767,'向阳区',137,0,3,NULL),(1768,'富锦市',137,0,3,NULL),(1769,'抚远县',137,0,3,NULL),(1770,'桦南县',137,0,3,NULL),(1771,'桦川县',137,0,3,NULL),(1772,'汤原县',137,0,3,NULL),(1773,'郊区',137,0,3,NULL),(1774,'勃利县',138,0,3,NULL),(1775,'新兴区',138,0,3,NULL),(1776,'桃山区',138,0,3,NULL),(1777,'茄子河区',138,0,3,NULL),(1778,'东宁县',139,0,3,NULL),(1779,'东安区',139,0,3,NULL),(1780,'宁安市',139,0,3,NULL),(1781,'林口县',139,0,3,NULL),(1782,'海林市',139,0,3,NULL),(1783,'爱民区',139,0,3,NULL),(1784,'穆棱市',139,0,3,NULL),(1785,'绥芬河市',139,0,3,NULL),(1786,'西安区',139,0,3,NULL),(1787,'阳明区',139,0,3,NULL),(1788,'五大连池市',140,0,3,NULL),(1789,'北安市',140,0,3,NULL),(1790,'嫩江县',140,0,3,NULL),(1791,'孙吴县',140,0,3,NULL),(1792,'爱辉区',140,0,3,NULL),(1793,'车逊克县',140,0,3,NULL),(1794,'逊克县',140,0,3,NULL),(1795,'兰西县',141,0,3,NULL),(1796,'安达市',141,0,3,NULL),(1797,'庆安县',141,0,3,NULL),(1798,'明水县',141,0,3,NULL),(1799,'望奎县',141,0,3,NULL),(1800,'海伦市',141,0,3,NULL),(1801,'绥化市北林区',141,0,3,NULL),(1802,'绥棱县',141,0,3,NULL),(1803,'肇东市',141,0,3,NULL),(1804,'青冈县',141,0,3,NULL),(1805,'呼玛县',142,0,3,NULL),(1806,'塔河县',142,0,3,NULL),(1807,'大兴安岭地区加格达奇区',142,0,3,NULL),(1808,'大兴安岭地区呼中区',142,0,3,NULL),(1809,'大兴安岭地区新林区',142,0,3,NULL),(1810,'大兴安岭地区松岭区',142,0,3,NULL),(1811,'漠河县',142,0,3,NULL),(2027,'下关区',162,0,3,NULL),(2028,'六合区',162,0,3,NULL),(2029,'建邺区',162,0,3,NULL),(2030,'栖霞区',162,0,3,NULL),(2031,'江宁区',162,0,3,NULL),(2032,'浦口区',162,0,3,NULL),(2033,'溧水县',162,0,3,NULL),(2034,'玄武区',162,0,3,NULL),(2035,'白下区',162,0,3,NULL),(2036,'秦淮区',162,0,3,NULL),(2037,'雨花台区',162,0,3,NULL),(2038,'高淳县',162,0,3,NULL),(2039,'鼓楼区',162,0,3,NULL),(2040,'北塘区',163,0,3,NULL),(2041,'南长区',163,0,3,NULL),(2042,'宜兴市',163,0,3,NULL),(2043,'崇安区',163,0,3,NULL),(2044,'惠山区',163,0,3,NULL),(2045,'江阴市',163,0,3,NULL),(2046,'滨湖区',163,0,3,NULL),(2047,'锡山区',163,0,3,NULL),(2048,'丰县',164,0,3,NULL),(2049,'九里区',164,0,3,NULL),(2050,'云龙区',164,0,3,NULL),(2051,'新沂市',164,0,3,NULL),(2052,'沛县',164,0,3,NULL),(2053,'泉山区',164,0,3,NULL),(2054,'睢宁县',164,0,3,NULL),(2055,'贾汪区',164,0,3,NULL),(2056,'邳州市',164,0,3,NULL),(2057,'铜山县',164,0,3,NULL),(2058,'鼓楼区',164,0,3,NULL),(2059,'天宁区',165,0,3,NULL),(2060,'戚墅堰区',165,0,3,NULL),(2061,'新北区',165,0,3,NULL),(2062,'武进区',165,0,3,NULL),(2063,'溧阳市',165,0,3,NULL),(2064,'金坛市',165,0,3,NULL),(2065,'钟楼区',165,0,3,NULL),(2066,'吴中区',166,0,3,NULL),(2067,'吴江市',166,0,3,NULL),(2068,'太仓市',166,0,3,NULL),(2069,'常熟市',166,0,3,NULL),(2070,'平江区',166,0,3,NULL),(2071,'张家港市',166,0,3,NULL),(2072,'昆山市',166,0,3,NULL),(2073,'沧浪区',166,0,3,NULL),(2074,'相城区',166,0,3,NULL),(2075,'苏州工业园区',166,0,3,NULL),(2076,'虎丘区',166,0,3,NULL),(2077,'金阊区',166,0,3,NULL),(2078,'启东市',167,0,3,NULL),(2079,'如东县',167,0,3,NULL),(2080,'如皋市',167,0,3,NULL),(2081,'崇川区',167,0,3,NULL),(2082,'海安县',167,0,3,NULL),(2083,'海门市',167,0,3,NULL),(2084,'港闸区',167,0,3,NULL),(2085,'通州市',167,0,3,NULL),(2086,'东海县',168,0,3,NULL),(2087,'新浦区',168,0,3,NULL),(2088,'海州区',168,0,3,NULL),(2089,'灌云县',168,0,3,NULL),(2090,'灌南县',168,0,3,NULL),(2091,'赣榆县',168,0,3,NULL),(2092,'连云区',168,0,3,NULL),(2093,'楚州区',169,0,3,NULL),(2094,'洪泽县',169,0,3,NULL),(2095,'涟水县',169,0,3,NULL),(2096,'淮阴区',169,0,3,NULL),(2097,'清河区',169,0,3,NULL),(2098,'清浦区',169,0,3,NULL),(2099,'盱眙县',169,0,3,NULL),(2100,'金湖县',169,0,3,NULL),(2101,'东台市',170,0,3,NULL),(2102,'亭湖区',170,0,3,NULL),(2103,'响水县',170,0,3,NULL),(2104,'大丰市',170,0,3,NULL),(2105,'射阳县',170,0,3,NULL),(2106,'建湖县',170,0,3,NULL),(2107,'滨海县',170,0,3,NULL),(2108,'盐都区',170,0,3,NULL),(2109,'阜宁县',170,0,3,NULL),(2110,'仪征市',171,0,3,NULL),(2111,'宝应县',171,0,3,NULL),(2112,'广陵区',171,0,3,NULL),(2113,'江都市',171,0,3,NULL),(2114,'维扬区',171,0,3,NULL),(2115,'邗江区',171,0,3,NULL),(2116,'高邮市',171,0,3,NULL),(2117,'丹徒区',172,0,3,NULL),(2118,'丹阳市',172,0,3,NULL),(2119,'京口区',172,0,3,NULL),(2120,'句容市',172,0,3,NULL),(2121,'扬中市',172,0,3,NULL),(2122,'润州区',172,0,3,NULL),(2123,'兴化市',173,0,3,NULL),(2124,'姜堰市',173,0,3,NULL),(2125,'泰兴市',173,0,3,NULL),(2126,'海陵区',173,0,3,NULL),(2127,'靖江市',173,0,3,NULL),(2128,'高港区',173,0,3,NULL),(2129,'宿城区',174,0,3,NULL),(2130,'宿豫区',174,0,3,NULL),(2131,'沭阳县',174,0,3,NULL),(2132,'泗洪县',174,0,3,NULL),(2133,'泗阳县',174,0,3,NULL),(2134,'上城区',175,0,3,NULL),(2135,'下城区',175,0,3,NULL),(2136,'临安市',175,0,3,NULL),(2137,'余杭区',175,0,3,NULL),(2138,'富阳市',175,0,3,NULL),(2139,'建德市',175,0,3,NULL),(2140,'拱墅区',175,0,3,NULL),(2141,'桐庐县',175,0,3,NULL),(2142,'江干区',175,0,3,NULL),(2143,'淳安县',175,0,3,NULL),(2144,'滨江区',175,0,3,NULL),(2145,'萧山区',175,0,3,NULL),(2146,'西湖区',175,0,3,NULL),(2147,'余姚市',176,0,3,NULL),(2148,'北仑区',176,0,3,NULL),(2149,'奉化市',176,0,3,NULL),(2150,'宁海县',176,0,3,NULL),(2151,'慈溪市',176,0,3,NULL),(2152,'江东区',176,0,3,NULL),(2153,'江北区',176,0,3,NULL),(2154,'海曙区',176,0,3,NULL),(2155,'象山县',176,0,3,NULL),(2156,'鄞州区',176,0,3,NULL),(2157,'镇海区',176,0,3,NULL),(2158,'乐清市',177,0,3,NULL),(2159,'平阳县',177,0,3,NULL),(2160,'文成县',177,0,3,NULL),(2161,'永嘉县',177,0,3,NULL),(2162,'泰顺县',177,0,3,NULL),(2163,'洞头县',177,0,3,NULL),(2164,'瑞安市',177,0,3,NULL),(2165,'瓯海区',177,0,3,NULL),(2166,'苍南县',177,0,3,NULL),(2167,'鹿城区',177,0,3,NULL),(2168,'龙湾区',177,0,3,NULL),(2169,'南湖区',178,0,3,NULL),(2170,'嘉善县',178,0,3,NULL),(2171,'平湖市',178,0,3,NULL),(2172,'桐乡市',178,0,3,NULL),(2173,'海宁市',178,0,3,NULL),(2174,'海盐县',178,0,3,NULL),(2175,'秀洲区',178,0,3,NULL),(2176,'南浔区',179,0,3,NULL),(2177,'吴兴区',179,0,3,NULL),(2178,'安吉县',179,0,3,NULL),(2179,'德清县',179,0,3,NULL),(2180,'长兴县',179,0,3,NULL),(2181,'上虞市',180,0,3,NULL),(2182,'嵊州市',180,0,3,NULL),(2183,'新昌县',180,0,3,NULL),(2184,'绍兴县',180,0,3,NULL),(2185,'诸暨市',180,0,3,NULL),(2186,'越城区',180,0,3,NULL),(2187,'定海区',181,0,3,NULL),(2188,'岱山县',181,0,3,NULL),(2189,'嵊泗县',181,0,3,NULL),(2190,'普陀区',181,0,3,NULL),(2191,'常山县',182,0,3,NULL),(2192,'开化县',182,0,3,NULL),(2193,'柯城区',182,0,3,NULL),(2194,'江山市',182,0,3,NULL),(2195,'衢江区',182,0,3,NULL),(2196,'龙游县',182,0,3,NULL),(2197,'东阳市',183,0,3,NULL),(2198,'义乌市',183,0,3,NULL),(2199,'兰溪市',183,0,3,NULL),(2200,'婺城区',183,0,3,NULL),(2201,'武义县',183,0,3,NULL),(2202,'永康市',183,0,3,NULL),(2203,'浦江县',183,0,3,NULL),(2204,'磐安县',183,0,3,NULL),(2205,'金东区',183,0,3,NULL),(2206,'三门县',184,0,3,NULL),(2207,'临海市',184,0,3,NULL),(2208,'仙居县',184,0,3,NULL),(2209,'天台县',184,0,3,NULL),(2210,'椒江区',184,0,3,NULL),(2211,'温岭市',184,0,3,NULL),(2212,'玉环县',184,0,3,NULL),(2213,'路桥区',184,0,3,NULL),(2214,'黄岩区',184,0,3,NULL),(2215,'云和县',185,0,3,NULL),(2216,'庆元县',185,0,3,NULL),(2217,'景宁畲族自治县',185,0,3,NULL),(2218,'松阳县',185,0,3,NULL),(2219,'缙云县',185,0,3,NULL),(2220,'莲都区',185,0,3,NULL),(2221,'遂昌县',185,0,3,NULL),(2222,'青田县',185,0,3,NULL),(2223,'龙泉市',185,0,3,NULL),(2224,'包河区',186,0,3,NULL),(2225,'庐阳区',186,0,3,NULL),(2226,'瑶海区',186,0,3,NULL),(2227,'肥东县',186,0,3,NULL),(2228,'肥西县',186,0,3,NULL),(2229,'蜀山区',186,0,3,NULL),(2230,'长丰县',186,0,3,NULL),(2231,'三山区',187,0,3,NULL),(2232,'南陵县',187,0,3,NULL),(2233,'弋江区',187,0,3,NULL),(2234,'繁昌县',187,0,3,NULL),(2235,'芜湖县',187,0,3,NULL),(2236,'镜湖区',187,0,3,NULL),(2237,'鸠江区',187,0,3,NULL),(2238,'五河县',188,0,3,NULL),(2239,'固镇县',188,0,3,NULL),(2240,'怀远县',188,0,3,NULL),(2241,'淮上区',188,0,3,NULL),(2242,'禹会区',188,0,3,NULL),(2243,'蚌山区',188,0,3,NULL),(2244,'龙子湖区',188,0,3,NULL),(2245,'八公山区',189,0,3,NULL),(2246,'凤台县',189,0,3,NULL),(2247,'大通区',189,0,3,NULL),(2248,'潘集区',189,0,3,NULL),(2249,'田家庵区',189,0,3,NULL),(2250,'谢家集区',189,0,3,NULL),(2251,'当涂县',190,0,3,NULL),(2252,'花山区',190,0,3,NULL),(2253,'金家庄区',190,0,3,NULL),(2254,'雨山区',190,0,3,NULL),(2255,'杜集区',191,0,3,NULL),(2256,'濉溪县',191,0,3,NULL),(2257,'烈山区',191,0,3,NULL),(2258,'相山区',191,0,3,NULL),(2259,'狮子山区',192,0,3,NULL),(2260,'郊区',192,0,3,NULL),(2261,'铜官山区',192,0,3,NULL),(2262,'铜陵县',192,0,3,NULL),(2263,'大观区',193,0,3,NULL),(2264,'太湖县',193,0,3,NULL),(2265,'宜秀区',193,0,3,NULL),(2266,'宿松县',193,0,3,NULL),(2267,'岳西县',193,0,3,NULL),(2268,'怀宁县',193,0,3,NULL),(2269,'望江县',193,0,3,NULL),(2270,'枞阳县',193,0,3,NULL),(2271,'桐城市',193,0,3,NULL),(2272,'潜山县',193,0,3,NULL),(2273,'迎江区',193,0,3,NULL),(2274,'休宁县',194,0,3,NULL),(2275,'屯溪区',194,0,3,NULL),(2276,'徽州区',194,0,3,NULL),(2277,'歙县',194,0,3,NULL),(2278,'祁门县',194,0,3,NULL),(2279,'黄山区',194,0,3,NULL),(2280,'黟县',194,0,3,NULL),(2281,'全椒县',195,0,3,NULL),(2282,'凤阳县',195,0,3,NULL),(2283,'南谯区',195,0,3,NULL),(2284,'天长市',195,0,3,NULL),(2285,'定远县',195,0,3,NULL),(2286,'明光市',195,0,3,NULL),(2287,'来安县',195,0,3,NULL),(2288,'琅玡区',195,0,3,NULL),(2289,'临泉县',196,0,3,NULL),(2290,'太和县',196,0,3,NULL),(2291,'界首市',196,0,3,NULL),(2292,'阜南县',196,0,3,NULL),(2293,'颍东区',196,0,3,NULL),(2294,'颍州区',196,0,3,NULL),(2295,'颍泉区',196,0,3,NULL),(2296,'颖上县',196,0,3,NULL),(2297,'埇桥区',197,0,3,NULL),(2298,'泗县辖',197,0,3,NULL),(2299,'灵璧县',197,0,3,NULL),(2300,'砀山县',197,0,3,NULL),(2301,'萧县',197,0,3,NULL),(2302,'含山县',198,0,3,NULL),(2303,'和县',198,0,3,NULL),(2304,'居巢区',198,0,3,NULL),(2305,'庐江县',198,0,3,NULL),(2306,'无为县',198,0,3,NULL),(2307,'寿县',199,0,3,NULL),(2308,'舒城县',199,0,3,NULL),(2309,'裕安区',199,0,3,NULL),(2310,'金安区',199,0,3,NULL),(2311,'金寨县',199,0,3,NULL),(2312,'霍山县',199,0,3,NULL),(2313,'霍邱县',199,0,3,NULL),(2314,'利辛县',200,0,3,NULL),(2315,'涡阳县',200,0,3,NULL),(2316,'蒙城县',200,0,3,NULL),(2317,'谯城区',200,0,3,NULL),(2318,'东至县',201,0,3,NULL),(2319,'石台县',201,0,3,NULL),(2320,'贵池区',201,0,3,NULL),(2321,'青阳县',201,0,3,NULL),(2322,'宁国市',202,0,3,NULL),(2323,'宣州区',202,0,3,NULL),(2324,'广德县',202,0,3,NULL),(2325,'旌德县',202,0,3,NULL),(2326,'泾县',202,0,3,NULL),(2327,'绩溪县',202,0,3,NULL),(2328,'郎溪县',202,0,3,NULL),(2329,'仓山区',203,0,3,NULL),(2330,'台江区',203,0,3,NULL),(2331,'平潭县',203,0,3,NULL),(2332,'晋安区',203,0,3,NULL),(2333,'永泰县',203,0,3,NULL),(2334,'福清市',203,0,3,NULL),(2335,'罗源县',203,0,3,NULL),(2336,'连江县',203,0,3,NULL),(2337,'长乐市',203,0,3,NULL),(2338,'闽侯县',203,0,3,NULL),(2339,'闽清县',203,0,3,NULL),(2340,'马尾区',203,0,3,NULL),(2341,'鼓楼区',203,0,3,NULL),(2342,'同安区',204,0,3,NULL),(2343,'思明区',204,0,3,NULL),(2344,'海沧区',204,0,3,NULL),(2345,'湖里区',204,0,3,NULL),(2346,'翔安区',204,0,3,NULL),(2347,'集美区',204,0,3,NULL),(2348,'仙游县',205,0,3,NULL),(2349,'城厢区',205,0,3,NULL),(2350,'涵江区',205,0,3,NULL),(2351,'秀屿区',205,0,3,NULL),(2352,'荔城区',205,0,3,NULL),(2353,'三元区',206,0,3,NULL),(2354,'大田县',206,0,3,NULL),(2355,'宁化县',206,0,3,NULL),(2356,'将乐县',206,0,3,NULL),(2357,'尤溪县',206,0,3,NULL),(2358,'建宁县',206,0,3,NULL),(2359,'明溪县',206,0,3,NULL),(2360,'梅列区',206,0,3,NULL),(2361,'永安市',206,0,3,NULL),(2362,'沙县',206,0,3,NULL),(2363,'泰宁县',206,0,3,NULL),(2364,'清流县',206,0,3,NULL),(2365,'丰泽区',207,0,3,NULL),(2366,'南安市',207,0,3,NULL),(2367,'安溪县',207,0,3,NULL),(2368,'德化县',207,0,3,NULL),(2369,'惠安县',207,0,3,NULL),(2370,'晋江市',207,0,3,NULL),(2371,'永春县',207,0,3,NULL),(2372,'泉港区',207,0,3,NULL),(2373,'洛江区',207,0,3,NULL),(2374,'石狮市',207,0,3,NULL),(2375,'金门县',207,0,3,NULL),(2376,'鲤城区',207,0,3,NULL),(2377,'东山县',208,0,3,NULL),(2378,'云霄县',208,0,3,NULL),(2379,'华安县',208,0,3,NULL),(2380,'南靖县',208,0,3,NULL),(2381,'平和县',208,0,3,NULL),(2382,'漳浦县',208,0,3,NULL),(2383,'芗城区',208,0,3,NULL),(2384,'诏安县',208,0,3,NULL),(2385,'长泰县',208,0,3,NULL),(2386,'龙文区',208,0,3,NULL),(2387,'龙海市',208,0,3,NULL),(2388,'光泽县',209,0,3,NULL),(2389,'延平区',209,0,3,NULL),(2390,'建瓯市',209,0,3,NULL),(2391,'建阳市',209,0,3,NULL),(2392,'政和县',209,0,3,NULL),(2393,'松溪县',209,0,3,NULL),(2394,'武夷山市',209,0,3,NULL),(2395,'浦城县',209,0,3,NULL),(2396,'邵武市',209,0,3,NULL),(2397,'顺昌县',209,0,3,NULL),(2398,'上杭县',210,0,3,NULL),(2399,'新罗区',210,0,3,NULL),(2400,'武平县',210,0,3,NULL),(2401,'永定县',210,0,3,NULL),(2402,'漳平市',210,0,3,NULL),(2403,'连城县',210,0,3,NULL),(2404,'长汀县',210,0,3,NULL),(2405,'古田县',211,0,3,NULL),(2406,'周宁县',211,0,3,NULL),(2407,'寿宁县',211,0,3,NULL),(2408,'屏南县',211,0,3,NULL),(2409,'柘荣县',211,0,3,NULL),(2410,'福安市',211,0,3,NULL),(2411,'福鼎市',211,0,3,NULL),(2412,'蕉城区',211,0,3,NULL),(2413,'霞浦县',211,0,3,NULL),(2414,'东湖区',212,0,3,NULL),(2415,'南昌县',212,0,3,NULL),(2416,'安义县',212,0,3,NULL),(2417,'新建县',212,0,3,NULL),(2418,'湾里区',212,0,3,NULL),(2419,'西湖区',212,0,3,NULL),(2420,'进贤县',212,0,3,NULL),(2421,'青云谱区',212,0,3,NULL),(2422,'青山湖区',212,0,3,NULL),(2423,'乐平市',213,0,3,NULL),(2424,'昌江区',213,0,3,NULL),(2425,'浮梁县',213,0,3,NULL),(2426,'珠山区',213,0,3,NULL),(2427,'上栗县',214,0,3,NULL),(2428,'安源区',214,0,3,NULL),(2429,'湘东区',214,0,3,NULL),(2430,'芦溪县',214,0,3,NULL),(2431,'莲花县',214,0,3,NULL),(2432,'九江县',215,0,3,NULL),(2433,'修水县',215,0,3,NULL),(2434,'庐山区',215,0,3,NULL),(2435,'彭泽县',215,0,3,NULL),(2436,'德安县',215,0,3,NULL),(2437,'星子县',215,0,3,NULL),(2438,'武宁县',215,0,3,NULL),(2439,'永修县',215,0,3,NULL),(2440,'浔阳区',215,0,3,NULL),(2441,'湖口县',215,0,3,NULL),(2442,'瑞昌市',215,0,3,NULL),(2443,'都昌县',215,0,3,NULL),(2444,'分宜县',216,0,3,NULL),(2445,'渝水区',216,0,3,NULL),(2446,'余江县',217,0,3,NULL),(2447,'月湖区',217,0,3,NULL),(2448,'贵溪市',217,0,3,NULL),(2449,'上犹县',218,0,3,NULL),(2450,'于都县',218,0,3,NULL),(2451,'会昌县',218,0,3,NULL),(2452,'信丰县',218,0,3,NULL),(2453,'全南县',218,0,3,NULL),(2454,'兴国县',218,0,3,NULL),(2455,'南康市',218,0,3,NULL),(2456,'大余县',218,0,3,NULL),(2457,'宁都县',218,0,3,NULL),(2458,'安远县',218,0,3,NULL),(2459,'定南县',218,0,3,NULL),(2460,'寻乌县',218,0,3,NULL),(2461,'崇义县',218,0,3,NULL),(2462,'瑞金市',218,0,3,NULL),(2463,'石城县',218,0,3,NULL),(2464,'章贡区',218,0,3,NULL),(2465,'赣县',218,0,3,NULL),(2466,'龙南县',218,0,3,NULL),(2467,'万安县',219,0,3,NULL),(2468,'井冈山市',219,0,3,NULL),(2469,'吉安县',219,0,3,NULL),(2470,'吉州区',219,0,3,NULL),(2471,'吉水县',219,0,3,NULL),(2472,'安福县',219,0,3,NULL),(2473,'峡江县',219,0,3,NULL),(2474,'新干县',219,0,3,NULL),(2475,'永丰县',219,0,3,NULL),(2476,'永新县',219,0,3,NULL),(2477,'泰和县',219,0,3,NULL),(2478,'遂川县',219,0,3,NULL),(2479,'青原区',219,0,3,NULL),(2480,'万载县',220,0,3,NULL),(2481,'上高县',220,0,3,NULL),(2482,'丰城市',220,0,3,NULL),(2483,'奉新县',220,0,3,NULL),(2484,'宜丰县',220,0,3,NULL),(2485,'樟树市',220,0,3,NULL),(2486,'袁州区',220,0,3,NULL),(2487,'铜鼓县',220,0,3,NULL),(2488,'靖安县',220,0,3,NULL),(2489,'高安市',220,0,3,NULL),(2490,'东乡县',221,0,3,NULL),(2491,'临川区',221,0,3,NULL),(2492,'乐安县',221,0,3,NULL),(2493,'南丰县',221,0,3,NULL),(2494,'南城县',221,0,3,NULL),(2495,'宜黄县',221,0,3,NULL),(2496,'崇仁县',221,0,3,NULL),(2497,'广昌县',221,0,3,NULL),(2498,'资溪县',221,0,3,NULL),(2499,'金溪县',221,0,3,NULL),(2500,'黎川县',221,0,3,NULL),(2501,'万年县',222,0,3,NULL),(2502,'上饶县',222,0,3,NULL),(2503,'余干县',222,0,3,NULL),(2504,'信州区',222,0,3,NULL),(2505,'婺源县',222,0,3,NULL),(2506,'广丰县',222,0,3,NULL),(2507,'弋阳县',222,0,3,NULL),(2508,'德兴市',222,0,3,NULL),(2509,'横峰县',222,0,3,NULL),(2510,'玉山县',222,0,3,NULL),(2511,'鄱阳县',222,0,3,NULL),(2512,'铅山县',222,0,3,NULL),(2513,'历下区',223,0,3,NULL),(2514,'历城区',223,0,3,NULL),(2515,'商河县',223,0,3,NULL),(2516,'天桥区',223,0,3,NULL),(2517,'市中区',223,0,3,NULL),(2518,'平阴县',223,0,3,NULL),(2519,'槐荫区',223,0,3,NULL),(2520,'济阳县',223,0,3,NULL),(2521,'章丘市',223,0,3,NULL),(2522,'长清区',223,0,3,NULL),(2523,'即墨市',224,0,3,NULL),(2524,'四方区',224,0,3,NULL),(2525,'城阳区',224,0,3,NULL),(2526,'崂山区',224,0,3,NULL),(2527,'市北区',224,0,3,NULL),(2528,'市南区',224,0,3,NULL),(2529,'平度市',224,0,3,NULL),(2530,'李沧区',224,0,3,NULL),(2531,'胶南市',224,0,3,NULL),(2532,'胶州市',224,0,3,NULL),(2533,'莱西市',224,0,3,NULL),(2534,'黄岛区',224,0,3,NULL),(2535,'临淄区',225,0,3,NULL),(2536,'博山区',225,0,3,NULL),(2537,'周村区',225,0,3,NULL),(2538,'张店区',225,0,3,NULL),(2539,'桓台县',225,0,3,NULL),(2540,'沂源县',225,0,3,NULL),(2541,'淄川区',225,0,3,NULL),(2542,'高青县',225,0,3,NULL),(2543,'台儿庄区',226,0,3,NULL),(2544,'山亭区',226,0,3,NULL),(2545,'峄城区',226,0,3,NULL),(2546,'市中区',226,0,3,NULL),(2547,'滕州市',226,0,3,NULL),(2548,'薛城区',226,0,3,NULL),(2549,'东营区',227,0,3,NULL),(2550,'利津县',227,0,3,NULL),(2551,'垦利县',227,0,3,NULL),(2552,'广饶县',227,0,3,NULL),(2553,'河口区',227,0,3,NULL),(2554,'招远市',228,0,3,NULL),(2555,'栖霞市',228,0,3,NULL),(2556,'海阳市',228,0,3,NULL),(2557,'牟平区',228,0,3,NULL),(2558,'福山区',228,0,3,NULL),(2559,'芝罘区',228,0,3,NULL),(2560,'莱山区',228,0,3,NULL),(2561,'莱州市',228,0,3,NULL),(2562,'莱阳市',228,0,3,NULL),(2563,'蓬莱市',228,0,3,NULL),(2564,'长岛县',228,0,3,NULL),(2565,'龙口市',228,0,3,NULL),(2566,'临朐县',229,0,3,NULL),(2567,'坊子区',229,0,3,NULL),(2568,'奎文区',229,0,3,NULL),(2569,'安丘市',229,0,3,NULL),(2570,'寒亭区',229,0,3,NULL),(2571,'寿光市',229,0,3,NULL),(2572,'昌乐县',229,0,3,NULL),(2573,'昌邑市',229,0,3,NULL),(2574,'潍城区',229,0,3,NULL),(2575,'诸城市',229,0,3,NULL),(2576,'青州市',229,0,3,NULL),(2577,'高密市',229,0,3,NULL),(2578,'任城区',230,0,3,NULL),(2579,'兖州市',230,0,3,NULL),(2580,'嘉祥县',230,0,3,NULL),(2581,'市中区',230,0,3,NULL),(2582,'微山县',230,0,3,NULL),(2583,'曲阜市',230,0,3,NULL),(2584,'梁山县',230,0,3,NULL),(2585,'汶上县',230,0,3,NULL),(2586,'泗水县',230,0,3,NULL),(2587,'邹城市',230,0,3,NULL),(2588,'金乡县',230,0,3,NULL),(2589,'鱼台县',230,0,3,NULL),(2590,'东平县',231,0,3,NULL),(2591,'宁阳县',231,0,3,NULL),(2592,'岱岳区',231,0,3,NULL),(2593,'新泰市',231,0,3,NULL),(2594,'泰山区',231,0,3,NULL),(2595,'肥城市',231,0,3,NULL),(2596,'乳山市',232,0,3,NULL),(2597,'文登市',232,0,3,NULL),(2598,'环翠区',232,0,3,NULL),(2599,'荣成市',232,0,3,NULL),(2600,'东港区',233,0,3,NULL),(2601,'五莲县',233,0,3,NULL),(2602,'岚山区',233,0,3,NULL),(2603,'莒县',233,0,3,NULL),(2604,'莱城区',234,0,3,NULL),(2605,'钢城区',234,0,3,NULL),(2606,'临沭县',235,0,3,NULL),(2607,'兰山区',235,0,3,NULL),(2608,'平邑县',235,0,3,NULL),(2609,'沂南县',235,0,3,NULL),(2610,'沂水县',235,0,3,NULL),(2611,'河东区',235,0,3,NULL),(2612,'罗庄区',235,0,3,NULL),(2613,'苍山县',235,0,3,NULL),(2614,'莒南县',235,0,3,NULL),(2615,'蒙阴县',235,0,3,NULL),(2616,'费县',235,0,3,NULL),(2617,'郯城县',235,0,3,NULL),(2618,'临邑县',236,0,3,NULL),(2619,'乐陵市',236,0,3,NULL),(2620,'夏津县',236,0,3,NULL),(2621,'宁津县',236,0,3,NULL),(2622,'平原县',236,0,3,NULL),(2623,'庆云县',236,0,3,NULL),(2624,'德城区',236,0,3,NULL),(2625,'武城县',236,0,3,NULL),(2626,'禹城市',236,0,3,NULL),(2627,'陵县',236,0,3,NULL),(2628,'齐河县',236,0,3,NULL),(2629,'东昌府区',237,0,3,NULL),(2630,'东阿县',237,0,3,NULL),(2631,'临清市',237,0,3,NULL),(2632,'冠县',237,0,3,NULL),(2633,'茌平县',237,0,3,NULL),(2634,'莘县',237,0,3,NULL),(2635,'阳谷县',237,0,3,NULL),(2636,'高唐县',237,0,3,NULL),(2637,'博兴县',238,0,3,NULL),(2638,'惠民县',238,0,3,NULL),(2639,'无棣县',238,0,3,NULL),(2640,'沾化县',238,0,3,NULL),(2641,'滨城区',238,0,3,NULL),(2642,'邹平县',238,0,3,NULL),(2643,'阳信县',238,0,3,NULL),(2644,'东明县',239,0,3,NULL),(2645,'单县',239,0,3,NULL),(2646,'定陶县',239,0,3,NULL),(2647,'巨野县',239,0,3,NULL),(2648,'成武县',239,0,3,NULL),(2649,'曹县',239,0,3,NULL),(2650,'牡丹区',239,0,3,NULL),(2651,'郓城县',239,0,3,NULL),(2652,'鄄城县',239,0,3,NULL),(2653,'上街区',240,0,3,NULL),(2654,'中原区',240,0,3,NULL),(2655,'中牟县',240,0,3,NULL),(2656,'二七区',240,0,3,NULL),(2657,'巩义市',240,0,3,NULL),(2658,'惠济区',240,0,3,NULL),(2659,'新密市',240,0,3,NULL),(2660,'新郑市',240,0,3,NULL),(2661,'登封市',240,0,3,NULL),(2662,'管城回族区',240,0,3,NULL),(2663,'荥阳市',240,0,3,NULL),(2664,'金水区',240,0,3,NULL),(2665,'兰考县',241,0,3,NULL),(2666,'尉氏县',241,0,3,NULL),(2667,'开封县',241,0,3,NULL),(2668,'杞县',241,0,3,NULL),(2669,'禹王台区',241,0,3,NULL),(2670,'通许县',241,0,3,NULL),(2671,'金明区',241,0,3,NULL),(2672,'顺河回族区',241,0,3,NULL),(2673,'鼓楼区',241,0,3,NULL),(2674,'龙亭区',241,0,3,NULL),(2675,'伊川县',242,0,3,NULL),(2676,'偃师市',242,0,3,NULL),(2677,'吉利区',242,0,3,NULL),(2678,'孟津县',242,0,3,NULL),(2679,'宜阳县',242,0,3,NULL),(2680,'嵩县',242,0,3,NULL),(2681,'新安县',242,0,3,NULL),(2682,'栾川县',242,0,3,NULL),(2683,'汝阳县',242,0,3,NULL),(2684,'洛宁县',242,0,3,NULL),(2685,'洛龙区',242,0,3,NULL),(2686,'涧西区',242,0,3,NULL),(2687,'瀍河回族区',242,0,3,NULL),(2688,'老城区',242,0,3,NULL),(2689,'西工区',242,0,3,NULL),(2690,'卫东区',243,0,3,NULL),(2691,'叶县',243,0,3,NULL),(2692,'宝丰县',243,0,3,NULL),(2693,'新华区',243,0,3,NULL),(2694,'汝州市',243,0,3,NULL),(2695,'湛河区',243,0,3,NULL),(2696,'石龙区',243,0,3,NULL),(2697,'舞钢市',243,0,3,NULL),(2698,'郏县',243,0,3,NULL),(2699,'鲁山县',243,0,3,NULL),(2700,'内黄县',244,0,3,NULL),(2701,'北关区',244,0,3,NULL),(2702,'安阳县',244,0,3,NULL),(2703,'文峰区',244,0,3,NULL),(2704,'林州市',244,0,3,NULL),(2705,'殷都区',244,0,3,NULL),(2706,'汤阴县',244,0,3,NULL),(2707,'滑县',244,0,3,NULL),(2708,'龙安区',244,0,3,NULL),(2709,'山城区',245,0,3,NULL),(2710,'浚县',245,0,3,NULL),(2711,'淇县',245,0,3,NULL),(2712,'淇滨区',245,0,3,NULL),(2713,'鹤山区',245,0,3,NULL),(2714,'凤泉区',246,0,3,NULL),(2715,'卫滨区',246,0,3,NULL),(2716,'卫辉市',246,0,3,NULL),(2717,'原阳县',246,0,3,NULL),(2718,'封丘县',246,0,3,NULL),(2719,'延津县',246,0,3,NULL),(2720,'新乡县',246,0,3,NULL),(2721,'牧野区',246,0,3,NULL),(2722,'红旗区',246,0,3,NULL),(2723,'获嘉县',246,0,3,NULL),(2724,'辉县市',246,0,3,NULL),(2725,'长垣县',246,0,3,NULL),(2726,'中站区',247,0,3,NULL),(2727,'修武县',247,0,3,NULL),(2728,'博爱县',247,0,3,NULL),(2729,'孟州市',247,0,3,NULL),(2730,'山阳区',247,0,3,NULL),(2731,'武陟县',247,0,3,NULL),(2732,'沁阳市',247,0,3,NULL),(2733,'温县',247,0,3,NULL),(2734,'解放区',247,0,3,NULL),(2735,'马村区',247,0,3,NULL),(2736,'华龙区',248,0,3,NULL),(2737,'南乐县',248,0,3,NULL),(2738,'台前县',248,0,3,NULL),(2739,'清丰县',248,0,3,NULL),(2740,'濮阳县',248,0,3,NULL),(2741,'范县',248,0,3,NULL),(2742,'禹州市',249,0,3,NULL),(2743,'襄城县',249,0,3,NULL),(2744,'许昌县',249,0,3,NULL),(2745,'鄢陵县',249,0,3,NULL),(2746,'长葛市',249,0,3,NULL),(2747,'魏都区',249,0,3,NULL),(2748,'临颍县',250,0,3,NULL),(2749,'召陵区',250,0,3,NULL),(2750,'源汇区',250,0,3,NULL),(2751,'舞阳县',250,0,3,NULL),(2752,'郾城区',250,0,3,NULL),(2753,'义马市',251,0,3,NULL),(2754,'卢氏县',251,0,3,NULL),(2755,'渑池县',251,0,3,NULL),(2756,'湖滨区',251,0,3,NULL),(2757,'灵宝市',251,0,3,NULL),(2758,'陕县',251,0,3,NULL),(2759,'内乡县',252,0,3,NULL),(2760,'南召县',252,0,3,NULL),(2761,'卧龙区',252,0,3,NULL),(2762,'唐河县',252,0,3,NULL),(2763,'宛城区',252,0,3,NULL),(2764,'新野县',252,0,3,NULL),(2765,'方城县',252,0,3,NULL),(2766,'桐柏县',252,0,3,NULL),(2767,'淅川县',252,0,3,NULL),(2768,'社旗县',252,0,3,NULL),(2769,'西峡县',252,0,3,NULL),(2770,'邓州市',252,0,3,NULL),(2771,'镇平县',252,0,3,NULL),(2772,'夏邑县',253,0,3,NULL),(2773,'宁陵县',253,0,3,NULL),(2774,'柘城县',253,0,3,NULL),(2775,'民权县',253,0,3,NULL),(2776,'永城市',253,0,3,NULL),(2777,'睢县',253,0,3,NULL),(2778,'睢阳区',253,0,3,NULL),(2779,'粱园区',253,0,3,NULL),(2780,'虞城县',253,0,3,NULL),(2781,'光山县',254,0,3,NULL),(2782,'商城县',254,0,3,NULL),(2783,'固始县',254,0,3,NULL),(2784,'平桥区',254,0,3,NULL),(2785,'息县',254,0,3,NULL),(2786,'新县',254,0,3,NULL),(2787,'浉河区',254,0,3,NULL),(2788,'淮滨县',254,0,3,NULL),(2789,'潢川县',254,0,3,NULL),(2790,'罗山县',254,0,3,NULL),(2791,'商水县',255,0,3,NULL),(2792,'太康县',255,0,3,NULL),(2793,'川汇区',255,0,3,NULL),(2794,'扶沟县',255,0,3,NULL),(2795,'沈丘县',255,0,3,NULL),(2796,'淮阳县',255,0,3,NULL),(2797,'西华县',255,0,3,NULL),(2798,'郸城县',255,0,3,NULL),(2799,'项城市',255,0,3,NULL),(2800,'鹿邑县',255,0,3,NULL),(2801,'上蔡县',256,0,3,NULL),(2802,'平舆县',256,0,3,NULL),(2803,'新蔡县',256,0,3,NULL),(2804,'正阳县',256,0,3,NULL),(2805,'汝南县',256,0,3,NULL),(2806,'泌阳县',256,0,3,NULL),(2807,'确山县',256,0,3,NULL),(2808,'西平县',256,0,3,NULL),(2809,'遂平县',256,0,3,NULL),(2810,'驿城区',256,0,3,NULL),(2811,'济源市',257,0,3,NULL),(2812,'东西湖区',258,0,3,NULL),(2813,'新洲区',258,0,3,NULL),(2814,'武昌区',258,0,3,NULL),(2815,'汉南区',258,0,3,NULL),(2816,'汉阳区',258,0,3,NULL),(2817,'江夏区',258,0,3,NULL),(2818,'江岸区',258,0,3,NULL),(2819,'江汉区',258,0,3,NULL),(2820,'洪山区',258,0,3,NULL),(2821,'硚口区',258,0,3,NULL),(2822,'蔡甸区',258,0,3,NULL),(2823,'青山区',258,0,3,NULL),(2824,'黄陂区',258,0,3,NULL),(2825,'下陆区',259,0,3,NULL),(2826,'大冶市',259,0,3,NULL),(2827,'西塞山区',259,0,3,NULL),(2828,'铁山区',259,0,3,NULL),(2829,'阳新县',259,0,3,NULL),(2830,'黄石港区',259,0,3,NULL),(2831,'丹江口市',260,0,3,NULL),(2832,'张湾区',260,0,3,NULL),(2833,'房县',260,0,3,NULL),(2834,'竹山县',260,0,3,NULL),(2835,'竹溪县',260,0,3,NULL),(2836,'茅箭区',260,0,3,NULL),(2837,'郧县',260,0,3,NULL),(2838,'郧西县',260,0,3,NULL),(2839,'五峰土家族自治县',261,0,3,NULL),(2840,'伍家岗区',261,0,3,NULL),(2841,'兴山县',261,0,3,NULL),(2842,'夷陵区',261,0,3,NULL),(2843,'宜都市',261,0,3,NULL),(2844,'当阳市',261,0,3,NULL),(2845,'枝江市',261,0,3,NULL),(2846,'点军区',261,0,3,NULL),(2847,'秭归县',261,0,3,NULL),(2848,'虢亭区',261,0,3,NULL),(2849,'西陵区',261,0,3,NULL),(2850,'远安县',261,0,3,NULL),(2851,'长阳土家族自治县',261,0,3,NULL),(2852,'保康县',262,0,3,NULL),(2853,'南漳县',262,0,3,NULL),(2854,'宜城市',262,0,3,NULL),(2855,'枣阳市',262,0,3,NULL),(2856,'樊城区',262,0,3,NULL),(2857,'老河口市',262,0,3,NULL),(2858,'襄城区',262,0,3,NULL),(2859,'襄阳区',262,0,3,NULL),(2860,'谷城县',262,0,3,NULL),(2861,'华容区',263,0,3,NULL),(2862,'粱子湖',263,0,3,NULL),(2863,'鄂城区',263,0,3,NULL),(2864,'东宝区',264,0,3,NULL),(2865,'京山县',264,0,3,NULL),(2866,'掇刀区',264,0,3,NULL),(2867,'沙洋县',264,0,3,NULL),(2868,'钟祥市',264,0,3,NULL),(2869,'云梦县',265,0,3,NULL),(2870,'大悟县',265,0,3,NULL),(2871,'孝南区',265,0,3,NULL),(2872,'孝昌县',265,0,3,NULL),(2873,'安陆市',265,0,3,NULL),(2874,'应城市',265,0,3,NULL),(2875,'汉川市',265,0,3,NULL),(2876,'公安县',266,0,3,NULL),(2877,'松滋市',266,0,3,NULL),(2878,'江陵县',266,0,3,NULL),(2879,'沙市区',266,0,3,NULL),(2880,'洪湖市',266,0,3,NULL),(2881,'监利县',266,0,3,NULL),(2882,'石首市',266,0,3,NULL),(2883,'荆州区',266,0,3,NULL),(2884,'团风县',267,0,3,NULL),(2885,'武穴市',267,0,3,NULL),(2886,'浠水县',267,0,3,NULL),(2887,'红安县',267,0,3,NULL),(2888,'罗田县',267,0,3,NULL),(2889,'英山县',267,0,3,NULL),(2890,'蕲春县',267,0,3,NULL),(2891,'麻城市',267,0,3,NULL),(2892,'黄州区',267,0,3,NULL),(2893,'黄梅县',267,0,3,NULL),(2894,'咸安区',268,0,3,NULL),(2895,'嘉鱼县',268,0,3,NULL),(2896,'崇阳县',268,0,3,NULL),(2897,'赤壁市',268,0,3,NULL),(2898,'通城县',268,0,3,NULL),(2899,'通山县',268,0,3,NULL),(2900,'广水市',269,0,3,NULL),(2901,'曾都区',269,0,3,NULL),(2902,'利川市',270,0,3,NULL),(2903,'咸丰县',270,0,3,NULL),(2904,'宣恩县',270,0,3,NULL),(2905,'巴东县',270,0,3,NULL),(2906,'建始县',270,0,3,NULL),(2907,'恩施市',270,0,3,NULL),(2908,'来凤县',270,0,3,NULL),(2909,'鹤峰县',270,0,3,NULL),(2910,'仙桃市',271,0,3,NULL),(2911,'潜江市',272,0,3,NULL),(2912,'天门市',273,0,3,NULL),(2913,'神农架林区',274,0,3,NULL),(2914,'天心区',275,0,3,NULL),(2915,'宁乡县',275,0,3,NULL),(2916,'岳麓区',275,0,3,NULL),(2917,'开福区',275,0,3,NULL),(2918,'望城县',275,0,3,NULL),(2919,'浏阳市',275,0,3,NULL),(2920,'芙蓉区',275,0,3,NULL),(2921,'长沙县',275,0,3,NULL),(2922,'雨花区',275,0,3,NULL),(2923,'天元区',276,0,3,NULL),(2924,'攸县',276,0,3,NULL),(2925,'株洲县',276,0,3,NULL),(2926,'炎陵县',276,0,3,NULL),(2927,'石峰区',276,0,3,NULL),(2928,'芦淞区',276,0,3,NULL),(2929,'茶陵县',276,0,3,NULL),(2930,'荷塘区',276,0,3,NULL),(2931,'醴陵市',276,0,3,NULL),(2932,'岳塘区',277,0,3,NULL),(2933,'湘乡市',277,0,3,NULL),(2934,'湘潭县',277,0,3,NULL),(2935,'雨湖区',277,0,3,NULL),(2936,'韶山市',277,0,3,NULL),(2937,'南岳区',278,0,3,NULL),(2938,'常宁市',278,0,3,NULL),(2939,'珠晖区',278,0,3,NULL),(2940,'石鼓区',278,0,3,NULL),(2941,'祁东县',278,0,3,NULL),(2942,'耒阳市',278,0,3,NULL),(2943,'蒸湘区',278,0,3,NULL),(2944,'衡东县',278,0,3,NULL),(2945,'衡南县',278,0,3,NULL),(2946,'衡山县',278,0,3,NULL),(2947,'衡阳县',278,0,3,NULL),(2948,'雁峰区',278,0,3,NULL),(2949,'北塔区',279,0,3,NULL),(2950,'双清区',279,0,3,NULL),(2951,'城步苗族自治县',279,0,3,NULL),(2952,'大祥区',279,0,3,NULL),(2953,'新宁县',279,0,3,NULL),(2954,'新邵县',279,0,3,NULL),(2955,'武冈市',279,0,3,NULL),(2956,'洞口县',279,0,3,NULL),(2957,'绥宁县',279,0,3,NULL),(2958,'邵东县',279,0,3,NULL),(2959,'邵阳县',279,0,3,NULL),(2960,'隆回县',279,0,3,NULL),(2961,'临湘市',280,0,3,NULL),(2962,'云溪区',280,0,3,NULL),(2963,'华容县',280,0,3,NULL),(2964,'君山区',280,0,3,NULL),(2965,'岳阳县',280,0,3,NULL),(2966,'岳阳楼区',280,0,3,NULL),(2967,'平江县',280,0,3,NULL),(2968,'汨罗市',280,0,3,NULL),(2969,'湘阴县',280,0,3,NULL),(2970,'临澧县',281,0,3,NULL),(2971,'安乡县',281,0,3,NULL),(2972,'桃源县',281,0,3,NULL),(2973,'武陵区',281,0,3,NULL),(2974,'汉寿县',281,0,3,NULL),(2975,'津市市',281,0,3,NULL),(2976,'澧县',281,0,3,NULL),(2977,'石门县',281,0,3,NULL),(2978,'鼎城区',281,0,3,NULL),(2979,'慈利县',282,0,3,NULL),(2980,'桑植县',282,0,3,NULL),(2981,'武陵源区',282,0,3,NULL),(2982,'永定区',282,0,3,NULL),(2983,'南县',283,0,3,NULL),(2984,'安化县',283,0,3,NULL),(2985,'桃江县',283,0,3,NULL),(2986,'沅江市',283,0,3,NULL),(2987,'资阳区',283,0,3,NULL),(2988,'赫山区',283,0,3,NULL),(2989,'临武县',284,0,3,NULL),(2990,'北湖区',284,0,3,NULL),(2991,'嘉禾县',284,0,3,NULL),(2992,'安仁县',284,0,3,NULL),(2993,'宜章县',284,0,3,NULL),(2994,'桂东县',284,0,3,NULL),(2995,'桂阳县',284,0,3,NULL),(2996,'永兴县',284,0,3,NULL),(2997,'汝城县',284,0,3,NULL),(2998,'苏仙区',284,0,3,NULL),(2999,'资兴市',284,0,3,NULL),(3000,'东安县',285,0,3,NULL),(3001,'冷水滩区',285,0,3,NULL),(3002,'双牌县',285,0,3,NULL),(3003,'宁远县',285,0,3,NULL),(3004,'新田县',285,0,3,NULL),(3005,'江华瑶族自治县',285,0,3,NULL),(3006,'江永县',285,0,3,NULL),(3007,'祁阳县',285,0,3,NULL),(3008,'蓝山县',285,0,3,NULL),(3009,'道县',285,0,3,NULL),(3010,'零陵区',285,0,3,NULL),(3011,'中方县',286,0,3,NULL),(3012,'会同县',286,0,3,NULL),(3013,'新晃侗族自治县',286,0,3,NULL),(3014,'沅陵县',286,0,3,NULL),(3015,'洪江市/洪江区',286,0,3,NULL),(3016,'溆浦县',286,0,3,NULL),(3017,'芷江侗族自治县',286,0,3,NULL),(3018,'辰溪县',286,0,3,NULL),(3019,'通道侗族自治县',286,0,3,NULL),(3020,'靖州苗族侗族自治县',286,0,3,NULL),(3021,'鹤城区',286,0,3,NULL),(3022,'麻阳苗族自治县',286,0,3,NULL),(3023,'冷水江市',287,0,3,NULL),(3024,'双峰县',287,0,3,NULL),(3025,'娄星区',287,0,3,NULL),(3026,'新化县',287,0,3,NULL),(3027,'涟源市',287,0,3,NULL),(3028,'保靖县',288,0,3,NULL),(3029,'凤凰县',288,0,3,NULL),(3030,'古丈县',288,0,3,NULL),(3031,'吉首市',288,0,3,NULL),(3032,'永顺县',288,0,3,NULL),(3033,'泸溪县',288,0,3,NULL),(3034,'花垣县',288,0,3,NULL),(3035,'龙山县',288,0,3,NULL),(3036,'萝岗区',289,0,3,NULL),(3037,'南沙区',289,0,3,NULL),(3038,'从化市',289,0,3,NULL),(3039,'增城市',289,0,3,NULL),(3040,'天河区',289,0,3,NULL),(3041,'海珠区',289,0,3,NULL),(3042,'番禺区',289,0,3,NULL),(3043,'白云区',289,0,3,NULL),(3044,'花都区',289,0,3,NULL),(3045,'荔湾区',289,0,3,NULL),(3046,'越秀区',289,0,3,NULL),(3047,'黄埔区',289,0,3,NULL),(3048,'乐昌市',290,0,3,NULL),(3049,'乳源瑶族自治县',290,0,3,NULL),(3050,'仁化县',290,0,3,NULL),(3051,'南雄市',290,0,3,NULL),(3052,'始兴县',290,0,3,NULL),(3053,'新丰县',290,0,3,NULL),(3054,'曲江区',290,0,3,NULL),(3055,'武江区',290,0,3,NULL),(3056,'浈江区',290,0,3,NULL),(3057,'翁源县',290,0,3,NULL),(3058,'南山区',291,0,3,NULL),(3059,'宝安区',291,0,3,NULL),(3060,'盐田区',291,0,3,NULL),(3061,'福田区',291,0,3,NULL),(3062,'罗湖区',291,0,3,NULL),(3063,'龙岗区',291,0,3,NULL),(3064,'斗门区',292,0,3,NULL),(3065,'金湾区',292,0,3,NULL),(3066,'香洲区',292,0,3,NULL),(3067,'南澳县',293,0,3,NULL),(3068,'潮南区',293,0,3,NULL),(3069,'潮阳区',293,0,3,NULL),(3070,'澄海区',293,0,3,NULL),(3071,'濠江区',293,0,3,NULL),(3072,'金平区',293,0,3,NULL),(3073,'龙湖区',293,0,3,NULL),(3074,'三水区',294,0,3,NULL),(3075,'南海区',294,0,3,NULL),(3076,'禅城区',294,0,3,NULL),(3077,'顺德区',294,0,3,NULL),(3078,'高明区',294,0,3,NULL),(3079,'台山市',295,0,3,NULL),(3080,'开平市',295,0,3,NULL),(3081,'恩平市',295,0,3,NULL),(3082,'新会区',295,0,3,NULL),(3083,'江海区',295,0,3,NULL),(3084,'蓬江区',295,0,3,NULL),(3085,'鹤山市',295,0,3,NULL),(3086,'吴川市',296,0,3,NULL),(3087,'坡头区',296,0,3,NULL),(3088,'廉江市',296,0,3,NULL),(3089,'徐闻县',296,0,3,NULL),(3090,'赤坎区',296,0,3,NULL),(3091,'遂溪县',296,0,3,NULL),(3092,'雷州市',296,0,3,NULL),(3093,'霞山区',296,0,3,NULL),(3094,'麻章区',296,0,3,NULL),(3095,'信宜市',297,0,3,NULL),(3096,'化州市',297,0,3,NULL),(3097,'电白县',297,0,3,NULL),(3098,'茂南区',297,0,3,NULL),(3099,'茂港区',297,0,3,NULL),(3100,'高州市',297,0,3,NULL),(3101,'四会市',298,0,3,NULL),(3102,'封开县',298,0,3,NULL),(3103,'广宁县',298,0,3,NULL),(3104,'德庆县',298,0,3,NULL),(3105,'怀集县',298,0,3,NULL),(3106,'端州区',298,0,3,NULL),(3107,'高要市',298,0,3,NULL),(3108,'鼎湖区',298,0,3,NULL),(3109,'博罗县',299,0,3,NULL),(3110,'惠东县',299,0,3,NULL),(3111,'惠城区',299,0,3,NULL),(3112,'惠阳区',299,0,3,NULL),(3113,'龙门县',299,0,3,NULL),(3114,'丰顺县',300,0,3,NULL),(3115,'五华县',300,0,3,NULL),(3116,'兴宁市',300,0,3,NULL),(3117,'大埔县',300,0,3,NULL),(3118,'平远县',300,0,3,NULL),(3119,'梅县',300,0,3,NULL),(3120,'梅江区',300,0,3,NULL),(3121,'蕉岭县',300,0,3,NULL),(3122,'城区',301,0,3,NULL),(3123,'海丰县',301,0,3,NULL),(3124,'陆丰市',301,0,3,NULL),(3125,'陆河县',301,0,3,NULL),(3126,'东源县',302,0,3,NULL),(3127,'和平县',302,0,3,NULL),(3128,'源城区',302,0,3,NULL),(3129,'紫金县',302,0,3,NULL),(3130,'连平县',302,0,3,NULL),(3131,'龙川县',302,0,3,NULL),(3132,'江城区',303,0,3,NULL),(3133,'阳东县',303,0,3,NULL),(3134,'阳春市',303,0,3,NULL),(3135,'阳西县',303,0,3,NULL),(3136,'佛冈县',304,0,3,NULL),(3137,'清城区',304,0,3,NULL),(3138,'清新县',304,0,3,NULL),(3139,'英德市',304,0,3,NULL),(3140,'连南瑶族自治县',304,0,3,NULL),(3141,'连山壮族瑶族自治县',304,0,3,NULL),(3142,'连州市',304,0,3,NULL),(3143,'阳山县',304,0,3,NULL),(3144,'东莞市',305,0,3,NULL),(3145,'中山市',306,0,3,NULL),(3146,'湘桥区',307,0,3,NULL),(3147,'潮安县',307,0,3,NULL),(3148,'饶平县',307,0,3,NULL),(3149,'惠来县',308,0,3,NULL),(3150,'揭东县',308,0,3,NULL),(3151,'揭西县',308,0,3,NULL),(3152,'普宁市',308,0,3,NULL),(3153,'榕城区',308,0,3,NULL),(3154,'云城区',309,0,3,NULL),(3155,'云安县',309,0,3,NULL),(3156,'新兴县',309,0,3,NULL),(3157,'罗定市',309,0,3,NULL),(3158,'郁南县',309,0,3,NULL),(3159,'上林县',310,0,3,NULL),(3160,'兴宁区',310,0,3,NULL),(3161,'宾阳县',310,0,3,NULL),(3162,'横县',310,0,3,NULL),(3163,'武鸣县',310,0,3,NULL),(3164,'江南区',310,0,3,NULL),(3165,'良庆区',310,0,3,NULL),(3166,'西乡塘区',310,0,3,NULL),(3167,'邕宁区',310,0,3,NULL),(3168,'隆安县',310,0,3,NULL),(3169,'青秀区',310,0,3,NULL),(3170,'马山县',310,0,3,NULL),(3171,'三江侗族自治县',311,0,3,NULL),(3172,'城中区',311,0,3,NULL),(3173,'柳北区',311,0,3,NULL),(3174,'柳南区',311,0,3,NULL),(3175,'柳城县',311,0,3,NULL),(3176,'柳江县',311,0,3,NULL),(3177,'融安县',311,0,3,NULL),(3178,'融水苗族自治县',311,0,3,NULL),(3179,'鱼峰区',311,0,3,NULL),(3180,'鹿寨县',311,0,3,NULL),(3181,'七星区',312,0,3,NULL),(3182,'临桂县',312,0,3,NULL),(3183,'全州县',312,0,3,NULL),(3184,'兴安县',312,0,3,NULL),(3185,'叠彩区',312,0,3,NULL),(3186,'平乐县',312,0,3,NULL),(3187,'恭城瑶族自治县',312,0,3,NULL),(3188,'永福县',312,0,3,NULL),(3189,'灌阳县',312,0,3,NULL),(3190,'灵川县',312,0,3,NULL),(3191,'秀峰区',312,0,3,NULL),(3192,'荔浦县',312,0,3,NULL),(3193,'象山区',312,0,3,NULL),(3194,'资源县',312,0,3,NULL),(3195,'阳朔县',312,0,3,NULL),(3196,'雁山区',312,0,3,NULL),(3197,'龙胜各族自治县',312,0,3,NULL),(3198,'万秀区',313,0,3,NULL),(3199,'岑溪市',313,0,3,NULL),(3200,'苍梧县',313,0,3,NULL),(3201,'蒙山县',313,0,3,NULL),(3202,'藤县',313,0,3,NULL),(3203,'蝶山区',313,0,3,NULL),(3204,'长洲区',313,0,3,NULL),(3205,'合浦县',314,0,3,NULL),(3206,'海城区',314,0,3,NULL),(3207,'铁山港区',314,0,3,NULL),(3208,'银海区',314,0,3,NULL),(3209,'上思县',315,0,3,NULL),(3210,'东兴市',315,0,3,NULL),(3211,'港口区',315,0,3,NULL),(3212,'防城区',315,0,3,NULL),(3213,'浦北县',316,0,3,NULL),(3214,'灵山县',316,0,3,NULL),(3215,'钦北区',316,0,3,NULL),(3216,'钦南区',316,0,3,NULL),(3217,'平南县',317,0,3,NULL),(3218,'桂平市',317,0,3,NULL),(3219,'港北区',317,0,3,NULL),(3220,'港南区',317,0,3,NULL),(3221,'覃塘区',317,0,3,NULL),(3222,'兴业县',318,0,3,NULL),(3223,'北流市',318,0,3,NULL),(3224,'博白县',318,0,3,NULL),(3225,'容县',318,0,3,NULL),(3226,'玉州区',318,0,3,NULL),(3227,'陆川县',318,0,3,NULL),(3228,'乐业县',319,0,3,NULL),(3229,'凌云县',319,0,3,NULL),(3230,'右江区',319,0,3,NULL),(3231,'平果县',319,0,3,NULL),(3232,'德保县',319,0,3,NULL),(3233,'田东县',319,0,3,NULL),(3234,'田林县',319,0,3,NULL),(3235,'田阳县',319,0,3,NULL),(3236,'西林县',319,0,3,NULL),(3237,'那坡县',319,0,3,NULL),(3238,'隆林各族自治县',319,0,3,NULL),(3239,'靖西县',319,0,3,NULL),(3240,'八步区',320,0,3,NULL),(3241,'富川瑶族自治县',320,0,3,NULL),(3242,'昭平县',320,0,3,NULL),(3243,'钟山县',320,0,3,NULL),(3244,'东兰县',321,0,3,NULL),(3245,'凤山县',321,0,3,NULL),(3246,'南丹县',321,0,3,NULL),(3247,'大化瑶族自治县',321,0,3,NULL),(3248,'天峨县',321,0,3,NULL),(3249,'宜州市',321,0,3,NULL),(3250,'巴马瑶族自治县',321,0,3,NULL),(3251,'环江毛南族自治县',321,0,3,NULL),(3252,'罗城仫佬族自治县',321,0,3,NULL),(3253,'都安瑶族自治县',321,0,3,NULL),(3254,'金城江区',321,0,3,NULL),(3255,'兴宾区',322,0,3,NULL),(3256,'合山市',322,0,3,NULL),(3257,'忻城县',322,0,3,NULL),(3258,'武宣县',322,0,3,NULL),(3259,'象州县',322,0,3,NULL),(3260,'金秀瑶族自治县',322,0,3,NULL),(3261,'凭祥市',323,0,3,NULL),(3262,'大新县',323,0,3,NULL),(3263,'天等县',323,0,3,NULL),(3264,'宁明县',323,0,3,NULL),(3265,'扶绥县',323,0,3,NULL),(3266,'江州区',323,0,3,NULL),(3267,'龙州县',323,0,3,NULL),(3268,'琼山区',324,0,3,NULL),(3269,'秀英区',324,0,3,NULL),(3270,'美兰区',324,0,3,NULL),(3271,'龙华区',324,0,3,NULL),(3272,'三亚市',325,0,3,NULL),(3273,'五指山市',326,0,3,NULL),(3274,'琼海市',327,0,3,NULL),(3275,'儋州市',328,0,3,NULL),(3276,'文昌市',329,0,3,NULL),(3277,'万宁市',330,0,3,NULL),(3278,'东方市',331,0,3,NULL),(3279,'定安县',332,0,3,NULL),(3280,'屯昌县',333,0,3,NULL),(3281,'澄迈县',334,0,3,NULL),(3282,'临高县',335,0,3,NULL),(3283,'白沙黎族自治县',336,0,3,NULL),(3284,'昌江黎族自治县',337,0,3,NULL),(3285,'乐东黎族自治县',338,0,3,NULL),(3286,'陵水黎族自治县',339,0,3,NULL),(3287,'保亭黎族苗族自治县',340,0,3,NULL),(3288,'琼中黎族苗族自治县',341,0,3,NULL),(4209,'双流县',385,0,3,NULL),(4210,'大邑县',385,0,3,NULL),(4211,'崇州市',385,0,3,NULL),(4212,'彭州市',385,0,3,NULL),(4213,'成华区',385,0,3,NULL),(4214,'新津县',385,0,3,NULL),(4215,'新都区',385,0,3,NULL),(4216,'武侯区',385,0,3,NULL),(4217,'温江区',385,0,3,NULL),(4218,'蒲江县',385,0,3,NULL),(4219,'邛崃市',385,0,3,NULL),(4220,'郫县',385,0,3,NULL),(4221,'都江堰市',385,0,3,NULL),(4222,'金堂县',385,0,3,NULL),(4223,'金牛区',385,0,3,NULL),(4224,'锦江区',385,0,3,NULL),(4225,'青白江区',385,0,3,NULL),(4226,'青羊区',385,0,3,NULL),(4227,'龙泉驿区',385,0,3,NULL),(4228,'大安区',386,0,3,NULL),(4229,'富顺县',386,0,3,NULL),(4230,'沿滩区',386,0,3,NULL),(4231,'自流井区',386,0,3,NULL),(4232,'荣县',386,0,3,NULL),(4233,'贡井区',386,0,3,NULL),(4234,'东区',387,0,3,NULL),(4235,'仁和区',387,0,3,NULL),(4236,'盐边县',387,0,3,NULL),(4237,'米易县',387,0,3,NULL),(4238,'西区',387,0,3,NULL),(4239,'叙永县',388,0,3,NULL),(4240,'古蔺县',388,0,3,NULL),(4241,'合江县',388,0,3,NULL),(4242,'江阳区',388,0,3,NULL),(4243,'泸县',388,0,3,NULL),(4244,'纳溪区',388,0,3,NULL),(4245,'龙马潭区',388,0,3,NULL),(4246,'中江县',389,0,3,NULL),(4247,'什邡市',389,0,3,NULL),(4248,'广汉市',389,0,3,NULL),(4249,'旌阳区',389,0,3,NULL),(4250,'绵竹市',389,0,3,NULL),(4251,'罗江县',389,0,3,NULL),(4252,'三台县',390,0,3,NULL),(4253,'北川羌族自治县',390,0,3,NULL),(4254,'安县',390,0,3,NULL),(4255,'平武县',390,0,3,NULL),(4256,'梓潼县',390,0,3,NULL),(4257,'江油市',390,0,3,NULL),(4258,'涪城区',390,0,3,NULL),(4259,'游仙区',390,0,3,NULL),(4260,'盐亭县',390,0,3,NULL),(4261,'元坝区',391,0,3,NULL),(4262,'利州区',391,0,3,NULL),(4263,'剑阁县',391,0,3,NULL),(4264,'旺苍县',391,0,3,NULL),(4265,'朝天区',391,0,3,NULL),(4266,'苍溪县',391,0,3,NULL),(4267,'青川县',391,0,3,NULL),(4268,'大英县',392,0,3,NULL),(4269,'安居区',392,0,3,NULL),(4270,'射洪县',392,0,3,NULL),(4271,'船山区',392,0,3,NULL),(4272,'蓬溪县',392,0,3,NULL),(4273,'东兴区',393,0,3,NULL),(4274,'威远县',393,0,3,NULL),(4275,'市中区',393,0,3,NULL),(4276,'资中县',393,0,3,NULL),(4277,'隆昌县',393,0,3,NULL),(4278,'五通桥区',394,0,3,NULL),(4279,'井研县',394,0,3,NULL),(4280,'夹江县',394,0,3,NULL),(4281,'峨眉山市',394,0,3,NULL),(4282,'峨边彝族自治县',394,0,3,NULL),(4283,'市中区',394,0,3,NULL),(4284,'沐川县',394,0,3,NULL),(4285,'沙湾区',394,0,3,NULL),(4286,'犍为县',394,0,3,NULL),(4287,'金口河区',394,0,3,NULL),(4288,'马边彝族自治县',394,0,3,NULL),(4289,'仪陇县',395,0,3,NULL),(4290,'南充市嘉陵区',395,0,3,NULL),(4291,'南部县',395,0,3,NULL),(4292,'嘉陵区',395,0,3,NULL),(4293,'营山县',395,0,3,NULL),(4294,'蓬安县',395,0,3,NULL),(4295,'西充县',395,0,3,NULL),(4296,'阆中市',395,0,3,NULL),(4297,'顺庆区',395,0,3,NULL),(4298,'高坪区',395,0,3,NULL),(4299,'东坡区',396,0,3,NULL),(4300,'丹棱县',396,0,3,NULL),(4301,'仁寿县',396,0,3,NULL),(4302,'彭山县',396,0,3,NULL),(4303,'洪雅县',396,0,3,NULL),(4304,'青神县',396,0,3,NULL),(4305,'兴文县',397,0,3,NULL),(4306,'南溪县',397,0,3,NULL),(4307,'宜宾县',397,0,3,NULL),(4308,'屏山县',397,0,3,NULL),(4309,'江安县',397,0,3,NULL),(4310,'珙县',397,0,3,NULL),(4311,'筠连县',397,0,3,NULL),(4312,'翠屏区',397,0,3,NULL),(4313,'长宁县',397,0,3,NULL),(4314,'高县',397,0,3,NULL),(4315,'华蓥市',398,0,3,NULL),(4316,'岳池县',398,0,3,NULL),(4317,'广安区',398,0,3,NULL),(4318,'武胜县',398,0,3,NULL),(4319,'邻水县',398,0,3,NULL),(4320,'万源市',399,0,3,NULL),(4321,'大竹县',399,0,3,NULL),(4322,'宣汉县',399,0,3,NULL),(4323,'开江县',399,0,3,NULL),(4324,'渠县',399,0,3,NULL),(4325,'达县',399,0,3,NULL),(4326,'通川区',399,0,3,NULL),(4327,'名山县',400,0,3,NULL),(4328,'天全县',400,0,3,NULL),(4329,'宝兴县',400,0,3,NULL),(4330,'汉源县',400,0,3,NULL),(4331,'石棉县',400,0,3,NULL),(4332,'芦山县',400,0,3,NULL),(4333,'荥经县',400,0,3,NULL),(4334,'雨城区',400,0,3,NULL),(4335,'南江县',401,0,3,NULL),(4336,'巴州区',401,0,3,NULL),(4337,'平昌县',401,0,3,NULL),(4338,'通江县',401,0,3,NULL),(4339,'乐至县',402,0,3,NULL),(4340,'安岳县',402,0,3,NULL),(4341,'简阳市',402,0,3,NULL),(4342,'雁江区',402,0,3,NULL),(4343,'九寨沟县',403,0,3,NULL),(4344,'壤塘县',403,0,3,NULL),(4345,'小金县',403,0,3,NULL),(4346,'松潘县',403,0,3,NULL),(4347,'汶川县',403,0,3,NULL),(4348,'理县',403,0,3,NULL),(4349,'红原县',403,0,3,NULL),(4350,'若尔盖县',403,0,3,NULL),(4351,'茂县',403,0,3,NULL),(4352,'金川县',403,0,3,NULL),(4353,'阿坝县',403,0,3,NULL),(4354,'马尔康县',403,0,3,NULL),(4355,'黑水县',403,0,3,NULL),(4356,'丹巴县',404,0,3,NULL),(4357,'乡城县',404,0,3,NULL),(4358,'巴塘县',404,0,3,NULL),(4359,'康定县',404,0,3,NULL),(4360,'得荣县',404,0,3,NULL),(4361,'德格县',404,0,3,NULL),(4362,'新龙县',404,0,3,NULL),(4363,'泸定县',404,0,3,NULL),(4364,'炉霍县',404,0,3,NULL),(4365,'理塘县',404,0,3,NULL),(4366,'甘孜县',404,0,3,NULL),(4367,'白玉县',404,0,3,NULL),(4368,'石渠县',404,0,3,NULL),(4369,'稻城县',404,0,3,NULL),(4370,'色达县',404,0,3,NULL),(4371,'道孚县',404,0,3,NULL),(4372,'雅江县',404,0,3,NULL),(4373,'会东县',405,0,3,NULL),(4374,'会理县',405,0,3,NULL),(4375,'冕宁县',405,0,3,NULL),(4376,'喜德县',405,0,3,NULL),(4377,'宁南县',405,0,3,NULL),(4378,'布拖县',405,0,3,NULL),(4379,'德昌县',405,0,3,NULL),(4380,'昭觉县',405,0,3,NULL),(4381,'普格县',405,0,3,NULL),(4382,'木里藏族自治县',405,0,3,NULL),(4383,'甘洛县',405,0,3,NULL),(4384,'盐源县',405,0,3,NULL),(4385,'美姑县',405,0,3,NULL),(4386,'西昌',405,0,3,NULL),(4387,'越西县',405,0,3,NULL),(4388,'金阳县',405,0,3,NULL),(4389,'雷波县',405,0,3,NULL),(4390,'乌当区',406,0,3,NULL),(4391,'云岩区',406,0,3,NULL),(4392,'修文县',406,0,3,NULL),(4393,'南明区',406,0,3,NULL),(4394,'小河区',406,0,3,NULL),(4395,'开阳县',406,0,3,NULL),(4396,'息烽县',406,0,3,NULL),(4397,'清镇市',406,0,3,NULL),(4398,'白云区',406,0,3,NULL),(4399,'花溪区',406,0,3,NULL),(4400,'六枝特区',407,0,3,NULL),(4401,'水城县',407,0,3,NULL),(4402,'盘县',407,0,3,NULL),(4403,'钟山区',407,0,3,NULL),(4404,'习水县',408,0,3,NULL),(4405,'仁怀市',408,0,3,NULL),(4406,'余庆县',408,0,3,NULL),(4407,'凤冈县',408,0,3,NULL),(4408,'务川仡佬族苗族自治县',408,0,3,NULL),(4409,'桐梓县',408,0,3,NULL),(4410,'正安县',408,0,3,NULL),(4411,'汇川区',408,0,3,NULL),(4412,'湄潭县',408,0,3,NULL),(4413,'红花岗区',408,0,3,NULL),(4414,'绥阳县',408,0,3,NULL),(4415,'赤水市',408,0,3,NULL),(4416,'道真仡佬族苗族自治县',408,0,3,NULL),(4417,'遵义县',408,0,3,NULL),(4418,'关岭布依族苗族自治县',409,0,3,NULL),(4419,'平坝县',409,0,3,NULL),(4420,'普定县',409,0,3,NULL),(4421,'紫云苗族布依族自治县',409,0,3,NULL),(4422,'西秀区',409,0,3,NULL),(4423,'镇宁布依族苗族自治县',409,0,3,NULL),(4424,'万山特区',410,0,3,NULL),(4425,'印江土家族苗族自治县',410,0,3,NULL),(4426,'德江县',410,0,3,NULL),(4427,'思南县',410,0,3,NULL),(4428,'松桃苗族自治县',410,0,3,NULL),(4429,'江口县',410,0,3,NULL),(4430,'沿河土家族自治县',410,0,3,NULL),(4431,'玉屏侗族自治县',410,0,3,NULL),(4432,'石阡县',410,0,3,NULL),(4433,'铜仁市',410,0,3,NULL),(4434,'兴义市',411,0,3,NULL),(4435,'兴仁县',411,0,3,NULL),(4436,'册亨县',411,0,3,NULL),(4437,'安龙县',411,0,3,NULL),(4438,'普安县',411,0,3,NULL),(4439,'晴隆县',411,0,3,NULL),(4440,'望谟县',411,0,3,NULL),(4441,'贞丰县',411,0,3,NULL),(4442,'大方县',412,0,3,NULL),(4443,'威宁彝族回族苗族自治县',412,0,3,NULL),(4444,'毕节市',412,0,3,NULL),(4445,'纳雍县',412,0,3,NULL),(4446,'织金县',412,0,3,NULL),(4447,'赫章县',412,0,3,NULL),(4448,'金沙县',412,0,3,NULL),(4449,'黔西县',412,0,3,NULL),(4450,'三穗县',413,0,3,NULL),(4451,'丹寨县',413,0,3,NULL),(4452,'从江县',413,0,3,NULL),(4453,'凯里市',413,0,3,NULL),(4454,'剑河县',413,0,3,NULL),(4455,'台江县',413,0,3,NULL),(4456,'天柱县',413,0,3,NULL),(4457,'岑巩县',413,0,3,NULL),(4458,'施秉县',413,0,3,NULL),(4459,'榕江县',413,0,3,NULL),(4460,'锦屏县',413,0,3,NULL),(4461,'镇远县',413,0,3,NULL),(4462,'雷山县',413,0,3,NULL),(4463,'麻江县',413,0,3,NULL),(4464,'黄平县',413,0,3,NULL),(4465,'黎平县',413,0,3,NULL),(4466,'三都水族自治县',414,0,3,NULL),(4467,'平塘县',414,0,3,NULL),(4468,'惠水县',414,0,3,NULL),(4469,'独山县',414,0,3,NULL),(4470,'瓮安县',414,0,3,NULL),(4471,'福泉市',414,0,3,NULL),(4472,'罗甸县',414,0,3,NULL),(4473,'荔波县',414,0,3,NULL),(4474,'贵定县',414,0,3,NULL),(4475,'都匀市',414,0,3,NULL),(4476,'长顺县',414,0,3,NULL),(4477,'龙里县',414,0,3,NULL),(4478,'东川区',415,0,3,NULL),(4479,'五华区',415,0,3,NULL),(4480,'呈贡县',415,0,3,NULL),(4481,'安宁市',415,0,3,NULL),(4482,'官渡区',415,0,3,NULL),(4483,'宜良县',415,0,3,NULL),(4484,'富民县',415,0,3,NULL),(4485,'寻甸回族彝族自治县',415,0,3,NULL),(4486,'嵩明县',415,0,3,NULL),(4487,'晋宁县',415,0,3,NULL),(4488,'盘龙区',415,0,3,NULL),(4489,'石林彝族自治县',415,0,3,NULL),(4490,'禄劝彝族苗族自治县',415,0,3,NULL),(4491,'西山区',415,0,3,NULL),(4492,'会泽县',416,0,3,NULL),(4493,'宣威市',416,0,3,NULL),(4494,'富源县',416,0,3,NULL),(4495,'师宗县',416,0,3,NULL),(4496,'沾益县',416,0,3,NULL),(4497,'罗平县',416,0,3,NULL),(4498,'陆良县',416,0,3,NULL),(4499,'马龙县',416,0,3,NULL),(4500,'麒麟区',416,0,3,NULL),(4501,'元江哈尼族彝族傣族自治县',417,0,3,NULL),(4502,'华宁县',417,0,3,NULL),(4503,'峨山彝族自治县',417,0,3,NULL),(4504,'新平彝族傣族自治县',417,0,3,NULL),(4505,'易门县',417,0,3,NULL),(4506,'江川县',417,0,3,NULL),(4507,'澄江县',417,0,3,NULL),(4508,'红塔区',417,0,3,NULL),(4509,'通海县',417,0,3,NULL),(4510,'施甸县',418,0,3,NULL),(4511,'昌宁县',418,0,3,NULL),(4512,'腾冲县',418,0,3,NULL),(4513,'隆阳区',418,0,3,NULL),(4514,'龙陵县',418,0,3,NULL),(4515,'大关县',419,0,3,NULL),(4516,'威信县',419,0,3,NULL),(4517,'巧家县',419,0,3,NULL),(4518,'彝良县',419,0,3,NULL),(4519,'昭阳区',419,0,3,NULL),(4520,'水富县',419,0,3,NULL),(4521,'永善县',419,0,3,NULL),(4522,'盐津县',419,0,3,NULL),(4523,'绥江县',419,0,3,NULL),(4524,'镇雄县',419,0,3,NULL),(4525,'鲁甸县',419,0,3,NULL),(4526,'华坪县',420,0,3,NULL),(4527,'古城区',420,0,3,NULL),(4528,'宁蒗彝族自治县',420,0,3,NULL),(4529,'永胜县',420,0,3,NULL),(4530,'玉龙纳西族自治县',420,0,3,NULL),(4531,'临翔区',422,0,3,NULL),(4532,'云县',422,0,3,NULL),(4533,'凤庆县',422,0,3,NULL),(4534,'双江拉祜族佤族布朗族傣族自治县',422,0,3,NULL),(4535,'永德县',422,0,3,NULL),(4536,'沧源佤族自治县',422,0,3,NULL),(4537,'耿马傣族佤族自治县',422,0,3,NULL),(4538,'镇康县',422,0,3,NULL),(4539,'元谋县',423,0,3,NULL),(4540,'南华县',423,0,3,NULL),(4541,'双柏县',423,0,3,NULL),(4542,'大姚县',423,0,3,NULL),(4543,'姚安县',423,0,3,NULL),(4544,'楚雄市',423,0,3,NULL),(4545,'武定县',423,0,3,NULL),(4546,'永仁县',423,0,3,NULL),(4547,'牟定县',423,0,3,NULL),(4548,'禄丰县',423,0,3,NULL),(4549,'个旧市',424,0,3,NULL),(4550,'元阳县',424,0,3,NULL),(4551,'屏边苗族自治县',424,0,3,NULL),(4552,'建水县',424,0,3,NULL),(4553,'开远市',424,0,3,NULL),(4554,'弥勒县',424,0,3,NULL),(4555,'河口瑶族自治县',424,0,3,NULL),(4556,'泸西县',424,0,3,NULL),(4557,'石屏县',424,0,3,NULL),(4558,'红河县',424,0,3,NULL),(4559,'绿春县',424,0,3,NULL),(4560,'蒙自县',424,0,3,NULL),(4561,'金平苗族瑶族傣族自治县',424,0,3,NULL),(4562,'丘北县',425,0,3,NULL),(4563,'富宁县',425,0,3,NULL),(4564,'广南县',425,0,3,NULL),(4565,'文山县',425,0,3,NULL),(4566,'砚山县',425,0,3,NULL),(4567,'西畴县',425,0,3,NULL),(4568,'马关县',425,0,3,NULL),(4569,'麻栗坡县',425,0,3,NULL),(4570,'勐海县',426,0,3,NULL),(4571,'勐腊县',426,0,3,NULL),(4572,'景洪市',426,0,3,NULL),(4573,'云龙县',427,0,3,NULL),(4574,'剑川县',427,0,3,NULL),(4575,'南涧彝族自治县',427,0,3,NULL),(4576,'大理市',427,0,3,NULL),(4577,'宾川县',427,0,3,NULL),(4578,'巍山彝族回族自治县',427,0,3,NULL),(4579,'弥渡县',427,0,3,NULL),(4580,'永平县',427,0,3,NULL),(4581,'洱源县',427,0,3,NULL),(4582,'漾濞彝族自治县',427,0,3,NULL),(4583,'祥云县',427,0,3,NULL),(4584,'鹤庆县',427,0,3,NULL),(4585,'梁河县',428,0,3,NULL),(4586,'潞西市',428,0,3,NULL),(4587,'瑞丽市',428,0,3,NULL),(4588,'盈江县',428,0,3,NULL),(4589,'陇川县',428,0,3,NULL),(4590,'德钦县',430,0,3,NULL),(4591,'维西傈僳族自治县',430,0,3,NULL),(4592,'香格里拉县',430,0,3,NULL),(4593,'城关区',431,0,3,NULL),(4594,'堆龙德庆县',431,0,3,NULL),(4595,'墨竹工卡县',431,0,3,NULL),(4596,'尼木县',431,0,3,NULL),(4597,'当雄县',431,0,3,NULL),(4598,'曲水县',431,0,3,NULL),(4599,'林周县',431,0,3,NULL),(4600,'达孜县',431,0,3,NULL),(4601,'丁青县',432,0,3,NULL),(4602,'八宿县',432,0,3,NULL),(4603,'察雅县',432,0,3,NULL),(4604,'左贡县',432,0,3,NULL),(4605,'昌都县',432,0,3,NULL),(4606,'江达县',432,0,3,NULL),(4607,'洛隆县',432,0,3,NULL),(4608,'类乌齐县',432,0,3,NULL),(4609,'芒康县',432,0,3,NULL),(4610,'贡觉县',432,0,3,NULL),(4611,'边坝县',432,0,3,NULL),(4612,'乃东县',433,0,3,NULL),(4613,'加查县',433,0,3,NULL),(4614,'扎囊县',433,0,3,NULL),(4615,'措美县',433,0,3,NULL),(4616,'曲松县',433,0,3,NULL),(4617,'桑日县',433,0,3,NULL),(4618,'洛扎县',433,0,3,NULL),(4619,'浪卡子县',433,0,3,NULL),(4620,'琼结县',433,0,3,NULL),(4621,'贡嘎县',433,0,3,NULL),(4622,'错那县',433,0,3,NULL),(4623,'隆子县',433,0,3,NULL),(4624,'亚东县',434,0,3,NULL),(4625,'仁布县',434,0,3,NULL),(4626,'仲巴县',434,0,3,NULL),(4627,'南木林县',434,0,3,NULL),(4628,'吉隆县',434,0,3,NULL),(4629,'定日县',434,0,3,NULL),(4630,'定结县',434,0,3,NULL),(4631,'岗巴县',434,0,3,NULL),(4632,'康马县',434,0,3,NULL),(4633,'拉孜县',434,0,3,NULL),(4634,'日喀则市',434,0,3,NULL),(4635,'昂仁县',434,0,3,NULL),(4636,'江孜县',434,0,3,NULL),(4637,'白朗县',434,0,3,NULL),(4638,'聂拉木县',434,0,3,NULL),(4639,'萨嘎县',434,0,3,NULL),(4640,'萨迦县',434,0,3,NULL),(4641,'谢通门县',434,0,3,NULL),(4642,'嘉黎县',435,0,3,NULL),(4643,'安多县',435,0,3,NULL),(4644,'尼玛县',435,0,3,NULL),(4645,'巴青县',435,0,3,NULL),(4646,'比如县',435,0,3,NULL),(4647,'班戈县',435,0,3,NULL),(4648,'申扎县',435,0,3,NULL),(4649,'索县',435,0,3,NULL),(4650,'聂荣县',435,0,3,NULL),(4651,'那曲县',435,0,3,NULL),(4652,'噶尔县',436,0,3,NULL),(4653,'措勤县',436,0,3,NULL),(4654,'改则县',436,0,3,NULL),(4655,'日土县',436,0,3,NULL),(4656,'普兰县',436,0,3,NULL),(4657,'札达县',436,0,3,NULL),(4658,'革吉县',436,0,3,NULL),(4659,'墨脱县',437,0,3,NULL),(4660,'察隅县',437,0,3,NULL),(4661,'工布江达县',437,0,3,NULL),(4662,'朗县',437,0,3,NULL),(4663,'林芝县',437,0,3,NULL),(4664,'波密县',437,0,3,NULL),(4665,'米林县',437,0,3,NULL),(4666,'临潼区',438,0,3,NULL),(4667,'周至县',438,0,3,NULL),(4668,'户县',438,0,3,NULL),(4669,'新城区',438,0,3,NULL),(4670,'未央区',438,0,3,NULL),(4671,'灞桥区',438,0,3,NULL),(4672,'碑林区',438,0,3,NULL),(4673,'莲湖区',438,0,3,NULL),(4674,'蓝田县',438,0,3,NULL),(4675,'长安区',438,0,3,NULL),(4676,'阎良区',438,0,3,NULL),(4677,'雁塔区',438,0,3,NULL),(4678,'高陵县',438,0,3,NULL),(4679,'印台区',439,0,3,NULL),(4680,'宜君县',439,0,3,NULL),(4681,'王益区',439,0,3,NULL),(4682,'耀州区',439,0,3,NULL),(4683,'凤县',440,0,3,NULL),(4684,'凤翔县',440,0,3,NULL),(4685,'千阳县',440,0,3,NULL),(4686,'太白县',440,0,3,NULL),(4687,'岐山县',440,0,3,NULL),(4688,'扶风县',440,0,3,NULL),(4689,'渭滨区',440,0,3,NULL),(4690,'眉县',440,0,3,NULL),(4691,'金台区',440,0,3,NULL),(4692,'陇县',440,0,3,NULL),(4693,'陈仓区',440,0,3,NULL),(4694,'麟游县',440,0,3,NULL),(4695,'三原县',441,0,3,NULL),(4696,'干县',441,0,3,NULL),(4697,'兴平市',441,0,3,NULL),(4698,'彬县',441,0,3,NULL),(4699,'旬邑县',441,0,3,NULL),(4700,'杨陵区',441,0,3,NULL),(4701,'武功县',441,0,3,NULL),(4702,'永寿县',441,0,3,NULL),(4703,'泾阳县',441,0,3,NULL),(4704,'淳化县',441,0,3,NULL),(4705,'渭城区',441,0,3,NULL),(4706,'礼泉县',441,0,3,NULL),(4707,'秦都区',441,0,3,NULL),(4708,'长武县',441,0,3,NULL),(4709,'临渭区',442,0,3,NULL),(4710,'华县',442,0,3,NULL),(4711,'华阴市',442,0,3,NULL),(4712,'合阳县',442,0,3,NULL),(4713,'大荔县',442,0,3,NULL),(4714,'富平县',442,0,3,NULL),(4715,'潼关县',442,0,3,NULL),(4716,'澄城县',442,0,3,NULL),(4717,'白水县',442,0,3,NULL),(4718,'蒲城县',442,0,3,NULL),(4719,'韩城市',442,0,3,NULL),(4720,'吴起县',443,0,3,NULL),(4721,'子长县',443,0,3,NULL),(4722,'安塞县',443,0,3,NULL),(4723,'宜川县',443,0,3,NULL),(4724,'宝塔区',443,0,3,NULL),(4725,'富县',443,0,3,NULL),(4726,'延川县',443,0,3,NULL),(4727,'延长县',443,0,3,NULL),(4728,'志丹县',443,0,3,NULL),(4729,'洛川县',443,0,3,NULL),(4730,'甘泉县',443,0,3,NULL),(4731,'黄陵县',443,0,3,NULL),(4732,'黄龙县',443,0,3,NULL),(4733,'佛坪县',444,0,3,NULL),(4734,'勉县',444,0,3,NULL),(4735,'南郑县',444,0,3,NULL),(4736,'城固县',444,0,3,NULL),(4737,'宁强县',444,0,3,NULL),(4738,'汉台区',444,0,3,NULL),(4739,'洋县',444,0,3,NULL),(4740,'留坝县',444,0,3,NULL),(4741,'略阳县',444,0,3,NULL),(4742,'西乡县',444,0,3,NULL),(4743,'镇巴县',444,0,3,NULL),(4744,'佳县',445,0,3,NULL),(4745,'吴堡县',445,0,3,NULL),(4746,'子洲县',445,0,3,NULL),(4747,'定边县',445,0,3,NULL),(4748,'府谷县',445,0,3,NULL),(4749,'榆林市榆阳区',445,0,3,NULL),(4750,'横山县',445,0,3,NULL),(4751,'清涧县',445,0,3,NULL),(4752,'神木县',445,0,3,NULL),(4753,'米脂县',445,0,3,NULL),(4754,'绥德县',445,0,3,NULL),(4755,'靖边县',445,0,3,NULL),(4756,'宁陕县',446,0,3,NULL),(4757,'岚皋县',446,0,3,NULL),(4758,'平利县',446,0,3,NULL),(4759,'旬阳县',446,0,3,NULL),(4760,'汉滨区',446,0,3,NULL),(4761,'汉阴县',446,0,3,NULL),(4762,'白河县',446,0,3,NULL),(4763,'石泉县',446,0,3,NULL),(4764,'紫阳县',446,0,3,NULL),(4765,'镇坪县',446,0,3,NULL),(4766,'丹凤县',447,0,3,NULL),(4767,'商南县',447,0,3,NULL),(4768,'商州区',447,0,3,NULL),(4769,'山阳县',447,0,3,NULL),(4770,'柞水县',447,0,3,NULL),(4771,'洛南县',447,0,3,NULL),(4772,'镇安县',447,0,3,NULL),(4773,'七里河区',448,0,3,NULL),(4774,'城关区',448,0,3,NULL),(4775,'安宁区',448,0,3,NULL),(4776,'榆中县',448,0,3,NULL),(4777,'永登县',448,0,3,NULL),(4778,'皋兰县',448,0,3,NULL),(4779,'红古区',448,0,3,NULL),(4780,'西固区',448,0,3,NULL),(4781,'嘉峪关市',449,0,3,NULL),(4782,'永昌县',450,0,3,NULL),(4783,'金川区',450,0,3,NULL),(4784,'会宁县',451,0,3,NULL),(4785,'平川区',451,0,3,NULL),(4786,'景泰县',451,0,3,NULL),(4787,'白银区',451,0,3,NULL),(4788,'靖远县',451,0,3,NULL),(4789,'张家川回族自治县',452,0,3,NULL),(4790,'武山县',452,0,3,NULL),(4791,'清水县',452,0,3,NULL),(4792,'甘谷县',452,0,3,NULL),(4793,'秦安县',452,0,3,NULL),(4794,'秦州区',452,0,3,NULL),(4795,'麦积区',452,0,3,NULL),(4796,'凉州区',453,0,3,NULL),(4797,'古浪县',453,0,3,NULL),(4798,'天祝藏族自治县',453,0,3,NULL),(4799,'民勤县',453,0,3,NULL),(4800,'临泽县',454,0,3,NULL),(4801,'山丹县',454,0,3,NULL),(4802,'民乐县',454,0,3,NULL),(4803,'甘州区',454,0,3,NULL),(4804,'肃南裕固族自治县',454,0,3,NULL),(4805,'高台县',454,0,3,NULL),(4806,'华亭县',455,0,3,NULL),(4807,'崆峒区',455,0,3,NULL),(4808,'崇信县',455,0,3,NULL),(4809,'庄浪县',455,0,3,NULL),(4810,'泾川县',455,0,3,NULL),(4811,'灵台县',455,0,3,NULL),(4812,'静宁县',455,0,3,NULL),(4813,'敦煌市',456,0,3,NULL),(4814,'玉门市',456,0,3,NULL),(4815,'瓜州县（原安西县）',456,0,3,NULL),(4816,'肃北蒙古族自治县',456,0,3,NULL),(4817,'肃州区',456,0,3,NULL),(4818,'金塔县',456,0,3,NULL),(4819,'阿克塞哈萨克族自治县',456,0,3,NULL),(4820,'华池县',457,0,3,NULL),(4821,'合水县',457,0,3,NULL),(4822,'宁县',457,0,3,NULL),(4823,'庆城县',457,0,3,NULL),(4824,'正宁县',457,0,3,NULL),(4825,'环县',457,0,3,NULL),(4826,'西峰区',457,0,3,NULL),(4827,'镇原县',457,0,3,NULL),(4828,'临洮县',458,0,3,NULL),(4829,'安定区',458,0,3,NULL),(4830,'岷县',458,0,3,NULL),(4831,'渭源县',458,0,3,NULL),(4832,'漳县',458,0,3,NULL),(4833,'通渭县',458,0,3,NULL),(4834,'陇西县',458,0,3,NULL),(4835,'两当县',459,0,3,NULL),(4836,'宕昌县',459,0,3,NULL),(4837,'康县',459,0,3,NULL),(4838,'徽县',459,0,3,NULL),(4839,'成县',459,0,3,NULL),(4840,'文县',459,0,3,NULL),(4841,'武都区',459,0,3,NULL),(4842,'礼县',459,0,3,NULL),(4843,'西和县',459,0,3,NULL),(4844,'东乡族自治县',460,0,3,NULL),(4845,'临夏县',460,0,3,NULL),(4846,'临夏市',460,0,3,NULL),(4847,'和政县',460,0,3,NULL),(4848,'广河县',460,0,3,NULL),(4849,'康乐县',460,0,3,NULL),(4850,'永靖县',460,0,3,NULL),(4851,'积石山保安族东乡族撒拉族自治县',460,0,3,NULL),(4852,'临潭县',461,0,3,NULL),(4853,'卓尼县',461,0,3,NULL),(4854,'合作市',461,0,3,NULL),(4855,'夏河县',461,0,3,NULL),(4856,'玛曲县',461,0,3,NULL),(4857,'碌曲县',461,0,3,NULL),(4858,'舟曲县',461,0,3,NULL),(4859,'迭部县',461,0,3,NULL),(4860,'城东区',462,0,3,NULL),(4861,'城中区',462,0,3,NULL),(4862,'城北区',462,0,3,NULL),(4863,'城西区',462,0,3,NULL),(4864,'大通回族土族自治县',462,0,3,NULL),(4865,'湟中县',462,0,3,NULL),(4866,'湟源县',462,0,3,NULL),(4867,'乐都县',463,0,3,NULL),(4868,'互助土族自治县',463,0,3,NULL),(4869,'化隆回族自治县',463,0,3,NULL),(4870,'平安县',463,0,3,NULL),(4871,'循化撒拉族自治县',463,0,3,NULL),(4872,'民和回族土族自治县',463,0,3,NULL),(4873,'刚察县',464,0,3,NULL),(4874,'海晏县',464,0,3,NULL),(4875,'祁连县',464,0,3,NULL),(4876,'门源回族自治县',464,0,3,NULL),(4877,'同仁县',465,0,3,NULL),(4878,'尖扎县',465,0,3,NULL),(4879,'河南蒙古族自治县',465,0,3,NULL),(4880,'泽库县',465,0,3,NULL),(4881,'共和县',466,0,3,NULL),(4882,'兴海县',466,0,3,NULL),(4883,'同德县',466,0,3,NULL),(4884,'贵南县',466,0,3,NULL),(4885,'贵德县',466,0,3,NULL),(4886,'久治县',467,0,3,NULL),(4887,'玛多县',467,0,3,NULL),(4888,'玛沁县',467,0,3,NULL),(4889,'班玛县',467,0,3,NULL),(4890,'甘德县',467,0,3,NULL),(4891,'达日县',467,0,3,NULL),(4892,'囊谦县',468,0,3,NULL),(4893,'曲麻莱县',468,0,3,NULL),(4894,'杂多县',468,0,3,NULL),(4895,'治多县',468,0,3,NULL),(4896,'玉树县',468,0,3,NULL),(4897,'称多县',468,0,3,NULL),(4898,'乌兰县',469,0,3,NULL),(4899,'冷湖行委',469,0,3,NULL),(4900,'大柴旦行委',469,0,3,NULL),(4901,'天峻县',469,0,3,NULL),(4902,'德令哈市',469,0,3,NULL),(4903,'格尔木市',469,0,3,NULL),(4904,'茫崖行委',469,0,3,NULL),(4905,'都兰县',469,0,3,NULL),(4906,'兴庆区',470,0,3,NULL),(4907,'永宁县',470,0,3,NULL),(4908,'灵武市',470,0,3,NULL),(4909,'西夏区',470,0,3,NULL),(4910,'贺兰县',470,0,3,NULL),(4911,'金凤区',470,0,3,NULL),(4912,'大武口区',471,0,3,NULL),(4913,'平罗县',471,0,3,NULL),(4914,'惠农区',471,0,3,NULL),(4915,'利通区',472,0,3,NULL),(4916,'同心县',472,0,3,NULL),(4917,'盐池县',472,0,3,NULL),(4918,'青铜峡市',472,0,3,NULL),(4919,'原州区',473,0,3,NULL),(4920,'彭阳县',473,0,3,NULL),(4921,'泾源县',473,0,3,NULL),(4922,'西吉县',473,0,3,NULL),(4923,'隆德县',473,0,3,NULL),(4924,'中宁县',474,0,3,NULL),(4925,'沙坡头区',474,0,3,NULL),(4926,'海原县',474,0,3,NULL),(4927,'东山区',475,0,3,NULL),(4928,'乌鲁木齐县',475,0,3,NULL),(4929,'天山区',475,0,3,NULL),(4930,'头屯河区',475,0,3,NULL),(4931,'新市区',475,0,3,NULL),(4932,'水磨沟区',475,0,3,NULL),(4933,'沙依巴克区',475,0,3,NULL),(4934,'达坂城区',475,0,3,NULL),(4935,'乌尔禾区',476,0,3,NULL),(4936,'克拉玛依区',476,0,3,NULL),(4937,'独山子区',476,0,3,NULL),(4938,'白碱滩区',476,0,3,NULL),(4939,'吐鲁番市',477,0,3,NULL),(4940,'托克逊县',477,0,3,NULL),(4941,'鄯善县',477,0,3,NULL),(4942,'伊吾县',478,0,3,NULL),(4943,'哈密市',478,0,3,NULL),(4944,'巴里坤哈萨克自治县',478,0,3,NULL),(4945,'吉木萨尔县',479,0,3,NULL),(4946,'呼图壁县',479,0,3,NULL),(4947,'奇台县',479,0,3,NULL),(4948,'昌吉市',479,0,3,NULL),(4949,'木垒哈萨克自治县',479,0,3,NULL),(4950,'玛纳斯县',479,0,3,NULL),(4951,'米泉市',479,0,3,NULL),(4952,'阜康市',479,0,3,NULL),(4953,'博乐市',480,0,3,NULL),(4954,'温泉县',480,0,3,NULL),(4955,'精河县',480,0,3,NULL),(4956,'博湖县',481,0,3,NULL),(4957,'和硕县',481,0,3,NULL),(4958,'和静县',481,0,3,NULL),(4959,'尉犁县',481,0,3,NULL),(4960,'库尔勒市',481,0,3,NULL),(4961,'焉耆回族自治县',481,0,3,NULL),(4962,'若羌县',481,0,3,NULL),(4963,'轮台县',481,0,3,NULL),(4964,'乌什县',482,0,3,NULL),(4965,'库车县',482,0,3,NULL),(4966,'拜城县',482,0,3,NULL),(4967,'新和县',482,0,3,NULL),(4968,'柯坪县',482,0,3,NULL),(4969,'沙雅县',482,0,3,NULL),(4970,'温宿县',482,0,3,NULL),(4971,'阿克苏市',482,0,3,NULL),(4972,'阿瓦提县',482,0,3,NULL),(4973,'乌恰县',483,0,3,NULL),(4974,'阿克陶县',483,0,3,NULL),(4975,'阿合奇县',483,0,3,NULL),(4976,'阿图什市',483,0,3,NULL),(4977,'伽师县',484,0,3,NULL),(4978,'叶城县',484,0,3,NULL),(4979,'喀什市',484,0,3,NULL),(4980,'塔什库尔干塔吉克自治县',484,0,3,NULL),(4981,'岳普湖县',484,0,3,NULL),(4982,'巴楚县',484,0,3,NULL),(4983,'泽普县',484,0,3,NULL),(4984,'疏勒县',484,0,3,NULL),(4985,'疏附县',484,0,3,NULL),(4986,'英吉沙县',484,0,3,NULL),(4987,'莎车县',484,0,3,NULL),(4988,'麦盖提县',484,0,3,NULL),(4989,'于田县',485,0,3,NULL),(4990,'和田县',485,0,3,NULL),(4991,'和田市',485,0,3,NULL),(4992,'墨玉县',485,0,3,NULL),(4993,'民丰县',485,0,3,NULL),(4994,'洛浦县',485,0,3,NULL),(4995,'皮山县',485,0,3,NULL),(4996,'策勒县',485,0,3,NULL),(4997,'伊宁县',486,0,3,NULL),(4998,'伊宁市',486,0,3,NULL),(4999,'奎屯市',486,0,3,NULL),(5000,'察布查尔锡伯自治县',486,0,3,NULL),(5001,'尼勒克县',486,0,3,NULL),(5002,'巩留县',486,0,3,NULL),(5003,'新源县',486,0,3,NULL),(5004,'昭苏县',486,0,3,NULL),(5005,'特克斯县',486,0,3,NULL),(5006,'霍城县',486,0,3,NULL),(5007,'乌苏市',487,0,3,NULL),(5008,'和布克赛尔蒙古自治县',487,0,3,NULL),(5009,'塔城市',487,0,3,NULL),(5010,'托里县',487,0,3,NULL),(5011,'沙湾县',487,0,3,NULL),(5012,'裕民县',487,0,3,NULL),(5013,'额敏县',487,0,3,NULL),(5014,'吉木乃县',488,0,3,NULL),(5015,'哈巴河县',488,0,3,NULL),(5016,'富蕴县',488,0,3,NULL),(5017,'布尔津县',488,0,3,NULL),(5018,'福海县',488,0,3,NULL),(5019,'阿勒泰市',488,0,3,NULL),(5020,'青河县',488,0,3,NULL),(5021,'石河子市',489,0,3,NULL),(5022,'阿拉尔市',490,0,3,NULL),(5023,'图木舒克市',491,0,3,NULL),(5024,'五家渠市',492,0,3,NULL),(45055,'海外',35,0,2,NULL);
/*!40000 ALTER TABLE `pmall_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_arrival_notice`
--

DROP TABLE IF EXISTS `pmall_arrival_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_arrival_notice` (
  `an_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `an_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `an_email` varchar(100) NOT NULL COMMENT '邮箱',
  `an_mobile` varchar(11) NOT NULL COMMENT '手机号',
  `an_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1到货通知，2预售',
  PRIMARY KEY (`an_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品到货通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_arrival_notice`
--

LOCK TABLES `pmall_arrival_notice` WRITE;
/*!40000 ALTER TABLE `pmall_arrival_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_arrival_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_article`
--

DROP TABLE IF EXISTS `pmall_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `article_position` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示位置:1默认网站前台,2买家,3卖家,4全站',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`article_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_article`
--

LOCK TABLES `pmall_article` WRITE;
/*!40000 ALTER TABLE `pmall_article` DISABLE KEYS */;
INSERT INTO `pmall_article` VALUES (6,2,'',1,1,255,'如何注册成为会员','如何注册成为会员',1449242303),(7,2,'',1,1,255,'如何搜索','如何搜索',1449242303),(8,2,'',1,1,255,'忘记密码','忘记密码',1449242303),(9,2,'',1,1,255,'我要买','我要买',1449242303),(10,2,'',1,1,255,'查看已购买商品','查看已购买商品',1449242303),(11,3,'',1,1,255,'如何管理店铺','如何管理店铺',1449242303),(12,3,'',1,1,255,'查看售出商品','查看售出商品',1449242303),(13,3,'',1,1,255,'如何发货','如何发货',1449242303),(14,3,'',1,1,255,'商城商品推荐','商城商品推荐',1449242303),(15,3,'',1,1,255,'如何申请开店','如何申请开店',1449242303),(16,4,'',1,1,255,'如何注册支付宝','如何注册支付宝',1449242303),(17,4,'',1,1,255,'在线支付','在线支付',1449242303),(18,6,'',1,1,255,'会员修改密码','会员修改密码',1449242303),(19,6,'',1,1,255,'会员修改个人资料','会员修改个人资料',1449242303),(20,6,'',1,1,255,'商品发布','商品发布',1449242303),(21,6,'',1,1,255,'修改收货地址','修改收货地址',1449242303),(22,7,'',1,1,255,'关于ShopWWI','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 网店运维是由一批青年为网店经营者提供技术支持及二次开发业务！立足于为人民服务为标准化管理模式！促进客户成交转化！为客户谋取丰厚利益！网店运维交流中心网址http://www.shopnc.com </p>',1449242303),(23,7,'',1,1,255,'联系我们','<p>欢迎您对我们的站点、工作、产品和服务提出自己宝贵的意见或建议。我们将给予您及时答复。同时也欢迎您到我们公司来洽商业务。</p>\r\n<p><br />\r\n<strong>公司名称</strong>： 网店运维交流中心 <br />\r\n<strong>通信地址</strong>： http://www.shopnc.com <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>电话</strong>： 400-880-1509 <br />\r\n<strong>商务Q群</strong>： 111731672 <br />\r\n<strong>软件著作权登记号</strong>： 运维S2.0 <br />\r\n<strong>ICP备案号</strong>： shopWWI00125 </p>',1449242303),(24,7,'',1,1,255,'招聘英才','<dl> <h3>PHP程序员</h3>\r\n<dt>职位要求： <dd>熟悉PHP5开发语言；<br />\r\n熟悉MySQL5数据库，同时熟悉sqlserver，oracle者优先；<br />\r\n熟悉面向对象思想，MVC三层体系，至少使用过目前已知PHP框架其中一种；<br />\r\n熟悉SERVER2003/Linux操作系统，熟悉常用Linux操作命令；<br />\r\n熟悉Mysql数据库应用开发，了解Mysql的数据库配置管理、性能优化等基本操作技能；<br />\r\n熟悉jquery，smarty等常用开源软件；<br />\r\n具备良好的代码编程习惯及较强的文档编写能力；<br />\r\n具备良好的团队合作能力；<br />\r\n熟悉设计模式者优先；<br />\r\n熟悉java，c++,c#,python其中一种者优先； </dd> <dt>学历要求： <dd>大本 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>网页设计（2名）</h3>\r\n<dt>岗位职责： <dd>网站UI设计、 切片以及HTML制作。 </dd> <dt>职位要求： <dd>有大型网站设计经验；有网站改版、频道建设经验者优先考虑； <br />\r\n熟练掌握photoshop,fireworks,dreamwaver等设计软件； <br />\r\n熟练运用Div+Css制作网页，符合CSS2.0-W3C标准，并掌握不同浏览器下，不同版本下CSS元素的区别；<br />\r\n熟悉网站制作流程，能运用并修改简单JavaScript类程序； <br />\r\n积极向上，有良好的人际沟通能力，良好的工作协调能力，踏实肯干的工作精神；具有良好的沟通表达能力，<br />\r\n需求判断力，团队协作能力； <br />\r\n请应聘者在简历中提供个人近期作品连接。 </dd> <dt>学历要求： <dd>专科 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl> <dl> <h3>方案策划（1名）</h3>\r\n<dt>职位要求： <dd>2年以上的文案编辑类相关工作经验，具备一定的文字功底，有极强的语言表达和逻辑思维能力， 能独立完成项目方案的编写，拟草各种协议。熟悉使用办公软件。 </dd> <dt>学历要求： <dd>大专以上 </dd> <dt>工作经验： <dd>一年以上 </dd> <dt>工作地点： <dd>天津 </dd></dl>',1449242303),(25,7,'',1,1,255,'合作及洽谈','<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; shopnc希望与服务代理商、合作伙伴并肩合作，携手开拓日益广阔的网络购物软件市场。如果您拥有好的建议，拥有丰富渠道资源、拥有众多目标客户、拥有相应的市场资源，并希望与shopnc进行深度业务合作， 欢迎成为shopnc业务合作伙伴，请联系。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>公司名称</strong>： 网店运维交流中心 <br />\r\n<strong>通信地址</strong>： http://www.shopnc.com <br />\r\n<strong>邮政编码</strong>： 300121 <br />\r\n<strong>QQ群</strong>： 111731672 <br />\r\n<strong>商务洽谈</strong>： 111731672 <br />\r\n</p>',1449242303),(26,5,'',1,1,255,'联系卖家','联系卖家',1449242303),(28,4,'',1,1,255,'分期付款','分期付款<br />',1449242303),(29,4,'',1,1,255,'邮局汇款','邮局汇款<br />',1449242303),(30,4,'',1,1,255,'公司转账','公司转账<br />',1449242303),(31,5,'',1,1,255,'退换货政策','退换货政策',1449242303),(32,5,'',1,1,255,'退换货流程','退换货流程',1449242303),(33,5,'',1,1,255,'返修/退换货','返修/退换货',1449242303),(34,5,'',1,1,255,'退款申请','退款申请',1449242303),(35,1,'http://www.shopnc.com/',1,1,1,'火爆销售中','火爆销售中<br />',1449242303),(36,1,'',1,1,255,'管理功能说明','管理功能说明',1449242303),(37,1,'',1,1,255,'如何扩充水印字体库','如何扩充水印字体库',1449242303),(38,1,'',1,1,255,'提示信息','提示信息',1449242303),(39,2,'',1,1,255,'积分细则','积分细则积分细则',1449242303),(40,2,'',1,1,255,'积分兑换说明','积分兑换说明',1449242303),(41,1,'',1,1,255,'功能使用说明','功能使用说明',1449242303);
/*!40000 ALTER TABLE `pmall_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_article_class`
--

DROP TABLE IF EXISTS `pmall_article_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_article_class` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `ac_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_article_class`
--

LOCK TABLES `pmall_article_class` WRITE;
/*!40000 ALTER TABLE `pmall_article_class` DISABLE KEYS */;
INSERT INTO `pmall_article_class` VALUES (1,'notice','商城公告',0,1),(2,'member','新手指南',0,2),(3,'store','商家中心',0,3),(4,'payment','支付方式',0,4),(5,'sold','售后服务',0,5),(6,'service','购物指南',0,6),(7,'about','关于我们',0,7);
/*!40000 ALTER TABLE `pmall_article_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_attribute`
--

DROP TABLE IF EXISTS `pmall_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值列',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '是否显示。0为不显示、1为显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_attribute`
--

LOCK TABLES `pmall_attribute` WRITE;
/*!40000 ALTER TABLE `pmall_attribute` DISABLE KEYS */;
INSERT INTO `pmall_attribute` VALUES (32,'类型',5,'电子,水银',1,0),(34,'加压方式',5,'智能加压,手动加压',1,0),(35,'检测方式',5,'臂式,腿式',1,0),(36,'显示方式',5,'自动式,浮标',1,0),(37,'精度',5,'&lt;5毫米汞柱,&gt;5毫米汞柱',1,0),(38,'工作模式',5,'全自动,人工',1,0);
/*!40000 ALTER TABLE `pmall_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_attribute_value`
--

DROP TABLE IF EXISTS `pmall_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_attribute_value` (
  `attr_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值id',
  `attr_value_name` varchar(100) DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_value_sort` tinyint(1) unsigned NOT NULL COMMENT '属性值排序',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_attribute_value`
--

LOCK TABLES `pmall_attribute_value` WRITE;
/*!40000 ALTER TABLE `pmall_attribute_value` DISABLE KEYS */;
INSERT INTO `pmall_attribute_value` VALUES (41,'电子',32,5,0),(42,'水银',32,5,0),(43,'智能加压',34,5,0),(44,'手动加压',34,5,0),(45,'臂式',35,5,0),(46,'腿式',35,5,0),(47,'自动式',36,5,0),(48,'浮标',36,5,0),(49,'&lt;5毫米汞柱',37,5,0),(50,'&gt;5毫米汞柱',37,5,0),(51,'全自动',38,5,0),(52,'人工',38,5,0);
/*!40000 ALTER TABLE `pmall_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_b2c_drugs_base_info`
--

DROP TABLE IF EXISTS `pmall_b2c_drugs_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_b2c_drugs_base_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `standard_code` varchar(200) DEFAULT NULL COMMENT 'æœ¬ä½ç ',
  `ATCMA` varchar(200) DEFAULT NULL,
  `PRONAME` varchar(200) DEFAULT NULL,
  `NAME` varchar(200) DEFAULT NULL,
  `ENAME` varchar(200) DEFAULT NULL,
  `HXMC` varchar(255) DEFAULT NULL,
  `GUIGE` varchar(200) DEFAULT NULL,
  `JIXING` varchar(200) DEFAULT NULL,
  `PZWH` varchar(200) DEFAULT NULL,
  `CID` bigint(22) DEFAULT NULL COMMENT 'åˆ†ç±»ID',
  `BID` bigint(22) DEFAULT NULL COMMENT 'å“ç‰ŒID',
  `DETAIL_DESC` longtext,
  `KEYWORDS` varchar(200) DEFAULT NULL,
  `COMPANY` varchar(200) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `SHOP_CODE` varchar(50) DEFAULT NULL,
  `SEARCH_TITLE` varchar(150) DEFAULT NULL,
  `SEARCH_KEYWORDS` varchar(150) DEFAULT NULL,
  `SEARCH_DESCRIPTION` varchar(150) DEFAULT NULL,
  `crtdate` varchar(20) DEFAULT '',
  `STATICFILEPATH` varchar(255) DEFAULT NULL,
  `SHOP_PRIVATE` varchar(1) DEFAULT '0',
  `SHPDW` varchar(120) DEFAULT NULL,
  `SHPBZH` mediumtext,
  `GNZHZH` mediumtext,
  `YLYF` mediumtext,
  `ZHYCHF` mediumtext,
  `XZH` mediumtext,
  `YLZY` mediumtext,
  `JINJI` mediumtext,
  `ZHYSHX` mediumtext,
  `CUNCANG` mediumtext,
  `BLFY` mediumtext,
  `JIXING2` varchar(200) DEFAULT NULL,
  `YWXHZY` mediumtext,
  `ISJINKOU` varchar(200) DEFAULT NULL,
  `JINKOUDIQU` mediumtext,
  `YOUXIAOQI` mediumtext,
  `YIBAOFENLEI` mediumtext,
  `ISCHUFANG` varchar(1) DEFAULT '0' COMMENT '0-éžè¯ç‰© 1-å¤„æ–¹è¯ 2-éžå¤„æ–¹è¯',
  `SHYRQ` mediumtext,
  `SHPMSH` mediumtext,
  `IMG_B` varchar(100) DEFAULT NULL,
  `IMG_S` varchar(100) DEFAULT NULL,
  `listBImg` varchar(200) DEFAULT NULL,
  `listSImg` varchar(200) DEFAULT NULL,
  `dpImg` varchar(200) DEFAULT NULL,
  `scrollSImg` varchar(100) DEFAULT NULL,
  `recommendDid` bigint(20) DEFAULT '0' COMMENT 'å¼•ç”¨å•†å®¶ç§æœ‰æ•°æ®çš„did',
  `sufix` int(11) DEFAULT '0' COMMENT 'å•†å“ç¼–å·å‰åº:1 è¯å“ï¼ˆå¤„æ–¹è¯ï¼‰,2 è¯å“ï¼ˆéžå¤„æ–¹è¯ï¼‰,3 æ¯å©´ç”¨å“,4 ç¾Žå®¹æŠ¤è‚¤,5 ä¿å¥ç”¨å“,6 æˆäººç”¨å“,7 è¯è†³ç¤¼å“,8 åŒ»è¯å™¨æ¢°,9 å…¶ä»–',
  `bName` varchar(100) DEFAULT NULL COMMENT 'å“ç‰Œåç§°',
  `cname` varchar(50) DEFAULT NULL COMMENT 'åŸºç¡€åˆ†ç±»åç§°(å½“å‰åˆ†ç±»çš„)',
  `cbidPath` varchar(20) DEFAULT NULL COMMENT 'åŸºç¡€åˆ†ç±»idçš„å…¨è·¯å¾„(åŒ…æ‹¬æ‰€æœ‰åˆ†çº§ä¸Žå½“å‰çº§)ï¼Œidé—´ä»¥_åˆ†å‰²',
  `merchant_name` varchar(100) DEFAULT NULL COMMENT 'å•†å®¶åç§°ï¼Œç§æœ‰å•†å“æ—¶éœ€è¦å¡«å†™æ­¤åç§°',
  `allName` varchar(200) DEFAULT NULL COMMENT 'å•†å®¶å…¨ç§°ï¼Œç§æœ‰å•†å“æ—¶éœ€è¦å¡«å†™æ­¤åç§°',
  `cbType` varchar(1) DEFAULT NULL COMMENT 'åŸºç¡€èµ„æ–™æ‰€å±žåŸºç¡€åˆ†ç±»çš„å±žæ€§',
  `CRTDATEL` bigint(19) DEFAULT '0' COMMENT 'æ•°æ®åˆ›å»ºæ—¶é—´',
  `accurateKeys` varchar(100) DEFAULT '' COMMENT 'ç²¾ç¡®æœç´¢å…³é”®è¯',
  `firstLetter` char(1) DEFAULT NULL COMMENT 'é¦–å­—æ¯,è§„åˆ™ï¼šè‹±æ–‡ï¼‹æ±‰å­—å–æ±‰å­—é¦–å­—æ¯ï¼Œçº¯è‹±æ–‡å–è‹±æ–‡é¦–å­—æ¯ã€‚é¦–å­—æ¯è¯·ä½¿ç”¨å¤§å†™',
  `weight` int(11) DEFAULT '0' COMMENT 'å•†å“é‡é‡ï¼šå•ä½å…‹',
  `allNamePath` varchar(4000) DEFAULT '' COMMENT 'åŸºç¡€åˆ†ç±»åç§°è·¯å¾„',
  `manufacturer_id` bigint(20) DEFAULT NULL,
  `enabled` smallint(6) DEFAULT '1' COMMENT '0-åœç”¨ 1-å¯ç”¨(è½¯åˆ é™¤å­—æ®µ)',
  `YLDL` mediumtext,
  `editflag` varchar(1) DEFAULT NULL COMMENT 'æ˜¯å¦å·²ç¼–è¾‘0:ç¡®è®¤é€šè¿‡ 1:å·²ç¼–è¾‘  2:æœªç¼–è¾‘',
  `standard_sku_count` bigint(10) DEFAULT '0' COMMENT 'æ ‡å‡†skuæ•°é‡ç»Ÿè®¡',
  `product_count` bigint(10) DEFAULT '0' COMMENT 'å‘å¸ƒå•†å“ç»Ÿè®¡',
  `accurate_keys` varchar(100) DEFAULT NULL,
  `all_name` varchar(200) DEFAULT NULL,
  `all_name_path` varchar(4000) DEFAULT NULL,
  `cb_type` varchar(1) DEFAULT NULL,
  `cbid_path` varchar(20) DEFAULT NULL,
  `dp_img` varchar(200) DEFAULT NULL,
  `first_letter` varchar(1) DEFAULT NULL,
  `recommend_did` bigint(20) DEFAULT NULL,
  `is_lock_up` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:æ­£å¸¸,1ï¼šç¦å”®/é”å®š(æ˜¯å¦ç¦å”®/é”å®š)',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ é™¤æ—¶é—´',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`NAME`) USING BTREE,
  KEY `idx_ischufang` (`ISCHUFANG`) USING BTREE,
  KEY `idx_manufacturer_id` (`manufacturer_id`) USING BTREE,
  KEY `idx_cid` (`CID`) USING BTREE,
  FULLTEXT KEY `idx_pzwh` (`PZWH`)
) ENGINE=MyISAM AUTO_INCREMENT=190498 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_b2c_drugs_base_info`
--

LOCK TABLES `pmall_b2c_drugs_base_info` WRITE;
/*!40000 ALTER TABLE `pmall_b2c_drugs_base_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_b2c_drugs_base_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_b2c_goods_sku`
--

DROP TABLE IF EXISTS `pmall_b2c_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_b2c_goods_sku` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'æ˜¯å¦å¯ç”¨(0:åœç”¨,1:å¯ç”¨)',
  `base_info_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'è¯ç›®åŸºç¡€ä¿¡æ¯ä¸»é”®IDå…³è”drugs_base_info',
  `unit` char(20) NOT NULL DEFAULT '' COMMENT 'å•ä½',
  `bar_code` varchar(50) NOT NULL DEFAULT '' COMMENT 'æ¡ç ',
  `specification_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'è§„æ ¼åç§°',
  `standard_name` varchar(100) NOT NULL DEFAULT '' COMMENT 'æ ‡å‡†åç§°',
  `mainimg` varchar(200) NOT NULL DEFAULT '' COMMENT 'é»˜è®¤ä¸»å›¾',
  `detail_desc` longtext NOT NULL COMMENT 'è¯¦ç»†æè¿°',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ é™¤æ—¶é—´',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_b2c_goods_sku`
--

LOCK TABLES `pmall_b2c_goods_sku` WRITE;
/*!40000 ALTER TABLE `pmall_b2c_goods_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_b2c_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_brand`
--

DROP TABLE IF EXISTS `pmall_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_brand` (
  `brand_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_class` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `brand_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `brand_sort` tinyint(3) unsigned DEFAULT '0' COMMENT '排序',
  `brand_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `brand_apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用，系统后台默认为1',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `show_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '品牌展示类型 0表示图片 1表示文字 ',
  `brand_bgpic` varchar(100) DEFAULT '/data/upload/shop/editor/brand_default_max.jpg' COMMENT '品牌大图',
  `brand_xbgpic` varchar(100) DEFAULT '/data/upload/shop/editor/brand_default_small.jpg' COMMENT '品牌小图',
  `brand_tjstore` varchar(100) DEFAULT '请于品牌管理里编辑我' COMMENT '品牌副标题',
  `brand_introduction` varchar(300) DEFAULT '网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改' COMMENT '品牌介绍',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_brand`
--

LOCK TABLES `pmall_brand` WRITE;
/*!40000 ALTER TABLE `pmall_brand` DISABLE KEYS */;
INSERT INTO `pmall_brand` VALUES (79,'justyle','J','服饰鞋帽','04397468710494742_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(80,'享爱.','H','服饰鞋帽','04397468934349942_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(81,'派丽蒙','P','女装','04397469152627878_sm.jpg',0,0,0,1,4,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(82,'康妮雅','K','女装','04397471448679692_sm.jpg',0,0,0,1,4,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(83,'秀秀美','X','女装','04397471716977022_sm.jpg',0,0,0,1,4,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(84,'阿迪达斯','A','服饰鞋帽','04397471910652190_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(85,'猫人','M','内衣','04397472152849925_sm.jpg',0,0,0,1,6,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(86,'茵曼（INMAN）','Y','T恤','04397472336312422_sm.jpg',0,0,0,1,12,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(87,'Hanes恒适','H','服饰鞋帽','04397472577467506_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(88,'缪诗','M','休闲鞋','04397472716852803_sm.jpg',0,0,0,1,74,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(89,'真维斯','Z','服饰鞋帽','04397472838086984_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(90,'金利来','J','西服','04397473042647991_sm.jpg',0,0,0,1,47,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(91,'其乐','Q','休闲鞋','04397473331842699_sm.jpg',0,1,0,1,109,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(92,'Newbalance','N','功能鞋','04397473633585549_sm.jpg',0,1,0,1,112,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(93,'百丽','B','女鞋','04398088925179484_sm.png',0,1,0,1,8,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(94,'七匹狼','Q','服饰鞋帽','04398089136939537_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(95,'李宁','L','运动','04398089270610035_sm.jpg',0,0,0,1,7,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(96,'佐丹奴','Z','服饰鞋帽','04398089412399747_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(97,'百思图','B','休闲鞋','04398089574801901_sm.jpg',0,0,0,1,93,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(98,'斯波帝卡','S','男装','04398089726299223_sm.jpg',0,0,0,1,5,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(99,'梦特娇','M','男装','04398089942879365_sm.jpg',0,1,0,1,5,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(100,'宝姿','B','服饰鞋帽','04398090061006740_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(101,'爱帝','A','服饰鞋帽','04398090218578648_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(102,'她他/tata','T','高跟鞋','04398090459092275_sm.jpg',0,0,0,1,91,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(103,'ELLE HOME','E','服饰鞋帽','04398090611386532_sm.jpg',0,1,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(104,'esprit','E','女装','04398090828687339_sm.jpg',0,1,0,1,4,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(105,'westside','W','服饰鞋帽','04398090975832253_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(106,'RDK','P','睡衣','04398091763582415_sm.jpg',0,0,0,1,62,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(107,'皮尔卡丹','P','风衣','04398091877500105_sm.jpg',0,0,0,1,43,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(108,'挪巍','N','服饰鞋帽','04398091973797599_sm.jpg',0,0,0,1,1,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(113,'波斯顿','B','个护化妆','04398099293923325_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(114,'薇姿','W','个护化妆','04398099463167230_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(115,'相宜本草','X','个护化妆','04398099611242673_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(116,'Dior','D','个护化妆','04398099738566948_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(117,'苏菲','S','个护化妆','04398099870651075_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(118,'faceshop','F','个护化妆','04398100051941493_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(119,'芙丽芳丝','F','个护化妆','04398100178308363_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(120,'娇爽','J','个护化妆','04398100362129645_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(121,'卡尼尔','K','个护化妆','04398100483927289_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(122,'纪梵希','J','个护化妆','04398100614445814_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(123,'护舒宝','H','个护化妆','04398100738554064_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(124,'兰蔻','L','个护化妆','04398100899214207_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(125,'娇兰','J','个护化妆','04398101035858820_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(126,'高丝洁','G','个护化妆','04398101363358081_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(127,'妮维雅','N','个护化妆','04398101539246004_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(128,'高丝','G','个护化妆','04398101708424765_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(129,'狮王','S','个护化妆','04398101929845854_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(130,'雅顿','Y','个护化妆','04398102086535787_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(131,'M.A.C','M','个护化妆','04398102231196519_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(132,'李施德林','L','个护化妆','04398102411008632_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(133,'雅诗兰黛','Y','个护化妆','04398102581821577_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(134,'MISS FACE','M','个护化妆','04398102756025036_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(135,'佳洁士','J','个护化妆','04398102918746492_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(136,'资生堂','X','个护化妆','04398103163925153_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(137,'倩碧','Q','个护化妆','04398103335196758_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(138,'benefit','B','个护化妆','04398103525876196_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(139,'SISLEY','S','个护化妆','04398103731155516_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(140,'爱丽','A','个护化妆','04398103883736888_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(141,'BOBBI BROWN','B','个护化妆','04398104034802420_sm.jpg',0,0,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(142,'SK-ll','S','个护化妆','04398104206717960_sm.jpg',0,1,0,1,470,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(143,'施华洛世奇','S','珠宝手表','04398116735872287_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(144,'万宝龙','W','珠宝手表','04398116855649611_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(145,'CK','C','珠宝手表','04398116986166995_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(146,'Disney','D','珠宝手表','04398117134560677_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(147,'佐卡伊','Z','珠宝手表','04398117259027285_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(148,'ZIPPO','Z','','04398117390207814_sm.gif',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(149,'梅花','M','珠宝手表','04398117504203345_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(150,'高仕','G','珠宝手表','04398117735732690_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(151,'宝玑','B','珠宝手表','04398117910949174_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(152,'一生一石','Y','珠宝手表','04398118118206423_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(153,'IDee','I','珠宝手表','04398118344918440_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(154,'elle','E','珠宝手表','04398118494505137_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(155,'卡西欧','K','珠宝手表','04398118617326698_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(156,'爱卡','A','珠宝手表','04398118792328978_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(157,'帝舵','D','珠宝手表','04398118894311290_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(158,'新秀','X','珠宝手表','04398119032319322_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(159,'九钻','J','珠宝手表','04398119151718735_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(160,'卡地亚','K','珠宝手表','04398119311706852_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(161,'蓝色多瑙河','L','珠宝手表','04398119501897486_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(162,'浪琴','L','珠宝手表','04398119677440904_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(163,'百利恒','B','珠宝手表','04398119859319840_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(164,'欧米茄','O','珠宝手表','04398119996858692_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(165,'tissot','T','珠宝手表','04398120131178815_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(166,'新光饰品','X','珠宝手表','04398120247306694_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(167,'英雄','Y','珠宝手表','04398120419590838_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(168,'瑞士军刀','R','珠宝手表','04398120584040229_sm.gif',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(169,'斯沃琪','S','珠宝手表','04398121090096799_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(170,'阿玛尼','A','珠宝手表','04398121209932680_sm.jpg',0,1,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(171,'亨得利','H','珠宝手表','04398125089603514_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(172,'lux-women','L','珠宝手表','04398125296052150_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(173,'ooh Dear','O','珠宝手表','04398125473712411_sm.jpg',0,0,0,1,530,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(174,'acer','A','数码办公','04398155389308089_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(175,'清华同方','Q','数码办公','04398155613517981_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(176,'富士通','F','数码办公','04398155751072786_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(177,'微软','W','数码办公','04398155862912765_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(178,'得力','D','数码办公','04398156045665837_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(179,'DELL','D','数码办公','04398156232757027_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(180,'ThinkPad','T','数码办公','04398156358858442_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(181,'联想打印机','L','数码办公','04398156503421310_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(182,'金士顿','J','数码办公','04398156705753579_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(183,'TP-LINK','T','数码办公','04398156873572761_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(184,'华硕','H','数码办公','04398157012150899_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(185,'罗技','L','数码办公','04398157235673753_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(186,'D-Link','D','数码办公','04398157356404105_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(187,'雷蛇','L','数码办公','04398157472174891_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(188,'IT-CEO','I','数码办公','04398157595321784_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(189,'hyundri','H','数码办公','04398157712394024_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(190,'惠普','H','数码办公','04398157881561725_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(191,'迈乐','M','数码办公','04398158065769057_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(192,'爱普生','A','数码办公','04398158266047493_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(193,'三木','S','数码办公','04398158379932048_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(194,'忆捷','Y','数码办公','04398158508475720_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(195,'佰科','B','数码办公','04398158666713881_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(196,'飞利浦','F','数码办公','04398158808225051_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(197,'雷柏','L','数码办公','04398158987559915_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(198,'双飞燕','S','数码办公','04398159147857437_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(199,'网件','W','数码办公','04398159314915358_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(200,'山泽','S','数码办公','04398159479959395_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(201,'松下','S','数码办公','04398159595550035_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(202,'TPOS','T','数码办公','04398159795526441_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(203,'富勒','F','数码办公','04398159927301628_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(204,'北通','B','数码办公','04398160061664664_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(205,'romoss','R','数码办公','04398160187629402_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(206,'索爱','S','数码办公','04398160348310562_sm.gif',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(207,'台电','T','数码办公','04398160575221477_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(208,'三星','S','数码办公','04398160720944823_sm.jpg',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(209,'理光','L','数码办公','04398160857676307_sm.gif',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(210,'飞毛腿','F','数码办公','04398161023292593_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(211,'阿尔卡特','A','数码办公','04398161143888870_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(212,'诺基亚','N','数码办公','04398161259006857_sm.gif',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(213,'摩托罗拉','M','数码办公','04398161410885588_sm.gif',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(214,'苹果','P','数码办公','04398168923750202_sm.png',0,1,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(215,'HTC','H','数码办公','04398169850955399_sm.jpg',0,0,0,1,256,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(216,'九阳','J','家用电器','04399844516657174_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(217,'索尼','S','家用电器','04399833099806870_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(218,'格力','G','家用电器','04399833262328490_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(219,'夏普','H','家用电器','04399833425234004_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(220,'美的','M','家用电器','04399833601121412_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(221,'博朗','B','家用电器','04399833768343488_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(222,'TCL','T','家用电器','04399833953558287_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(223,'欧姆龙','O','家用电器','04399834117653152_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(224,'苏泊尔','S','家用电器','04399834427362760_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(225,'伊莱克斯','Y','家用电器','04399834676870929_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(226,'艾力斯特','A','家用电器','04399835435836906_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(227,'西门子','X','家用电器','04399835594337307_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(228,'三菱电机','S','家用电器','04399835807315767_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(229,'奔腾','S','家用电器','04399836030618924_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(230,'三洋','S','家用电器','04399836185660687_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(231,'大金','D','家用电器','04399836403301996_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(232,'三星电器','S','家用电器','04399836619819860_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(233,'海尔','H','家用电器','04399837024444210_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(234,'格兰仕','G','家用电器','04399837873721609_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(235,'海信','H','家用电器','04399838032416433_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(236,'博世','B','家用电器','04399838243363042_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(237,'老板','L','家用电器','04399838473427197_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(238,'奥克斯','A','家用电器','04399838633002147_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(239,'LG','L','家用电器','04399838782976323_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(240,'创维','C','家用电器','04399839110204841_sm.jpg',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(241,'松下电器','S','家用电器','04399839604098052_sm.gif',0,0,0,1,308,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(242,'中国联通','Z','虚拟充值','04399847297781057_sm.jpg',0,0,0,1,1037,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(243,'中国电信','Z','虚拟充值','04399847472066981_sm.jpg',0,0,0,1,1037,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(244,'中国移动','Z','虚拟充值','04399847612667714_sm.jpg',0,0,0,1,1037,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(245,'一品玉','Y','食品饮料','04399854316938195_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(246,'金奥力','J','食品饮料','04399854503149255_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(247,'北大荒','B','食品饮料','04399854638913791_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(248,'健安喜','J','食品饮料','04399854806939714_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(249,'屯河','T','食品饮料','04399854945115195_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(250,'养生堂','Y','食品饮料','04399855140966866_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(251,'同庆和堂','T','食品饮料','04399855332734276_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(252,'黄飞红','H','食品饮料','04399855513686549_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(253,'乐力','L','食品饮料','04399855699218750_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(254,'汤臣倍健','T','食品饮料','04399855941379731_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(255,'康比特','K','食品饮料','04399856135110739_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(256,'喜瑞','X','食品饮料','04399856323294870_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(257,'同仁堂','T','食品饮料','04399856454919811_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(258,'白兰氏','B','食品饮料','04399856638765013_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(259,'Lumi','L','食品饮料','04399856804968818_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(260,'新西兰十一坊','X','食品饮料','04399856948519746_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(261,'自然之宝','Z','食品饮料','04399857092677752_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(262,'善存','S','食品饮料','04399857246559825_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(263,'长城葡萄酒','C','食品饮料','04399857399887704_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(264,'凯镛','K','食品饮料','04399857579422195_sm.jpg',0,0,0,1,593,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(267,'惠氏','H','母婴用品','04399878077210018_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(268,'lala布书','L','母婴用品','04399878481448839_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(269,'美赞臣','M','母婴用品','04399878617014779_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(270,'好奇','H','母婴用品','04399878791943342_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(271,'多美','D','母婴用品','04399878980307860_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(272,'嘉宝','J','母婴用品','04399879383821119_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(273,'孩之宝','H','母婴用品','04399879573077116_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(274,'嗳呵','A','母婴用品','04399879712252398_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(275,'美斯特伦','M','母婴用品','04399879861821747_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(276,'乐高','L','母婴用品','04399880083330972_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(277,'芭比','B','母婴用品','04399880244694286_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(278,'NUK','N','母婴用品','04399880420786755_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(279,'魔法玉米','M','母婴用品','04399880604749242_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(280,'宝贝第一','B','母婴用品','04399880757446523_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(281,'强生','Q','母婴用品','04399880892528550_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(282,'澳优','A','母婴用品','04399881087936122_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(283,'木马智慧','M','母婴用品','04399881246572965_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(284,'百立乐','B','母婴用品','04399881709264364_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(285,'雀巢','Q','母婴用品','04399881950170970_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(286,'帮宝适','B','母婴用品','04399882134949479_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(287,'万代','W','母婴用品','04399882291234767_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(288,'亲贝','Q','母婴用品','04399882442124015_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(289,'十月天使','S','母婴用品','04399882581513663_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(290,'多美滋','D','母婴用品','04399882826616164_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(291,'星辉','X','母婴用品','04399882966084988_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(292,'布朗博士','B','母婴用品','04399883157641690_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(293,'新安怡','X','母婴用品','04399883297614786_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(294,'费雪','F','母婴用品','04399883534332035_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(295,'Hipp','H','母婴用品','04399883690219411_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(296,'新大王','X','母婴用品','04399883855598553_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(297,'雅培','Y','母婴用品','04399884035362889_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(298,'亨氏','H','母婴用品','04399884182772511_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(299,'十月妈咪','S','母婴用品','04399884360526483_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(300,'好孩子','H','母婴用品','04399884512865285_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(301,'婴姿坊','Y','母婴用品','04399884644632532_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(302,'妈咪宝贝','M','母婴用品','04399884799920935_sm.jpg',0,0,0,1,959,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(303,'直觉','Z','运动健康','04399889262024650_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(304,'世达球','S','运动健康','04399889410183423_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(305,'悠度','Y','运动健康','04399889744222357_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(306,'威尔胜','W','运动健康','04399889941968796_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(307,'远洋瑜伽','Y','运动健康','04399890266352034_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(308,'信乐','X','运动健康','04399890429362085_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(309,'诺可文','N','运动健康','04399890643925803_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(310,'艾威','A','运动健康','04399890796771131_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(311,'LELO','L','运动健康','04399890952734102_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(312,'乔山','Q','运动健康','04399891122713199_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(313,'皮克朋','P','运动健康','04399891285897466_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(314,'捷安特','J','运动健康','04399891438458842_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(315,'开普特','K','运动健康','04399891598799644_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(316,'火枫','H','运动健康','04399891771381530_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(317,'INDEED','I','运动健康','04399891911058029_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(318,'欧亚马','O','运动健康','04399892067310657_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(319,'李斯特','L','运动健康','04399892199751417_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(320,'乐美福','L','运动健康','04399892359082323_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(321,'以比赞','Y','运动健康','04399892526357198_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(322,'皮尔瑜伽','P','运动健康','04399893307910546_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(323,'以诗萜','Y','运动健康','04399893452531024_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(324,'斯伯丁','S','运动健康','04399893596931049_sm.jpg',0,0,0,1,662,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(326,'玛克','M','','04399902137097199_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(327,'美好家','M','','04399902244747580_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(328,'溢彩年华','Y','','04399902391635130_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(329,'欧司朗','O','','04399902537418591_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(330,'世家洁具','S','','04399902668760247_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(331,'天堂伞','T','','04399902780394855_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(332,'慧乐家','H','','04399902896835151_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(333,'希格','X','','04399903024936544_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(334,'生活诚品','S','','04399903153847612_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(335,'爱仕达','A','','04399903259361371_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(336,'罗莱','L','','04399903404912119_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(337,'索客','S','','04399903541756673_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(338,'好事达','H','','04399903715622158_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(339,'安睡宝','A','','04399903832203331_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(340,'博洋家纺','B','','04399903956723469_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(341,'空间大师','K','','04399904058344749_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(342,'富安娜','F','','04399904168163421_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(343,'三光云彩','S','','04399904279499345_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(344,'乔曼帝','Q','','04399904423386126_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(345,'乐扣乐扣','L','','04399904614221217_sm.jpg',0,0,0,1,0,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(348,'奥唯嘉（Ovega）','A','文胸','04431812331259168_sm.jpg',0,0,0,1,58,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(351,'曼妮芬（ManniForm）','M','内衣','04431810033957836_sm.jpg',0,0,0,1,6,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(352,'婷美（TINGMEI）','T','内衣','04431809546541815_sm.png',0,0,0,1,6,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(353,'古今','G','内衣','04431807497959652_sm.jpg',0,0,0,1,6,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(358,'金史密斯（KINGSMITH）','J','健身器械','04420592440315393_small.gif',0,0,4,1,691,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(359,'周大福','Z','纯金K金饰品','04420650490304114_sm.jpg',0,0,0,1,532,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(360,'周生生','Z','纯金K金饰品','04420650201635924_sm.jpg',0,0,0,1,532,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(364,'BH (必艾奇)','B','运动器械','04420633630909218_small.jpg',0,0,4,1,665,0,'/data/upload/shop/editor/brand_default_max.jpg','/data/upload/shop/editor/brand_default_small.jpg','请于品牌管理里编辑我','网店运维提醒您：你当前的品牌介绍并没有填写！使用默认的这些会出现在你的眼前，请于后台进行修改'),(365,'白云山','B','中西成药','',0,0,0,1,1057,1,'','','','&lt;span style=&quot;color:#666666;font-family:宋体, Arial, Helvetica, sans-serif;font-size:13px;line-height:25px;&quot;&gt;白云山&lt;/span&gt;');
/*!40000 ALTER TABLE `pmall_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cart`
--

DROP TABLE IF EXISTS `pmall_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家id',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '购买商品数量',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='购物车数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cart`
--

LOCK TABLES `pmall_cart` WRITE;
/*!40000 ALTER TABLE `pmall_cart` DISABLE KEYS */;
INSERT INTO `pmall_cart` VALUES (9,12,1,'800方o2o',100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','63.00',1,'1_04752627750479728.png',0);
/*!40000 ALTER TABLE `pmall_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_chain`
--

DROP TABLE IF EXISTS `pmall_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_chain` (
  `chain_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `chain_user` varchar(50) NOT NULL COMMENT '登录名',
  `chain_pwd` char(32) NOT NULL COMMENT '登录密码',
  `chain_name` varchar(50) NOT NULL COMMENT '门店名称',
  `chain_img` varchar(50) NOT NULL COMMENT '门店图片',
  `area_id_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级地区id',
  `area_id_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二级地区id',
  `area_id_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '三级地区id',
  `area_id_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '四级地区id',
  `area_id` int(10) unsigned NOT NULL COMMENT '地区id',
  `area_info` varchar(50) NOT NULL COMMENT '地区详情',
  `chain_address` varchar(50) NOT NULL COMMENT '详细地址',
  `chain_phone` varchar(100) NOT NULL COMMENT '联系方式',
  `chain_opening_hours` varchar(100) NOT NULL COMMENT '营业时间',
  `chain_traffic_line` varchar(100) NOT NULL COMMENT '交通线路',
  PRIMARY KEY (`chain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺门店表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_chain`
--

LOCK TABLES `pmall_chain` WRITE;
/*!40000 ALTER TABLE `pmall_chain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_chain_stock`
--

DROP TABLE IF EXISTS `pmall_chain_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_chain_stock` (
  `chain_id` int(10) unsigned NOT NULL COMMENT '门店id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品SPU',
  `stock` int(10) NOT NULL COMMENT '库存',
  PRIMARY KEY (`chain_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店商品库存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_chain_stock`
--

LOCK TABLES `pmall_chain_stock` WRITE;
/*!40000 ALTER TABLE `pmall_chain_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_chain_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_chat_log`
--

DROP TABLE IF EXISTS `pmall_chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_chat_log` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='消息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_chat_log`
--

LOCK TABLES `pmall_chat_log` WRITE;
/*!40000 ALTER TABLE `pmall_chat_log` DISABLE KEYS */;
INSERT INTO `pmall_chat_log` VALUES (1,11,'15999904305','192.168.0.14',1,'800@member.com','Hello,man~',1468548565),(2,11,'15999904305','192.168.0.14',1,'800@member.com',':mad:',1468548570),(3,2,'testuser','192.168.0.117',5,'eshop2','没货了啊？',1468548797),(4,11,'15999904305','192.168.0.14',1,'800@member.com','sss',1468548858),(5,2,'testuser','192.168.0.117',5,'eshop2','你好啊。',1468549236),(6,14,'13560134398','192.168.0.117',5,'eshop2','有事咨询',1468552067),(7,11,'15999904305','192.168.0.14',1,'800@member.com','Hellp,man~',1468552692),(8,15,'13560134397','192.168.0.117',5,'eshop2','nih',1468566610);
/*!40000 ALTER TABLE `pmall_chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_chat_msg`
--

DROP TABLE IF EXISTS `pmall_chat_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_chat_msg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` varchar(300) DEFAULT NULL COMMENT '消息内容',
  `r_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_chat_msg`
--

LOCK TABLES `pmall_chat_msg` WRITE;
/*!40000 ALTER TABLE `pmall_chat_msg` DISABLE KEYS */;
INSERT INTO `pmall_chat_msg` VALUES (1,11,'15999904305','192.168.0.14',1,'800@member.com','Hello,man~',2,1468548565),(2,11,'15999904305','192.168.0.14',1,'800@member.com',':mad:',2,1468548570),(3,2,'testuser','192.168.0.117',5,'eshop2','没货了啊？',2,1468548797),(4,11,'15999904305','192.168.0.14',1,'800@member.com','sss',2,1468548858),(5,2,'testuser','192.168.0.117',5,'eshop2','你好啊。',2,1468549236),(6,14,'13560134398','192.168.0.117',5,'eshop2','有事咨询',2,1468552067),(7,11,'15999904305','192.168.0.14',1,'800@member.com','Hellp,man~',2,1468552692),(8,15,'13560134397','192.168.0.117',5,'eshop2','nih',2,1468566610);
/*!40000 ALTER TABLE `pmall_chat_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle`
--

DROP TABLE IF EXISTS `pmall_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `circle_desc` varchar(255) DEFAULT NULL COMMENT '圈子描述',
  `circle_masterid` int(11) unsigned NOT NULL COMMENT '圈主id',
  `circle_mastername` varchar(50) NOT NULL COMMENT '圈主名称',
  `circle_img` varchar(50) DEFAULT NULL COMMENT '圈子图片',
  `class_id` int(11) unsigned NOT NULL COMMENT '圈子分类',
  `circle_mcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子成员数',
  `circle_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子主题数',
  `circle_gcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '圈子商品数',
  `circle_pursuereason` varchar(255) DEFAULT NULL COMMENT '圈子申请理由',
  `circle_notice` varchar(255) DEFAULT NULL COMMENT '圈子公告',
  `circle_status` tinyint(3) unsigned NOT NULL COMMENT '圈子状态，0关闭，1开启，2审核中，3审核失败',
  `circle_statusinfo` varchar(255) DEFAULT NULL COMMENT '关闭或审核失败原因',
  `circle_joinaudit` tinyint(3) unsigned NOT NULL COMMENT '加入圈子时候需要审核，0不需要，1需要',
  `circle_addtime` varchar(10) NOT NULL COMMENT '圈子创建时间',
  `circle_noticetime` varchar(10) DEFAULT NULL COMMENT '圈子公告更新时间',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为热门圈子 1是 0否',
  `circle_tag` varchar(60) DEFAULT NULL COMMENT '圈子标签',
  `new_verifycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待审核成员数',
  `new_informcount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '等待处理举报数',
  `mapply_open` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请管理是否开启 0关闭，1开启',
  `mapply_ml` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成员级别',
  `new_mapplycount` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理申请数量',
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle`
--

LOCK TABLES `pmall_circle` WRITE;
/*!40000 ALTER TABLE `pmall_circle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_affix`
--

DROP TABLE IF EXISTS `pmall_circle_affix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_affix` (
  `affix_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件id',
  `affix_filename` varchar(100) NOT NULL COMMENT '文件名称',
  `affix_filethumb` varchar(100) NOT NULL COMMENT '缩略图名称',
  `affix_filesize` int(10) unsigned NOT NULL COMMENT '文件大小，单位字节',
  `affix_addtime` varchar(10) NOT NULL COMMENT '上传时间',
  `affix_type` tinyint(3) unsigned NOT NULL COMMENT '文件类型 0无 1主题 2评论',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  PRIMARY KEY (`affix_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_affix`
--

LOCK TABLES `pmall_circle_affix` WRITE;
/*!40000 ALTER TABLE `pmall_circle_affix` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_affix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_class`
--

DROP TABLE IF EXISTS `pmall_circle_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子分类id',
  `class_name` varchar(50) NOT NULL COMMENT '圈子分类名称',
  `class_addtime` varchar(10) NOT NULL COMMENT '圈子分类创建时间',
  `class_sort` tinyint(3) unsigned NOT NULL COMMENT '圈子分类排序',
  `class_status` tinyint(3) unsigned NOT NULL COMMENT '圈子分类状态 0不显示，1显示',
  `is_recommend` tinyint(3) unsigned NOT NULL COMMENT '是否推荐 0未推荐，1已推荐',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_class`
--

LOCK TABLES `pmall_circle_class` WRITE;
/*!40000 ALTER TABLE `pmall_circle_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_explog`
--

DROP TABLE IF EXISTS `pmall_circle_explog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_explog` (
  `el_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '经验日志id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `el_exp` int(10) NOT NULL COMMENT '获得经验',
  `el_time` varchar(10) NOT NULL COMMENT '获得时间',
  `el_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1管理员操作 2发表话题 3发表回复 4话题被回复 5话题被删除 6回复被删除',
  `el_itemid` varchar(100) NOT NULL COMMENT '信息id',
  `el_desc` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`el_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经验日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_explog`
--

LOCK TABLES `pmall_circle_explog` WRITE;
/*!40000 ALTER TABLE `pmall_circle_explog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_explog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_expmember`
--

DROP TABLE IF EXISTS `pmall_circle_expmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_expmember` (
  `member_id` int(11) NOT NULL COMMENT '成员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `em_exp` int(10) NOT NULL COMMENT '获得经验',
  `em_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员每天获得经验表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_expmember`
--

LOCK TABLES `pmall_circle_expmember` WRITE;
/*!40000 ALTER TABLE `pmall_circle_expmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_expmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_exptheme`
--

DROP TABLE IF EXISTS `pmall_circle_exptheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_exptheme` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `et_exp` int(10) NOT NULL COMMENT '获得经验',
  `et_time` varchar(10) NOT NULL COMMENT '获得时间',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题每天获得经验表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_exptheme`
--

LOCK TABLES `pmall_circle_exptheme` WRITE;
/*!40000 ALTER TABLE `pmall_circle_exptheme` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_exptheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_fs`
--

DROP TABLE IF EXISTS `pmall_circle_fs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_fs` (
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `friendship_id` int(11) unsigned NOT NULL COMMENT '友情圈子id',
  `friendship_name` varchar(11) NOT NULL COMMENT '友情圈子名称',
  `friendship_sort` tinyint(4) unsigned NOT NULL COMMENT '友情圈子排序',
  `friendship_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '友情圈子名称 1显示 0隐藏',
  PRIMARY KEY (`circle_id`,`friendship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情圈子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_fs`
--

LOCK TABLES `pmall_circle_fs` WRITE;
/*!40000 ALTER TABLE `pmall_circle_fs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_fs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_inform`
--

DROP TABLE IF EXISTS `pmall_circle_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_inform` (
  `inform_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `reply_id` int(11) unsigned NOT NULL COMMENT '回复id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `inform_content` varchar(255) NOT NULL COMMENT '举报内容',
  `inform_time` varchar(10) NOT NULL COMMENT '举报时间',
  `inform_type` tinyint(4) NOT NULL COMMENT '类型 0话题、1回复',
  `inform_state` tinyint(4) NOT NULL COMMENT '状态 0未处理、1已处理',
  `inform_opid` int(11) unsigned DEFAULT '0' COMMENT '操作人id',
  `inform_opname` varchar(50) DEFAULT '' COMMENT '操作人名称',
  `inform_opexp` tinyint(4) DEFAULT '0' COMMENT '操作经验',
  `inform_opresult` varchar(255) DEFAULT '' COMMENT '处理结果',
  PRIMARY KEY (`inform_id`),
  KEY `circle_id` (`circle_id`,`theme_id`,`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_inform`
--

LOCK TABLES `pmall_circle_inform` WRITE;
/*!40000 ALTER TABLE `pmall_circle_inform` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_like`
--

DROP TABLE IF EXISTS `pmall_circle_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_like` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_like`
--

LOCK TABLES `pmall_circle_like` WRITE;
/*!40000 ALTER TABLE `pmall_circle_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_mapply`
--

DROP TABLE IF EXISTS `pmall_circle_mapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_mapply` (
  `mapply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `mapply_reason` varchar(255) NOT NULL COMMENT '申请理由',
  `mapply_time` varchar(10) NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`mapply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_mapply`
--

LOCK TABLES `pmall_circle_mapply` WRITE;
/*!40000 ALTER TABLE `pmall_circle_mapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_mapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_member`
--

DROP TABLE IF EXISTS `pmall_circle_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_member` (
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) DEFAULT NULL COMMENT '圈子名称',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `cm_applycontent` varchar(255) DEFAULT '' COMMENT '申请内容',
  `cm_applytime` varchar(10) DEFAULT NULL COMMENT '申请时间',
  `cm_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0申请中 1通过 2未通过',
  `cm_intro` varchar(255) DEFAULT '' COMMENT '自我介绍',
  `cm_jointime` varchar(10) NOT NULL COMMENT '加入时间',
  `cm_level` int(11) NOT NULL DEFAULT '1' COMMENT '成员级别',
  `cm_levelname` varchar(10) NOT NULL DEFAULT '初级粉丝' COMMENT '成员头衔',
  `cm_exp` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '会员经验',
  `cm_nextexp` int(10) NOT NULL DEFAULT '5' COMMENT '下一级所需经验',
  `is_identity` tinyint(3) unsigned DEFAULT NULL COMMENT '1圈主 2管理 3成员',
  `is_allowspeak` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许发言 1允许 0禁止',
  `is_star` tinyint(4) NOT NULL DEFAULT '0' COMMENT '明星成员 1是 0否',
  `cm_thcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `cm_comcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复数',
  `cm_lastspeaktime` varchar(10) DEFAULT '' COMMENT '最后发言时间',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  PRIMARY KEY (`member_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_member`
--

LOCK TABLES `pmall_circle_member` WRITE;
/*!40000 ALTER TABLE `pmall_circle_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_ml`
--

DROP TABLE IF EXISTS `pmall_circle_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_ml` (
  `circle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '圈子id',
  `mlref_id` int(10) DEFAULT NULL COMMENT '参考头衔id 0为默认 null为自定义',
  `ml_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `ml_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `ml_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `ml_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `ml_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `ml_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `ml_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `ml_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `ml_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `ml_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `ml_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `ml_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `ml_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `ml_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `ml_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `ml_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员头衔表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_ml`
--

LOCK TABLES `pmall_circle_ml` WRITE;
/*!40000 ALTER TABLE `pmall_circle_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_mldefault`
--

DROP TABLE IF EXISTS `pmall_circle_mldefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_mldefault` (
  `mld_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '头衔等级',
  `mld_name` varchar(10) NOT NULL COMMENT '头衔名称',
  `mld_exp` int(10) NOT NULL COMMENT '所需经验值',
  PRIMARY KEY (`mld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='成员头衔默认设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_mldefault`
--

LOCK TABLES `pmall_circle_mldefault` WRITE;
/*!40000 ALTER TABLE `pmall_circle_mldefault` DISABLE KEYS */;
INSERT INTO `pmall_circle_mldefault` VALUES (1,'初级粉丝',1),(2,'中级粉丝',5),(3,'高级粉丝',15),(4,'正式会员',30),(5,'正式会员',50),(6,'核心会员',100),(7,'核心会员',200),(8,'铁杆会员',500),(9,'铁杆会员',1000),(10,'知名人士',2000),(11,'知名人士',3000),(12,'人气楷模',6000),(13,'人气楷模',10000),(14,'意见领袖',18000),(15,'资深元老',30000),(16,'荣耀元老',60000);
/*!40000 ALTER TABLE `pmall_circle_mldefault` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_mlref`
--

DROP TABLE IF EXISTS `pmall_circle_mlref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_mlref` (
  `mlref_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '参考头衔id',
  `mlref_name` varchar(10) NOT NULL COMMENT '参考头衔名称',
  `mlref_addtime` varchar(10) NOT NULL COMMENT '创建时间',
  `mlref_status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `mlref_1` varchar(10) NOT NULL COMMENT '1级头衔名称',
  `mlref_2` varchar(10) NOT NULL COMMENT '2级头衔名称',
  `mlref_3` varchar(10) NOT NULL COMMENT '3级头衔名称',
  `mlref_4` varchar(10) NOT NULL COMMENT '4级头衔名称',
  `mlref_5` varchar(10) NOT NULL COMMENT '5级头衔名称',
  `mlref_6` varchar(10) NOT NULL COMMENT '6级头衔名称',
  `mlref_7` varchar(10) NOT NULL COMMENT '7级头衔名称',
  `mlref_8` varchar(10) NOT NULL COMMENT '8级头衔名称',
  `mlref_9` varchar(10) NOT NULL COMMENT '9级头衔名称',
  `mlref_10` varchar(10) NOT NULL COMMENT '10级头衔名称',
  `mlref_11` varchar(10) NOT NULL COMMENT '11级头衔名称',
  `mlref_12` varchar(10) NOT NULL COMMENT '12级头衔名称',
  `mlref_13` varchar(10) NOT NULL COMMENT '13级头衔名称',
  `mlref_14` varchar(10) NOT NULL COMMENT '14级头衔名称',
  `mlref_15` varchar(10) NOT NULL COMMENT '15级头衔名称',
  `mlref_16` varchar(10) NOT NULL COMMENT '16级头衔名称',
  PRIMARY KEY (`mlref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员参考头衔表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_mlref`
--

LOCK TABLES `pmall_circle_mlref` WRITE;
/*!40000 ALTER TABLE `pmall_circle_mlref` DISABLE KEYS */;
INSERT INTO `pmall_circle_mlref` VALUES (1,'校园系列','1371784037',1,'托儿所','幼儿园','学前班','一年级','二年级','三年级','四年级','五年级','六年级','初一','初二','初三','高一','高二','高三','大学'),(2,'名气系列','1371797598',1,'默默无闻','崭露头角','锋芒毕露','小有名气','小有美名','颇具名气','颇具盛名','富有名气','富有美誉','远近闻名','崭露头角','声名远扬','赫赫有名','大名鼎鼎','如雷贯耳','名扬四海'),(3,'内涵系列','1371884423',1,'1L喂熊','抢个沙发','自带板凳','路人甲君','打酱油的','华丽飘过','前来围观','我勒个去','亮了瞎了','兰州烧饼','鸭梨山大','笑而不语','内牛满面','虎躯一震','霸气外露','此贴必火'),(4,'军衔系列','1371884788',1,'下士','中士','上士','少尉','中尉','上尉','大尉','少校','中校','上校','大校','少将','中将','上将','大将','元帅'),(5,'书生系列','1371884953',1,'白丁','童生','秀才','举人','举人','贡士','进士','进士','进士','探花','探花','榜眼','榜眼','状元','状元','圣贤'),(6,'武侠系列','1371885047',1,'初涉江湖','无名之辈','仗剑天涯','人海孤鸿','四方游侠','江湖少侠','后起之秀','武林新贵','武林高手','英雄豪杰','人中龙凤','自成一派','名震江湖','武林盟主','一代宗师','笑傲江湖');
/*!40000 ALTER TABLE `pmall_circle_mlref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_recycle`
--

DROP TABLE IF EXISTS `pmall_circle_recycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_recycle` (
  `recycle_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回收站id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `recycle_content` text NOT NULL COMMENT '内容',
  `recycle_opid` int(11) unsigned NOT NULL COMMENT '操作人id',
  `recycle_opname` varchar(50) NOT NULL COMMENT '操作人名称',
  `recycle_type` tinyint(3) unsigned NOT NULL COMMENT '类型 1话题，2回复',
  `recycle_time` varchar(10) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`recycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子回收站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_recycle`
--

LOCK TABLES `pmall_circle_recycle` WRITE;
/*!40000 ALTER TABLE `pmall_circle_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_recycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_thclass`
--

DROP TABLE IF EXISTS `pmall_circle_thclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_thclass` (
  `thclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题分类id',
  `thclass_name` varchar(20) NOT NULL COMMENT '主题名称',
  `thclass_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '主题状态 1开启，0关闭',
  `is_moderator` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理专属 1是，0否',
  `thclass_sort` tinyint(3) unsigned NOT NULL COMMENT '分类排序',
  `circle_id` int(11) unsigned NOT NULL COMMENT '所属圈子id',
  PRIMARY KEY (`thclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子主题分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_thclass`
--

LOCK TABLES `pmall_circle_thclass` WRITE;
/*!40000 ALTER TABLE `pmall_circle_thclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_thclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_theme`
--

DROP TABLE IF EXISTS `pmall_circle_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_theme` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主题id',
  `theme_name` varchar(50) NOT NULL COMMENT '主题名称',
  `theme_content` text NOT NULL COMMENT '主题内容',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `circle_name` varchar(12) NOT NULL COMMENT '圈子名称',
  `thclass_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题分类id',
  `thclass_name` varchar(20) DEFAULT '' COMMENT '主题分类名称',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `is_identity` tinyint(3) unsigned NOT NULL COMMENT '1圈主 2管理 3成员',
  `theme_addtime` varchar(10) NOT NULL COMMENT '主题发表时间',
  `theme_editname` varchar(50) DEFAULT NULL COMMENT '编辑人名称',
  `theme_edittime` varchar(10) DEFAULT NULL COMMENT '主题编辑时间',
  `theme_likecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数量',
  `theme_commentcount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `theme_browsecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `theme_sharecount` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分享数量',
  `is_stick` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶 1是  0否',
  `is_digest` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否加精 1是 0否',
  `lastspeak_id` int(11) unsigned DEFAULT NULL COMMENT '最后发言人id',
  `lastspeak_name` varchar(50) DEFAULT NULL COMMENT '最后发言人名称',
  `lastspeak_time` varchar(10) DEFAULT NULL COMMENT '最后发言时间',
  `has_goods` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品标记 1是 0否',
  `has_affix` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件标记 1是 0 否',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `is_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否推荐 1是 0否',
  `is_shut` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主题是否关闭 1是 0否',
  `theme_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  `theme_readperm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '阅读权限',
  `theme_special` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '特殊话题 0普通 1投票',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='圈子主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_theme`
--

LOCK TABLES `pmall_circle_theme` WRITE;
/*!40000 ALTER TABLE `pmall_circle_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_thg`
--

DROP TABLE IF EXISTS `pmall_circle_thg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_thg` (
  `themegoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主题商品id',
  `theme_id` int(11) NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `thg_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品类型 0为本商城、1为淘宝 默认为0',
  `thg_url` varchar(1000) DEFAULT NULL COMMENT '商品链接',
  PRIMARY KEY (`themegoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_thg`
--

LOCK TABLES `pmall_circle_thg` WRITE;
/*!40000 ALTER TABLE `pmall_circle_thg` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_thg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_thpoll`
--

DROP TABLE IF EXISTS `pmall_circle_thpoll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_thpoll` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `poll_multiple` tinyint(3) unsigned NOT NULL COMMENT '单/多选 0单选、1多选',
  `poll_startime` varchar(10) NOT NULL COMMENT '开始时间',
  `poll_endtime` varchar(10) NOT NULL COMMENT '结束时间',
  `poll_days` tinyint(3) unsigned NOT NULL COMMENT '投票天数',
  `poll_voters` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '投票参与人数',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_thpoll`
--

LOCK TABLES `pmall_circle_thpoll` WRITE;
/*!40000 ALTER TABLE `pmall_circle_thpoll` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_thpoll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_thpolloption`
--

DROP TABLE IF EXISTS `pmall_circle_thpolloption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_thpolloption` (
  `pollop_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票选项id',
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `pollop_option` varchar(80) NOT NULL COMMENT '投票选项',
  `pollop_votes` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '得票数',
  `pollop_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pollop_votername` mediumtext COMMENT '投票者名称',
  PRIMARY KEY (`pollop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票选项表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_thpolloption`
--

LOCK TABLES `pmall_circle_thpolloption` WRITE;
/*!40000 ALTER TABLE `pmall_circle_thpolloption` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_thpolloption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_thpollvoter`
--

DROP TABLE IF EXISTS `pmall_circle_thpollvoter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_thpollvoter` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '话题id',
  `member_id` int(11) unsigned NOT NULL COMMENT '成员id',
  `member_name` varchar(50) NOT NULL COMMENT '成员名称',
  `pollvo_options` mediumtext NOT NULL COMMENT '投票选项',
  `pollvo_time` varchar(10) NOT NULL COMMENT '投票选项',
  KEY `theme_id` (`theme_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员投票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_thpollvoter`
--

LOCK TABLES `pmall_circle_thpollvoter` WRITE;
/*!40000 ALTER TABLE `pmall_circle_thpollvoter` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_thpollvoter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_circle_threply`
--

DROP TABLE IF EXISTS `pmall_circle_threply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_circle_threply` (
  `theme_id` int(11) unsigned NOT NULL COMMENT '主题id',
  `reply_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `circle_id` int(11) unsigned NOT NULL COMMENT '圈子id',
  `member_id` int(11) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `reply_content` text NOT NULL COMMENT '评论内容',
  `reply_addtime` varchar(10) NOT NULL COMMENT '发表时间',
  `reply_replyid` int(11) unsigned DEFAULT NULL COMMENT '回复楼层id',
  `reply_replyname` varchar(50) DEFAULT NULL COMMENT '回复楼层会员名称',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '屏蔽 1是 0否',
  `reply_exp` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '获得经验',
  PRIMARY KEY (`theme_id`,`reply_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_circle_threply`
--

LOCK TABLES `pmall_circle_threply` WRITE;
/*!40000 ALTER TABLE `pmall_circle_threply` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_circle_threply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_article`
--

DROP TABLE IF EXISTS `pmall_cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `article_title` varchar(50) NOT NULL COMMENT '文章标题',
  `article_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类编号',
  `article_origin` varchar(50) DEFAULT NULL COMMENT '文章来源',
  `article_origin_address` varchar(255) DEFAULT NULL COMMENT '文章来源链接',
  `article_author` varchar(50) NOT NULL COMMENT '文章作者',
  `article_abstract` varchar(140) DEFAULT NULL COMMENT '文章摘要',
  `article_content` text COMMENT '文章正文',
  `article_image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `article_keyword` varchar(255) DEFAULT NULL COMMENT '文章关键字',
  `article_link` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `article_goods` text COMMENT '相关商品',
  `article_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期开始时间',
  `article_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章有效期结束时间',
  `article_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章发布时间',
  `article_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章点击量',
  `article_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章排序0-255',
  `article_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `article_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否允许评论1-允许，0-不允许',
  `article_verify_admin` varchar(50) DEFAULT NULL COMMENT '文章审核管理员',
  `article_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章审核时间',
  `article_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站',
  `article_publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `article_publisher_id` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `article_type` tinyint(1) unsigned NOT NULL COMMENT '文章类型1-管理员发布，2-用户投稿',
  `article_attachment_path` varchar(50) NOT NULL COMMENT '文章附件路径',
  `article_image_all` text COMMENT '文章全部图片',
  `article_modify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章修改时间',
  `article_tag` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `article_comment_count` int(10) unsigned DEFAULT '0' COMMENT '文章评论数',
  `article_attitude_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情1',
  `article_attitude_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情2',
  `article_attitude_3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情3',
  `article_attitude_4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情4',
  `article_attitude_5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情5',
  `article_attitude_6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章心情6',
  `article_title_short` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `article_attitude_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章态度开关1-允许，0-不允许',
  `article_commend_image_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章推荐标志(图文)',
  `article_share_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分享数',
  `article_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_article`
--

LOCK TABLES `pmall_cms_article` WRITE;
/*!40000 ALTER TABLE `pmall_cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_article_attitude`
--

DROP TABLE IF EXISTS `pmall_cms_article_attitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_article_attitude` (
  `attitude_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '心情编号',
  `attitude_article_id` int(10) unsigned NOT NULL COMMENT '文章编号',
  `attitude_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `attitude_time` int(10) unsigned NOT NULL COMMENT '发布心情时间',
  PRIMARY KEY (`attitude_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS文章心情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_article_attitude`
--

LOCK TABLES `pmall_cms_article_attitude` WRITE;
/*!40000 ALTER TABLE `pmall_cms_article_attitude` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_article_attitude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_article_class`
--

DROP TABLE IF EXISTS `pmall_cms_article_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cms文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_article_class`
--

LOCK TABLES `pmall_cms_article_class` WRITE;
/*!40000 ALTER TABLE `pmall_cms_article_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_article_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_comment`
--

DROP TABLE IF EXISTS `pmall_cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(2000) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  `comment_quote` varchar(255) DEFAULT NULL COMMENT '评论引用',
  `comment_up` int(10) unsigned DEFAULT '0' COMMENT '顶数量',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_comment`
--

LOCK TABLES `pmall_cms_comment` WRITE;
/*!40000 ALTER TABLE `pmall_cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_comment_up`
--

DROP TABLE IF EXISTS `pmall_cms_comment_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_comment_up` (
  `up_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '顶编号',
  `comment_id` int(10) unsigned NOT NULL COMMENT '评论编号',
  `up_member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `up_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论顶表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_comment_up`
--

LOCK TABLES `pmall_cms_comment_up` WRITE;
/*!40000 ALTER TABLE `pmall_cms_comment_up` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_comment_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_index_module`
--

DROP TABLE IF EXISTS `pmall_cms_index_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_index_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `module_title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `module_name` varchar(50) NOT NULL COMMENT '模板名称',
  `module_type` varchar(50) DEFAULT '' COMMENT '模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `module_state` tinyint(1) unsigned DEFAULT '1' COMMENT '状态1-显示、0-不显示',
  `module_content` text COMMENT '模块内容',
  `module_style` varchar(50) NOT NULL DEFAULT 'style1' COMMENT '模块主题',
  `module_view` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台列表显示样式 1-展开 2-折叠',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS首页模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_index_module`
--

LOCK TABLES `pmall_cms_index_module` WRITE;
/*!40000 ALTER TABLE `pmall_cms_index_module` DISABLE KEYS */;
INSERT INTO `pmall_cms_index_module` VALUES (1,'文章模块1','article1','article1',255,1,NULL,'style1',1);
/*!40000 ALTER TABLE `pmall_cms_index_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_module`
--

DROP TABLE IF EXISTS `pmall_cms_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板模块编号',
  `module_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块标题',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `module_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板模块类型，index-固定内容、article1-文章模块1、article2-文章模块2、micro-微商城、adv-通栏广告',
  `module_class` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模板模块种类1-系统自带 2-用户自定义',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS模板模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_module`
--

LOCK TABLES `pmall_cms_module` WRITE;
/*!40000 ALTER TABLE `pmall_cms_module` DISABLE KEYS */;
INSERT INTO `pmall_cms_module` VALUES (1,'综合模块','index','index',1),(2,'微商城模块','micro','micro',1),(3,'文章模块1','article1','article1',1),(4,'文章模块2','article2','article2',1),(5,'通栏广告模块','adv','adv',1);
/*!40000 ALTER TABLE `pmall_cms_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_module_assembly`
--

DROP TABLE IF EXISTS `pmall_cms_module_assembly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_module_assembly` (
  `assembly_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '组件编号',
  `assembly_title` varchar(50) NOT NULL COMMENT '组件标题',
  `assembly_name` varchar(50) NOT NULL COMMENT '组件名称',
  `assembly_explain` varchar(255) NOT NULL COMMENT '组件说明',
  PRIMARY KEY (`assembly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='cms模块组件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_module_assembly`
--

LOCK TABLES `pmall_cms_module_assembly` WRITE;
/*!40000 ALTER TABLE `pmall_cms_module_assembly` DISABLE KEYS */;
INSERT INTO `pmall_cms_module_assembly` VALUES (1,'文章','article','文章组件'),(2,'图片','picture','图片组件'),(3,'商品','goods','商品组件'),(4,'品牌','brand','品牌组件'),(5,'图文','article_image','图文'),(6,'店铺','store','店铺'),(7,'会员','member','会员'),(8,'FLASH','flash','FLASH'),(9,'自定义','html','自定义');
/*!40000 ALTER TABLE `pmall_cms_module_assembly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_module_frame`
--

DROP TABLE IF EXISTS `pmall_cms_module_frame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_module_frame` (
  `frame_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '框架编号',
  `frame_title` varchar(50) NOT NULL COMMENT '框架标题',
  `frame_name` varchar(50) NOT NULL COMMENT '框架名称',
  `frame_explain` varchar(255) NOT NULL COMMENT '框架说明',
  `frame_structure` varchar(255) NOT NULL COMMENT '框架结构',
  PRIMARY KEY (`frame_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='cms模块框架表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_module_frame`
--

LOCK TABLES `pmall_cms_module_frame` WRITE;
/*!40000 ALTER TABLE `pmall_cms_module_frame` DISABLE KEYS */;
INSERT INTO `pmall_cms_module_frame` VALUES (1,'右边栏三列结构','2_2_1','右边栏三列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w1\"}}'),(2,'左边栏三列结构','1_2_2','左边栏三列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}'),(3,'左右宽边栏结构','2_1_2','左右宽边栏结构','{\"block1\":{\"type\":\"block\",\"name\":\"w2\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"},\"block3\":{\"type\":\"block\",\"name\":\"w2\"}}'),(4,'左边栏两列结构','1_4','左边栏两列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w4\"}} '),(5,'右边栏两列结构','4_1','右边栏两列结构','{\"block1\":{\"type\":\"block\",\"name\":\"w4\"},\"block2\":{\"type\":\"block\",\"name\":\"w1\"}} '),(6,'右边栏混合结构','2x2_2_1','右边栏混合结构','{\"block1\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block2\":{\"type\":\"block\",\"name\":\"w22\"},\"block3\":{\"type\":\"block\",\"name\":\"w22\"}}},\"block4\":{\"type\":\"block\",\"name\":\"w2\"},\"block5\":{\"type\":\"block\",\"name\":\"w1\"}} '),(7,'左边栏混合结构','1_2_2x2','左边栏混合结构','{\"block1\":{\"type\":\"block\",\"name\":\"w1\"},\"block2\":{\"type\":\"block\",\"name\":\"w2\"},\"block3\":{\"type\":\"content\",\"name\":\"w2\",\"child\":{\"block4\":{\"type\":\"block\",\"name\":\"w22\"},\"block5\":{\"type\":\"block\",\"name\":\"w22\"}}}}'),(8,'一体化结构','1','一体化结构','{\"block1\":{\"type\":\"block\",\"name\":\"w5\"}}');
/*!40000 ALTER TABLE `pmall_cms_module_frame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_navigation`
--

DROP TABLE IF EXISTS `pmall_cms_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_navigation` (
  `navigation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航编号',
  `navigation_title` varchar(50) NOT NULL COMMENT '导航标题',
  `navigation_link` varchar(255) NOT NULL COMMENT '导航链接',
  `navigation_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `navigation_open_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '导航打开方式1-本页打开，2-新页打开',
  PRIMARY KEY (`navigation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_navigation`
--

LOCK TABLES `pmall_cms_navigation` WRITE;
/*!40000 ALTER TABLE `pmall_cms_navigation` DISABLE KEYS */;
INSERT INTO `pmall_cms_navigation` VALUES (1,'商城','http://shoptest16.800pharm.net/',255,1),(2,'圈子','http://shoptest16.800pharm.net/circle',255,1),(3,'微商城','http://shoptest16.800pharm.net/microshop',255,1),(4,'品牌','http://shoptest16.800pharm.net/shop/index.php?act=brand',255,1);
/*!40000 ALTER TABLE `pmall_cms_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_picture`
--

DROP TABLE IF EXISTS `pmall_cms_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_picture` (
  `picture_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '画报编号',
  `picture_title` varchar(50) NOT NULL COMMENT '画报标题',
  `picture_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报分类编号',
  `picture_author` varchar(50) NOT NULL COMMENT '画报作者',
  `picture_abstract` varchar(140) DEFAULT NULL COMMENT '画报摘要',
  `picture_image` varchar(255) DEFAULT NULL COMMENT '画报图片',
  `picture_keyword` varchar(255) DEFAULT NULL COMMENT '画报关键字',
  `picture_publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报发布时间',
  `picture_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报点击量',
  `picture_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '画报排序0-255',
  `picture_commend_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报推荐标志1-未推荐，2-已推荐',
  `picture_comment_flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '画报是否允许评论1-允许，2-不允许',
  `picture_verify_admin` varchar(50) DEFAULT NULL COMMENT '画报审核管理员',
  `picture_verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '画报审核时间',
  `picture_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-草稿、2-待审核、3-已发布、4-回收站、5-已关闭',
  `picture_publisher_name` varchar(50) NOT NULL COMMENT '发布人用户名',
  `picture_publisher_id` int(10) unsigned NOT NULL COMMENT '发布人编号',
  `picture_type` tinyint(1) unsigned NOT NULL COMMENT '画报类型1-管理员发布，2-用户投稿',
  `picture_attachment_path` varchar(50) NOT NULL DEFAULT '',
  `picture_modify_time` int(10) unsigned NOT NULL COMMENT '画报修改时间',
  `picture_tag` varchar(255) DEFAULT NULL COMMENT '画报标签',
  `picture_comment_count` int(10) unsigned DEFAULT '0' COMMENT '画报评论数',
  `picture_title_short` varchar(50) DEFAULT '' COMMENT '画报短标题',
  `picture_image_count` tinyint(1) unsigned DEFAULT '0' COMMENT '画报图片总数',
  `picture_share_count` int(10) unsigned DEFAULT '0' COMMENT '画报分享数',
  `picture_verify_reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  PRIMARY KEY (`picture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS画报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_picture`
--

LOCK TABLES `pmall_cms_picture` WRITE;
/*!40000 ALTER TABLE `pmall_cms_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_picture_class`
--

DROP TABLE IF EXISTS `pmall_cms_picture_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_picture_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cms画报分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_picture_class`
--

LOCK TABLES `pmall_cms_picture_class` WRITE;
/*!40000 ALTER TABLE `pmall_cms_picture_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_picture_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_picture_image`
--

DROP TABLE IF EXISTS `pmall_cms_picture_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_picture_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `image_name` varchar(255) NOT NULL COMMENT '图片地址',
  `image_abstract` varchar(200) DEFAULT NULL COMMENT '图片摘要',
  `image_goods` text COMMENT '相关商品',
  `image_store` varchar(255) DEFAULT NULL COMMENT '相关店铺',
  `image_width` int(10) unsigned DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(10) unsigned DEFAULT NULL COMMENT '图片高度',
  `image_picture_id` int(10) unsigned NOT NULL COMMENT '画报编号',
  `image_path` varchar(50) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS画报图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_picture_image`
--

LOCK TABLES `pmall_cms_picture_image` WRITE;
/*!40000 ALTER TABLE `pmall_cms_picture_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_picture_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_special`
--

DROP TABLE IF EXISTS `pmall_cms_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `special_title` varchar(50) NOT NULL COMMENT '专题标题',
  `special_stitle` varchar(200) NOT NULL COMMENT '专题副标题',
  `special_margin_top` int(10) DEFAULT '0' COMMENT '正文距顶部距离',
  `special_background` varchar(255) DEFAULT NULL COMMENT '专题背景',
  `special_image` varchar(255) DEFAULT NULL COMMENT '专题封面图',
  `special_image_all` text COMMENT '专题图片',
  `special_content` text COMMENT '专题内容',
  `special_modify_time` int(10) unsigned NOT NULL COMMENT '专题修改时间',
  `special_publish_id` int(10) unsigned NOT NULL COMMENT '专题发布者编号',
  `special_state` tinyint(1) unsigned NOT NULL COMMENT '专题状态1-草稿、2-已发布',
  `special_background_color` varchar(10) NOT NULL DEFAULT '#FFFFFF' COMMENT '专题背景色',
  `special_repeat` varchar(10) NOT NULL DEFAULT 'no-repeat' COMMENT '背景重复方式',
  `special_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '专题类型(1-cms专题 2-商城专题)',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_special`
--

LOCK TABLES `pmall_cms_special` WRITE;
/*!40000 ALTER TABLE `pmall_cms_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_tag`
--

DROP TABLE IF EXISTS `pmall_cms_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签编号',
  `tag_name` varchar(50) NOT NULL COMMENT '标签名称',
  `tag_sort` tinyint(1) unsigned NOT NULL COMMENT '标签排序',
  `tag_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签使用计数',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_tag`
--

LOCK TABLES `pmall_cms_tag` WRITE;
/*!40000 ALTER TABLE `pmall_cms_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cms_tag_relation`
--

DROP TABLE IF EXISTS `pmall_cms_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cms_tag_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `relation_type` tinyint(1) unsigned NOT NULL COMMENT '关系类型1-文章，2-画报',
  `relation_tag_id` int(10) unsigned NOT NULL COMMENT '标签编号',
  `relation_object_id` int(10) unsigned NOT NULL COMMENT '对象编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS标签关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cms_tag_relation`
--

LOCK TABLES `pmall_cms_tag_relation` WRITE;
/*!40000 ALTER TABLE `pmall_cms_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_cms_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_complain`
--

DROP TABLE IF EXISTS `pmall_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告id',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告名称',
  `accused_id` int(11) NOT NULL COMMENT '被告id',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) DEFAULT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) DEFAULT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) DEFAULT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) DEFAULT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) NOT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) DEFAULT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) DEFAULT NULL COMMENT '投诉处理人id',
  `appeal_message` varchar(255) DEFAULT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) DEFAULT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) DEFAULT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) DEFAULT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) DEFAULT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) DEFAULT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) DEFAULT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) DEFAULT NULL COMMENT '最终处理人id',
  `complain_state` tinyint(4) NOT NULL COMMENT '投诉状态(10-新投诉/20-投诉通过转给被投诉人/30-被投诉人已申诉/40-提交仲裁/99-已关闭)',
  `complain_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '投诉是否通过平台审批(1未通过/2通过)',
  PRIMARY KEY (`complain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_complain`
--

LOCK TABLES `pmall_complain` WRITE;
/*!40000 ALTER TABLE `pmall_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_complain_subject`
--

DROP TABLE IF EXISTS `pmall_complain_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_complain_subject` (
  `complain_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complain_subject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态(1-有效/2-失效)',
  PRIMARY KEY (`complain_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_complain_subject`
--

LOCK TABLES `pmall_complain_subject` WRITE;
/*!40000 ALTER TABLE `pmall_complain_subject` DISABLE KEYS */;
INSERT INTO `pmall_complain_subject` VALUES (1,'商家不同意退款','买家申请退款被拒绝。',2),(2,'未收到货','交易成功，未收到货，钱已经付给商家，可进行维权。',1),(3,'售后保障服务','交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。',1);
/*!40000 ALTER TABLE `pmall_complain_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_complain_talk`
--

DROP TABLE IF EXISTS `pmall_complain_talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_complain_talk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话id',
  `complain_id` int(11) NOT NULL COMMENT '投诉id',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人id',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人名称',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉对话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_complain_talk`
--

LOCK TABLES `pmall_complain_talk` WRITE;
/*!40000 ALTER TABLE `pmall_complain_talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_complain_talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_consult`
--

DROP TABLE IF EXISTS `pmall_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` int(10) DEFAULT NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(255) DEFAULT '' COMMENT '咨询回复内容',
  `consult_reply_time` int(10) DEFAULT NULL COMMENT '咨询回复时间',
  `isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`),
  KEY `goods_id` (`goods_id`),
  KEY `seller_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_consult`
--

LOCK TABLES `pmall_consult` WRITE;
/*!40000 ALTER TABLE `pmall_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_consult_type`
--

DROP TABLE IF EXISTS `pmall_consult_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(10) NOT NULL COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '咨询类型排序',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_consult_type`
--

LOCK TABLES `pmall_consult_type` WRITE;
/*!40000 ALTER TABLE `pmall_consult_type` DISABLE KEYS */;
INSERT INTO `pmall_consult_type` VALUES (1,'商品咨询','&lt;strong&gt;商城承诺&lt;/strong&gt;：商品均为原装正品行货，自带机打发票，严格执行国家三包政策，享受全国联保服务。&lt;br /&gt;\r\n&lt;strong&gt;功能咨询&lt;/strong&gt;：咨询商品功能建议您拨打各品牌的官方客服电话，以便获得更准确的信息。',1),(2,'支付问题','&lt;strong&gt;大额支付&lt;/strong&gt;：线上支付中的招行、工行、建行、农行、广发支持大额支付，最高单笔一次支付10000元。&lt;br /&gt;\r\n&lt;strong&gt;货到付款&lt;/strong&gt;：只有官方店铺支持货到付款功能。&lt;br /&gt;',2),(3,'发票及保修','&lt;strong&gt;商城承诺&lt;/strong&gt;：商品均为原装正品行货，自带机打发票，严格执行国家三包政策，享受全国联保服务。&lt;br /&gt;\r\n&lt;strong&gt;发票类型&lt;/strong&gt;：商城所售商品均自带机打发票，在提供相关企业资料证明后，可申请开取增值税发票。&lt;br /&gt;\r\n&lt;strong&gt;退 换 货&lt;/strong&gt;：商城为您提供完善的退换货服务。',3),(4,'促销及赠品','',4);
/*!40000 ALTER TABLE `pmall_consult_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_consume`
--

DROP TABLE IF EXISTS `pmall_consume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_consume` (
  `consume_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消费表',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `consume_amount` decimal(10,2) NOT NULL COMMENT '金额',
  `consume_time` int(10) unsigned NOT NULL COMMENT '时间',
  `consume_remark` varchar(200) NOT NULL COMMENT '备注',
  PRIMARY KEY (`consume_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='消费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_consume`
--

LOCK TABLES `pmall_consume` WRITE;
/*!40000 ALTER TABLE `pmall_consume` DISABLE KEYS */;
INSERT INTO `pmall_consume` VALUES (1,7,'kit','52800.00',1467721235,'确认退款，订单号: 8000000000001101'),(2,7,'kit','0.01',1467784465,'管理员更改订单为已收款状态，订单号：8000000000001001'),(3,7,'kit','52800.00',1467784834,'确认退款，订单号: 8000000000001301'),(4,7,'kit','0.01',1467785152,'确认退款，订单号: 8000000000001001'),(5,7,'kit','0.01',1467785664,'管理员更改订单为已收款状态，订单号：8000000000001401'),(6,7,'kit','211200.00',1467785803,'管理员更改订单为已收款状态，订单号：8000000000001501'),(7,7,'kit','0.01',1467793067,'确认退款，订单号: 8000000000001401'),(8,7,'kit','100.00',1467794353,'确认退款，订单号: 8000000000001501'),(9,2,'testuser','120.00',1467947548,'管理员更改订单为已收款状态，订单号：8000000000002801'),(10,5,'eshop2','110.10',1467965379,'卖出商品收入,扣除拥金9.9,订单号: 8000000000002801'),(11,7,'kit','110.00',1468207285,'管理员更改订单为已收款状态，订单号：8000000000002601'),(12,2,'testuser','70.00',1468403355,'确认退款，订单号: 8000000000003801'),(13,5,'eshop2','100.00',1468464925,'管理员调节预存款【增加】，充值单号: 540521808925160005'),(14,7,'kit','100.00',1468467383,'管理员调节预存款【增加】，充值单号: 500521811383442005'),(15,16,'Aidan','10000000.00',1468897665,'管理员调节预存款【增加】，充值单号: 430522241665960000'),(16,16,'Aidan','146300.00',1468898104,'下单，支付预存款，订单号: 8000000000004101'),(17,16,'Aidan','100.00',1468906749,'下单，支付预存款，订单号: 8000000000004301'),(18,16,'Aidan','100.00',1468908300,'确认退款，订单号: 8000000000004301'),(19,16,'Aidan','146300.00',1468908814,'确认退款，订单号: 8000000000004101'),(20,16,'Aidan','200.00',1468912034,'下单，支付预存款，订单号: 8000000000004501'),(21,16,'Aidan','200.00',1468913748,'确认退款，订单号: 8000000000004501'),(22,15,'13560134397','9999.00',1468914508,'管理员调节预存款【增加】，充值单号: 910522258508674005'),(23,16,'Aidan','1.00',1468914591,'申请提现，冻结预存款，提现单号: 800522258591473016'),(24,16,'Aidan','1.00',1468915793,'提现成功，提现单号: 800522258591473016'),(25,16,'Aidan','100.00',1468918526,'下单，支付预存款，订单号: 8000000000004601'),(26,7,'kit','110.00',1468977319,'管理员更改订单为已收款状态，订单号：8000000000002301'),(27,7,'kit','83.00',1469524990,'管理员更改订单为已收款状态，订单号：8000000000005301'),(28,15,'13560134397','100.00',1469531707,'管理员调节预存款【减少】，充值单号: 200522875707587005'),(29,16,'Aidan','100.00',1469669211,'下单，支付预存款，订单号: 8000000000005801');
/*!40000 ALTER TABLE `pmall_consume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract`
--

DROP TABLE IF EXISTS `pmall_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract` (
  `ct_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ct_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `ct_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `ct_itemid` int(11) NOT NULL COMMENT '服务项目ID',
  `ct_auditstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请审核状态0未审核1审核通过2审核失败3已支付保证金4保证金审核通过5保证金审核失败',
  `ct_joinstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '加入状态 0未申请 1已申请 2已加入',
  `ct_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金余额',
  `ct_closestate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '永久关闭 0永久关闭 1开启',
  `ct_quitstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退出申请状态0未申请 1已申请 2申请失败',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务加入情况表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract`
--

LOCK TABLES `pmall_contract` WRITE;
/*!40000 ALTER TABLE `pmall_contract` DISABLE KEYS */;
INSERT INTO `pmall_contract` VALUES (1,2,'eshop2',1,4,2,'1000.00',1,0),(2,1,'800方o2o',4,0,2,'0.00',1,0),(3,1,'800方o2o',3,0,2,'0.00',1,0),(4,1,'800方o2o',1,0,2,'0.00',1,0),(5,1,'800方o2o',2,0,2,'0.00',1,0);
/*!40000 ALTER TABLE `pmall_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract_apply`
--

DROP TABLE IF EXISTS `pmall_contract_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract_apply` (
  `cta_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请ID',
  `cta_itemid` int(11) NOT NULL COMMENT '保障项目ID',
  `cta_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `cta_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `cta_addtime` int(11) NOT NULL COMMENT '申请时间',
  `cta_auditstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态 0未审核 1审核通过 2审核失败 3保证金待审核 4保证金审核通过 5保证金审核失败',
  `cta_cost` decimal(10,2) DEFAULT '0.00' COMMENT '保证金金额',
  `cta_costimg` varchar(500) DEFAULT NULL COMMENT '保证金付款凭证图片',
  PRIMARY KEY (`cta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺加入消费者保障服务申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract_apply`
--

LOCK TABLES `pmall_contract_apply` WRITE;
/*!40000 ALTER TABLE `pmall_contract_apply` DISABLE KEYS */;
INSERT INTO `pmall_contract_apply` VALUES (1,1,2,'eshop2',1468230019,4,'1000.00','05215740704195980.jpg');
/*!40000 ALTER TABLE `pmall_contract_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract_costlog`
--

DROP TABLE IF EXISTS `pmall_contract_costlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract_costlog` (
  `clog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `clog_itemid` int(11) NOT NULL COMMENT '保障项目ID',
  `clog_itemname` varchar(100) NOT NULL COMMENT '保障项目名称',
  `clog_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `clog_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `clog_adminid` int(11) DEFAULT NULL COMMENT '操作管理员ID',
  `clog_adminname` varchar(200) DEFAULT NULL COMMENT '操作管理员名称',
  `clog_price` decimal(10,2) NOT NULL COMMENT '金额',
  `clog_addtime` int(11) NOT NULL COMMENT '添加时间',
  `clog_desc` varchar(2000) NOT NULL COMMENT '描述',
  PRIMARY KEY (`clog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务保证金日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract_costlog`
--

LOCK TABLES `pmall_contract_costlog` WRITE;
/*!40000 ALTER TABLE `pmall_contract_costlog` DISABLE KEYS */;
INSERT INTO `pmall_contract_costlog` VALUES (1,1,'7天退货',2,'eshop2',1,'admin','1000.00',1468230084,'申请加入保障服务，支付保证金');
/*!40000 ALTER TABLE `pmall_contract_costlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract_item`
--

DROP TABLE IF EXISTS `pmall_contract_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract_item` (
  `cti_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cti_name` varchar(100) NOT NULL COMMENT '保障项目名称',
  `cti_describe` varchar(2000) NOT NULL COMMENT '保障项目描述',
  `cti_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `cti_icon` varchar(500) NOT NULL COMMENT '图标',
  `cti_descurl` varchar(500) DEFAULT NULL COMMENT '内容介绍文章地址',
  `cti_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0关闭 1开启',
  `cti_sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`cti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='消费者保障服务项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract_item`
--

LOCK TABLES `pmall_contract_item` WRITE;
/*!40000 ALTER TABLE `pmall_contract_item` DISABLE KEYS */;
INSERT INTO `pmall_contract_item` VALUES (1,'7天退货','卖家就该商品退货服务向买家作出承诺，自商品签收之日起至卖家承诺保障时间内，商品符合卖家约定状态的情况下，如买家对购买的商品不满意可无理由申请退货。','1000.00','7day.gif','',1,1),(2,'品质承诺','卖家就该商品品质向买家作出承诺，承诺商品为正品。','1000.00','pz.gif','',1,2),(3,'破损补寄','卖家就该商品签收状态作出承诺，自商品签收之日起至卖家承诺保障时间内，如发现商品在运输途中出现破损，买家可申请破损部分商品补寄。','1000.00','psbf.gif','',1,3),(4,'急速物流','与优秀快递公司合作，快速送达买家手中，保障买家良好的购物物流体验。','1000.00','jswl.gif','',1,4),(5,'','','0.00','','',0,0),(6,'','','0.00','','',0,0),(7,'','','0.00','','',0,0),(8,'','','0.00','','',0,0),(9,'','','0.00','','',0,0),(10,'','','0.00','','',0,0);
/*!40000 ALTER TABLE `pmall_contract_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract_log`
--

DROP TABLE IF EXISTS `pmall_contract_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `log_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `log_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `log_itemid` int(11) NOT NULL COMMENT '服务项目ID',
  `log_itemname` varchar(100) NOT NULL COMMENT '服务项目名称',
  `log_msg` varchar(1000) NOT NULL COMMENT '操作描述',
  `log_addtime` int(11) NOT NULL COMMENT '添加时间',
  `log_role` varchar(100) NOT NULL COMMENT '操作者角色 管理员为admin 商家为seller',
  `log_userid` int(11) NOT NULL COMMENT '操作者ID',
  `log_username` varchar(200) NOT NULL COMMENT '操作者名称',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract_log`
--

LOCK TABLES `pmall_contract_log` WRITE;
/*!40000 ALTER TABLE `pmall_contract_log` DISABLE KEYS */;
INSERT INTO `pmall_contract_log` VALUES (1,2,'eshop2',1,'7天退货','店铺申请加入保障服务',1468230019,'seller',5,'eshop2'),(2,2,'eshop2',1,'7天退货','审核通过，待支付保证金',1468230039,'admin',1,'admin'),(3,2,'eshop2',1,'7天退货','店铺支付保证金',1468230070,'seller',5,'eshop2'),(4,2,'eshop2',1,'7天退货','保证金审核通过',1468230084,'admin',1,'admin'),(5,1,'800方o2o',4,'急速物流','自营店铺加入保障服务',1468481995,'seller',1,'800@member.com'),(6,1,'800方o2o',3,'破损补寄','自营店铺加入保障服务',1468481996,'seller',1,'800@member.com'),(7,1,'800方o2o',1,'7天退货','自营店铺加入保障服务',1468482003,'seller',1,'800@member.com'),(8,1,'800方o2o',2,'品质承诺','自营店铺加入保障服务',1468482008,'seller',1,'800@member.com');
/*!40000 ALTER TABLE `pmall_contract_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_contract_quitapply`
--

DROP TABLE IF EXISTS `pmall_contract_quitapply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_contract_quitapply` (
  `ctq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退出申请ID',
  `ctq_itemid` int(11) NOT NULL COMMENT '项目ID',
  `ctq_itemname` varchar(200) NOT NULL COMMENT '项目名称',
  `ctq_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `ctq_storename` varchar(500) NOT NULL COMMENT '店铺名称',
  `ctq_addtime` int(11) NOT NULL COMMENT '添加时间',
  `ctq_auditstate` tinyint(4) NOT NULL COMMENT '审核状态0未审核1审核通过2审核失败',
  PRIMARY KEY (`ctq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消费者保障服务退出申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_contract_quitapply`
--

LOCK TABLES `pmall_contract_quitapply` WRITE;
/*!40000 ALTER TABLE `pmall_contract_quitapply` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_contract_quitapply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_cron`
--

DROP TABLE IF EXISTS `pmall_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '任务类型 1商品上架 2根据商品id更新商品促销价格 3优惠套装过期 4推荐展位过期 5团购开始更新商品促销价格 6团购过期 7限时折扣过期 8加价购过期 9商品消费者保障服务开启状态更新 10手机专享过期',
  `exeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联任务的ID[如商品ID,会员ID]',
  `exetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='任务队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_cron`
--

LOCK TABLES `pmall_cron` WRITE;
/*!40000 ALTER TABLE `pmall_cron` DISABLE KEYS */;
INSERT INTO `pmall_cron` VALUES (1,7,1,1453392000),(4,6,100009,1453392000),(5,9,100010,1467700768),(6,9,100011,1467855455),(7,9,100012,1467963958),(8,9,100013,1468047986),(9,9,100014,1468313536),(10,9,100015,1468568569),(11,9,100016,1468582418),(12,9,100017,1468900498),(13,9,100018,1468916050),(14,9,100019,1469425381),(15,9,100020,1469425531),(16,9,100021,1469425705),(17,9,100022,1469426243),(18,9,100023,1469426716),(19,4,2,1472191164);
/*!40000 ALTER TABLE `pmall_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_daddress`
--

DROP TABLE IF EXISTS `pmall_daddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_daddress` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `store_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '省市县',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `telphone` varchar(40) DEFAULT NULL COMMENT '电话',
  `company` varchar(50) DEFAULT '' COMMENT '公司',
  `is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认1是',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='卖家发货地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_daddress`
--

LOCK TABLES `pmall_daddress` WRITE;
/*!40000 ALTER TABLE `pmall_daddress` DISABLE KEYS */;
INSERT INTO `pmall_daddress` VALUES (1,1,'陈小姐',3041,289,'广东 广州市 海珠区','四季天地3楼','18012345678','','0'),(2,2,'eshop2',3041,289,'广东 广州市 海珠区','四季天地2楼','88889999','eshop2旗舰门店','1');
/*!40000 ALTER TABLE `pmall_daddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_delivery_order`
--

DROP TABLE IF EXISTS `pmall_delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_delivery_order` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `addtime` int(11) DEFAULT '0' COMMENT '订单生成时间',
  `order_sn` bigint(20) DEFAULT NULL COMMENT '订单号',
  `dlyp_id` int(11) DEFAULT NULL COMMENT '自提点ID',
  `shipping_code` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `express_code` varchar(30) DEFAULT NULL COMMENT '快递公司编码',
  `express_name` varchar(30) DEFAULT NULL COMMENT '快递公司名称',
  `reciver_name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `reciver_telphone` varchar(20) DEFAULT NULL COMMENT '电话',
  `reciver_mobphone` varchar(11) DEFAULT NULL COMMENT '手机',
  `dlyo_state` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '订单状态 10(默认)未到站，20已到站，30已提取',
  `dlyo_pickup_code` varchar(6) DEFAULT NULL COMMENT '提货码',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单自提点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_delivery_order`
--

LOCK TABLES `pmall_delivery_order` WRITE;
/*!40000 ALTER TABLE `pmall_delivery_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_delivery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_delivery_point`
--

DROP TABLE IF EXISTS `pmall_delivery_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_delivery_point` (
  `dlyp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '提货站id',
  `dlyp_name` varchar(50) NOT NULL COMMENT '提货站登录名',
  `dlyp_passwd` varchar(32) NOT NULL COMMENT '提货站登录密码',
  `dlyp_truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `dlyp_mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `dlyp_telephony` varchar(20) DEFAULT '' COMMENT '座机号码',
  `dlyp_address_name` varchar(20) NOT NULL COMMENT '服务站名称',
  `dlyp_area_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `dlyp_area_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `dlyp_area_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `dlyp_area_4` int(10) unsigned NOT NULL COMMENT '四级地区id',
  `dlyp_area` int(10) unsigned NOT NULL COMMENT '地区id',
  `dlyp_area_info` varchar(255) NOT NULL COMMENT '地区内容',
  `dlyp_address` varchar(255) NOT NULL COMMENT '详细地址',
  `dlyp_idcard` varchar(18) NOT NULL COMMENT '身份证号码',
  `dlyp_idcard_image` varchar(255) NOT NULL COMMENT '身份证照片',
  `dlyp_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `dlyp_state` tinyint(3) unsigned NOT NULL COMMENT '提货站状态 0关闭，1开启，10等待审核, 20审核失败',
  `dlyp_fail_reason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`dlyp_id`),
  UNIQUE KEY `dlyp_name` (`dlyp_name`),
  UNIQUE KEY `dlyp_idcard` (`dlyp_idcard`),
  UNIQUE KEY `dlyp_mobile` (`dlyp_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提货站表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_delivery_point`
--

LOCK TABLES `pmall_delivery_point` WRITE;
/*!40000 ALTER TABLE `pmall_delivery_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_delivery_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_document`
--

DROP TABLE IF EXISTS `pmall_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_document` (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) NOT NULL COMMENT '标题',
  `doc_content` text NOT NULL COMMENT '内容',
  `doc_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `doc_code` (`doc_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_document`
--

LOCK TABLES `pmall_document` WRITE;
/*!40000 ALTER TABLE `pmall_document` DISABLE KEYS */;
INSERT INTO `pmall_document` VALUES (1,'agreement','用户服务协议','<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户账号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>',1449242303),(4,'open_store','开店协议','<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的账户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的账户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>',1449242303),(5,'groupbuy','团购活动协议','<p>\r\n  一、团购的所有权和运作权归本公司。\r\n</p>\r\n<p>\r\n    二、本公司有权在必要时修改本协议，本协议一旦发生变更，将会在相关页面上公布。如果您不同意所改动的内容，您应主动停止使用团购服务。如果您继续使用服务，则视为接受本协议的变更。\r\n</p>\r\n<p>\r\n   三、如发生下列任何一种情形，本公司有权中断或终止向您提供的服务而无需通知您：\r\n</p>\r\n1、 您提供的个人资料不真实；<br />\r\n2、您违反本协议的规定；<br />\r\n3、 按照政府主管部门的监管要求；<br />\r\n4、本公司认为您的行为违反团购服务性质或需求的特殊情形。\r\n<p>\r\n 四、尽管本协议可能另有其他规定，本公司仍然可以随时终止本协议。\r\n</p>\r\n<p>\r\n  五、本公司终止本协议的权利不会妨害本公司可能拥有的在本协议终止前因您违反本协议或本公司本应享有的任何其他权利。\r\n</p>\r\n<p>\r\n  六、您理解并完全接受，本公司有权自行对团购资源作下线处理。\r\n</p>',1449242303),(6,'create_circle','圈子使用须知','&nbsp;&nbsp; 请您仔细阅读本须知的全部内容（特别是以<strong><span style=\"text-decoration:underline;\">粗体下划线</span></strong>标注的内容）。如果您不同意本须知的任意内容，您应当停止使用本产品。\r\n<p>\r\n  1、“圈子”是本公司开设的一个供商城用户（以下简称“用户”或“您”）交流购物体验等信息的网络社区。<strong><span style=\"text-decoration:underline;\">您使用“圈子”产品需遵守本须知，并遵守本公司公布的操作流程和规则。</span></strong>\r\n</p>\r\n<p>\r\n  2、“圈子”产品的功能和产品提供方式由本公司自行决定，后续本公司可能调整产品名称和产品运行的域名等。<strong><span style=\"text-decoration:underline;\">本须知适用于“圈子”产品的调整、改进版本和附加功能。</span></strong>\r\n</p>\r\n<p>\r\n    3、您可以通过本产品创建网络关系圈子，其他感兴趣的用户可以加入您创建的圈子。您应当遵守任何适用的法律之规定，并自觉尊重和维护其他参与者的合法权利。您不得以任何形式开展违法活动、侵犯他人合法权益、损害本公司或其他公司的合法利益，否则您需为此自行承担法律责任。<strong><span style=\"text-decoration:underline;\">您同意本公司无需为产品使用者的违法或侵权等行为承担任何责任。</span></strong>\r\n</p>\r\n<p>\r\n  4、您同意并保证通过本产品上传、发布的文字、图片等全部信息素材符合相关法律的规定。您保证素材内容以及素材所含链接指向的内容的合法性和正当性，不侵犯他人的肖像权、名誉权、知识产权、隐私权等合法权益，也不会侵犯法人或其他团体的商业秘密等合法权益。\r\n</p>\r\n<p>\r\n    5、<strong><span style=\"text-decoration:underline;\">您使用本产品可能需要提供关于您的个人资料、肖像、联系方式等个人信息。您了解并同意，在使用本产品过程中关于您的个人信息可能会通过网络等渠道进行传播。</span></strong>\r\n</p>\r\n<p>\r\n 6、您通过本产品上传、发布素材，即意味着<strong><span style=\"text-decoration:underline;\">您同意向本公司提供免费的、永久性的、不可撤销的权利和许可，使本公司可以在全球范围内复制、发行、展示、演绎和通过信息网络等渠道使用您上传的素材和信息</span></strong>，例如将您提供的图片发布于活动页面或平面媒体中。\r\n</p>\r\n<p>\r\n   7、本公司无法事先了解您上传素材的真实性和合法性。如您上传的素材被发现不适宜展示或遭受他人举报或投诉的，本公司有权立即删除或进行屏蔽从而停止该素材的继续传播。<strong><span style=\"text-decoration:underline;\">如果您违反本须知的内容、有关协议或规则等的，本公司有权删除相关素材并有权拒绝您继续使用产品，届时您无权要求本公司进行补偿或赔偿。</span></strong>\r\n</p>\r\n<p>\r\n 8、您使用本产品应同时遵守《用户服务协议》、本公司公布的各项规则以及本公司发布的关于本产品的特别规则和制度。\r\n</p>\r\n<p>\r\n   9、第三方可能通过分公司其他产品或本产品知悉并使用您上传的素材、个人信息或进而侵犯您的合法权利。<strong><span style=\"text-decoration:underline;\">本公司提醒您注意和谨防网络诈骗以及其他可能对您不利的行动和信息，但本公司对第三方的侵权、违法等行为不承担赔偿等法律责任。</span></strong>您承诺合法使用并善待其他用户上传的素材和信息。\r\n</p>\r\n<p>\r\n 10、您应自行对上传的素材进行备份。本公司可能按照本须知删除或屏蔽素材，相关系统亦可能遭受网络攻击或网络故障，类似或其他情况均可能使您上传的素材丢失或故障，对此本公司将尽力避免但不做任何保证。\r\n</p>\r\n<p>\r\n 11、<strong><span style=\"text-decoration:underline;\">如您因使用本产品与本公司发生纠纷的，您同意由本公司住所地人民法院管辖审理。</span></strong> \r\n</p>\r\n<p>\r\n   12、<strong><span style=\"text-decoration:underline;\">本公司有权更新、修改本须知以及有关规则、流程等相关文件的内容，本公司在法律允许的范围内负责对本须知进行说明和解释</span></strong>。如您对修改存有异议，您有权选择不再继续使用本产品，但您在此前的行为仍受本须知以及相关文件最新的修改版本的约束。\r\n</p>',1449242303);
/*!40000 ALTER TABLE `pmall_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_evaluate_goods`
--

DROP TABLE IF EXISTS `pmall_evaluate_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_evaluate_goods` (
  `geval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表自增ID',
  `geval_orderno` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_goodsimage` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不是 1表示是匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_image` varchar(255) DEFAULT NULL COMMENT '晒单图片',
  `geval_content_again` varchar(255) NOT NULL COMMENT '追加评价内容',
  `geval_addtime_again` int(10) unsigned NOT NULL COMMENT '追加评价时间',
  `geval_image_again` varchar(255) NOT NULL COMMENT '追加评价图片',
  `geval_explain_again` varchar(255) NOT NULL COMMENT '追加解释内容',
  PRIMARY KEY (`geval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信誉评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_evaluate_goods`
--

LOCK TABLES `pmall_evaluate_goods` WRITE;
/*!40000 ALTER TABLE `pmall_evaluate_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_evaluate_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_evaluate_store`
--

DROP TABLE IF EXISTS `pmall_evaluate_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_evaluate_store` (
  `seval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `seval_orderid` int(11) unsigned NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_addtime` int(11) unsigned NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) unsigned NOT NULL COMMENT '店铺编号',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) unsigned NOT NULL COMMENT '买家编号',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称',
  `seval_desccredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '描述相符评分',
  `seval_servicecredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '服务态度评分',
  `seval_deliverycredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '发货速度评分',
  PRIMARY KEY (`seval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺评分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_evaluate_store`
--

LOCK TABLES `pmall_evaluate_store` WRITE;
/*!40000 ALTER TABLE `pmall_evaluate_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_evaluate_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_exppoints_log`
--

DROP TABLE IF EXISTS `pmall_exppoints_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_exppoints_log` (
  `exp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经验值日志编号',
  `exp_memberid` int(11) NOT NULL COMMENT '会员编号',
  `exp_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `exp_points` int(11) NOT NULL DEFAULT '0' COMMENT '经验值负数表示扣除',
  `exp_addtime` int(11) NOT NULL COMMENT '添加时间',
  `exp_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `exp_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY (`exp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='经验值日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_exppoints_log`
--

LOCK TABLES `pmall_exppoints_log` WRITE;
/*!40000 ALTER TABLE `pmall_exppoints_log` DISABLE KEYS */;
INSERT INTO `pmall_exppoints_log` VALUES (1,3,'testuser2',500,1467623745,'订单8000000000000901购物消费','order'),(2,1,'800@member.com',5,1467700561,'会员登录','login'),(3,3,'testuser2',5,1467700815,'会员登录','login'),(4,7,'kit',500,1467719000,'订单8000000000001101购物消费','order'),(5,7,'kit',5,1467777155,'会员登录','login'),(6,7,'kit',500,1467777594,'订单8000000000001201购物消费','order'),(7,7,'kit',500,1467783478,'订单8000000000001301购物消费','order'),(8,7,'kit',500,1467794377,'订单8000000000001501购物消费','order'),(9,1,'800@member.com',5,1467799158,'会员登录','login'),(10,1,'800@member.com',5,1467860580,'会员登录','login'),(11,7,'kit',5,1467942334,'会员登录','login'),(12,2,'testuser',5,1467947438,'会员登录','login'),(13,2,'testuser',120,1467965379,'订单8000000000002801购物消费','order'),(14,2,'testuser',500,1468217982,'订单8000000000000801购物消费','order'),(15,2,'testuser',86,1468307594,'订单8000000000003401购物消费','order'),(16,2,'testuser',160,1468313658,'订单8000000000003701购物消费','order'),(17,1,'800@member.com',5,1468382190,'会员登录','login'),(18,9,'eveyb',5,1468389019,'会员登录','login'),(19,2,'testuser',78,1468403025,'订单8000000000003801购物消费','order'),(20,2,'testuser',5,1468403067,'会员登录','login'),(21,7,'kit',5,1468479693,'会员登录','login'),(22,12,'luojuan',5,1468548758,'会员登录','login'),(23,5,'eshop2',5,1468552094,'会员登录','login'),(24,15,'13560134397',100,1468806492,'订单8000000000004001购物消费','order'),(25,7,'kit',5,1468924835,'会员登录','login'),(26,15,'13560134397',100,1468976595,'订单8000000000004401购物消费','order'),(27,1,'800@member.com',5,1469512745,'会员登录','login'),(28,7,'kit',5,1469524884,'会员登录','login'),(29,16,'Aidan',5,1469667921,'会员登录','login');
/*!40000 ALTER TABLE `pmall_exppoints_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_express`
--

DROP TABLE IF EXISTS `pmall_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_express` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `e_name` varchar(50) NOT NULL COMMENT '公司名称',
  `e_state` enum('0','1') NOT NULL DEFAULT '1' COMMENT '状态',
  `e_code` varchar(50) NOT NULL COMMENT '编号',
  `e_letter` char(1) NOT NULL COMMENT '首字母',
  `e_order` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1常用2不常用',
  `e_url` varchar(100) NOT NULL COMMENT '公司网址',
  `e_zt_state` tinyint(4) DEFAULT '0' COMMENT '是否支持服务站配送0否1是',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='快递公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_express`
--

LOCK TABLES `pmall_express` WRITE;
/*!40000 ALTER TABLE `pmall_express` DISABLE KEYS */;
INSERT INTO `pmall_express` VALUES (1,'安信达','1','anxindakuaixi','A','2','http://www.anxinda.com',1),(2,'包裹平邮','0','youzhengguonei','B','2','http://yjcx.chinapost.com.cn',0),(3,'CCES','0','cces','C','2','http://www.cces.com.cn',0),(4,'传喜物流','0','chuanxiwuliu','C','2','http://www.cxcod.com',0),(5,'DHL快递','0','dhl','D','2','http://www.cn.dhl.com',0),(6,'大田物流','0','datianwuliu','D','2','http://www.dtw.com.cn',0),(7,'德邦物流','0','debangwuliu','D','2','http://www.deppon.com',0),(8,'EMS','0','ems','E','2','http://www.ems.com.cn',0),(9,'EMS国际','0','emsguoji','E','2','###',0),(10,'飞康达','0','feikangda','F','2','http://www.fkd.com.cn',0),(11,'FedEx(国际)','0','fedex','F','2','http://fedex.com/cn',0),(12,'凡客如风达','0','rufengda','F','2','http://www.rufengda.com',0),(13,'港中能达','0','ganzhongnengda','G','2','http://www.nd56.com',0),(14,'挂号信','0','youzhengguonei','G','2','http://yjcx.chinapost.com.cn',1),(15,'共速达','1','gongsuda','G','2','http://www.gongsuda.com/mall/Search.aspx',1),(16,'汇通快递','0','huitongkuaidi','H','2','http://www.htky365.com',0),(17,'华宇物流','0','tiandihuayu','H','2','http://www.hoau.net',0),(18,'佳吉快运','0','jiajiwuliu','J','2','http://www.jiaji.com',0),(19,'佳怡物流','0','jiayiwuliu','J','2','http://www.jiayi56.com',0),(20,'急先达','0','jixianda','J','2','http://www.joust.cn',0),(21,'快捷速递','0','kuaijiesudi','K','2','http://www.fastexpress.com.cn',0),(22,'龙邦快递','0','longbanwuliu','L','2','http://www.lbex.com.cn',0),(23,'联邦快递','0','lianbangkuaidi','L','2','http://cndxp.apac.fedex.com/dxp.html',0),(24,'联昊通','0','lianhaowuliu','L','2','http://www.lhtex.com.cn',0),(25,'全一快递','0','quanyikuaidi','Q','2','http://www.apex100.com',0),(26,'全峰快递','0','quanfengkuaidi','Q','2','http://www.qfkd.com.cn',0),(27,'全日通','0','quanritongkuaidi','Q','2','http://www.at-express.com',0),(28,'申通快递','1','shentong','S','2','http://www.sto.cn',0),(29,'顺丰快递','0','shunfeng','S','1','http://www.sf-express.com',0),(30,'速尔快递','0','suer','S','2','http://www.sure56.com',0),(31,'TNT快递','0','tnt','T','2','http://www.tnt.com.cn',0),(32,'天天快递','0','tiantian','T','2','http://www.ttkdex.com',0),(33,'天地华宇','0','tiandihuayu','T','2','http://www.hoau.net',0),(34,'UPS快递','0','ups','U','2','http://www.ups.com/cn',0),(35,'USPS','0','usps','U','2','http://www.kuaidi100.com/all/usps.shtml',0),(36,'新邦物流','0','xinbangwuliu','X','2','http://www.xbwl.cn',0),(37,'信丰物流','0','xinfengwuliu','X','2','http://www.xf-express.com.cn',0),(38,'希伊艾斯','0','cces','X','2','http://www.cces.com.cn',0),(39,'新蛋物流','0','neweggozzo','X','2','http://www.ozzo.com.cn',0),(40,'圆通快递','0','yuantong','Y','1','http://www.yto.net.cn',0),(41,'韵达快递','0','yunda','Y','1','http://www.yundaex.com',0),(42,'邮政包裹','0','youzhengguonei','Y','2','http://yjcx.chinapost.com.cn',0),(43,'优速快递','0','youshuwuliu','Y','2','http://www.uc56.com',0),(44,'中通快递','0','zhongtong','Z','1','http://www.zto.cn',0),(45,'中铁快运','0','zhongtiewuliu','Z','2','http://www.cre.cn',0),(46,'宅急送','0','zhaijisong','Z','2','http://www.zjs.com.cn',0),(47,'中邮物流','0','zhongyouwuliu','Z','2','http://www.cnpl.com.cn',0);
/*!40000 ALTER TABLE `pmall_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_favorites`
--

DROP TABLE IF EXISTS `pmall_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名',
  `fav_id` int(10) unsigned NOT NULL COMMENT '商品或店铺ID',
  `fav_type` char(5) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,store为店铺,默认为商品',
  `fav_time` int(10) unsigned NOT NULL COMMENT '收藏时间',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `sc_id` int(10) unsigned DEFAULT '0' COMMENT '店铺分类ID',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `log_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品收藏时价格',
  `log_msg` varchar(20) DEFAULT NULL COMMENT '收藏备注',
  PRIMARY KEY (`log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_favorites`
--

LOCK TABLES `pmall_favorites` WRITE;
/*!40000 ALTER TABLE `pmall_favorites` DISABLE KEYS */;
INSERT INTO `pmall_favorites` VALUES (1,2,'testuser',100009,'goods',1467614407,1,'800方o2o',0,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','1_04752627958339099.jpg',587,'42800.00','42800.00'),(3,2,'testuser',2,'store',1468549619,2,'eshop2',0,NULL,NULL,0,'0.00',NULL);
/*!40000 ALTER TABLE `pmall_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_flowstat`
--

DROP TABLE IF EXISTS `pmall_flowstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_flowstat` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_flowstat`
--

LOCK TABLES `pmall_flowstat` WRITE;
/*!40000 ALTER TABLE `pmall_flowstat` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_flowstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_flowstat_1`
--

DROP TABLE IF EXISTS `pmall_flowstat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_flowstat_1` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_flowstat_1`
--

LOCK TABLES `pmall_flowstat_1` WRITE;
/*!40000 ALTER TABLE `pmall_flowstat_1` DISABLE KEYS */;
INSERT INTO `pmall_flowstat_1` VALUES (1467561600,4,1,'sum',0),(1467561600,1,1,'goods',100006),(1467561600,3,1,'goods',100002),(1467648000,7,1,'sum',0),(1467648000,5,1,'goods',100009),(1467648000,2,1,'goods',100008),(1467734400,13,1,'sum',0),(1467734400,6,1,'goods',100009),(1467734400,4,1,'goods',100000),(1467820800,4,1,'sum',0),(1467820800,2,1,'goods',100006),(1467820800,1,1,'goods',100009),(1467820800,1,1,'goods',100008),(1468166400,2,1,'sum',0),(1468166400,2,1,'goods',100007),(1468425600,3,1,'sum',0),(1468425600,2,1,'goods',100002),(1468425600,1,1,'goods',100006),(1468512000,3,1,'sum',0),(1468512000,3,1,'goods',100002),(1468857600,2,1,'sum',0),(1468857600,1,1,'goods',100007),(1468857600,1,1,'goods',100017),(1468944000,1,1,'sum',0),(1468944000,1,1,'goods',100002),(1469462400,4,1,'sum',0),(1469462400,4,1,'goods',100002),(1469548800,1,1,'sum',0);
/*!40000 ALTER TABLE `pmall_flowstat_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_flowstat_2`
--

DROP TABLE IF EXISTS `pmall_flowstat_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_flowstat_2` (
  `stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_flowstat_2`
--

LOCK TABLES `pmall_flowstat_2` WRITE;
/*!40000 ALTER TABLE `pmall_flowstat_2` DISABLE KEYS */;
INSERT INTO `pmall_flowstat_2` VALUES (1467648000,4,2,'sum',0),(1467648000,4,2,'goods',100010),(1467907200,7,2,'sum',0),(1467907200,5,2,'goods',100012),(1467907200,2,2,'goods',100011),(1468512000,8,2,'sum',0),(1468512000,1,2,'goods',100012),(1468512000,1,2,'goods',100011),(1468857600,6,2,'sum',0),(1468857600,3,2,'goods',100013),(1468857600,2,2,'goods',100018),(1468857600,1,2,'goods',100019),(1469462400,1,2,'sum',0),(1469462400,1,2,'goods',100024),(1469635200,4,2,'sum',0),(1469635200,1,2,'goods',100013),(1469635200,3,2,'goods',100018);
/*!40000 ALTER TABLE `pmall_flowstat_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_gadmin`
--

DROP TABLE IF EXISTS `pmall_gadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_gadmin` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `gname` varchar(50) DEFAULT NULL COMMENT '组名',
  `limits` text COMMENT '权限内容',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='权限组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_gadmin`
--

LOCK TABLES `pmall_gadmin` WRITE;
/*!40000 ALTER TABLE `pmall_gadmin` DISABLE KEYS */;
INSERT INTO `pmall_gadmin` VALUES (2,'商务支持','_IEnHwoH2b_4XZAvzTwa3sWaxtC3ZEBdDiR5qvSJaVF2bz94blCouf0VbXTYJuT4HlMkAe_Gdl_ZxhvWdZ_L7iNY8X6bQOBY8s-YPYBXAVNQ7k6tTUGZJtBneVzK-t9dXZWt_DQpGaxbXvB0PY1FPv_J1bUIXcOZIFzpZu-1SawWRxqaPuOpAYOvvHBrYrvIUVBYTc8hTTAN8bTpVVDqVcyaPmDa2uCcPRSpDrrIgeCUCgDVbmD1ccPofmM5FC9pmVNZxJwpZxwHnpAFLt6esXLLtVqIULBY7SCxCsv6bUVqKjOG5d_6KkBKPnIZCc_a_o87_XCnGfz17wTVcrCFKZMo1S-6CTJ4WJ_JpZwqew-1DuOrLWAIcT7bkRM8EBQgLV9tofR5eX9XeLzKmnDuuuHJaETqDn_LHXCnGfz1HwTVcrCFKZPpJSBZKTKZuI75JZwqew-1PuOrLW_IcT-c4RPbMBMwnT-u_UGZJtBHNdBEaKpDZrYVsnDRJqaxbXvAECgDVbmDlccSobqKpFXBZ6XK0ti8GdowHnpAF7jAasNMLlh5c0WOsAH8djbwa7iGaxtBH5ctOvnQurZRsbRRJrh-H7wOEKXz1goFFQ0-YfuOZFLAq1W_YJhuW9y-nirAEAiOe0KPX8s84PU_okVCdWsqeMkPZilO6GUtKPcDaqoIt-cEWaa_LIbRHbJvFgeFF8vEpuxAVgFBZKoO5uVqWigwXCsAZDtALLHQc9Q-L8IQLwG8djbwa7pGaxtBHxctNviQevpV9DLSZOaxbXvAUCgDVbrFE9jRY7mPYsFzpZu9FJi-mdvwWDbPI8fPOoZMH8s84PV_4kVCdWsqdAhT6mfNKWQtKPcDaulIt-cFGaa-c0aQXnZB4sc_FhjEVupBpEdy2dWJIKT919y8Hip-VkmAb_f7cNj5bwLO7nECwasuqDtUWNkBXZEA9nfQ8fXVsrVUJjsrIgeCUua1Z_vD180-ZrcLoZEBZSZJYqZ719y8Hip_FkmAbDf7bFW9rMYMMAb8djbwa_pGaxtD3ZE9dfhS-rVStCEFqn1'),(3,'运营人员','SKfBWOrBULHBVC0pdaQyY-SxcOwtn-pnXQQIPb3ytYbjCgK37WC9XCVrjwkDM8s9xmT5Oypew8Z_UyIxwvUfQjnu_rOa80WuTDkrjEWvA7oNRqS9mZdBsFX71rJxkH_uEcovHoftjtWBvCV7oBWwTCXeNZYd7cqyYtZ-syIh1AFrrxUeP_i-YwkCXqWufIVwk7daoyCujYthR0mO4aJEsHE78qabOBOds6jBc7Qbo3WwXDrq0pGauZoBF6kPVXTE5uT_bZaueBUK8-WufCQeEAgjwsXa5hIqKndCUFYLwaYVt9QaXymLi4SK8-WubCQfI-hjDqdtwyGaOyr-w8XbwaUEF8QPcWkOrpjNDtWBvCULHJkAf5cK0aT9DmoSVqnudbWE96QeIbUbnwUaT_WCXCVLjwkEI3rdgaI9qxbecGn7wpHhwvT_gmoePmfuYshRfqWufIUgPDrq0pGauZrCZ6nudXTE5uT_bZaueBSKrGk-z-WaEyjDsppNEaI9qxbeoGn7wpHRwvT-IqjvH7idUuhdTDiLj_Wgk7daQoIpPfoh57i_VsWFRy_r8gabC3UubFUeTCQfICjEAtmt1nUd_gqtQGlbwqHh1AFrrxUe3-heczjCLqWufIUw_Drq0tIpPmrxZwnqQzVhw_D78qabaBOeo9fBI6h-QAQwkxdaUsI-SxcuwtnudeYkBx_r8gabC8UubFVuzqkeQClkA2Xa5hIqOtdCUFZbwaY1RsTukdpOzrOa80WuT_WvHIUg3CXdZnVuTsqSZ0mukaJEsHDrvyori9UZY0jxk3kevwWDbCbawzW6uvdtRwouNkYkNBQaXymLi6S68-WurCQeI9jk40nNxmCqzgduU8Z_UyJhwvS_Qcoe_7gNIyQu4xWbHAWEDCc60aStrjqNQGlbwrHB1AFrrxUfT5dtY0jR7qWufIUAHDrq0pGquZqhN3mNFbWEBAUeArUbnwUabAWCXCULDIQ0AtnttZWtnjcnBN9kKQzVhwAEr8qabaBOdgwjRw-hPEHQwkxdaYvI-SxdOwtj-FmYVRuP_fZaueBSqvGk-zBWaE9kTM6nOdhV9-ZdBsFX7szXBwFFqYeoe38i9YAmdTDiLjCUQk7daQpIpPtrwFynuFtXURCVaXymLi7SK8-WuP7WaE-kz01qudhV9_WnBFATr1hJxY_F_bxYLWBOeQ9jBA3l-g9jy0ApNRmW9ngXu10ZrYrJFUHDbrxUf75htE6lRw3jd47gjw7qtFfCqzgduY_Z_UyHhoH_vQpnuv2j906jwIqlO0yjTc2opUzUaurce1-ZrMtJwR9TuMknvLwhtIqgxI3l-bwWDbCc6kzW6uocOwtnPRnWkFBReMljuD2ht7tWBvCV7XJkAf5cK0aWOPmqhF_leFmSEhwS-gcUbnwUafDWCXCULPIQ046qtBnXNrmqwFum-9aWAQIRb3raLn6UaT_WtU4ke47jEIxqtFXW9DjodQGlbwtHR1AFrzxUf72gNI_kSU3h6DJigf9bK5rIqixXyh6oeVgUlQvF-zxZLCCiq3EWtU6hOM-gjEzoOcaI9qxceUGn7wwJwRuP_ggpef7kJXGiez9V7oBWw76dZVrXNLrmBlwmudqTk4vF-zxZLOCiq38U-zqkvMvlS0xqddtW-XptdQGlbwtIx1AFrToaaD6j9U_fBAtjOEzkv_DpK0tH6zqduM7ZqRrYUNBO_crnvDsOa80WufAWvHIUg3CXeZsSeXWsSRskOcaJEsHEbzyori4S63tkCcpl941jD0srpUzUautbO1-ZrMsJwRAUOUrjuvoid8wlRw2hqDJigf-bK5rIqKrdtR-oONsSENzUOkpou_zfJXGni_I'),(4,'推广人员','uH3by2SqE6DVwpyDTBJ6fDpvcBqNGPQoSnD1re8IKkzpOgM2Kk1cwt-kgJPZ4T9FgPEIpt_VcczG8ZMukX_Vsw8GOozc-duHrfsZPgTdEW6aCOL9DYtVQLCKxfPlZt1VsFAbnh_4tgM2Ko1cwt_0gJQqIUO07hQ4NnxZAhynbUNvoY7Vsw8GOszc-duHrfsZPgTdEW6a6OLNLStVQLCKBfPlZp0GLF9rfi_9yEOJ3XCbZgLHxL7GQNDFThSYNnxE9WBKEXNavu92Muwqywx46dqb0Z8KDQRdIR87-DOo-g_FLTAqSXBV1r1VsWB7nn9sKTLq3nEsts6UlQBGnVDZ_gC4psrJBb97ERMO8g7J5nqWTfzI2VwrzfwGyrAOAX77GBPdHUBY3ECdJe_F9zDmLUw4KVCt2GPofoDLpXLDAiN2LVClgZEIpixE9aCq4mIeuEi-Z1oqWTfzI2YwrzfwGCrAOAX77GBO87X_o4WO9eL7Veh1WnZysutyJ1f6Kvo_81SKHRbM6sXN4kL-ISvCy0n'),(5,'会员中心','9EUlKERrJSYd5VvTPfH9cpNr-HXfednTSsbG1oYFa2IGs5MUZhSmI7-FlhdjqvL5NeR5isNEe39fZr6j0pIDJXOjE-dRaz_oQpIUxsFl5SIW7XdhAoc5BT_6T2NkfwNnFnIZzwWZ8yOz5seCk1_pJ5QAF66ZOqf47lb322ITOWPEQtITcUA3g9QRf0_UIfKj6lYmRMIW3eZjYwGVua_nH3dka1Nm2gbZ_1YpIhLT5seCk4_pJ5QAt66ZOqf47faHmmITJTAzj-7wtlAkAzRg7xNXZTVYyhZ1ph1jfbPfn-alpp_m4fb33xW6ecZk68WWrv-EekSSQ75Y6xdzCy6VulRmCjPo9-9_pTPkIjIkJWLYElR0W79EMqY0ZoLhNfGWLnciTlMolr9X73dkazNm2fZJD2Yp7gA3VrQCM8Nll4SP22OX-ucZXncXBm9ylr-QT_Jgoj-Eklb0vvNoZbZHWgWxMoHTajOfw2MVZr5qUqaXvvaW1oaFayJ2wxAkRrMVR3JIu0cE-l6VulRmCqPo9-9_pTKz8xJzxTMX0lR0W79EoqY0ZrLhNcJGHkZTUsZYdT_6T2NUy4b3VhOU7jWZ0q6keaSSEy_pJ5RgViPZKbbpjecz5_JPpj-gs37QEkAjFwbUjtInReXo-nYGUP72WsNfP-alpi9nXedXHgZKyfZoHkUaMi6keaSSE1_pJ5SwViL4WodaXXdYVm9ylr-gT_JgoqAjFme0r1NXJSZD5tXSsf6jflPfn9GY-hKb4de3Xsam1oaFazJ2wxAkRrMVZzMpSvcUC56VulRmGqPo9-7PFr6kY2EjdkN4RzblH65UxYKk5rL2Qn5T-sJjE1Zo2gOKUrcWvga7BPOoW7I2D5O0ZiRikjN5GufDq0MI-qa6fbZHq3JClTAzj-5gEtO0k0QxajN4NeXXumXVBbE2nTcjQyZYdT_6T2Nk64b3VeO1ajYKMtNXuleF5vIoG0fT-sMI6jLmrbPU939zNr-QT-1UBkN3xygEXwMWBRX3umXBMoHTalO_w2MVFl_m4sdXvqa7-WborgUpAtMz5seCk0-FqySQx1AUKsfp7fcoCtKy6QLjMzGzUUA3g9PxK8NksgJUZUZGNcIWvmbSAxVoOgMa4rJUfmNn5kOp-7IWT46oyjflxwO4iufSqzNoyhLmrbPU989zNrAQnmJz9bNoNzfkvl5UxYKk9rL2Qn6zaUeiA4WoiWNm33bEaxLHagOVW7EqMbjLIySclpmO0F6eAV0-FuvRmesJX2nMCmnMUQ91QtbAkM1R1-79EMpEo-mVWVMG2HgaTMkZ0JsLXXwNkfwNnxgOU70ZJIyJ3Wfd2R0O5G4MQapAVRwR6KsNE1-3jOlKUQjIDVfKnR1Lhfq_UUkK49sJSEn1n_mZTUiapSgNqDePnW3MHFoclayIGrgO4CSh051NYCjd_17MFpwQ2rlPU109eKkPDE4EjdhN3N2Lhfq_UUnK49sJSUn1n_mZTUiZIGjL6EwbHrkHnaWOVC6K6P4-UBrMWJ1JJOecDG0LJKvbZvXJUeBOMBx');
/*!40000 ALTER TABLE `pmall_gadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods`
--

DROP TABLE IF EXISTS `pmall_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称（+规格名称）',
  `goods_jingle` varchar(150) DEFAULT '' COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_promotion_price` decimal(10,2) NOT NULL COMMENT '商品促销价格',
  `goods_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商品货号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL COMMENT '库存报警值',
  `goods_barcode` varchar(20) DEFAULT '' COMMENT '商品条形码',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售数量',
  `goods_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数量',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_image` varchar(100) NOT NULL DEFAULT '' COMMENT '商品主图',
  `goods_body` text NOT NULL COMMENT '商品描述',
  `mobile_body` text NOT NULL COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_edittime` int(10) unsigned NOT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否 默认0',
  `goods_stcids` varchar(255) DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int(10) unsigned NOT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned NOT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `is_fcode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为F码商品 1是，0否',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1是，0否',
  `presell_deliverdate` int(11) NOT NULL DEFAULT '0' COMMENT '预售商品发货时间',
  `is_book` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为预定商品，1是，0否',
  `book_down_payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '定金金额',
  `book_final_payment` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '尾款金额',
  `book_down_time` int(11) NOT NULL DEFAULT '0' COMMENT '预定结束时间',
  `book_buyers` mediumint(9) DEFAULT '0' COMMENT '预定人数',
  `have_gift` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否拥有赠品',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `contract_1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_4` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_5` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_6` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_7` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_8` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_9` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `contract_10` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消费者保障服务状态 0关闭 1开启',
  `is_chain` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为门店商品 1是，0否',
  `invite_rate` decimal(10,2) DEFAULT '0.00' COMMENT '分销佣金',
  `specifications` varchar(200) NOT NULL DEFAULT '' COMMENT '商品规格',
  `weight` char(20) NOT NULL DEFAULT '' COMMENT '商品重量',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100030 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods`
--

LOCK TABLES `pmall_goods` WRITE;
/*!40000 ALTER TABLE `pmall_goods` DISABLE KEYS */;
INSERT INTO `pmall_goods` VALUES (100000,100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品','',1,'800方o2o',587,530,540,587,0,'70000.00','70000.00',0,'70000.00','',0,'',12,2,0,'N;','N;',98,'1_04752627678636481.jpg','','',1,1,1421918768,1468482008,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100001,100001,'劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210','【雅欧国际】：所有商品全新原装正品　　',1,'800方o2o',587,530,540,587,0,'87500.00','87500.00',0,'87500.00','',0,'',1,0,0,'N;','N;',100,'1_04752627707766698.png','','',1,1,1421918773,1468482008,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100002,100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','',1,'800方o2o',587,530,540,587,0,'63.00','63.00',0,'63200.00','',0,'',24,3,0,'N;','N;',297,'1_04752627750479728.png','','',1,1,1421918775,1469512794,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100003,100003,'劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333','【雅欧国际】：所有商品全新原装正品　　',1,'800方o2o',587,530,540,587,0,'89200.00','89200.00',0,'89200.00','',0,'',1,0,0,'N;','N;',100,'1_04752627769865296.jpg','','',1,1,1421918778,1468482008,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100004,100004,'劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233','【雅欧国际】：所有商品全新原装正品　　',1,'800方o2o',587,530,540,587,0,'97800.00','97800.00',0,'97800.00','',0,'',2,0,0,'N;','N;',100,'1_04752627799921979.jpg','','',1,1,1421918781,1468482008,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100005,100005,'劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品','',1,'800方o2o',587,530,540,587,0,'65900.00','65900.00',0,'65900.00','',0,'',2,0,0,'N;','N;',100,'1_04752627843241680.jpg','','',1,1,1421918784,1469431466,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100006,100006,'劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201','',1,'800方o2o',587,530,540,587,0,'100500.00','100500.00',0,'100500.00','',0,'',6,0,0,'N;','N;',100,'1_04752627871532105.png','','',1,1,1421918788,1468582490,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100007,100007,'劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593','',1,'800方o2o',587,530,540,587,0,'146300.00','146300.00',0,'146300.00','',0,'',10,1,0,'N;','N;',99,'1_04752627900055146.png','','',1,1,1421918790,1468908814,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100008,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','广告词是啥？',1,'800方o2o',587,530,540,587,0,'209500.00','209500.00',0,'209500.00','',0,'',20,3,0,'N;','N;',97,'1_04752627931531971.jpg','','',1,1,1421918793,1468582064,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100009,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','【雅欧国际】：所有商品全新原装正品　　',1,'800方o2o',587,530,540,587,0,'52800.00','42800.00',1,'52800.00','',0,'',49,17,1,'N;','N;',83,'1_04752627958339099.jpg','','',1,1,1421918796,1468899470,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,1,1,1,1,0,0,0,0,0,0,0,'0.00','',''),(100010,100010,'测试商品1','测试商品1',2,'eshop2',12,1,4,12,274,'80.00','80.00',0,'90.00','',0,'',27,0,0,'N;','N;',999,'2_05210447164396115.jpg','','',10,1,1467700768,1468230084,19,289,0,0,'6.00',0,1,',1,',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100013,100012,'拖拉塞米片','拖拉塞米片',2,'eshop2',1060,1058,1059,1060,348,'480.00','480.00',0,'670.00','',0,'',18,9,0,'N;','N;',990,'2_05213079227148488.jpg','','',1,1,1467963958,1469668305,19,289,0,0,'0.00',0,1,',1,',5,0,1,1469980799,1,0,0,0,0,0,'0.00','0.00',0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100015,100014,'舒筋健骨丸','舒筋健骨丸',2,'eshop2',1060,1058,1059,1060,339,'70.00','70.00',0,'120.00','',0,'',11,2,0,'N;','N;',997,'2_05216575160789666.jpg','','',0,1,1468313536,1468474561,19,289,0,0,'8.00',0,1,',1,',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100016,100015,'祛斑面霜','祛斑',4,'咯咯小店',481,470,471,481,343,'10.00','10.00',0,'200.00','',0,'',2,0,0,'N;','N;',10,'4_05219124589505593.jpg','','',1,1,1468568569,1468806342,19,289,0,0,'2.00',1,1,',3,6,',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100017,100016,'啦啦啦啦','',1,'800方o2o',108,1,9,108,0,'10.00','10.00',0,'15.00','',0,'',3,0,0,'N;','N;',100,'1_04752627750479728.png','','',0,1,1468582418,1468915126,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100018,100011,'欧姆龙血压计','欧姆龙血压计',2,'eshop2',12,1,4,12,274,'100.00','100.00',0,'120.00','',200,'',35,6,0,'N;','N;',983,'2_05211324717488064.jpg','','',1,1,1468806324,1469677607,19,289,0,0,'10.00',0,1,',1,',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100019,100017,'女装测试','',2,'eshop2',12,1,4,12,0,'100.00','100.00',0,'100.00','',0,'',7,0,0,'N;','N;',10000,'2_05222444906791674.jpg','','',10,1,1468900498,1469530946,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100024,100018,'欧姆龙（OMRON）电子血压计 家用 HEM-7051（上臂式）','碉堡上臂式，不需要¥9,999，不需要¥999，只需要¥997',2,'eshop2',1071,1070,1071,0,0,'77.00','77.00',0,'9999.00','Blood-001',10,'12345678901',10,3,0,'N;','N;',26661,'2_05222598068424864.jpg','','',1,1,1468985688,1469676325,19,289,0,0,'6.00',0,1,',1,',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100025,100019,'test0725','test0725',1,'800方o2o',717,662,669,717,0,'10.00','10.00',0,'11.00','test0725',11,'test0725',0,0,0,'N;','N;',111,'1_04752627958339099.jpg','','',1,1,1469425381,1469425426,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100026,100020,'test0725-1','test0725-1',1,'800方o2o',157,2,151,157,0,'111.00','111.00',0,'111.00','test0725-1',11,'test0725-1',0,0,0,'N;','N;',111,'1_05227695267124957.jpg','','',1,1,1469425531,1469425531,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100027,100021,'test0725-2','test0725-2',1,'800方o2o',671,662,663,671,0,'12.00','12.00',0,'122.00','test0725-2',22,'test0725-2',2,0,0,'N;','N;',121,'1_05227696969486977.jpg','','',10,1,1469425705,1469431532,0,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100028,100022,'test0725-3','test0725-3',1,'800方o2o',157,2,151,157,0,'11.00','11.00',0,'111.00','test0725-3',2,'test0725-3',4,0,0,'N;','N;',22,'1_05227701535745608.jpg','','',1,1,1469426243,1469437292,19,289,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','',''),(100029,100023,'test0725-4','test0725-4',1,'800方o2o',718,662,669,718,0,'32.00','32.00',0,'234.00','test0725-4',23,'test0725-4',68,8,0,'N;','N;',415,'1_05227702508114739.jpg','','',1,1,1469426716,1469590459,19,0,0,0,'0.00',0,1,'',5,0,0,0,0,0,0,0,0,0,'0.00','0.00',0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,'0.00','','');
/*!40000 ALTER TABLE `pmall_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_attr_index`
--

DROP TABLE IF EXISTS `pmall_goods_attr_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_attr_index` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性id',
  `attr_value_id` int(10) unsigned NOT NULL COMMENT '属性值id',
  PRIMARY KEY (`goods_id`,`gc_id`,`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品与属性对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_attr_index`
--

LOCK TABLES `pmall_goods_attr_index` WRITE;
/*!40000 ALTER TABLE `pmall_goods_attr_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_goods_attr_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_browse`
--

DROP TABLE IF EXISTS `pmall_goods_browse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_browse` (
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `browsetime` int(11) NOT NULL COMMENT '浏览时间',
  `gc_id` int(11) NOT NULL COMMENT '商品分类',
  `gc_id_1` int(11) NOT NULL COMMENT '商品一级分类',
  `gc_id_2` int(11) NOT NULL COMMENT '商品二级分类',
  `gc_id_3` int(11) NOT NULL COMMENT '商品三级分类',
  PRIMARY KEY (`goods_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_browse`
--

LOCK TABLES `pmall_goods_browse` WRITE;
/*!40000 ALTER TABLE `pmall_goods_browse` DISABLE KEYS */;
INSERT INTO `pmall_goods_browse` VALUES (100000,7,1467800216,587,530,540,587),(100002,12,1468568735,587,530,540,587),(100004,2,1467801012,587,530,540,587),(100005,2,1467615316,587,530,540,587),(100006,8,1467858531,587,530,540,587),(100007,16,1468896743,587,530,540,587),(100008,8,1467858703,587,530,540,587),(100009,11,1468552681,587,530,540,587),(100010,2,1467792624,12,1,4,12),(100013,16,1469668307,1060,1058,1059,1060),(100015,2,1468474561,1060,1058,1059,1060),(100017,5,1468900546,108,1,9,108),(100018,7,1469677607,12,1,4,12),(100019,16,1468911903,12,1,4,12),(100024,7,1469676325,1071,1070,1071,0),(100029,14,1469590460,718,662,669,718);
/*!40000 ALTER TABLE `pmall_goods_browse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_class`
--

DROP TABLE IF EXISTS `pmall_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_class` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `gc_name` varchar(100) NOT NULL COMMENT '分类名称',
  `type_id` int(10) unsigned DEFAULT '0' COMMENT '类型id',
  `type_name` varchar(100) DEFAULT '' COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `commis_rate` float unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `gc_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布虚拟商品，1是，0否',
  `gc_title` varchar(200) DEFAULT '' COMMENT '名称',
  `gc_keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `gc_description` varchar(255) DEFAULT '' COMMENT '描述',
  `show_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '商品展示方式，1按颜色，2按SPU',
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_class`
--

LOCK TABLES `pmall_goods_class` WRITE;
/*!40000 ALTER TABLE `pmall_goods_class` DISABLE KEYS */;
INSERT INTO `pmall_goods_class` VALUES (1,'服饰鞋帽',0,'',0,0,255,0,'','','',1),(2,'礼品箱包',0,'',0,0,255,0,'','','',1),(3,'家居家',0,'',0,0,255,0,'','','',1),(4,'女装',0,'',1,0,255,0,'','','',1),(5,'男装',0,'',1,0,255,0,'','','',1),(6,'内衣',0,'',1,0,255,0,'','','',1),(7,'运动',0,'',1,0,255,0,'','','',1),(8,'女鞋',0,'',1,0,255,0,'','','',1),(9,'男鞋',0,'',1,0,255,0,'','','',1),(10,'配饰',0,'',1,0,255,0,'','','',1),(11,'童装',0,'',1,0,255,0,'','','',1),(12,'T恤',0,'',4,0,255,0,'','','',1),(13,'衬衫',0,'',4,0,255,0,'','','',1),(14,'针织衫',0,'',4,0,255,0,'','','',1),(15,'雪纺衫',0,'',4,0,255,0,'','','',1),(16,'卫衣',0,'',4,0,255,0,'','','',1),(17,'马甲',0,'',4,0,255,0,'','','',1),(18,'连衣裙',0,'',4,0,255,0,'','','',1),(19,'半身裙',0,'',4,0,255,0,'','','',1),(20,'牛仔裤',0,'',4,0,255,0,'','','',1),(21,'休闲裤',0,'',4,0,255,0,'','','',1),(22,'打底裤',0,'',4,0,255,0,'','','',1),(23,'正装裤',0,'',4,0,255,0,'','','',1),(24,'西服',0,'',4,0,255,0,'','','',1),(25,'短外套',0,'',4,0,255,0,'','','',1),(26,'风衣',0,'',4,0,255,0,'','','',1),(27,'大衣',0,'',4,0,255,0,'','','',1),(28,'皮衣皮草',0,'',4,0,255,0,'','','',1),(29,'棉服',0,'',4,0,255,0,'','','',1),(30,'羽绒服',0,'',4,0,255,0,'','','',1),(31,'孕妇装',0,'',4,0,255,0,'','','',1),(32,'大码装',0,'',4,0,255,0,'','','',1),(33,'中老年装',0,'',4,0,255,0,'','','',1),(34,'婚纱礼服',0,'',4,0,255,0,'','','',1),(35,'衬衫',0,'',5,0,255,0,'','','',1),(36,'T恤',0,'',5,0,255,0,'','','',1),(37,'POLO衫',0,'',5,0,255,0,'','','',1),(38,'针织衫',0,'',5,0,255,0,'','','',1),(39,'羊绒衫',0,'',5,0,255,0,'','','',1),(40,'卫衣',0,'',5,0,255,0,'','','',1),(41,'马甲／背心',0,'',5,0,255,0,'','','',1),(42,'夹克',0,'',5,0,255,0,'','','',1),(43,'风衣',0,'',5,0,255,0,'','','',1),(44,'大衣',0,'',5,0,255,0,'','','',1),(45,'皮衣',0,'',5,0,255,0,'','','',1),(46,'外套',0,'',5,0,255,0,'','','',1),(47,'西服',0,'',5,0,255,0,'','','',1),(48,'棉服',0,'',5,0,255,0,'','','',1),(49,'羽绒服',0,'',5,0,255,0,'','','',1),(50,'牛仔裤',0,'',5,0,255,0,'','','',1),(51,'休闲裤',0,'',5,0,255,0,'','','',1),(52,'西裤',0,'',5,0,255,0,'','','',1),(53,'西服套装',0,'',5,0,255,0,'','','',1),(54,'大码装',0,'',5,0,255,0,'','','',1),(55,'中老年装',0,'',5,0,255,0,'','','',1),(56,'唐装',0,'',5,0,255,0,'','','',1),(57,'工装',0,'',5,0,255,0,'','','',1),(58,'文胸',0,'',6,0,255,0,'','','',1),(59,'女式内裤',0,'',6,0,255,0,'','','',1),(60,'男式内裤',0,'',6,0,255,0,'','','',1),(61,'家居',0,'',6,0,255,0,'','','',1),(62,'睡衣',0,'',6,0,255,0,'','','',1),(63,'塑身衣',0,'',6,0,255,0,'','','',1),(64,'睡袍／浴袍',0,'',6,0,255,0,'','','',1),(65,'泳衣',0,'',6,0,255,0,'','','',1),(66,'背心',0,'',6,0,255,0,'','','',1),(67,'抹胸',0,'',6,0,255,0,'','','',1),(68,'连裤袜',0,'',6,0,255,0,'','','',1),(69,'美腿袜',0,'',6,0,255,0,'','','',1),(70,'男袜',0,'',6,0,255,0,'','','',1),(71,'女袜',0,'',6,0,255,0,'','','',1),(72,'情趣内衣',0,'',6,0,255,0,'','','',1),(73,'保暖内衣',0,'',6,0,255,0,'','','',1),(74,'休闲鞋',0,'',7,0,255,0,'','','',1),(75,'帆布鞋',0,'',7,0,255,0,'','','',1),(76,'跑步鞋',0,'',7,0,255,0,'','','',1),(77,'篮球鞋',0,'',7,0,255,0,'','','',1),(78,'足球鞋',0,'',7,0,255,0,'','','',1),(79,'训练鞋',0,'',7,0,255,0,'','','',1),(80,'乒羽鞋',0,'',7,0,255,0,'','','',1),(81,'拖鞋',0,'',7,0,255,0,'','','',1),(82,'卫衣',0,'',7,0,255,0,'','','',1),(83,'夹克',0,'',7,0,255,0,'','','',1),(84,'T恤',0,'',7,0,255,0,'','','',1),(85,'棉服／羽绒服',0,'',7,0,255,0,'','','',1),(86,'运动裤',0,'',7,0,255,0,'','','',1),(87,'套装',0,'',7,0,255,0,'','','',1),(88,'运动包',0,'',7,0,255,0,'','','',1),(89,'运动配件',0,'',7,0,255,0,'','','',1),(90,'平底鞋',0,'',8,0,255,0,'','','',1),(91,'高跟鞋',0,'',8,0,255,0,'','','',1),(92,'单鞋',0,'',8,0,255,0,'','','',1),(93,'休闲鞋',0,'',8,0,255,0,'','','',1),(94,'凉鞋',0,'',8,0,255,0,'','','',1),(95,'女靴',0,'',8,0,255,0,'','','',1),(96,'雪地靴',0,'',8,0,255,0,'','','',1),(97,'拖鞋',0,'',8,0,255,0,'','','',1),(98,'裸靴',0,'',8,0,255,0,'','','',1),(99,'筒靴',0,'',8,0,255,0,'','','',1),(100,'帆布鞋',0,'',8,0,255,0,'','','',1),(101,'雨鞋／雨靴',0,'',8,0,255,0,'','','',1),(102,'妈妈鞋',0,'',8,0,255,0,'','','',1),(103,'鞋配件',0,'',8,0,255,0,'','','',1),(104,'特色鞋',0,'',8,0,255,0,'','','',1),(105,'鱼嘴鞋',0,'',8,0,255,0,'','','',1),(106,'布鞋／绣花鞋',0,'',8,0,255,0,'','','',1),(107,'商务休闲鞋',0,'',9,0,255,0,'','','',1),(108,'正装鞋',0,'',9,0,255,0,'','','',1),(109,'休闲鞋',0,'',9,0,255,0,'','','',1),(110,'凉鞋／沙滩鞋',0,'',9,0,255,0,'','','',1),(111,'男靴',0,'',9,0,255,0,'','','',1),(112,'功能鞋',0,'',9,0,255,0,'','','',1),(113,'拖鞋',0,'',9,0,255,0,'','','',1),(114,'传统布鞋',0,'',9,0,255,0,'','','',1),(115,'鞋配件',0,'',9,0,255,0,'','','',1),(116,'帆布鞋',0,'',9,0,255,0,'','','',1),(117,'豆豆鞋',0,'',9,0,255,0,'','','',1),(118,'驾车鞋',0,'',9,0,255,0,'','','',1),(119,'太阳镜',0,'',10,0,255,0,'','','',1),(120,'框镜',0,'',10,0,255,0,'','','',1),(121,'皮带',0,'',10,0,255,0,'','','',1),(122,'围巾',0,'',10,0,255,0,'','','',1),(123,'手套',0,'',10,0,255,0,'','','',1),(124,'帽子',0,'',10,0,255,0,'','','',1),(125,'领带',0,'',10,0,255,0,'','','',1),(126,'袖扣',0,'',10,0,255,0,'','','',1),(127,'其他配件',0,'',10,0,255,0,'','','',1),(128,'丝巾',0,'',10,0,255,0,'','','',1),(129,'披肩',0,'',10,0,255,0,'','','',1),(130,'腰带',0,'',10,0,255,0,'','','',1),(131,'腰链／腰封',0,'',10,0,255,0,'','','',1),(132,'棒球帽',0,'',10,0,255,0,'','','',1),(133,'毛线',0,'',10,0,255,0,'','','',1),(134,'遮阳帽',0,'',10,0,255,0,'','','',1),(135,'防紫外线手套',0,'',10,0,255,0,'','','',1),(136,'草帽',0,'',10,0,255,0,'','','',1),(137,'套装',0,'',11,0,255,0,'','','',1),(138,'上衣',0,'',11,0,255,0,'','','',1),(139,'裤子',0,'',11,0,255,0,'','','',1),(140,'裙子',0,'',11,0,255,0,'','','',1),(141,'内衣／家居服',0,'',11,0,255,0,'','','',1),(142,'羽绒服／棉服',0,'',11,0,255,0,'','','',1),(143,'亲子装',0,'',11,0,255,0,'','','',1),(144,'儿童配饰',0,'',11,0,255,0,'','','',1),(145,'礼服／演出服',0,'',11,0,255,0,'','','',1),(146,'运动鞋',0,'',11,0,255,0,'','','',1),(147,'单鞋',0,'',11,0,255,0,'','','',1),(148,'靴子',0,'',11,0,255,0,'','','',1),(149,'凉鞋',0,'',11,0,255,0,'','','',1),(150,'功能鞋',0,'',11,0,255,0,'','','',1),(151,'潮流女包',0,'',2,0,255,0,'','','',1),(152,'时尚男包',0,'',2,0,255,0,'','','',1),(153,'功能箱包',0,'',2,0,255,0,'','','',1),(154,'礼品',0,'',2,0,255,0,'','','',1),(155,'奢侈品',0,'',2,0,255,0,'','','',1),(156,'钱包/卡包',0,'',151,0,255,0,'','','',1),(157,'手拿包',0,'',151,0,255,0,'','','',1),(158,'单肩包',0,'',151,0,255,0,'','','',1),(159,'双肩包',0,'',151,0,255,0,'','','',1),(160,'手提包',0,'',151,0,255,0,'','','',1),(161,'斜挎包',0,'',151,0,255,0,'','','',1),(162,'钱包/卡包',0,'',152,0,255,0,'','','',1),(163,'男士手包',0,'',152,0,255,0,'','','',1),(164,'腰带／礼盒',0,'',152,0,255,0,'','','',1),(165,'商务公文包',0,'',152,0,255,0,'','','',1),(166,'电脑数码包',0,'',153,0,255,0,'','','',1),(167,'拉杆箱',0,'',153,0,255,0,'','','',1),(168,'旅行包',0,'',153,0,255,0,'','','',1),(169,'旅行配件',0,'',153,0,255,0,'','','',1),(170,'休闲运动包',0,'',153,0,255,0,'','','',1),(171,'登山包',0,'',153,0,255,0,'','','',1),(172,'妈咪包',0,'',153,0,255,0,'','','',1),(173,'书包',0,'',153,0,255,0,'','','',1),(174,'火机烟具',0,'',154,0,255,0,'','','',1),(175,'礼品文具',0,'',154,0,255,0,'','','',1),(176,'瑞士军刀',0,'',154,0,255,0,'','','',1),(177,'收藏品',0,'',154,0,255,0,'','','',1),(178,'工艺礼品',0,'',154,0,255,0,'','','',1),(179,'创意礼品',0,'',154,0,255,0,'','','',1),(180,'礼卡礼卷',0,'',154,0,255,0,'','','',1),(181,'鲜花速递',0,'',154,0,255,0,'','','',1),(182,'婚庆用品',0,'',154,0,255,0,'','','',1),(184,'奢侈品箱包',0,'',155,0,255,0,'','','',1),(185,'钱包',0,'',155,0,255,0,'','','',1),(186,'服饰',0,'',155,0,255,0,'','','',1),(187,'腰带',0,'',155,0,255,0,'','','',1),(188,'太阳镜眼镜',0,'',155,0,255,0,'','','',1),(189,'配件',0,'',155,0,255,0,'','','',1),(190,'GUCCI',0,'',155,0,255,0,'','','',1),(191,'PRADA',0,'',155,0,255,0,'','','',1),(192,'FENDI',0,'',155,0,255,0,'','','',1),(193,'BURBERRY',0,'',155,0,255,0,'','','',1),(194,'MONTBLANC',0,'',155,0,255,0,'','','',1),(195,'ARMANI',0,'',155,0,255,0,'','','',1),(196,'RIMOWA',0,'',155,0,255,0,'','','',1),(197,'RAY-BAN',0,'',155,0,255,0,'','','',1),(198,'COACH',0,'',155,0,255,0,'','','',1),(199,'更多品牌',0,'',155,0,255,0,'','','',1),(200,'家纺',0,'',3,0,255,0,'','','',1),(201,'灯具',0,'',3,0,255,0,'','','',1),(202,'生活日用',0,'',3,0,255,0,'','','',1),(203,'家装软饰',0,'',3,0,255,0,'','','',1),(204,'清洁日用',0,'',3,0,255,0,'','','',1),(205,'宠物生活',0,'',3,0,255,0,'','','',1),(206,'床品件套',0,'',200,0,255,0,'','','',1),(207,'被子',0,'',200,0,255,0,'','','',1),(208,'枕芯枕套',0,'',200,0,255,0,'','','',1),(209,'床单被罩',0,'',200,0,255,0,'','','',1),(210,'毛巾被/毯',0,'',200,0,255,0,'','','',1),(211,'床垫/床褥',0,'',200,0,255,0,'','','',1),(212,'蚊帐/凉席',0,'',200,0,255,0,'','','',1),(213,'抱枕坐垫',0,'',200,0,255,0,'','','',1),(214,'毛巾家纺',0,'',200,0,255,0,'','','',1),(215,'电热毯',0,'',200,0,255,0,'','','',1),(216,'窗帘/窗纱',0,'',200,0,255,0,'','','',1),(217,'酒店用品',0,'',200,0,255,0,'','','',1),(218,'台灯',0,'',201,0,255,0,'','','',1),(219,'节能灯',0,'',201,0,255,0,'','','',1),(220,'装饰灯',0,'',201,0,255,0,'','','',1),(221,'落地灯',0,'',201,0,255,0,'','','',1),(222,'应急灯/手电',0,'',201,0,255,0,'','','',1),(223,'LED灯',0,'',201,0,255,0,'','','',1),(224,'吸顶灯',0,'',201,0,255,0,'','','',1),(225,'五金电器',0,'',201,0,255,0,'','','',1),(226,'吊灯',0,'',201,0,255,0,'','','',1),(227,'氛围照明',0,'',201,0,255,0,'','','',1),(228,'收纳用品',0,'',202,0,255,0,'','','',1),(229,'雨伞雨具',0,'',202,0,255,0,'','','',1),(230,'浴室用品',0,'',202,0,255,0,'','','',1),(231,'缝纫用品',0,'',202,0,255,0,'','','',1),(232,'洗晒用品',0,'',202,0,255,0,'','','',1),(233,'净化除味',0,'',202,0,255,0,'','','',1),(234,'桌布/罩件',0,'',203,0,255,0,'','','',1),(235,'地毯地垫',0,'',203,0,255,0,'','','',1),(236,'沙发垫套',0,'',203,0,255,0,'','','',1),(237,'相框/相片墙',0,'',203,0,255,0,'','','',1),(238,'墙画墙贴',0,'',203,0,255,0,'','','',1),(239,'节庆饰品',0,'',203,0,255,0,'','','',1),(240,'手工/十字绣',0,'',203,0,255,0,'','','',1),(241,'工艺摆件',0,'',203,0,255,0,'','','',1),(242,'其他',0,'',203,0,255,0,'','','',1),(243,'纸品湿巾',0,'',204,0,255,0,'','','',1),(244,'衣物清洁',0,'',204,0,255,0,'','','',1),(245,'清洁工具',0,'',204,0,255,0,'','','',1),(246,'驱虫用品',0,'',204,0,255,0,'','','',1),(247,'居室清洁',0,'',204,0,255,0,'','','',1),(248,'皮具护理',0,'',204,0,255,0,'','','',1),(249,'宠物主粮',0,'',205,0,255,0,'','','',1),(250,'宠物零食',0,'',205,0,255,0,'','','',1),(251,'营养品',0,'',205,0,255,0,'','','',1),(252,'家居日用',0,'',205,0,255,0,'','','',1),(253,'玩具服饰',0,'',205,0,255,0,'','','',1),(254,'出行装备',0,'',205,0,255,0,'','','',1),(255,'医护美容',0,'',205,0,255,0,'','','',1),(256,'数码办公',0,'',0,0,255,0,'','','',1),(258,'手机配件',0,'',256,0,255,0,'','','',1),(259,'摄影摄像',0,'',256,0,255,0,'','','',1),(260,'数码配件',0,'',256,0,255,0,'','','',1),(261,'时尚影音',0,'',256,0,255,0,'','','',1),(262,'手机',0,'',257,0,255,0,'','','',1),(263,'对讲机',0,'',257,0,255,0,'','','',1),(264,'手机电池',0,'',258,0,255,0,'','','',1),(265,'蓝牙耳机',0,'',258,0,255,0,'','','',1),(266,'充电器/数据线',0,'',258,0,255,0,'','','',1),(267,'手机耳机',0,'',258,0,255,0,'','','',1),(268,'手机贴膜',0,'',258,0,255,0,'','','',1),(269,'手机存储卡',0,'',258,0,255,0,'','','',1),(270,'手机保护套',0,'',258,0,255,0,'','','',1),(271,'车载配件',0,'',258,0,255,0,'','','',1),(272,'iPhone 配件',0,'',258,0,255,0,'','','',1),(273,'创意配件',0,'',258,0,255,0,'','','',1),(274,'便携/无线音响',0,'',258,0,255,0,'','','',1),(275,'手机饰品',0,'',258,0,255,0,'','','',1),(276,'数码相机',0,'',259,0,255,0,'','','',1),(277,'单电/微单相机',0,'',259,0,255,0,'','','',1),(278,'单反相机',0,'',259,0,255,0,'','','',1),(279,'摄像机',0,'',259,0,255,0,'','','',1),(280,'拍立得',0,'',259,0,255,0,'','','',1),(281,'镜头',0,'',259,0,255,0,'','','',1),(282,'存储卡',0,'',260,0,255,0,'','','',1),(283,'读卡器',0,'',260,0,255,0,'','','',1),(284,'滤镜',0,'',260,0,255,0,'','','',1),(285,'闪光灯/手柄',0,'',260,0,255,0,'','','',1),(286,'相机包',0,'',260,0,255,0,'','','',1),(287,'三脚架/云台',0,'',260,0,255,0,'','','',1),(288,'相机清洁',0,'',260,0,255,0,'','','',1),(289,'相机贴膜',0,'',260,0,255,0,'','','',1),(290,'机身附件',0,'',260,0,255,0,'','','',1),(291,'镜头附件',0,'',260,0,255,0,'','','',1),(292,'电池/充电器',0,'',260,0,255,0,'','','',1),(293,'移动电源',0,'',260,0,255,0,'','','',1),(294,'MP3/MP4',0,'',261,0,255,0,'','','',1),(295,'智能设备',0,'',261,0,255,0,'','','',1),(296,'耳机/耳麦',0,'',261,0,255,0,'','','',1),(297,'音箱',0,'',261,0,255,0,'','','',1),(298,'高清播放器',0,'',261,0,255,0,'','','',1),(299,'电子书',0,'',261,0,255,0,'','','',1),(300,'电子词典',0,'',261,0,255,0,'','','',1),(301,'MP3/MP4配件',0,'',261,0,255,0,'','','',1),(302,'录音笔',0,'',261,0,255,0,'','','',1),(303,'麦克风',0,'',261,0,255,0,'','','',1),(304,'专业音频',0,'',261,0,255,0,'','','',1),(305,'电子教育',0,'',261,0,255,0,'','','',1),(306,'数码相框',0,'',261,0,255,0,'','','',1),(307,'苹果配件',0,'',261,0,255,0,'','','',1),(308,'家用电器',0,'',0,0,255,0,'','','',1),(309,'大家电',0,'',308,0,255,0,'','','',1),(310,'生活电器',0,'',308,0,255,0,'','','',1),(311,'厨房电器',0,'',308,0,255,0,'','','',1),(312,'个护健康',0,'',308,0,255,0,'','','',1),(313,'五金家装',0,'',308,0,255,0,'','','',1),(314,'平板电视',0,'',309,0,255,0,'','','',1),(315,'空调',0,'',309,0,255,0,'','','',1),(316,'冰箱',0,'',309,0,255,0,'','','',1),(317,'洗衣机',0,'',309,0,255,0,'','','',1),(318,'家庭影院',0,'',309,0,255,0,'','','',1),(319,'DVD播放机',0,'',309,0,255,0,'','','',1),(320,'迷你音响',0,'',309,0,255,0,'','','',1),(321,'烟机/灶具',0,'',309,0,255,0,'','','',1),(322,'热水器',0,'',309,0,255,0,'','','',1),(323,'消毒柜/洗碗机',0,'',309,0,255,0,'','','',1),(324,'酒柜/冰吧/冷柜',0,'',309,0,255,0,'','','',1),(325,'家电配件',0,'',309,0,255,0,'','','',1),(326,'净化器',0,'',310,0,255,0,'','','',1),(327,'电风扇',0,'',310,0,255,0,'','','',1),(328,'吸尘器',0,'',310,0,255,0,'','','',1),(329,'加湿器',0,'',310,0,255,0,'','','',1),(330,'净水设备',0,'',310,0,255,0,'','','',1),(331,'饮水机',0,'',310,0,255,0,'','','',1),(332,'冷风扇',0,'',310,0,255,0,'','','',1),(333,'挂烫机/熨斗',0,'',310,0,255,0,'','','',1),(334,'电话机',0,'',310,0,255,0,'','','',1),(335,'插座',0,'',310,0,255,0,'','','',1),(336,'收录/音机',0,'',310,0,255,0,'','','',1),(337,'除湿/干衣机',0,'',310,0,255,0,'','','',1),(338,'清洁机',0,'',310,0,255,0,'','','',1),(339,'取暖电器',0,'',310,0,255,0,'','','',1),(340,'其它生活电器',0,'',310,0,255,0,'','','',1),(341,'料理/榨汁机',0,'',311,0,255,0,'','','',1),(342,'豆浆机',0,'',311,0,255,0,'','','',1),(343,'电饭煲',0,'',311,0,255,0,'','','',1),(344,'电压力锅',0,'',311,0,255,0,'','','',1),(345,'面包机',0,'',311,0,255,0,'','','',1),(346,'咖啡机',0,'',311,0,255,0,'','','',1),(347,'微波炉',0,'',311,0,255,0,'','','',1),(348,'电烤箱',0,'',311,0,255,0,'','','',1),(349,'电磁炉',0,'',311,0,255,0,'','','',1),(350,'电饼铛/烧烤盘',0,'',311,0,255,0,'','','',1),(351,'煮蛋器',0,'',311,0,255,0,'','','',1),(352,'酸奶机',0,'',311,0,255,0,'','','',1),(353,'电炖锅',0,'',311,0,255,0,'','','',1),(354,'电水壶/热水瓶',0,'',311,0,255,0,'','','',1),(355,'多用途锅',0,'',311,0,255,0,'','','',1),(356,'果蔬解毒机',0,'',311,0,255,0,'','','',1),(357,'其它厨房电器',0,'',311,0,255,0,'','','',1),(358,'剃须刀',0,'',312,0,255,0,'','','',1),(359,'剃/脱毛器',0,'',312,0,255,0,'','','',1),(360,'口腔护理',0,'',312,0,255,0,'','','',1),(361,'电吹风',0,'',312,0,255,0,'','','',1),(362,'美容器',0,'',312,0,255,0,'','','',1),(363,'美发器',0,'',312,0,255,0,'','','',1),(364,'按摩椅',0,'',312,0,255,0,'','','',1),(365,'按摩器',0,'',312,0,255,0,'','','',1),(366,'足浴盆',0,'',312,0,255,0,'','','',1),(367,'血压计',0,'',312,0,255,0,'','','',1),(368,'健康秤/厨房秤',0,'',312,0,255,0,'','','',1),(369,'血糖仪',0,'',312,0,255,0,'','','',1),(370,'体温计',0,'',312,0,255,0,'','','',1),(371,'计步器/脂肪检测仪',0,'',312,0,255,0,'','','',1),(372,'其它健康电器',0,'',312,0,255,0,'','','',1),(373,'电动工具',0,'',313,0,255,0,'','','',1),(374,'手动工具',0,'',313,0,255,0,'','','',1),(375,'仪器仪表',0,'',313,0,255,0,'','','',1),(376,'浴霸/排气扇',0,'',313,0,255,0,'','','',1),(377,'灯具',0,'',313,0,255,0,'','','',1),(378,'LED灯',0,'',313,0,255,0,'','','',1),(379,'洁身器',0,'',313,0,255,0,'','','',1),(380,'水槽',0,'',313,0,255,0,'','','',1),(381,'龙头',0,'',313,0,255,0,'','','',1),(382,'淋浴花洒',0,'',313,0,255,0,'','','',1),(383,'厨卫五金',0,'',313,0,255,0,'','','',1),(384,'家具五金',0,'',313,0,255,0,'','','',1),(385,'门铃',0,'',313,0,255,0,'','','',1),(386,'电气开关',0,'',313,0,255,0,'','','',1),(387,'插座',0,'',313,0,255,0,'','','',1),(388,'电工电料',0,'',313,0,255,0,'','','',1),(389,'监控安防',0,'',313,0,255,0,'','','',1),(390,'电脑整机',0,'',256,0,255,0,'','','',1),(391,'电脑配件',0,'',256,0,255,0,'','','',1),(392,'外设产品',0,'',256,0,255,0,'','','',1),(393,'网络产品',0,'',256,0,255,0,'','','',1),(394,'办公打印',0,'',256,0,255,0,'','','',1),(395,'办公文仪',0,'',256,0,255,0,'','','',1),(398,'笔记本',0,'',390,0,255,0,'','','',1),(399,'超极本',0,'',390,0,255,0,'','','',1),(400,'游戏本',0,'',390,0,255,0,'','','',1),(401,'平板电脑',0,'',390,0,255,0,'','','',1),(402,'平板电脑配件',0,'',390,0,255,0,'','','',1),(403,'台式机',0,'',390,0,255,0,'','','',1),(404,'服务器',0,'',390,0,255,0,'','','',1),(405,'笔记本配件',0,'',390,0,255,0,'','','',1),(406,'CPU',0,'',391,0,255,0,'','','',1),(407,'主板',0,'',391,0,255,0,'','','',1),(408,'显卡',0,'',391,0,255,0,'','','',1),(409,'硬盘',0,'',391,0,255,0,'','','',1),(410,'SSD固态硬盘',0,'',391,0,255,0,'','','',1),(411,'内存',0,'',391,0,255,0,'','','',1),(412,'机箱',0,'',391,0,255,0,'','','',1),(413,'电源',0,'',391,0,255,0,'','','',1),(414,'显示器',0,'',391,0,255,0,'','','',1),(415,'刻录机/光驱',0,'',391,0,255,0,'','','',1),(416,'散热器',0,'',391,0,255,0,'','','',1),(417,'声卡/扩展卡',0,'',391,0,255,0,'','','',1),(418,'装机配件',0,'',391,0,255,0,'','','',1),(419,'鼠标',0,'',392,0,255,0,'','','',1),(420,'键盘',0,'',392,0,255,0,'','','',1),(421,'移动硬盘',0,'',392,0,255,0,'','','',1),(422,'U盘',0,'',392,0,255,0,'','','',1),(423,'摄像头',0,'',392,0,255,0,'','','',1),(424,'外置盒',0,'',392,0,255,0,'','','',1),(425,'游戏设备',0,'',392,0,255,0,'','','',1),(426,'电视盒',0,'',392,0,255,0,'','','',1),(427,'手写板',0,'',392,0,255,0,'','','',1),(428,'鼠标垫',0,'',392,0,255,0,'','','',1),(429,'插座',0,'',392,0,255,0,'','','',1),(430,'UPS电源',0,'',392,0,255,0,'','','',1),(431,'线缆',0,'',392,0,255,0,'','','',1),(432,'电脑工具',0,'',392,0,255,0,'','','',1),(433,'电脑清洁',0,'',392,0,255,0,'','','',1),(434,'路由器',0,'',393,0,255,0,'','','',1),(435,'网卡',0,'',393,0,255,0,'','','',1),(436,'交换机',0,'',393,0,255,0,'','','',1),(437,'网络存储',0,'',393,0,255,0,'','','',1),(438,'3G上网',0,'',393,0,255,0,'','','',1),(439,'网络盒子',0,'',393,0,255,0,'','','',1),(440,'打印机',0,'',394,0,255,0,'','','',1),(441,'一体机',0,'',394,0,255,0,'','','',1),(442,'投影机',0,'',394,0,255,0,'','','',1),(443,'投影配件',0,'',394,0,255,0,'','','',1),(444,'传真机',0,'',394,0,255,0,'','','',1),(445,'复合机',0,'',394,0,255,0,'','','',1),(446,'碎纸机',0,'',394,0,255,0,'','','',1),(447,'扫描仪',0,'',394,0,255,0,'','','',1),(448,'墨盒',0,'',394,0,255,0,'','','',1),(449,'硒鼓',0,'',394,0,255,0,'','','',1),(450,'墨粉',0,'',394,0,255,0,'','','',1),(451,'色带',0,'',394,0,255,0,'','','',1),(452,'办公文具',0,'',395,0,255,0,'','','',1),(453,'文件管理',0,'',395,0,255,0,'','','',1),(454,'笔类',0,'',395,0,255,0,'','','',1),(455,'纸类',0,'',395,0,255,0,'','','',1),(456,'本册/便签',0,'',395,0,255,0,'','','',1),(457,'学生文具',0,'',395,0,255,0,'','','',1),(458,'财务用品',0,'',395,0,255,0,'','','',1),(459,'计算器',0,'',395,0,255,0,'','','',1),(460,'激光笔',0,'',395,0,255,0,'','','',1),(461,'白板/封装',0,'',395,0,255,0,'','','',1),(462,'考勤机',0,'',395,0,255,0,'','','',1),(463,'刻录碟片/附件',0,'',395,0,255,0,'','','',1),(464,'点钞机',0,'',395,0,255,0,'','','',1),(465,'支付设备/POS机',0,'',395,0,255,0,'','','',1),(466,'安防监控',0,'',395,0,255,0,'','','',1),(467,'呼叫/会议设备',0,'',395,0,255,0,'','','',1),(468,'保险柜',0,'',395,0,255,0,'','','',1),(469,'办公家具',0,'',395,0,255,0,'','','',1),(470,'个护化妆',0,'',0,0,255,0,'','','',1),(471,'面部护理',0,'',470,0,255,0,'','','',1),(472,'身体护理',0,'',470,0,255,0,'','','',1),(473,'口腔护理',0,'',470,0,255,0,'','','',1),(474,'女性护理',0,'',470,0,255,0,'','','',1),(475,'男士护理',0,'',470,0,255,0,'','','',1),(476,'魅力彩妆',0,'',470,0,255,0,'','','',1),(477,'香水SPA',0,'',470,0,255,0,'','','',1),(478,'洁面乳',0,'',471,0,255,0,'','','',1),(479,'爽肤水',0,'',471,0,255,0,'','','',1),(480,'精华露',0,'',471,0,255,0,'','','',1),(481,'乳液面霜',0,'',471,0,255,0,'','','',1),(482,'面膜面贴',0,'',471,0,255,0,'','','',1),(483,'眼部护理',0,'',471,0,255,0,'','','',1),(484,'颈部护理',0,'',471,0,255,0,'','','',1),(485,'T区护理',0,'',471,0,255,0,'','','',1),(486,'护肤套装',0,'',471,0,255,0,'','','',1),(487,'防晒隔离',0,'',471,0,255,0,'','','',1),(488,'洗发护发',0,'',472,0,255,0,'','','',1),(489,'染发/造型',0,'',472,0,255,0,'','','',1),(490,'沐浴',0,'',472,0,255,0,'','','',1),(491,'磨砂/浴盐',0,'',472,0,255,0,'','','',1),(492,'身体乳',0,'',472,0,255,0,'','','',1),(493,'手工/香皂',0,'',472,0,255,0,'','','',1),(494,'香薰精油',0,'',472,0,255,0,'','','',1),(495,'纤体瘦身',0,'',472,0,255,0,'','','',1),(496,'脱毛膏',0,'',472,0,255,0,'','','',1),(497,'手足护理',0,'',472,0,255,0,'','','',1),(498,'洗护套装',0,'',472,0,255,0,'','','',1),(499,'牙膏/牙粉',0,'',473,0,255,0,'','','',1),(500,'牙刷/牙线',0,'',473,0,255,0,'','','',1),(501,'漱口水',0,'',473,0,255,0,'','','',1),(502,'卫生巾',0,'',474,0,255,0,'','','',1),(503,'卫生护垫',0,'',474,0,255,0,'','','',1),(504,'洗液',0,'',474,0,255,0,'','','',1),(505,'美容食品',0,'',474,0,255,0,'','','',1),(506,'其他',0,'',474,0,255,0,'','','',1),(507,'脸部护理',0,'',475,0,255,0,'','','',1),(508,'眼部护理',0,'',475,0,255,0,'','','',1),(509,'身体护理',0,'',475,0,255,0,'','','',1),(510,'男士香水',0,'',475,0,255,0,'','','',1),(511,'剃须护理',0,'',475,0,255,0,'','','',1),(512,'防脱洗护',0,'',475,0,255,0,'','','',1),(513,'男士唇膏',0,'',475,0,255,0,'','','',1),(514,'粉底/遮瑕',0,'',476,0,255,0,'','','',1),(515,'腮红',0,'',476,0,255,0,'','','',1),(516,'眼影/眼线',0,'',476,0,255,0,'','','',1),(517,'眉笔',0,'',476,0,255,0,'','','',1),(518,'睫毛膏',0,'',476,0,255,0,'','','',1),(519,'唇膏唇彩',0,'',476,0,255,0,'','','',1),(520,'彩妆组合',0,'',476,0,255,0,'','','',1),(521,'卸妆',0,'',476,0,255,0,'','','',1),(522,'美甲',0,'',476,0,255,0,'','','',1),(523,'彩妆工具',0,'',476,0,255,0,'','','',1),(524,'假发',0,'',476,0,255,0,'','','',1),(525,'女士香水',0,'',477,0,255,0,'','','',1),(526,'男士香水',0,'',477,0,255,0,'','','',1),(527,'组合套装',0,'',477,0,255,0,'','','',1),(528,'迷你香水',0,'',477,0,255,0,'','','',1),(529,'香体走珠',0,'',477,0,255,0,'','','',1),(530,'珠宝手表',0,'',0,0,255,0,'','','',1),(531,'时尚饰品',0,'',530,0,255,0,'','','',1),(532,'纯金K金饰品',0,'',530,0,255,0,'','','',1),(533,'金银投资',0,'',530,0,255,0,'','','',1),(534,'银饰',0,'',530,0,255,0,'','','',1),(535,'钻石饰品',0,'',530,0,255,0,'','','',1),(536,'翡翠玉石',0,'',530,0,255,0,'','','',1),(537,'水晶玛瑙',0,'',530,0,255,0,'','','',1),(538,'宝石珍珠',0,'',530,0,255,0,'','','',1),(539,'婚庆',0,'',530,0,255,0,'','','',1),(540,'钟表手表',0,'',530,0,255,0,'','','',1),(541,'项链',0,'',531,0,255,0,'','','',1),(542,'手链/脚链',0,'',531,0,255,0,'','','',1),(543,'戒指',0,'',531,0,255,0,'','','',1),(544,'耳饰',0,'',531,0,255,0,'','','',1),(545,'头饰',0,'',531,0,255,0,'','','',1),(546,'胸针',0,'',531,0,255,0,'','','',1),(547,'婚庆饰品',0,'',531,0,255,0,'','','',1),(548,'饰品配件',0,'',531,0,255,0,'','','',1),(549,'吊坠/项链',0,'',532,0,255,0,'','','',1),(550,'手镯/手链/脚链',0,'',532,0,255,0,'','','',1),(551,'戒指',0,'',532,0,255,0,'','','',1),(552,'耳饰',0,'',532,0,255,0,'','','',1),(553,'工艺金',0,'',533,0,255,0,'','','',1),(554,'工艺银',0,'',533,0,255,0,'','','',1),(555,'吊坠/项链',0,'',534,0,255,0,'','','',1),(556,'手镯/手链/脚链',0,'',534,0,255,0,'','','',1),(557,'戒指/耳饰',0,'',534,0,255,0,'','','',1),(558,'宝宝金银',0,'',534,0,255,0,'','','',1),(559,'千足银',0,'',534,0,255,0,'','','',1),(560,'裸钻',0,'',535,0,255,0,'','','',1),(561,'戒指',0,'',535,0,255,0,'','','',1),(563,'项链/吊坠',0,'',535,0,255,0,'','','',1),(564,'耳饰',0,'',535,0,255,0,'','','',1),(565,'手镯/手链',0,'',535,0,255,0,'','','',1),(566,'项链/吊坠',0,'',536,0,255,0,'','','',1),(567,'手镯/手串',0,'',536,0,255,0,'','','',1),(568,'戒指',0,'',536,0,255,0,'','','',1),(569,'耳饰',0,'',536,0,255,0,'','','',1),(570,'挂件/摆件/把件',0,'',536,0,255,0,'','','',1),(571,'高值收藏',0,'',536,0,255,0,'','','',1),(572,'耳饰',0,'',537,0,255,0,'','','',1),(573,'手镯/手链/脚链',0,'',537,0,255,0,'','','',1),(574,'戒指',0,'',537,0,255,0,'','','',1),(575,'头饰/胸针',0,'',537,0,255,0,'','','',1),(576,'摆件/挂件',0,'',537,0,255,0,'','','',1),(577,'项链/吊坠',0,'',538,0,255,0,'','','',1),(578,'耳饰',0,'',538,0,255,0,'','','',1),(579,'手镯/手链',0,'',538,0,255,0,'','','',1),(580,'戒指',0,'',538,0,255,0,'','','',1),(581,'婚嫁首饰',0,'',539,0,255,0,'','','',1),(582,'婚纱摄影',0,'',539,0,255,0,'','','',1),(583,'婚纱礼服',0,'',539,0,255,0,'','','',1),(584,'婚庆服务',0,'',539,0,255,0,'','','',1),(585,'婚庆礼品/用品',0,'',539,0,255,0,'','','',1),(586,'婚宴',0,'',539,0,255,0,'','','',1),(587,'瑞士品牌',0,'',540,0,255,0,'','','',1),(588,'国产品牌',0,'',540,0,255,0,'','','',1),(589,'日本品牌',0,'',540,0,255,0,'','','',1),(590,'时尚品牌',0,'',540,0,255,0,'','','',1),(591,'闹钟挂钟',0,'',540,0,255,0,'','','',1),(592,'儿童手表',0,'',540,0,255,0,'','','',1),(593,'食品饮料',0,'',0,0,255,0,'','','',1),(594,'进口食品',0,'',593,0,255,0,'','','',1),(595,'地方特产',0,'',593,0,255,0,'','','',1),(596,'休闲食品',0,'',593,0,255,0,'','','',1),(597,'粮油调味',0,'',593,0,255,0,'','','',1),(598,'中外名酒',0,'',593,0,255,0,'','','',1),(599,'饮料冲调',0,'',593,0,255,0,'','','',1),(600,'营养健康',0,'',593,0,255,0,'','','',1),(601,'亚健康调理',0,'',593,0,255,0,'','','',1),(602,'健康礼品',0,'',593,0,255,0,'','','',1),(603,'生鲜食品',0,'',593,0,255,0,'','','',1),(604,'饼干蛋糕',0,'',594,0,255,0,'','','',1),(605,'糖果巧克力',0,'',594,0,255,0,'','','',1),(606,'休闲零食',0,'',594,0,255,0,'','','',1),(607,'冲调饮品',0,'',594,0,255,0,'','','',1),(608,'粮油调味',0,'',594,0,255,0,'','','',1),(609,'华北',0,'',595,0,255,0,'','','',1),(610,'西北',0,'',595,0,255,0,'','','',1),(611,'西南',0,'',595,0,255,0,'','','',1),(612,'东北',0,'',595,0,255,0,'','','',1),(613,'华南',0,'',595,0,255,0,'','','',1),(614,'华东',0,'',595,0,255,0,'','','',1),(615,'华中',0,'',595,0,255,0,'','','',1),(616,'休闲零食',0,'',596,0,255,0,'','','',1),(617,'坚果炒货',0,'',596,0,255,0,'','','',1),(618,'肉干肉松',0,'',596,0,255,0,'','','',1),(619,'蜜饯果脯',0,'',596,0,255,0,'','','',1),(620,'糖果/巧克力',0,'',596,0,255,0,'','','',1),(621,'饼干蛋糕',0,'',596,0,255,0,'','','',1),(622,'米面杂粮',0,'',597,0,255,0,'','','',1),(623,'食用油',0,'',597,0,255,0,'','','',1),(624,'调味品',0,'',597,0,255,0,'','','',1),(625,'南北干货',0,'',597,0,255,0,'','','',1),(626,'方便食品',0,'',597,0,255,0,'','','',1),(627,'有机食品',0,'',597,0,255,0,'','','',1),(628,'白酒',0,'',598,0,255,0,'','','',1),(629,'洋酒',0,'',598,0,255,0,'','','',1),(630,'葡萄酒',0,'',598,0,255,0,'','','',1),(631,'啤酒',0,'',598,0,255,0,'','','',1),(632,'黄酒',0,'',598,0,255,0,'','','',1),(633,'水',0,'',599,0,255,0,'','','',1),(634,'饮料',0,'',599,0,255,0,'','','',1),(635,'牛奶',0,'',599,0,255,0,'','','',1),(636,'茶叶',0,'',599,0,255,0,'','','',1),(637,'咖啡/奶茶',0,'',599,0,255,0,'','','',1),(638,'冲饮谷物',0,'',599,0,255,0,'','','',1),(639,'基础营养',0,'',600,0,255,0,'','','',1),(640,'美体养颜',0,'',600,0,255,0,'','','',1),(641,'滋补调养',0,'',600,0,255,0,'','','',1),(642,'骨骼健康',0,'',600,0,255,0,'','','',1),(643,'保健茶饮',0,'',600,0,255,0,'','','',1),(644,'成分保健',0,'',600,0,255,0,'','','',1),(645,'无糖食品',0,'',600,0,255,0,'','','',1),(646,'调节三高',0,'',601,0,255,0,'','','',1),(647,'心脑养护',0,'',601,0,255,0,'','','',1),(648,'改善睡眠',0,'',601,0,255,0,'','','',1),(649,'肝肾养护',0,'',601,0,255,0,'','','',1),(650,'免疫调节',0,'',601,0,255,0,'','','',1),(651,'更多调理',0,'',601,0,255,0,'','','',1),(652,'参茸礼品',0,'',602,0,255,0,'','','',1),(653,'更多礼品',0,'',602,0,255,0,'','','',1),(654,'水果',0,'',603,0,255,0,'','','',1),(655,'蔬菜',0,'',603,0,255,0,'','','',1),(656,'海鲜水产',0,'',603,0,255,0,'','','',1),(657,'禽蛋',0,'',603,0,255,0,'','','',1),(658,'鲜肉',0,'',603,0,255,0,'','','',1),(659,'加工类肉食',0,'',603,0,255,0,'','','',1),(660,'冻品',0,'',603,0,255,0,'','','',1),(661,'半成品',0,'',603,0,255,0,'','','',1),(662,'运动健康',0,'',0,0,255,0,'','','',1),(663,'户外鞋服',0,'',662,0,255,0,'','','',1),(664,'户外装备',0,'',662,0,255,0,'','','',1),(665,'运动器械',0,'',662,0,255,0,'','','',1),(666,'纤体瑜伽',0,'',662,0,255,0,'','','',1),(667,'体育娱乐',0,'',662,0,255,0,'','','',1),(668,'成人用品',0,'',662,0,255,0,'','','',1),(669,'保健器械',0,'',662,0,255,0,'','','',1),(670,'急救卫生',0,'',662,0,255,0,'','','',1),(671,'户外服装',0,'',663,0,255,0,'','','',1),(672,'户外鞋袜',0,'',663,0,255,0,'','','',1),(673,'户外配饰',0,'',663,0,255,0,'','','',1),(674,'帐篷',0,'',664,0,255,0,'','','',1),(675,'睡袋',0,'',664,0,255,0,'','','',1),(676,'登山攀岩',0,'',664,0,255,0,'','','',1),(677,'户外背包',0,'',664,0,255,0,'','','',1),(678,'户外照明',0,'',664,0,255,0,'','','',1),(679,'户外垫子',0,'',664,0,255,0,'','','',1),(680,'户外仪表',0,'',664,0,255,0,'','','',1),(681,'户外工具',0,'',664,0,255,0,'','','',1),(682,'望远镜',0,'',664,0,255,0,'','','',1),(683,'垂钓用品',0,'',664,0,255,0,'','','',1),(684,'旅游用品',0,'',664,0,255,0,'','','',1),(685,'便携桌椅床',0,'',664,0,255,0,'','','',1),(686,'烧烤用品',0,'',664,0,255,0,'','','',1),(687,'野餐炊具',0,'',664,0,255,0,'','','',1),(688,'军迷用品',0,'',664,0,255,0,'','','',1),(689,'游泳用具',0,'',664,0,255,0,'','','',1),(690,'泳衣',0,'',664,0,255,0,'','','',1),(691,'健身器械',0,'',665,0,255,0,'','','',1),(692,'运动器材',0,'',665,0,255,0,'','','',1),(693,'极限轮滑',0,'',665,0,255,0,'','','',1),(694,'骑行运动',0,'',665,0,255,0,'','','',1),(695,'运动护具',0,'',665,0,255,0,'','','',1),(696,'武术搏击',0,'',665,0,255,0,'','','',1),(697,'瑜伽垫',0,'',666,0,255,0,'','','',1),(698,'瑜伽服',0,'',666,0,255,0,'','','',1),(699,'瑜伽配件',0,'',666,0,255,0,'','','',1),(700,'瑜伽套装',0,'',666,0,255,0,'','','',1),(701,'舞蹈鞋服',0,'',666,0,255,0,'','','',1),(702,'羽毛球',0,'',667,0,255,0,'','','',1),(703,'乒乓球',0,'',667,0,255,0,'','','',1),(704,'篮球',0,'',667,0,255,0,'','','',1),(705,'足球',0,'',667,0,255,0,'','','',1),(706,'网球',0,'',667,0,255,0,'','','',1),(707,'排球',0,'',667,0,255,0,'','','',1),(708,'高尔夫球',0,'',667,0,255,0,'','','',1),(709,'棋牌麻将',0,'',667,0,255,0,'','','',1),(710,'其他',0,'',667,0,255,0,'','','',1),(711,'安全避孕',0,'',668,0,255,0,'','','',1),(712,'验孕测孕',0,'',668,0,255,0,'','','',1),(713,'人体润滑',0,'',668,0,255,0,'','','',1),(714,'情爱玩具',0,'',668,0,255,0,'','','',1),(715,'情趣内衣',0,'',668,0,255,0,'','','',1),(716,'组合套装',0,'',668,0,255,0,'','','',1),(717,'养生器械',0,'',669,0,255,0,'','','',1),(718,'保健用品',0,'',669,0,255,0,'','','',1),(719,'康复辅助',0,'',669,0,255,0,'','','',1),(720,'家庭护理',0,'',669,0,255,0,'','','',1),(721,'跌打损伤',0,'',670,0,255,0,'','','',1),(722,'烫伤止痒',0,'',670,0,255,0,'','','',1),(723,'防裂抗冻',0,'',670,0,255,0,'','','',1),(724,'口腔咽部',0,'',670,0,255,0,'','','',1),(725,'眼部保健',0,'',670,0,255,0,'','','',1),(726,'鼻炎健康',0,'',670,0,255,0,'','','',1),(727,'风湿骨痛',0,'',670,0,255,0,'','','',1),(728,'生殖泌尿',0,'',670,0,255,0,'','','',1),(729,'美体塑身',0,'',670,0,255,0,'','','',1),(730,'汽车用品',0,'',0,0,255,0,'','','',1),(731,'电子电器',0,'',730,0,255,0,'','','',1),(732,'系统养护',0,'',730,0,255,0,'','','',1),(733,'改装配件',0,'',730,0,255,0,'','','',1),(734,'汽车美容',0,'',730,0,255,0,'','','',1),(735,'座垫脚垫',0,'',730,0,255,0,'','','',1),(736,'内饰精品',0,'',730,0,255,0,'','','',1),(737,'安全自驾',0,'',730,0,255,0,'','','',1),(738,'便携GPS导航',0,'',731,0,255,0,'','','',1),(739,'嵌入式导航',0,'',731,0,255,0,'','','',1),(740,'安全预警仪',0,'',731,0,255,0,'','','',1),(741,'行车记录仪',0,'',731,0,255,0,'','','',1),(742,'跟踪防盗器',0,'',731,0,255,0,'','','',1),(743,'倒车雷达',0,'',731,0,255,0,'','','',1),(744,'车载电源',0,'',731,0,255,0,'','','',1),(745,'车载蓝牙',0,'',731,0,255,0,'','','',1),(746,'车载影音',0,'',731,0,255,0,'','','',1),(747,'车载净化器',0,'',731,0,255,0,'','','',1),(748,'车载冰箱',0,'',731,0,255,0,'','','',1),(749,'车载吸尘器',0,'',731,0,255,0,'','','',1),(750,'充气泵',0,'',731,0,255,0,'','','',1),(751,'胎压监测',0,'',731,0,255,0,'','','',1),(752,'车载生活电器',0,'',731,0,255,0,'','','',1),(753,'机油',0,'',732,0,255,0,'','','',1),(754,'添加剂',0,'',732,0,255,0,'','','',1),(755,'防冻冷却液',0,'',732,0,255,0,'','','',1),(756,'附属油',0,'',732,0,255,0,'','','',1),(757,'底盘装甲',0,'',732,0,255,0,'','','',1),(758,'空调清洗剂',0,'',732,0,255,0,'','','',1),(759,'金属养护',0,'',732,0,255,0,'','','',1),(760,'雨刷',0,'',733,0,255,0,'','','',1),(761,'车灯',0,'',733,0,255,0,'','','',1),(762,'轮胎',0,'',733,0,255,0,'','','',1),(763,'贴膜',0,'',733,0,255,0,'','','',1),(764,'装饰贴',0,'',733,0,255,0,'','','',1),(765,'后视镜',0,'',733,0,255,0,'','','',1),(766,'机油滤',0,'',733,0,255,0,'','','',1),(767,'空气滤',0,'',733,0,255,0,'','','',1),(768,'空调滤',0,'',733,0,255,0,'','','',1),(769,'燃油滤',0,'',733,0,255,0,'','','',1),(770,'火花塞',0,'',733,0,255,0,'','','',1),(771,'喇叭',0,'',733,0,255,0,'','','',1),(772,'刹车片',0,'',733,0,255,0,'','','',1),(773,'刹车盘',0,'',733,0,255,0,'','','',1),(774,'减震器',0,'',733,0,255,0,'','','',1),(775,'车身装饰',0,'',733,0,255,0,'','','',1),(776,'尾喉/排气管',0,'',733,0,255,0,'','','',1),(777,'踏板',0,'',733,0,255,0,'','','',1),(778,'蓄电池',0,'',733,0,255,0,'','','',1),(779,'其他配件',0,'',733,0,255,0,'','','',1),(780,'漆面美容',0,'',734,0,255,0,'','','',1),(781,'漆面修复',0,'',734,0,255,0,'','','',1),(782,'内饰清洁',0,'',734,0,255,0,'','','',1),(783,'玻璃美容',0,'',734,0,255,0,'','','',1),(784,'补漆笔',0,'',734,0,255,0,'','','',1),(785,'轮胎轮毂清洗',0,'',734,0,255,0,'','','',1),(786,'洗车器',0,'',734,0,255,0,'','','',1),(787,'洗车水枪',0,'',734,0,255,0,'','','',1),(788,'洗车配件',0,'',734,0,255,0,'','','',1),(789,'洗车液',0,'',734,0,255,0,'','','',1),(790,'车掸',0,'',734,0,255,0,'','','',1),(791,'擦车巾/海绵',0,'',734,0,255,0,'','','',1),(792,'凉垫',0,'',735,0,255,0,'','','',1),(793,'四季垫',0,'',735,0,255,0,'','','',1),(794,'毛垫',0,'',735,0,255,0,'','','',1),(795,'专车专用座垫',0,'',735,0,255,0,'','','',1),(796,'专车专用座套',0,'',735,0,255,0,'','','',1),(797,'通用座套',0,'',735,0,255,0,'','','',1),(798,'多功能垫',0,'',735,0,255,0,'','','',1),(799,'专车专用脚垫',0,'',735,0,255,0,'','','',1),(800,'通用脚垫',0,'',735,0,255,0,'','','',1),(801,'后备箱垫',0,'',735,0,255,0,'','','',1),(802,'车用香水',0,'',736,0,255,0,'','','',1),(803,'车用炭包',0,'',736,0,255,0,'','','',1),(804,'空气净化',0,'',736,0,255,0,'','','',1),(805,'颈枕/头枕',0,'',736,0,255,0,'','','',1),(806,'抱枕/腰靠',0,'',736,0,255,0,'','','',1),(807,'方向盘套',0,'',736,0,255,0,'','','',1),(808,'挂件',0,'',736,0,255,0,'','','',1),(809,'摆件',0,'',736,0,255,0,'','','',1),(810,'布艺软饰',0,'',736,0,255,0,'','','',1),(811,'功能用品',0,'',736,0,255,0,'','','',1),(812,'整理收纳',0,'',736,0,255,0,'','','',1),(813,'CD夹',0,'',736,0,255,0,'','','',1),(814,'儿童安全座椅',0,'',737,0,255,0,'','','',1),(815,'应急救援',0,'',737,0,255,0,'','','',1),(816,'汽修工具',0,'',737,0,255,0,'','','',1),(817,'自驾野营',0,'',737,0,255,0,'','','',1),(818,'自驾照明',0,'',737,0,255,0,'','','',1),(819,'保温箱',0,'',737,0,255,0,'','','',1),(820,'置物箱',0,'',737,0,255,0,'','','',1),(821,'车衣',0,'',737,0,255,0,'','','',1),(822,'遮阳挡雪挡',0,'',737,0,255,0,'','','',1),(823,'车锁地锁',0,'',737,0,255,0,'','','',1),(824,'摩托车装备',0,'',737,0,255,0,'','','',1),(825,'玩具乐器',0,'',0,0,255,0,'','','',1),(826,'适用年龄',0,'',825,0,255,0,'','','',1),(827,'遥控/电动',0,'',825,0,255,0,'','','',1),(828,'毛绒布艺',0,'',825,0,255,0,'','','',1),(829,'娃娃玩具',0,'',825,0,255,0,'','','',1),(830,'模型玩具',0,'',825,0,255,0,'','','',1),(831,'健身玩具',0,'',825,0,255,0,'','','',1),(832,'动漫玩具',0,'',825,0,255,0,'','','',1),(833,'益智玩具',0,'',825,0,255,0,'','','',1),(834,'积木拼插',0,'',825,0,255,0,'','','',1),(835,'DIY玩具',0,'',825,0,255,0,'','','',1),(836,'创意减压',0,'',825,0,255,0,'','','',1),(837,'乐器相关',0,'',825,0,255,0,'','','',1),(838,'0-6个月',0,'',826,0,255,0,'','','',1),(839,'6-12个月',0,'',826,0,255,0,'','','',1),(840,'1-3岁',0,'',826,0,255,0,'','','',1),(841,'3-6岁',0,'',826,0,255,0,'','','',1),(842,'6-14岁',0,'',826,0,255,0,'','','',1),(843,'14岁以上',0,'',826,0,255,0,'','','',1),(844,'遥控车',0,'',827,0,255,0,'','','',1),(845,'遥控飞机',0,'',827,0,255,0,'','','',1),(846,'遥控船',0,'',827,0,255,0,'','','',1),(847,'机器人/电动',0,'',827,0,255,0,'','','',1),(848,'轨道/助力',0,'',827,0,255,0,'','','',1),(849,'毛绒/布艺',0,'',828,0,255,0,'','','',1),(850,'靠垫/抱枕',0,'',828,0,255,0,'','','',1),(851,'芭比娃娃',0,'',829,0,255,0,'','','',1),(852,'卡通娃娃',0,'',829,0,255,0,'','','',1),(853,'智能娃娃',0,'',829,0,255,0,'','','',1),(854,'仿真模型',0,'',830,0,255,0,'','','',1),(855,'拼插模型',0,'',830,0,255,0,'','','',1),(856,'收藏爱好',0,'',830,0,255,0,'','','',1),(857,'炫舞毯',0,'',831,0,255,0,'','','',1),(858,'爬行垫/毯',0,'',831,0,255,0,'','','',1),(859,'户外玩具',0,'',831,0,255,0,'','','',1),(860,'戏水玩具',0,'',831,0,255,0,'','','',1),(861,'电影周边',0,'',832,0,255,0,'','','',1),(862,'卡通周边',0,'',832,0,255,0,'','','',1),(863,'网游周边',0,'',832,0,255,0,'','','',1),(864,'摇铃/床铃',0,'',833,0,255,0,'','','',1),(865,'健身架',0,'',833,0,255,0,'','','',1),(866,'早教启智',0,'',833,0,255,0,'','','',1),(867,'拖拉玩具',0,'',833,0,255,0,'','','',1),(868,'积木',0,'',834,0,255,0,'','','',1),(869,'拼图',0,'',834,0,255,0,'','','',1),(870,'磁力棒',0,'',834,0,255,0,'','','',1),(871,'立体拼插',0,'',834,0,255,0,'','','',1),(872,'手工彩泥',0,'',835,0,255,0,'','','',1),(873,'绘画工具',0,'',835,0,255,0,'','','',1),(874,'情景玩具',0,'',835,0,255,0,'','','',1),(875,'减压玩具',0,'',836,0,255,0,'','','',1),(876,'创意玩具',0,'',836,0,255,0,'','','',1),(877,'钢琴',0,'',837,0,255,0,'','','',1),(878,'电子琴',0,'',837,0,255,0,'','','',1),(879,'手风琴',0,'',837,0,255,0,'','','',1),(880,'吉他/贝斯',0,'',837,0,255,0,'','','',1),(881,'民族管弦乐器',0,'',837,0,255,0,'','','',1),(882,'西洋管弦乐',0,'',837,0,255,0,'','','',1),(883,'口琴/口风琴/竖笛',0,'',837,0,255,0,'','','',1),(884,'西洋打击乐器',0,'',837,0,255,0,'','','',1),(885,'各式乐器配件',0,'',837,0,255,0,'','','',1),(886,'电脑音乐',0,'',837,0,255,0,'','','',1),(887,'工艺礼品乐器',0,'',837,0,255,0,'','','',1),(888,'厨具',0,'',0,0,255,0,'','','',1),(889,'烹饪锅具',0,'',888,0,255,0,'','','',1),(890,'刀剪菜板',0,'',888,0,255,0,'','','',1),(891,'收纳保鲜',0,'',888,0,255,0,'','','',1),(892,'水具酒具',0,'',888,0,255,0,'','','',1),(893,'餐具',0,'',888,0,255,0,'','','',1),(895,'炒锅',0,'',889,0,255,0,'','','',1),(896,'煎锅',0,'',889,0,255,0,'','','',1),(897,'压力锅',0,'',889,0,255,0,'','','',1),(898,'蒸锅',0,'',889,0,255,0,'','','',1),(899,'汤锅',0,'',889,0,255,0,'','','',1),(900,'奶锅',0,'',889,0,255,0,'','','',1),(901,'套锅',0,'',889,0,255,0,'','','',1),(902,'煲类',0,'',889,0,255,0,'','','',1),(903,'水壶',0,'',889,0,255,0,'','','',1),(904,'厨用杂件',0,'',889,0,255,0,'','','',1),(905,'单刀',0,'',890,0,255,0,'','','',1),(906,'剪刀',0,'',890,0,255,0,'','','',1),(907,'套刀',0,'',890,0,255,0,'','','',1),(908,'砧板',0,'',890,0,255,0,'','','',1),(909,'刀具配件',0,'',890,0,255,0,'','','',1),(910,'保鲜盒',0,'',891,0,255,0,'','','',1),(911,'保鲜膜/袋',0,'',891,0,255,0,'','','',1),(912,'调料器皿',0,'',891,0,255,0,'','','',1),(913,'饭盒/提锅',0,'',891,0,255,0,'','','',1),(914,'塑料杯',0,'',892,0,255,0,'','','',1),(915,'运动水壶',0,'',892,0,255,0,'','','',1),(916,'玻璃杯',0,'',892,0,255,0,'','','',1),(917,'陶瓷杯',0,'',892,0,255,0,'','','',1),(918,'保温杯',0,'',892,0,255,0,'','','',1),(919,'保温壶',0,'',892,0,255,0,'','','',1),(920,'酒杯/套装',0,'',892,0,255,0,'','','',1),(921,'酒具配件',0,'',892,0,255,0,'','','',1),(922,'餐具套装',0,'',893,0,255,0,'','','',1),(923,'碗/碟/盘',0,'',893,0,255,0,'','','',1),(924,'筷勺/刀叉',0,'',893,0,255,0,'','','',1),(925,'一次性餐具',0,'',893,0,255,0,'','','',1),(935,'茶具/咖啡具',0,'',888,0,255,0,'','','',1),(936,'整套茶具',0,'',935,0,255,0,'','','',1),(937,'茶杯',0,'',935,0,255,0,'','','',1),(938,'茶壶',0,'',935,0,255,0,'','','',1),(939,'茶盘茶托',0,'',935,0,255,0,'','','',1),(940,'茶叶罐',0,'',935,0,255,0,'','','',1),(941,'茶具配件',0,'',935,0,255,0,'','','',1),(942,'茶宠摆件',0,'',935,0,255,0,'','','',1),(943,'咖啡具',0,'',935,0,255,0,'','','',1),(944,'其他',0,'',935,0,255,0,'','','',1),(959,'母婴用品',0,'',0,0,255,0,'','','',1),(960,'奶粉',0,'',959,0,255,0,'','','',1),(961,'营养辅食',0,'',959,0,255,0,'','','',1),(962,'尿裤湿巾',0,'',959,0,255,0,'','','',1),(963,'喂养用品',0,'',959,0,255,0,'','','',1),(964,'洗护用品',0,'',959,0,255,0,'','','',1),(965,'童车童床',0,'',959,0,255,0,'','','',1),(966,'服饰寝居',0,'',959,0,255,0,'','','',1),(967,'妈妈专区',0,'',959,0,255,0,'','','',1),(968,'品牌奶粉',0,'',960,0,255,0,'','','',1),(969,'妈妈奶粉',0,'',960,0,255,0,'','','',1),(970,'1段奶粉',0,'',960,0,255,0,'','','',1),(971,'2段奶粉',0,'',960,0,255,0,'','','',1),(972,'3段奶粉',0,'',960,0,255,0,'','','',1),(973,'4段奶粉',0,'',960,0,255,0,'','','',1),(974,'羊奶粉',0,'',960,0,255,0,'','','',1),(975,'特殊配方',0,'',960,0,255,0,'','','',1),(976,'成人奶粉',0,'',960,0,255,0,'','','',1),(977,'婴幼营养',0,'',961,0,255,0,'','','',1),(978,'初乳',0,'',961,0,255,0,'','','',1),(979,'米粉/菜粉',0,'',961,0,255,0,'','','',1),(980,'果泥/果汁',0,'',961,0,255,0,'','','',1),(981,'肉松/饼干',0,'',961,0,255,0,'','','',1),(982,'辅食',0,'',961,0,255,0,'','','',1),(983,'孕期营养',0,'',961,0,255,0,'','','',1),(984,'清火/开胃',0,'',961,0,255,0,'','','',1),(985,'面条/粥',0,'',961,0,255,0,'','','',1),(986,'品牌尿裤',0,'',962,0,255,0,'','','',1),(987,'新生儿',0,'',962,0,255,0,'','','',1),(988,'S号',0,'',962,0,255,0,'','','',1),(989,'M号',0,'',962,0,255,0,'','','',1),(990,'L号',0,'',962,0,255,0,'','','',1),(991,'XL/XXL号',0,'',962,0,255,0,'','','',1),(992,'裤型尿裤',0,'',962,0,255,0,'','','',1),(993,'湿巾',0,'',962,0,255,0,'','','',1),(994,'尿布/尿垫',0,'',962,0,255,0,'','','',1),(995,'成人尿裤',0,'',962,0,255,0,'','','',1),(996,'奶瓶',0,'',963,0,255,0,'','','',1),(997,'奶嘴',0,'',963,0,255,0,'','','',1),(998,'吸奶器',0,'',963,0,255,0,'','','',1),(999,'暖奶/消毒',0,'',963,0,255,0,'','','',1),(1000,'餐具',0,'',963,0,255,0,'','','',1),(1001,'水具',0,'',963,0,255,0,'','','',1),(1002,'牙胶/安抚',0,'',963,0,255,0,'','','',1),(1003,'辅助用品',0,'',963,0,255,0,'','','',1),(1004,'宝宝护肤',0,'',964,0,255,0,'','','',1),(1005,'洗浴用品',0,'',964,0,255,0,'','','',1),(1006,'洗发沐浴',0,'',964,0,255,0,'','','',1),(1007,'清洁用品',0,'',964,0,255,0,'','','',1),(1008,'护理用品',0,'',964,0,255,0,'','','',1),(1009,'妈妈护肤',0,'',964,0,255,0,'','','',1),(1010,'婴儿推车',0,'',965,0,255,0,'','','',1),(1011,'餐椅摇椅',0,'',965,0,255,0,'','','',1),(1012,'婴儿床',0,'',965,0,255,0,'','','',1),(1013,'学步车',0,'',965,0,255,0,'','','',1),(1014,'三轮车',0,'',965,0,255,0,'','','',1),(1015,'自行车',0,'',965,0,255,0,'','','',1),(1016,'电动车',0,'',965,0,255,0,'','','',1),(1017,'健身车',0,'',965,0,255,0,'','','',1),(1018,'安全座椅',0,'',965,0,255,0,'','','',1),(1019,'婴儿外出服',0,'',966,0,255,0,'','','',1),(1020,'婴儿内衣',0,'',966,0,255,0,'','','',1),(1021,'婴儿礼盒',0,'',966,0,255,0,'','','',1),(1022,'婴儿鞋帽袜',0,'',966,0,255,0,'','','',1),(1023,'安全防护',0,'',966,0,255,0,'','','',1),(1024,'家居床品',0,'',966,0,255,0,'','','',1),(1025,'其他',0,'',966,0,255,0,'','','',1),(1026,'包/背婴带',0,'',967,0,255,0,'','','',1),(1027,'妈妈护理',0,'',967,0,255,0,'','','',1),(1028,'产后塑身',0,'',967,0,255,0,'','','',1),(1029,'孕妇内衣',0,'',967,0,255,0,'','','',1),(1030,'防辐射服',0,'',967,0,255,0,'','','',1),(1031,'孕妇装',0,'',967,0,255,0,'','','',1),(1032,'孕妇食品',0,'',967,0,255,0,'','','',1),(1033,'妈妈美容',0,'',967,0,255,0,'','','',1),(1034,'手机通讯',0,'',256,0,255,0,'','','',1),(1035,'手机',0,'',1034,0,255,0,'','','',1),(1036,'对讲机',0,'',1034,0,255,0,'','','',1),(1037,'虚拟充值',0,'',0,0,255,1,'','','',1),(1041,'充值',0,'',1037,0,255,1,'','','',1),(1042,'游戏',0,'',1037,0,255,1,'','','',1),(1043,'票务',0,'',1037,0,255,1,'','','',1),(1044,'手机充值',0,'',1041,0,255,1,'','','',1),(1045,'游戏点卡',0,'',1042,0,255,1,'','','',1),(1046,'QQ充值',0,'',1042,0,255,1,'','','',1),(1047,'电影票',0,'',1043,0,255,1,'','','',1),(1048,'演唱会',0,'',1043,0,255,1,'','','',1),(1049,'话剧/歌剧/音乐剧',0,'',1043,0,255,1,'','','',1),(1050,'体育赛事',0,'',1043,0,255,1,'','','',1),(1051,'舞蹈芭蕾',0,'',1043,0,255,1,'','','',1),(1052,'戏曲综艺',0,'',1043,0,255,1,'','','',1),(1053,'女装',0,'',4,0,255,0,'','','',1),(1054,'整车',0,'',730,0,255,0,'','','',1),(1055,'新车',0,'',1054,0,255,0,'','','',1),(1056,'二手车',0,'',1054,0,255,0,'','','',1),(1058,'中西成药',6,'批准文号',0,10,0,1,'','','',1),(1059,'心脑血管',6,'批准文号',1058,10,0,1,'','','',1),(1060,'高血压',6,'批准文号',1059,10,0,1,'','','',1),(1062,'男科疾病',6,'批准文号',1058,10,0,1,'','','',1),(1063,'阳痿早泄',6,'批准文号',1062,10,0,1,'','','',1),(1064,'专科用药',0,'',0,8,0,0,'','','',1),(1065,'肝胆科',0,'',1064,8,0,0,'','','',1),(1066,'护肝片',0,'',1065,8,0,0,'','','',1),(1068,'血压计',5,'血压计',1067,9,0,1,'','','',1),(1069,'欧姆龙',5,'血压计',1068,9,0,1,'','','',1),(1070,'医疗器械',0,'',0,9,0,0,'','','',1),(1071,'血压计',5,'',1070,9,0,0,'','','',1);
/*!40000 ALTER TABLE `pmall_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_class_nav`
--

DROP TABLE IF EXISTS `pmall_goods_class_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_class_nav` (
  `cn_adv2_link` varchar(100) NOT NULL COMMENT '广告2链接',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `cn_alias` varchar(100) DEFAULT '' COMMENT '商品分类别名',
  `cn_classids` varchar(100) DEFAULT '' COMMENT '推荐子级分类',
  `cn_brandids` varchar(100) DEFAULT '' COMMENT '推荐的品牌',
  `cn_pic` varchar(100) DEFAULT '' COMMENT '分类图片',
  `cn_adv1` varchar(100) DEFAULT '' COMMENT '广告图1',
  `cn_adv1_link` varchar(100) DEFAULT '' COMMENT '广告1链接',
  `cn_adv2` varchar(100) DEFAULT '' COMMENT '广告图2',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_class_nav`
--

LOCK TABLES `pmall_goods_class_nav` WRITE;
/*!40000 ALTER TABLE `pmall_goods_class_nav` DISABLE KEYS */;
INSERT INTO `pmall_goods_class_nav` VALUES ('',1,'','12,19,26,33,35,42,49,56','108,105,101,96,89,80,83,352','04849343852775378.png','04849383096194771.jpg','','04849383096284687.jpg'),('',2,'','156,163,168,170,186,192,193,198','342,341,336,335,334,330,329,328','04849344505821846.png','04849386427434184.jpg','','04849386427492123.jpg'),('',3,'','206,210,213,216,220,227,231','344,342,341,338,336,335,330,329','04849345975757419.png','04849387912371887.jpg','','04849387912422255.jpg'),('',256,'','278,279,398,399,437,1035,1036','215,214,208,202,196,190,184','04849346415545755.png','04849389240497918.jpg','','04849389240540796.jpg'),('',308,'','314,317,318,321,326,327,328,329','241,240,235,234,229,228,223,217','04849346837120218.png','04849391321812920.jpg','','04849391321877848.jpg'),('',470,'','478,479,485,486,490,491,497,498','142,136,135,130,128,124,123,117','04849347515759481.png','04849392722316549.jpg','','04849392722363907.jpg'),('',530,'','557,563,566,567,570,571,572,575,576','171,165,159,153,152,146,360,359','04849347913383394.png','04849399151585529.jpg','','04849399151680886.jpg'),('',593,'','605,617,623,629,630,632,636,637','264,263,258,257,252,251,246,245','04849348133390475.png','04849400285934568.jpg','','04849400285991819.jpg'),('',662,'','671,675,676,677,681,682,683,684,690','324,323,318,317,312,311,306,305','04849348436546686.png','04849401365781256.jpg','','04849401365834473.jpg'),('',730,'','738,740,744,746,752,753,754','241,240,234,228,227,222,221,216','04849348664379344.png','04849404510419498.jpg','','04849404510472921.jpg'),('',825,'','844,847,848,849,850,851,855,857','344,343,338,337,332,331,326,148','04849352366294406.png','04849405508671552.jpg','','04849405508723529.jpg'),('',888,'','895,902,918,936,939,942,943','322,321,316,315,310,309,304,303','04849352648636017.png','04849408123501895.jpg','','04849408123559604.jpg'),('',959,'','968,970,975,981,982,986,994,996','302,301,296,295,290,284,278,272','04849353182209090.png','04849409796241200.jpg','','04849409796289293.jpg'),('',1037,'','1044,1047,1048,1049,1050,1051,1052','244,243,242','04849353042725089.png','04849412911666956.jpg','','04849412911723098.jpg');
/*!40000 ALTER TABLE `pmall_goods_class_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_class_staple`
--

DROP TABLE IF EXISTS `pmall_goods_class_staple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_class_staple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_class_staple`
--

LOCK TABLES `pmall_goods_class_staple` WRITE;
/*!40000 ALTER TABLE `pmall_goods_class_staple` DISABLE KEYS */;
INSERT INTO `pmall_goods_class_staple` VALUES (1,'服饰鞋帽 >女装 >雪纺衫',1,4,15,0,1,1),(2,'服饰鞋帽 >男装 >POLO衫',1,5,37,0,1,1),(3,'服饰鞋帽 >女装 >T恤',1,4,12,0,5,2),(5,'中西成药 >心脑血管 >高血压',1058,1059,1060,0,5,11),(6,'中西成药 >心脑血管 >高血压',1058,1059,1060,4,1,5),(9,'礼品箱包 >潮流女包 >手拿包',2,151,157,0,1,5),(10,'个护化妆 >面部护理 >乳液面霜',470,471,481,0,12,3),(11,'服饰鞋帽 >运动 >篮球鞋',1,7,77,0,1,1),(12,'礼品箱包 >潮流女包 >钱包/卡包',2,151,156,0,1,1),(13,'服饰鞋帽 >女鞋 >平底鞋',1,8,90,0,1,1),(14,'服饰鞋帽 >男鞋 >正装鞋',1,9,108,0,1,1),(15,'医疗器械 >血压计',1070,1071,0,5,5,1),(16,'服饰鞋帽 >女装 >T恤',1,4,12,0,1,1),(17,'运动健康 >保健器械 >养生器械',662,669,717,0,1,3),(18,'运动健康 >户外鞋服 >户外服装',662,663,671,0,1,1),(19,'运动健康 >保健器械 >保健用品',662,669,718,0,1,1);
/*!40000 ALTER TABLE `pmall_goods_class_staple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_class_tag`
--

DROP TABLE IF EXISTS `pmall_goods_class_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_class_tag` (
  `gc_tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TAGid',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_tag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gc_tag_value` text NOT NULL COMMENT '分类TAG值',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`gc_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=906 DEFAULT CHARSET=utf8 COMMENT='商品分类TAG表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_class_tag`
--

LOCK TABLES `pmall_goods_class_tag` WRITE;
/*!40000 ALTER TABLE `pmall_goods_class_tag` DISABLE KEYS */;
INSERT INTO `pmall_goods_class_tag` VALUES (1,1058,1059,1060,'中西成药&nbsp;&gt;&nbsp;心脑血管&nbsp;&gt;&nbsp;高血压','中西成药,心脑血管,高血压',1060,6),(2,1058,1062,1063,'中西成药&nbsp;&gt;&nbsp;男科疾病&nbsp;&gt;&nbsp;阳痿早泄','中西成药,男科疾病,阳痿早泄',1063,6),(3,1064,1065,1066,'专科用药&nbsp;&gt;&nbsp;肝胆科&nbsp;&gt;&nbsp;护肝片','专科用药,肝胆科,护肝片',1066,0),(4,1070,1071,0,'医疗器械&nbsp;&gt;&nbsp;血压计','医疗器械,血压计',1071,5),(5,1,4,12,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;T恤','服饰鞋帽,女装,T恤',12,0),(6,1,4,13,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;衬衫','服饰鞋帽,女装,衬衫',13,0),(7,1,4,14,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;针织衫','瓦河',14,0),(8,1,4,15,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;雪纺衫','服饰鞋帽,女装,雪纺衫',15,0),(9,1,4,16,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;卫衣','服饰鞋帽,女装,卫衣',16,0),(10,1,4,17,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;马甲','服饰鞋帽,女装,马甲',17,0),(11,1,4,18,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;连衣裙','服饰鞋帽,女装,连衣裙',18,0),(12,1,4,19,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;半身裙','服饰鞋帽,女装,半身裙',19,0),(13,1,4,20,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;牛仔裤','服饰鞋帽,女装,牛仔裤',20,0),(14,1,4,21,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;休闲裤','服饰鞋帽,女装,休闲裤',21,0),(15,1,4,22,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;打底裤','服饰鞋帽,女装,打底裤',22,0),(16,1,4,23,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;正装裤','服饰鞋帽,女装,正装裤',23,0),(17,1,4,24,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;西服','服饰鞋帽,女装,西服',24,0),(18,1,4,25,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;短外套','服饰鞋帽,女装,短外套',25,0),(19,1,4,26,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;风衣','服饰鞋帽,女装,风衣',26,0),(20,1,4,27,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;大衣','服饰鞋帽,女装,大衣',27,0),(21,1,4,28,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;皮衣皮草','服饰鞋帽,女装,皮衣皮草',28,0),(22,1,4,29,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;棉服','服饰鞋帽,女装,棉服',29,0),(23,1,4,30,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;羽绒服','服饰鞋帽,女装,羽绒服',30,0),(24,1,4,31,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;孕妇装','服饰鞋帽,女装,孕妇装',31,0),(25,1,4,32,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;大码装','服饰鞋帽,女装,大码装',32,0),(26,1,4,33,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;中老年装','服饰鞋帽,女装,中老年装',33,0),(27,1,4,34,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;婚纱礼服','服饰鞋帽,女装,婚纱礼服',34,0),(28,1,4,1053,'服饰鞋帽&nbsp;&gt;&nbsp;女装&nbsp;&gt;&nbsp;女装','服饰鞋帽,女装,女装',1053,0),(29,1,5,35,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;衬衫','服饰鞋帽,男装,衬衫',35,0),(30,1,5,36,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;T恤','服饰鞋帽,男装,T恤',36,0),(31,1,5,37,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;POLO衫','服饰鞋帽,男装,POLO衫',37,0),(32,1,5,38,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;针织衫','服饰鞋帽,男装,针织衫',38,0),(33,1,5,39,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;羊绒衫','服饰鞋帽,男装,羊绒衫',39,0),(34,1,5,40,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;卫衣','服饰鞋帽,男装,卫衣',40,0),(35,1,5,41,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;马甲／背心','服饰鞋帽,男装,马甲／背心',41,0),(36,1,5,42,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;夹克','服饰鞋帽,男装,夹克',42,0),(37,1,5,43,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;风衣','服饰鞋帽,男装,风衣',43,0),(38,1,5,44,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;大衣','服饰鞋帽,男装,大衣',44,0),(39,1,5,45,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;皮衣','服饰鞋帽,男装,皮衣',45,0),(40,1,5,46,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;外套','服饰鞋帽,男装,外套',46,0),(41,1,5,47,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;西服','服饰鞋帽,男装,西服',47,0),(42,1,5,48,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;棉服','服饰鞋帽,男装,棉服',48,0),(43,1,5,49,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;羽绒服','服饰鞋帽,男装,羽绒服',49,0),(44,1,5,50,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;牛仔裤','服饰鞋帽,男装,牛仔裤',50,0),(45,1,5,51,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;休闲裤','服饰鞋帽,男装,休闲裤',51,0),(46,1,5,52,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;西裤','服饰鞋帽,男装,西裤',52,0),(47,1,5,53,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;西服套装','服饰鞋帽,男装,西服套装',53,0),(48,1,5,54,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;大码装','服饰鞋帽,男装,大码装',54,0),(49,1,5,55,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;中老年装','服饰鞋帽,男装,中老年装',55,0),(50,1,5,56,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;唐装','服饰鞋帽,男装,唐装',56,0),(51,1,5,57,'服饰鞋帽&nbsp;&gt;&nbsp;男装&nbsp;&gt;&nbsp;工装','服饰鞋帽,男装,工装',57,0),(52,1,6,58,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;文胸','服饰鞋帽,内衣,文胸',58,0),(53,1,6,59,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;女式内裤','服饰鞋帽,内衣,女式内裤',59,0),(54,1,6,60,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;男式内裤','服饰鞋帽,内衣,男式内裤',60,0),(55,1,6,61,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;家居','服饰鞋帽,内衣,家居',61,0),(56,1,6,62,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;睡衣','服饰鞋帽,内衣,睡衣',62,0),(57,1,6,63,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;塑身衣','服饰鞋帽,内衣,塑身衣',63,0),(58,1,6,64,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;睡袍／浴袍','服饰鞋帽,内衣,睡袍／浴袍',64,0),(59,1,6,65,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;泳衣','服饰鞋帽,内衣,泳衣',65,0),(60,1,6,66,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;背心','服饰鞋帽,内衣,背心',66,0),(61,1,6,67,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;抹胸','服饰鞋帽,内衣,抹胸',67,0),(62,1,6,68,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;连裤袜','服饰鞋帽,内衣,连裤袜',68,0),(63,1,6,69,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;美腿袜','服饰鞋帽,内衣,美腿袜',69,0),(64,1,6,70,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;男袜','服饰鞋帽,内衣,男袜',70,0),(65,1,6,71,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;女袜','服饰鞋帽,内衣,女袜',71,0),(66,1,6,72,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;情趣内衣','服饰鞋帽,内衣,情趣内衣',72,0),(67,1,6,73,'服饰鞋帽&nbsp;&gt;&nbsp;内衣&nbsp;&gt;&nbsp;保暖内衣','服饰鞋帽,内衣,保暖内衣',73,0),(68,1,7,74,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;休闲鞋','服饰鞋帽,运动,休闲鞋',74,0),(69,1,7,75,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;帆布鞋','服饰鞋帽,运动,帆布鞋',75,0),(70,1,7,76,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;跑步鞋','服饰鞋帽,运动,跑步鞋',76,0),(71,1,7,77,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;篮球鞋','服饰鞋帽,运动,篮球鞋',77,0),(72,1,7,78,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;足球鞋','服饰鞋帽,运动,足球鞋',78,0),(73,1,7,79,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;训练鞋','服饰鞋帽,运动,训练鞋',79,0),(74,1,7,80,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;乒羽鞋','服饰鞋帽,运动,乒羽鞋',80,0),(75,1,7,81,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;拖鞋','服饰鞋帽,运动,拖鞋',81,0),(76,1,7,82,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;卫衣','服饰鞋帽,运动,卫衣',82,0),(77,1,7,83,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;夹克','服饰鞋帽,运动,夹克',83,0),(78,1,7,84,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;T恤','服饰鞋帽,运动,T恤',84,0),(79,1,7,85,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;棉服／羽绒服','服饰鞋帽,运动,棉服／羽绒服',85,0),(80,1,7,86,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动裤','服饰鞋帽,运动,运动裤',86,0),(81,1,7,87,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;套装','服饰鞋帽,运动,套装',87,0),(82,1,7,88,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动包','服饰鞋帽,运动,运动包',88,0),(83,1,7,89,'服饰鞋帽&nbsp;&gt;&nbsp;运动&nbsp;&gt;&nbsp;运动配件','服饰鞋帽,运动,运动配件',89,0),(84,1,8,90,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;平底鞋','服饰鞋帽,女鞋,平底鞋',90,0),(85,1,8,91,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;高跟鞋','服饰鞋帽,女鞋,高跟鞋',91,0),(86,1,8,92,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;单鞋','服饰鞋帽,女鞋,单鞋',92,0),(87,1,8,93,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;休闲鞋','服饰鞋帽,女鞋,休闲鞋',93,0),(88,1,8,94,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;凉鞋','服饰鞋帽,女鞋,凉鞋',94,0),(89,1,8,95,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;女靴','服饰鞋帽,女鞋,女靴',95,0),(90,1,8,96,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;雪地靴','服饰鞋帽,女鞋,雪地靴',96,0),(91,1,8,97,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;拖鞋','服饰鞋帽,女鞋,拖鞋',97,0),(92,1,8,98,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;裸靴','服饰鞋帽,女鞋,裸靴',98,0),(93,1,8,99,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;筒靴','服饰鞋帽,女鞋,筒靴',99,0),(94,1,8,100,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;帆布鞋','服饰鞋帽,女鞋,帆布鞋',100,0),(95,1,8,101,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;雨鞋／雨靴','服饰鞋帽,女鞋,雨鞋／雨靴',101,0),(96,1,8,102,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;妈妈鞋','服饰鞋帽,女鞋,妈妈鞋',102,0),(97,1,8,103,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;鞋配件','服饰鞋帽,女鞋,鞋配件',103,0),(98,1,8,104,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;特色鞋','服饰鞋帽,女鞋,特色鞋',104,0),(99,1,8,105,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;鱼嘴鞋','服饰鞋帽,女鞋,鱼嘴鞋',105,0),(100,1,8,106,'服饰鞋帽&nbsp;&gt;&nbsp;女鞋&nbsp;&gt;&nbsp;布鞋／绣花鞋','服饰鞋帽,女鞋,布鞋／绣花鞋',106,0),(101,1,9,107,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;商务休闲鞋','服饰鞋帽,男鞋,商务休闲鞋',107,0),(102,1,9,108,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;正装鞋','服饰鞋帽,男鞋,正装鞋',108,0),(103,1,9,109,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;休闲鞋','服饰鞋帽,男鞋,休闲鞋',109,0),(104,1,9,110,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;凉鞋／沙滩鞋','服饰鞋帽,男鞋,凉鞋／沙滩鞋',110,0),(105,1,9,111,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;男靴','服饰鞋帽,男鞋,男靴',111,0),(106,1,9,112,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;功能鞋','服饰鞋帽,男鞋,功能鞋',112,0),(107,1,9,113,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;拖鞋','服饰鞋帽,男鞋,拖鞋',113,0),(108,1,9,114,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;传统布鞋','服饰鞋帽,男鞋,传统布鞋',114,0),(109,1,9,115,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;鞋配件','服饰鞋帽,男鞋,鞋配件',115,0),(110,1,9,116,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;帆布鞋','服饰鞋帽,男鞋,帆布鞋',116,0),(111,1,9,117,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;豆豆鞋','服饰鞋帽,男鞋,豆豆鞋',117,0),(112,1,9,118,'服饰鞋帽&nbsp;&gt;&nbsp;男鞋&nbsp;&gt;&nbsp;驾车鞋','服饰鞋帽,男鞋,驾车鞋',118,0),(113,1,10,119,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;太阳镜','服饰鞋帽,配饰,太阳镜',119,0),(114,1,10,120,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;框镜','服饰鞋帽,配饰,框镜',120,0),(115,1,10,121,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;皮带','服饰鞋帽,配饰,皮带',121,0),(116,1,10,122,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;围巾','服饰鞋帽,配饰,围巾',122,0),(117,1,10,123,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;手套','服饰鞋帽,配饰,手套',123,0),(118,1,10,124,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;帽子','服饰鞋帽,配饰,帽子',124,0),(119,1,10,125,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;领带','服饰鞋帽,配饰,领带',125,0),(120,1,10,126,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;袖扣','服饰鞋帽,配饰,袖扣',126,0),(121,1,10,127,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;其他配件','服饰鞋帽,配饰,其他配件',127,0),(122,1,10,128,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;丝巾','服饰鞋帽,配饰,丝巾',128,0),(123,1,10,129,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;披肩','服饰鞋帽,配饰,披肩',129,0),(124,1,10,130,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;腰带','服饰鞋帽,配饰,腰带',130,0),(125,1,10,131,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;腰链／腰封','服饰鞋帽,配饰,腰链／腰封',131,0),(126,1,10,132,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;棒球帽','服饰鞋帽,配饰,棒球帽',132,0),(127,1,10,133,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;毛线','服饰鞋帽,配饰,毛线',133,0),(128,1,10,134,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;遮阳帽','服饰鞋帽,配饰,遮阳帽',134,0),(129,1,10,135,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;防紫外线手套','服饰鞋帽,配饰,防紫外线手套',135,0),(130,1,10,136,'服饰鞋帽&nbsp;&gt;&nbsp;配饰&nbsp;&gt;&nbsp;草帽','服饰鞋帽,配饰,草帽',136,0),(131,1,11,137,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;套装','服饰鞋帽,童装,套装',137,0),(132,1,11,138,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;上衣','服饰鞋帽,童装,上衣',138,0),(133,1,11,139,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;裤子','服饰鞋帽,童装,裤子',139,0),(134,1,11,140,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;裙子','服饰鞋帽,童装,裙子',140,0),(135,1,11,141,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;内衣／家居服','服饰鞋帽,童装,内衣／家居服',141,0),(136,1,11,142,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;羽绒服／棉服','服饰鞋帽,童装,羽绒服／棉服',142,0),(137,1,11,143,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;亲子装','服饰鞋帽,童装,亲子装',143,0),(138,1,11,144,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;儿童配饰','服饰鞋帽,童装,儿童配饰',144,0),(139,1,11,145,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;礼服／演出服','服饰鞋帽,童装,礼服／演出服',145,0),(140,1,11,146,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;运动鞋','服饰鞋帽,童装,运动鞋',146,0),(141,1,11,147,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;单鞋','服饰鞋帽,童装,单鞋',147,0),(142,1,11,148,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;靴子','服饰鞋帽,童装,靴子',148,0),(143,1,11,149,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;凉鞋','服饰鞋帽,童装,凉鞋',149,0),(144,1,11,150,'服饰鞋帽&nbsp;&gt;&nbsp;童装&nbsp;&gt;&nbsp;功能鞋','服饰鞋帽,童装,功能鞋',150,0),(145,2,151,156,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;钱包/卡包','礼品箱包,潮流女包,钱包/卡包',156,0),(146,2,151,157,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;手拿包','礼品箱包,潮流女包,手拿包',157,0),(147,2,151,158,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;单肩包','礼品箱包,潮流女包,单肩包',158,0),(148,2,151,159,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;双肩包','礼品箱包,潮流女包,双肩包',159,0),(149,2,151,160,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;手提包','礼品箱包,潮流女包,手提包',160,0),(150,2,151,161,'礼品箱包&nbsp;&gt;&nbsp;潮流女包&nbsp;&gt;&nbsp;斜挎包','礼品箱包,潮流女包,斜挎包',161,0),(151,2,152,162,'礼品箱包&nbsp;&gt;&nbsp;时尚男包&nbsp;&gt;&nbsp;钱包/卡包','礼品箱包,时尚男包,钱包/卡包',162,0),(152,2,152,163,'礼品箱包&nbsp;&gt;&nbsp;时尚男包&nbsp;&gt;&nbsp;男士手包','礼品箱包,时尚男包,男士手包',163,0),(153,2,152,164,'礼品箱包&nbsp;&gt;&nbsp;时尚男包&nbsp;&gt;&nbsp;腰带／礼盒','礼品箱包,时尚男包,腰带／礼盒',164,0),(154,2,152,165,'礼品箱包&nbsp;&gt;&nbsp;时尚男包&nbsp;&gt;&nbsp;商务公文包','礼品箱包,时尚男包,商务公文包',165,0),(155,2,153,166,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;电脑数码包','礼品箱包,功能箱包,电脑数码包',166,0),(156,2,153,167,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;拉杆箱','礼品箱包,功能箱包,拉杆箱',167,0),(157,2,153,168,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;旅行包','礼品箱包,功能箱包,旅行包',168,0),(158,2,153,169,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;旅行配件','礼品箱包,功能箱包,旅行配件',169,0),(159,2,153,170,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;休闲运动包','礼品箱包,功能箱包,休闲运动包',170,0),(160,2,153,171,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;登山包','礼品箱包,功能箱包,登山包',171,0),(161,2,153,172,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;妈咪包','礼品箱包,功能箱包,妈咪包',172,0),(162,2,153,173,'礼品箱包&nbsp;&gt;&nbsp;功能箱包&nbsp;&gt;&nbsp;书包','礼品箱包,功能箱包,书包',173,0),(163,2,154,174,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;火机烟具','礼品箱包,礼品,火机烟具',174,0),(164,2,154,175,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;礼品文具','礼品箱包,礼品,礼品文具',175,0),(165,2,154,176,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;瑞士军刀','礼品箱包,礼品,瑞士军刀',176,0),(166,2,154,177,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;收藏品','礼品箱包,礼品,收藏品',177,0),(167,2,154,178,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;工艺礼品','礼品箱包,礼品,工艺礼品',178,0),(168,2,154,179,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;创意礼品','礼品箱包,礼品,创意礼品',179,0),(169,2,154,180,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;礼卡礼卷','礼品箱包,礼品,礼卡礼卷',180,0),(170,2,154,181,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;鲜花速递','礼品箱包,礼品,鲜花速递',181,0),(171,2,154,182,'礼品箱包&nbsp;&gt;&nbsp;礼品&nbsp;&gt;&nbsp;婚庆用品','礼品箱包,礼品,婚庆用品',182,0),(172,2,155,184,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;奢侈品箱包','礼品箱包,奢侈品,奢侈品箱包',184,0),(173,2,155,185,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;钱包','礼品箱包,奢侈品,钱包',185,0),(174,2,155,186,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;服饰','礼品箱包,奢侈品,服饰',186,0),(175,2,155,187,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;腰带','礼品箱包,奢侈品,腰带',187,0),(176,2,155,188,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;太阳镜眼镜','礼品箱包,奢侈品,太阳镜眼镜',188,0),(177,2,155,189,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;配件','礼品箱包,奢侈品,配件',189,0),(178,2,155,190,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;GUCCI','礼品箱包,奢侈品,GUCCI',190,0),(179,2,155,191,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;PRADA','礼品箱包,奢侈品,PRADA',191,0),(180,2,155,192,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;FENDI','礼品箱包,奢侈品,FENDI',192,0),(181,2,155,193,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;BURBERRY','礼品箱包,奢侈品,BURBERRY',193,0),(182,2,155,194,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;MONTBLANC','礼品箱包,奢侈品,MONTBLANC',194,0),(183,2,155,195,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;ARMANI','礼品箱包,奢侈品,ARMANI',195,0),(184,2,155,196,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;RIMOWA','礼品箱包,奢侈品,RIMOWA',196,0),(185,2,155,197,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;RAY-BAN','礼品箱包,奢侈品,RAY-BAN',197,0),(186,2,155,198,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;COACH','礼品箱包,奢侈品,COACH',198,0),(187,2,155,199,'礼品箱包&nbsp;&gt;&nbsp;奢侈品&nbsp;&gt;&nbsp;更多品牌','礼品箱包,奢侈品,更多品牌',199,0),(188,3,200,206,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床品件套','家居家装,家纺,床品件套',206,0),(189,3,200,207,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;被子','家居家装,家纺,被子',207,0),(190,3,200,208,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;枕芯枕套','家居家装,家纺,枕芯枕套',208,0),(191,3,200,209,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床单被罩','家居家装,家纺,床单被罩',209,0),(192,3,200,210,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;毛巾被/毯','家居家装,家纺,毛巾被/毯',210,0),(193,3,200,211,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;床垫/床褥','家居家装,家纺,床垫/床褥',211,0),(194,3,200,212,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;蚊帐/凉席','家居家装,家纺,蚊帐/凉席',212,0),(195,3,200,213,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;抱枕坐垫','家居家装,家纺,抱枕坐垫',213,0),(196,3,200,214,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;毛巾家纺','家居家装,家纺,毛巾家纺',214,0),(197,3,200,215,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;电热毯','家居家装,家纺,电热毯',215,0),(198,3,200,216,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;窗帘/窗纱','家居家装,家纺,窗帘/窗纱',216,0),(199,3,200,217,'家居家装&nbsp;&gt;&nbsp;家纺&nbsp;&gt;&nbsp;酒店用品','家居家装,家纺,酒店用品',217,0),(200,3,201,218,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;台灯','家居家装,灯具,台灯',218,0),(201,3,201,219,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;节能灯','家居家装,灯具,节能灯',219,0),(202,3,201,220,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;装饰灯','家居家装,灯具,装饰灯',220,0),(203,3,201,221,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;落地灯','家居家装,灯具,落地灯',221,0),(204,3,201,222,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;应急灯/手电','家居家装,灯具,应急灯/手电',222,0),(205,3,201,223,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;LED灯','家居家装,灯具,LED灯',223,0),(206,3,201,224,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;吸顶灯','家居家装,灯具,吸顶灯',224,0),(207,3,201,225,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;五金电器','家居家装,灯具,五金电器',225,0),(208,3,201,226,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;吊灯','家居家装,灯具,吊灯',226,0),(209,3,201,227,'家居家装&nbsp;&gt;&nbsp;灯具&nbsp;&gt;&nbsp;氛围照明','家居家装,灯具,氛围照明',227,0),(210,3,202,228,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;收纳用品','家居家装,生活日用,收纳用品',228,0),(211,3,202,229,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;雨伞雨具','家居家装,生活日用,雨伞雨具',229,0),(212,3,202,230,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;浴室用品','家居家装,生活日用,浴室用品',230,0),(213,3,202,231,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;缝纫用品','家居家装,生活日用,缝纫用品',231,0),(214,3,202,232,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;洗晒用品','家居家装,生活日用,洗晒用品',232,0),(215,3,202,233,'家居家装&nbsp;&gt;&nbsp;生活日用&nbsp;&gt;&nbsp;净化除味','家居家装,生活日用,净化除味',233,0),(216,3,203,234,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;桌布/罩件','家居家装,家装软饰,桌布/罩件',234,0),(217,3,203,235,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;地毯地垫','家居家装,家装软饰,地毯地垫',235,0),(218,3,203,236,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;沙发垫套','家居家装,家装软饰,沙发垫套',236,0),(219,3,203,237,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;相框/相片墙','家居家装,家装软饰,相框/相片墙',237,0),(220,3,203,238,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;墙画墙贴','家居家装,家装软饰,墙画墙贴',238,0),(221,3,203,239,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;节庆饰品','家居家装,家装软饰,节庆饰品',239,0),(222,3,203,240,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;手工/十字绣','家居家装,家装软饰,手工/十字绣',240,0),(223,3,203,241,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;工艺摆件','家居家装,家装软饰,工艺摆件',241,0),(224,3,203,242,'家居家装&nbsp;&gt;&nbsp;家装软饰&nbsp;&gt;&nbsp;其他','家居家装,家装软饰,其他',242,0),(225,3,204,243,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;纸品湿巾','家居家装,清洁日用,纸品湿巾',243,0),(226,3,204,244,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;衣物清洁','家居家装,清洁日用,衣物清洁',244,0),(227,3,204,245,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;清洁工具','家居家装,清洁日用,清洁工具',245,0),(228,3,204,246,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;驱虫用品','家居家装,清洁日用,驱虫用品',246,0),(229,3,204,247,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;居室清洁','家居家装,清洁日用,居室清洁',247,0),(230,3,204,248,'家居家装&nbsp;&gt;&nbsp;清洁日用&nbsp;&gt;&nbsp;皮具护理','家居家装,清洁日用,皮具护理',248,0),(231,3,205,249,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;宠物主粮','家居家装,宠物生活,宠物主粮',249,0),(232,3,205,250,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;宠物零食','家居家装,宠物生活,宠物零食',250,0),(233,3,205,251,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;营养品','家居家装,宠物生活,营养品',251,0),(234,3,205,252,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;家居日用','家居家装,宠物生活,家居日用',252,0),(235,3,205,253,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;玩具服饰','家居家装,宠物生活,玩具服饰',253,0),(236,3,205,254,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;出行装备','家居家装,宠物生活,出行装备',254,0),(237,3,205,255,'家居家装&nbsp;&gt;&nbsp;宠物生活&nbsp;&gt;&nbsp;医护美容','家居家装,宠物生活,医护美容',255,0),(238,256,258,264,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机电池','数码办公,手机配件,手机电池',264,0),(239,256,258,265,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;蓝牙耳机','数码办公,手机配件,蓝牙耳机',265,0),(240,256,258,266,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;充电器/数据线','数码办公,手机配件,充电器/数据线',266,0),(241,256,258,267,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机耳机','数码办公,手机配件,手机耳机',267,0),(242,256,258,268,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机贴膜','数码办公,手机配件,手机贴膜',268,0),(243,256,258,269,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机存储卡','数码办公,手机配件,手机存储卡',269,0),(244,256,258,270,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机保护套','数码办公,手机配件,手机保护套',270,0),(245,256,258,271,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;车载配件','数码办公,手机配件,车载配件',271,0),(246,256,258,272,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;iPhone 配件','数码办公,手机配件,iPhone 配件',272,0),(247,256,258,273,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;创意配件','数码办公,手机配件,创意配件',273,0),(248,256,258,274,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;便携/无线音响','数码办公,手机配件,便携/无线音响',274,0),(249,256,258,275,'数码办公&nbsp;&gt;&nbsp;手机配件&nbsp;&gt;&nbsp;手机饰品','数码办公,手机配件,手机饰品',275,0),(250,256,259,276,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;数码相机','数码办公,摄影摄像,数码相机',276,0),(251,256,259,277,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;单电/微单相机','数码办公,摄影摄像,单电/微单相机',277,0),(252,256,259,278,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;单反相机','数码办公,摄影摄像,单反相机',278,0),(253,256,259,279,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;摄像机','数码办公,摄影摄像,摄像机',279,0),(254,256,259,280,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;拍立得','数码办公,摄影摄像,拍立得',280,0),(255,256,259,281,'数码办公&nbsp;&gt;&nbsp;摄影摄像&nbsp;&gt;&nbsp;镜头','数码办公,摄影摄像,镜头',281,0),(256,256,260,282,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;存储卡','数码办公,数码配件,存储卡',282,0),(257,256,260,283,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;读卡器','数码办公,数码配件,读卡器',283,0),(258,256,260,284,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;滤镜','数码办公,数码配件,滤镜',284,0),(259,256,260,285,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;闪光灯/手柄','数码办公,数码配件,闪光灯/手柄',285,0),(260,256,260,286,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;相机包','数码办公,数码配件,相机包',286,0),(261,256,260,287,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;三脚架/云台','数码办公,数码配件,三脚架/云台',287,0),(262,256,260,288,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;相机清洁','数码办公,数码配件,相机清洁',288,0),(263,256,260,289,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;相机贴膜','数码办公,数码配件,相机贴膜',289,0),(264,256,260,290,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;机身附件','数码办公,数码配件,机身附件',290,0),(265,256,260,291,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;镜头附件','数码办公,数码配件,镜头附件',291,0),(266,256,260,292,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;电池/充电器','数码办公,数码配件,电池/充电器',292,0),(267,256,260,293,'数码办公&nbsp;&gt;&nbsp;数码配件&nbsp;&gt;&nbsp;移动电源','数码办公,数码配件,移动电源',293,0),(268,256,261,294,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;MP3/MP4','数码办公,时尚影音,MP3/MP4',294,0),(269,256,261,295,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;智能设备','数码办公,时尚影音,智能设备',295,0),(270,256,261,296,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;耳机/耳麦','数码办公,时尚影音,耳机/耳麦',296,0),(271,256,261,297,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;音箱','数码办公,时尚影音,音箱',297,0),(272,256,261,298,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;高清播放器','数码办公,时尚影音,高清播放器',298,0),(273,256,261,299,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子书','数码办公,时尚影音,电子书',299,0),(274,256,261,300,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子词典','数码办公,时尚影音,电子词典',300,0),(275,256,261,301,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;MP3/MP4配件','数码办公,时尚影音,MP3/MP4配件',301,0),(276,256,261,302,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;录音笔','数码办公,时尚影音,录音笔',302,0),(277,256,261,303,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;麦克风','数码办公,时尚影音,麦克风',303,0),(278,256,261,304,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;专业音频','数码办公,时尚影音,专业音频',304,0),(279,256,261,305,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;电子教育','数码办公,时尚影音,电子教育',305,0),(280,256,261,306,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;数码相框','数码办公,时尚影音,数码相框',306,0),(281,256,261,307,'数码办公&nbsp;&gt;&nbsp;时尚影音&nbsp;&gt;&nbsp;苹果配件','数码办公,时尚影音,苹果配件',307,0),(282,256,390,398,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;笔记本','数码办公,电脑整机,笔记本',398,0),(283,256,390,399,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;超极本','数码办公,电脑整机,超极本',399,0),(284,256,390,400,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;游戏本','数码办公,电脑整机,游戏本',400,0),(285,256,390,401,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;平板电脑','数码办公,电脑整机,平板电脑',401,0),(286,256,390,402,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;平板电脑配件','数码办公,电脑整机,平板电脑配件',402,0),(287,256,390,403,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;台式机','数码办公,电脑整机,台式机',403,0),(288,256,390,404,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;服务器','数码办公,电脑整机,服务器',404,0),(289,256,390,405,'数码办公&nbsp;&gt;&nbsp;电脑整机&nbsp;&gt;&nbsp;笔记本配件','数码办公,电脑整机,笔记本配件',405,0),(290,256,391,406,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;CPU','数码办公,电脑配件,CPU',406,0),(291,256,391,407,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;主板','数码办公,电脑配件,主板',407,0),(292,256,391,408,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;显卡','数码办公,电脑配件,显卡',408,0),(293,256,391,409,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;硬盘','数码办公,电脑配件,硬盘',409,0),(294,256,391,410,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;SSD固态硬盘','数码办公,电脑配件,SSD固态硬盘',410,0),(295,256,391,411,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;内存','数码办公,电脑配件,内存',411,0),(296,256,391,412,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;机箱','数码办公,电脑配件,机箱',412,0),(297,256,391,413,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;电源','数码办公,电脑配件,电源',413,0),(298,256,391,414,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;显示器','数码办公,电脑配件,显示器',414,0),(299,256,391,415,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;刻录机/光驱','数码办公,电脑配件,刻录机/光驱',415,0),(300,256,391,416,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;散热器','数码办公,电脑配件,散热器',416,0),(301,256,391,417,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;声卡/扩展卡','数码办公,电脑配件,声卡/扩展卡',417,0),(302,256,391,418,'数码办公&nbsp;&gt;&nbsp;电脑配件&nbsp;&gt;&nbsp;装机配件','数码办公,电脑配件,装机配件',418,0),(303,256,392,419,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;鼠标','数码办公,外设产品,鼠标',419,0),(304,256,392,420,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;键盘','数码办公,外设产品,键盘',420,0),(305,256,392,421,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;移动硬盘','数码办公,外设产品,移动硬盘',421,0),(306,256,392,422,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;U盘','数码办公,外设产品,U盘',422,0),(307,256,392,423,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;摄像头','数码办公,外设产品,摄像头',423,0),(308,256,392,424,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;外置盒','数码办公,外设产品,外置盒',424,0),(309,256,392,425,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;游戏设备','数码办公,外设产品,游戏设备',425,0),(310,256,392,426,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电视盒','数码办公,外设产品,电视盒',426,0),(311,256,392,427,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;手写板','数码办公,外设产品,手写板',427,0),(312,256,392,428,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;鼠标垫','数码办公,外设产品,鼠标垫',428,0),(313,256,392,429,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;插座','数码办公,外设产品,插座',429,0),(314,256,392,430,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;UPS电源','数码办公,外设产品,UPS电源',430,0),(315,256,392,431,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;线缆','数码办公,外设产品,线缆',431,0),(316,256,392,432,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电脑工具','数码办公,外设产品,电脑工具',432,0),(317,256,392,433,'数码办公&nbsp;&gt;&nbsp;外设产品&nbsp;&gt;&nbsp;电脑清洁','数码办公,外设产品,电脑清洁',433,0),(318,256,393,434,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;路由器','数码办公,网络产品,路由器',434,0),(319,256,393,435,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网卡','数码办公,网络产品,网卡',435,0),(320,256,393,436,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;交换机','数码办公,网络产品,交换机',436,0),(321,256,393,437,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网络存储','数码办公,网络产品,网络存储',437,0),(322,256,393,438,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;3G上网','数码办公,网络产品,3G上网',438,0),(323,256,393,439,'数码办公&nbsp;&gt;&nbsp;网络产品&nbsp;&gt;&nbsp;网络盒子','数码办公,网络产品,网络盒子',439,0),(324,256,394,440,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;打印机','数码办公,办公打印,打印机',440,0),(325,256,394,441,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;一体机','数码办公,办公打印,一体机',441,0),(326,256,394,442,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;投影机','数码办公,办公打印,投影机',442,0),(327,256,394,443,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;投影配件','数码办公,办公打印,投影配件',443,0),(328,256,394,444,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;传真机','数码办公,办公打印,传真机',444,0),(329,256,394,445,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;复合机','数码办公,办公打印,复合机',445,0),(330,256,394,446,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;碎纸机','数码办公,办公打印,碎纸机',446,0),(331,256,394,447,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;扫描仪','数码办公,办公打印,扫描仪',447,0),(332,256,394,448,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;墨盒','数码办公,办公打印,墨盒',448,0),(333,256,394,449,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;硒鼓','数码办公,办公打印,硒鼓',449,0),(334,256,394,450,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;墨粉','数码办公,办公打印,墨粉',450,0),(335,256,394,451,'数码办公&nbsp;&gt;&nbsp;办公打印&nbsp;&gt;&nbsp;色带','数码办公,办公打印,色带',451,0),(336,256,395,452,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;办公文具','数码办公,办公文仪,办公文具',452,0),(337,256,395,453,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;文件管理','数码办公,办公文仪,文件管理',453,0),(338,256,395,454,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;笔类','数码办公,办公文仪,笔类',454,0),(339,256,395,455,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;纸类','数码办公,办公文仪,纸类',455,0),(340,256,395,456,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;本册/便签','数码办公,办公文仪,本册/便签',456,0),(341,256,395,457,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;学生文具','数码办公,办公文仪,学生文具',457,0),(342,256,395,458,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;财务用品','数码办公,办公文仪,财务用品',458,0),(343,256,395,459,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;计算器','数码办公,办公文仪,计算器',459,0),(344,256,395,460,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;激光笔','数码办公,办公文仪,激光笔',460,0),(345,256,395,461,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;白板/封装','数码办公,办公文仪,白板/封装',461,0),(346,256,395,462,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;考勤机','数码办公,办公文仪,考勤机',462,0),(347,256,395,463,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;刻录碟片/附件','数码办公,办公文仪,刻录碟片/附件',463,0),(348,256,395,464,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;点钞机','数码办公,办公文仪,点钞机',464,0),(349,256,395,465,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;支付设备/POS机','数码办公,办公文仪,支付设备/POS机',465,0),(350,256,395,466,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;安防监控','数码办公,办公文仪,安防监控',466,0),(351,256,395,467,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;呼叫/会议设备','数码办公,办公文仪,呼叫/会议设备',467,0),(352,256,395,468,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;保险柜','数码办公,办公文仪,保险柜',468,0),(353,256,395,469,'数码办公&nbsp;&gt;&nbsp;办公文仪&nbsp;&gt;&nbsp;办公家具','数码办公,办公文仪,办公家具',469,0),(354,256,1034,1035,'数码办公&nbsp;&gt;&nbsp;手机通讯&nbsp;&gt;&nbsp;手机','数码办公,手机通讯,手机',1035,0),(355,256,1034,1036,'数码办公&nbsp;&gt;&nbsp;手机通讯&nbsp;&gt;&nbsp;对讲机','数码办公,手机通讯,对讲机',1036,0),(356,308,309,314,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;平板电视','家用电器,大家电,平板电视',314,0),(357,308,309,315,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;空调','家用电器,大家电,空调',315,0),(358,308,309,316,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;冰箱','家用电器,大家电,冰箱',316,0),(359,308,309,317,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;洗衣机','家用电器,大家电,洗衣机',317,0),(360,308,309,318,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;家庭影院','家用电器,大家电,家庭影院',318,0),(361,308,309,319,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;DVD播放机','家用电器,大家电,DVD播放机',319,0),(362,308,309,320,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;迷你音响','家用电器,大家电,迷你音响',320,0),(363,308,309,321,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;烟机/灶具','家用电器,大家电,烟机/灶具',321,0),(364,308,309,322,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;热水器','家用电器,大家电,热水器',322,0),(365,308,309,323,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;消毒柜/洗碗机','家用电器,大家电,消毒柜/洗碗机',323,0),(366,308,309,324,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;酒柜/冰吧/冷柜','家用电器,大家电,酒柜/冰吧/冷柜',324,0),(367,308,309,325,'家用电器&nbsp;&gt;&nbsp;大家电&nbsp;&gt;&nbsp;家电配件','家用电器,大家电,家电配件',325,0),(368,308,310,326,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;净化器','家用电器,生活电器,净化器',326,0),(369,308,310,327,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;电风扇','家用电器,生活电器,电风扇',327,0),(370,308,310,328,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;吸尘器','家用电器,生活电器,吸尘器',328,0),(371,308,310,329,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;加湿器','家用电器,生活电器,加湿器',329,0),(372,308,310,330,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;净水设备','家用电器,生活电器,净水设备',330,0),(373,308,310,331,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;饮水机','家用电器,生活电器,饮水机',331,0),(374,308,310,332,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;冷风扇','家用电器,生活电器,冷风扇',332,0),(375,308,310,333,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;挂烫机/熨斗','家用电器,生活电器,挂烫机/熨斗',333,0),(376,308,310,334,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;电话机','家用电器,生活电器,电话机',334,0),(377,308,310,335,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;插座','家用电器,生活电器,插座',335,0),(378,308,310,336,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;收录/音机','家用电器,生活电器,收录/音机',336,0),(379,308,310,337,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;除湿/干衣机','家用电器,生活电器,除湿/干衣机',337,0),(380,308,310,338,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;清洁机','家用电器,生活电器,清洁机',338,0),(381,308,310,339,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;取暖电器','家用电器,生活电器,取暖电器',339,0),(382,308,310,340,'家用电器&nbsp;&gt;&nbsp;生活电器&nbsp;&gt;&nbsp;其它生活电器','家用电器,生活电器,其它生活电器',340,0),(383,308,311,341,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;料理/榨汁机','家用电器,厨房电器,料理/榨汁机',341,0),(384,308,311,342,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;豆浆机','家用电器,厨房电器,豆浆机',342,0),(385,308,311,343,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电饭煲','家用电器,厨房电器,电饭煲',343,0),(386,308,311,344,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电压力锅','家用电器,厨房电器,电压力锅',344,0),(387,308,311,345,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;面包机','家用电器,厨房电器,面包机',345,0),(388,308,311,346,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;咖啡机','家用电器,厨房电器,咖啡机',346,0),(389,308,311,347,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;微波炉','家用电器,厨房电器,微波炉',347,0),(390,308,311,348,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电烤箱','家用电器,厨房电器,电烤箱',348,0),(391,308,311,349,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电磁炉','家用电器,厨房电器,电磁炉',349,0),(392,308,311,350,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电饼铛/烧烤盘','家用电器,厨房电器,电饼铛/烧烤盘',350,0),(393,308,311,351,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;煮蛋器','家用电器,厨房电器,煮蛋器',351,0),(394,308,311,352,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;酸奶机','家用电器,厨房电器,酸奶机',352,0),(395,308,311,353,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电炖锅','家用电器,厨房电器,电炖锅',353,0),(396,308,311,354,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;电水壶/热水瓶','家用电器,厨房电器,电水壶/热水瓶',354,0),(397,308,311,355,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;多用途锅','家用电器,厨房电器,多用途锅',355,0),(398,308,311,356,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;果蔬解毒机','家用电器,厨房电器,果蔬解毒机',356,0),(399,308,311,357,'家用电器&nbsp;&gt;&nbsp;厨房电器&nbsp;&gt;&nbsp;其它厨房电器','家用电器,厨房电器,其它厨房电器',357,0),(400,308,312,358,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;剃须刀','家用电器,个护健康,剃须刀',358,0),(401,308,312,359,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;剃/脱毛器','家用电器,个护健康,剃/脱毛器',359,0),(402,308,312,360,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;口腔护理','家用电器,个护健康,口腔护理',360,0),(403,308,312,361,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;电吹风','家用电器,个护健康,电吹风',361,0),(404,308,312,362,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;美容器','家用电器,个护健康,美容器',362,0),(405,308,312,363,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;美发器','家用电器,个护健康,美发器',363,0),(406,308,312,364,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;按摩椅','家用电器,个护健康,按摩椅',364,0),(407,308,312,365,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;按摩器','家用电器,个护健康,按摩器',365,0),(408,308,312,366,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;足浴盆','家用电器,个护健康,足浴盆',366,0),(409,308,312,367,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;血压计','家用电器,个护健康,血压计',367,0),(410,308,312,368,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;健康秤/厨房秤','家用电器,个护健康,健康秤/厨房秤',368,0),(411,308,312,369,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;血糖仪','家用电器,个护健康,血糖仪',369,0),(412,308,312,370,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;体温计','家用电器,个护健康,体温计',370,0),(413,308,312,371,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;计步器/脂肪检测仪','家用电器,个护健康,计步器/脂肪检测仪',371,0),(414,308,312,372,'家用电器&nbsp;&gt;&nbsp;个护健康&nbsp;&gt;&nbsp;其它健康电器','家用电器,个护健康,其它健康电器',372,0),(415,308,313,373,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电动工具','家用电器,五金家装,电动工具',373,0),(416,308,313,374,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;手动工具','家用电器,五金家装,手动工具',374,0),(417,308,313,375,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;仪器仪表','家用电器,五金家装,仪器仪表',375,0),(418,308,313,376,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;浴霸/排气扇','家用电器,五金家装,浴霸/排气扇',376,0),(419,308,313,377,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;灯具','家用电器,五金家装,灯具',377,0),(420,308,313,378,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;LED灯','家用电器,五金家装,LED灯',378,0),(421,308,313,379,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;洁身器','家用电器,五金家装,洁身器',379,0),(422,308,313,380,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;水槽','家用电器,五金家装,水槽',380,0),(423,308,313,381,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;龙头','家用电器,五金家装,龙头',381,0),(424,308,313,382,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;淋浴花洒','家用电器,五金家装,淋浴花洒',382,0),(425,308,313,383,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;厨卫五金','家用电器,五金家装,厨卫五金',383,0),(426,308,313,384,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;家具五金','家用电器,五金家装,家具五金',384,0),(427,308,313,385,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;门铃','家用电器,五金家装,门铃',385,0),(428,308,313,386,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电气开关','家用电器,五金家装,电气开关',386,0),(429,308,313,387,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;插座','家用电器,五金家装,插座',387,0),(430,308,313,388,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;电工电料','家用电器,五金家装,电工电料',388,0),(431,308,313,389,'家用电器&nbsp;&gt;&nbsp;五金家装&nbsp;&gt;&nbsp;监控安防','家用电器,五金家装,监控安防',389,0),(432,470,471,478,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;洁面乳','个护化妆,面部护理,洁面乳',478,0),(433,470,471,479,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;爽肤水','个护化妆,面部护理,爽肤水',479,0),(434,470,471,480,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;精华露','个护化妆,面部护理,精华露',480,0),(435,470,471,481,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;乳液面霜','个护化妆,面部护理,乳液面霜',481,0),(436,470,471,482,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;面膜面贴','个护化妆,面部护理,面膜面贴',482,0),(437,470,471,483,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;眼部护理','个护化妆,面部护理,眼部护理',483,0),(438,470,471,484,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;颈部护理','个护化妆,面部护理,颈部护理',484,0),(439,470,471,485,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;T区护理','个护化妆,面部护理,T区护理',485,0),(440,470,471,486,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;护肤套装','个护化妆,面部护理,护肤套装',486,0),(441,470,471,487,'个护化妆&nbsp;&gt;&nbsp;面部护理&nbsp;&gt;&nbsp;防晒隔离','个护化妆,面部护理,防晒隔离',487,0),(442,470,472,488,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;洗发护发','个护化妆,身体护理,洗发护发',488,0),(443,470,472,489,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;染发/造型','个护化妆,身体护理,染发/造型',489,0),(444,470,472,490,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;沐浴','个护化妆,身体护理,沐浴',490,0),(445,470,472,491,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;磨砂/浴盐','个护化妆,身体护理,磨砂/浴盐',491,0),(446,470,472,492,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;身体乳','个护化妆,身体护理,身体乳',492,0),(447,470,472,493,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;手工/香皂','个护化妆,身体护理,手工/香皂',493,0),(448,470,472,494,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;香薰精油','个护化妆,身体护理,香薰精油',494,0),(449,470,472,495,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;纤体瘦身','个护化妆,身体护理,纤体瘦身',495,0),(450,470,472,496,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;脱毛膏','个护化妆,身体护理,脱毛膏',496,0),(451,470,472,497,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;手足护理','个护化妆,身体护理,手足护理',497,0),(452,470,472,498,'个护化妆&nbsp;&gt;&nbsp;身体护理&nbsp;&gt;&nbsp;洗护套装','个护化妆,身体护理,洗护套装',498,0),(453,470,473,499,'个护化妆&nbsp;&gt;&nbsp;口腔护理&nbsp;&gt;&nbsp;牙膏/牙粉','个护化妆,口腔护理,牙膏/牙粉',499,0),(454,470,473,500,'个护化妆&nbsp;&gt;&nbsp;口腔护理&nbsp;&gt;&nbsp;牙刷/牙线','个护化妆,口腔护理,牙刷/牙线',500,0),(455,470,473,501,'个护化妆&nbsp;&gt;&nbsp;口腔护理&nbsp;&gt;&nbsp;漱口水','个护化妆,口腔护理,漱口水',501,0),(456,470,474,502,'个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;卫生巾','个护化妆,女性护理,卫生巾',502,0),(457,470,474,503,'个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;卫生护垫','个护化妆,女性护理,卫生护垫',503,0),(458,470,474,504,'个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;洗液','个护化妆,女性护理,洗液',504,0),(459,470,474,505,'个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;美容食品','个护化妆,女性护理,美容食品',505,0),(460,470,474,506,'个护化妆&nbsp;&gt;&nbsp;女性护理&nbsp;&gt;&nbsp;其他','个护化妆,女性护理,其他',506,0),(461,470,475,507,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;脸部护理','个护化妆,男士护理,脸部护理',507,0),(462,470,475,508,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;眼部护理','个护化妆,男士护理,眼部护理',508,0),(463,470,475,509,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;身体护理','个护化妆,男士护理,身体护理',509,0),(464,470,475,510,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;男士香水','个护化妆,男士护理,男士香水',510,0),(465,470,475,511,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;剃须护理','个护化妆,男士护理,剃须护理',511,0),(466,470,475,512,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;防脱洗护','个护化妆,男士护理,防脱洗护',512,0),(467,470,475,513,'个护化妆&nbsp;&gt;&nbsp;男士护理&nbsp;&gt;&nbsp;男士唇膏','个护化妆,男士护理,男士唇膏',513,0),(468,470,476,514,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;粉底/遮瑕','个护化妆,魅力彩妆,粉底/遮瑕',514,0),(469,470,476,515,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;腮红','个护化妆,魅力彩妆,腮红',515,0),(470,470,476,516,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;眼影/眼线','个护化妆,魅力彩妆,眼影/眼线',516,0),(471,470,476,517,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;眉笔','个护化妆,魅力彩妆,眉笔',517,0),(472,470,476,518,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;睫毛膏','个护化妆,魅力彩妆,睫毛膏',518,0),(473,470,476,519,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;唇膏唇彩','个护化妆,魅力彩妆,唇膏唇彩',519,0),(474,470,476,520,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;彩妆组合','个护化妆,魅力彩妆,彩妆组合',520,0),(475,470,476,521,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;卸妆','个护化妆,魅力彩妆,卸妆',521,0),(476,470,476,522,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;美甲','个护化妆,魅力彩妆,美甲',522,0),(477,470,476,523,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;彩妆工具','个护化妆,魅力彩妆,彩妆工具',523,0),(478,470,476,524,'个护化妆&nbsp;&gt;&nbsp;魅力彩妆&nbsp;&gt;&nbsp;假发','个护化妆,魅力彩妆,假发',524,0),(479,470,477,525,'个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;女士香水','个护化妆,香水SPA,女士香水',525,0),(480,470,477,526,'个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;男士香水','个护化妆,香水SPA,男士香水',526,0),(481,470,477,527,'个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;组合套装','个护化妆,香水SPA,组合套装',527,0),(482,470,477,528,'个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;迷你香水','个护化妆,香水SPA,迷你香水',528,0),(483,470,477,529,'个护化妆&nbsp;&gt;&nbsp;香水SPA&nbsp;&gt;&nbsp;香体走珠','个护化妆,香水SPA,香体走珠',529,0),(484,530,531,541,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;项链','珠宝手表,时尚饰品,项链',541,0),(485,530,531,542,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;手链/脚链','珠宝手表,时尚饰品,手链/脚链',542,0),(486,530,531,543,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;戒指','珠宝手表,时尚饰品,戒指',543,0),(487,530,531,544,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;耳饰','珠宝手表,时尚饰品,耳饰',544,0),(488,530,531,545,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;头饰','珠宝手表,时尚饰品,头饰',545,0),(489,530,531,546,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;胸针','珠宝手表,时尚饰品,胸针',546,0),(490,530,531,547,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;婚庆饰品','珠宝手表,时尚饰品,婚庆饰品',547,0),(491,530,531,548,'珠宝手表&nbsp;&gt;&nbsp;时尚饰品&nbsp;&gt;&nbsp;饰品配件','珠宝手表,时尚饰品,饰品配件',548,0),(492,530,532,549,'珠宝手表&nbsp;&gt;&nbsp;纯金K金饰品&nbsp;&gt;&nbsp;吊坠/项链','珠宝手表,纯金K金饰品,吊坠/项链',549,0),(493,530,532,550,'珠宝手表&nbsp;&gt;&nbsp;纯金K金饰品&nbsp;&gt;&nbsp;手镯/手链/脚链','珠宝手表,纯金K金饰品,手镯/手链/脚链',550,0),(494,530,532,551,'珠宝手表&nbsp;&gt;&nbsp;纯金K金饰品&nbsp;&gt;&nbsp;戒指','珠宝手表,纯金K金饰品,戒指',551,0),(495,530,532,552,'珠宝手表&nbsp;&gt;&nbsp;纯金K金饰品&nbsp;&gt;&nbsp;耳饰','珠宝手表,纯金K金饰品,耳饰',552,0),(496,530,533,553,'珠宝手表&nbsp;&gt;&nbsp;金银投资&nbsp;&gt;&nbsp;工艺金','珠宝手表,金银投资,工艺金',553,0),(497,530,533,554,'珠宝手表&nbsp;&gt;&nbsp;金银投资&nbsp;&gt;&nbsp;工艺银','珠宝手表,金银投资,工艺银',554,0),(498,530,534,555,'珠宝手表&nbsp;&gt;&nbsp;银饰&nbsp;&gt;&nbsp;吊坠/项链','珠宝手表,银饰,吊坠/项链',555,0),(499,530,534,556,'珠宝手表&nbsp;&gt;&nbsp;银饰&nbsp;&gt;&nbsp;手镯/手链/脚链','珠宝手表,银饰,手镯/手链/脚链',556,0),(500,530,534,557,'珠宝手表&nbsp;&gt;&nbsp;银饰&nbsp;&gt;&nbsp;戒指/耳饰','珠宝手表,银饰,戒指/耳饰',557,0),(501,530,534,558,'珠宝手表&nbsp;&gt;&nbsp;银饰&nbsp;&gt;&nbsp;宝宝金银','珠宝手表,银饰,宝宝金银',558,0),(502,530,534,559,'珠宝手表&nbsp;&gt;&nbsp;银饰&nbsp;&gt;&nbsp;千足银','珠宝手表,银饰,千足银',559,0),(503,530,535,560,'珠宝手表&nbsp;&gt;&nbsp;钻石饰品&nbsp;&gt;&nbsp;裸钻','珠宝手表,钻石饰品,裸钻',560,0),(504,530,535,561,'珠宝手表&nbsp;&gt;&nbsp;钻石饰品&nbsp;&gt;&nbsp;戒指','珠宝手表,钻石饰品,戒指',561,0),(505,530,535,563,'珠宝手表&nbsp;&gt;&nbsp;钻石饰品&nbsp;&gt;&nbsp;项链/吊坠','珠宝手表,钻石饰品,项链/吊坠',563,0),(506,530,535,564,'珠宝手表&nbsp;&gt;&nbsp;钻石饰品&nbsp;&gt;&nbsp;耳饰','珠宝手表,钻石饰品,耳饰',564,0),(507,530,535,565,'珠宝手表&nbsp;&gt;&nbsp;钻石饰品&nbsp;&gt;&nbsp;手镯/手链','珠宝手表,钻石饰品,手镯/手链',565,0),(508,530,536,566,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;项链/吊坠','珠宝手表,翡翠玉石,项链/吊坠',566,0),(509,530,536,567,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;手镯/手串','珠宝手表,翡翠玉石,手镯/手串',567,0),(510,530,536,568,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;戒指','珠宝手表,翡翠玉石,戒指',568,0),(511,530,536,569,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;耳饰','珠宝手表,翡翠玉石,耳饰',569,0),(512,530,536,570,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;挂件/摆件/把件','珠宝手表,翡翠玉石,挂件/摆件/把件',570,0),(513,530,536,571,'珠宝手表&nbsp;&gt;&nbsp;翡翠玉石&nbsp;&gt;&nbsp;高值收藏','珠宝手表,翡翠玉石,高值收藏',571,0),(514,530,537,572,'珠宝手表&nbsp;&gt;&nbsp;水晶玛瑙&nbsp;&gt;&nbsp;耳饰','珠宝手表,水晶玛瑙,耳饰',572,0),(515,530,537,573,'珠宝手表&nbsp;&gt;&nbsp;水晶玛瑙&nbsp;&gt;&nbsp;手镯/手链/脚链','珠宝手表,水晶玛瑙,手镯/手链/脚链',573,0),(516,530,537,574,'珠宝手表&nbsp;&gt;&nbsp;水晶玛瑙&nbsp;&gt;&nbsp;戒指','珠宝手表,水晶玛瑙,戒指',574,0),(517,530,537,575,'珠宝手表&nbsp;&gt;&nbsp;水晶玛瑙&nbsp;&gt;&nbsp;头饰/胸针','珠宝手表,水晶玛瑙,头饰/胸针',575,0),(518,530,537,576,'珠宝手表&nbsp;&gt;&nbsp;水晶玛瑙&nbsp;&gt;&nbsp;摆件/挂件','珠宝手表,水晶玛瑙,摆件/挂件',576,0),(519,530,538,577,'珠宝手表&nbsp;&gt;&nbsp;宝石珍珠&nbsp;&gt;&nbsp;项链/吊坠','珠宝手表,宝石珍珠,项链/吊坠',577,0),(520,530,538,578,'珠宝手表&nbsp;&gt;&nbsp;宝石珍珠&nbsp;&gt;&nbsp;耳饰','珠宝手表,宝石珍珠,耳饰',578,0),(521,530,538,579,'珠宝手表&nbsp;&gt;&nbsp;宝石珍珠&nbsp;&gt;&nbsp;手镯/手链','珠宝手表,宝石珍珠,手镯/手链',579,0),(522,530,538,580,'珠宝手表&nbsp;&gt;&nbsp;宝石珍珠&nbsp;&gt;&nbsp;戒指','珠宝手表,宝石珍珠,戒指',580,0),(523,530,539,581,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚嫁首饰','珠宝手表,婚庆,婚嫁首饰',581,0),(524,530,539,582,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚纱摄影','珠宝手表,婚庆,婚纱摄影',582,0),(525,530,539,583,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚纱礼服','珠宝手表,婚庆,婚纱礼服',583,0),(526,530,539,584,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚庆服务','珠宝手表,婚庆,婚庆服务',584,0),(527,530,539,585,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚庆礼品/用品','珠宝手表,婚庆,婚庆礼品/用品',585,0),(528,530,539,586,'珠宝手表&nbsp;&gt;&nbsp;婚庆&nbsp;&gt;&nbsp;婚宴','珠宝手表,婚庆,婚宴',586,0),(529,530,540,587,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;瑞士品牌','珠宝手表,钟表手表,瑞士品牌',587,0),(530,530,540,588,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;国产品牌','珠宝手表,钟表手表,国产品牌',588,0),(531,530,540,589,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;日本品牌','珠宝手表,钟表手表,日本品牌',589,0),(532,530,540,590,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;时尚品牌','珠宝手表,钟表手表,时尚品牌',590,0),(533,530,540,591,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;闹钟挂钟','珠宝手表,钟表手表,闹钟挂钟',591,0),(534,530,540,592,'珠宝手表&nbsp;&gt;&nbsp;钟表手表&nbsp;&gt;&nbsp;儿童手表','珠宝手表,钟表手表,儿童手表',592,0),(535,593,594,604,'食品饮料&nbsp;&gt;&nbsp;进口食品&nbsp;&gt;&nbsp;饼干蛋糕','食品饮料,进口食品,饼干蛋糕',604,0),(536,593,594,605,'食品饮料&nbsp;&gt;&nbsp;进口食品&nbsp;&gt;&nbsp;糖果巧克力','食品饮料,进口食品,糖果巧克力',605,0),(537,593,594,606,'食品饮料&nbsp;&gt;&nbsp;进口食品&nbsp;&gt;&nbsp;休闲零食','食品饮料,进口食品,休闲零食',606,0),(538,593,594,607,'食品饮料&nbsp;&gt;&nbsp;进口食品&nbsp;&gt;&nbsp;冲调饮品','食品饮料,进口食品,冲调饮品',607,0),(539,593,594,608,'食品饮料&nbsp;&gt;&nbsp;进口食品&nbsp;&gt;&nbsp;粮油调味','食品饮料,进口食品,粮油调味',608,0),(540,593,595,609,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;华北','食品饮料,地方特产,华北',609,0),(541,593,595,610,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;西北','食品饮料,地方特产,西北',610,0),(542,593,595,611,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;西南','食品饮料,地方特产,西南',611,0),(543,593,595,612,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;东北','食品饮料,地方特产,东北',612,0),(544,593,595,613,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;华南','食品饮料,地方特产,华南',613,0),(545,593,595,614,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;华东','食品饮料,地方特产,华东',614,0),(546,593,595,615,'食品饮料&nbsp;&gt;&nbsp;地方特产&nbsp;&gt;&nbsp;华中','食品饮料,地方特产,华中',615,0),(547,593,596,616,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;休闲零食','食品饮料,休闲食品,休闲零食',616,0),(548,593,596,617,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;坚果炒货','食品饮料,休闲食品,坚果炒货',617,0),(549,593,596,618,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;肉干肉松','食品饮料,休闲食品,肉干肉松',618,0),(550,593,596,619,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;蜜饯果脯','食品饮料,休闲食品,蜜饯果脯',619,0),(551,593,596,620,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;糖果/巧克力','食品饮料,休闲食品,糖果/巧克力',620,0),(552,593,596,621,'食品饮料&nbsp;&gt;&nbsp;休闲食品&nbsp;&gt;&nbsp;饼干蛋糕','食品饮料,休闲食品,饼干蛋糕',621,0),(553,593,597,622,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;米面杂粮','食品饮料,粮油调味,米面杂粮',622,0),(554,593,597,623,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;食用油','食品饮料,粮油调味,食用油',623,0),(555,593,597,624,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;调味品','食品饮料,粮油调味,调味品',624,0),(556,593,597,625,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;南北干货','食品饮料,粮油调味,南北干货',625,0),(557,593,597,626,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;方便食品','食品饮料,粮油调味,方便食品',626,0),(558,593,597,627,'食品饮料&nbsp;&gt;&nbsp;粮油调味&nbsp;&gt;&nbsp;有机食品','食品饮料,粮油调味,有机食品',627,0),(559,593,598,628,'食品饮料&nbsp;&gt;&nbsp;中外名酒&nbsp;&gt;&nbsp;白酒','食品饮料,中外名酒,白酒',628,0),(560,593,598,629,'食品饮料&nbsp;&gt;&nbsp;中外名酒&nbsp;&gt;&nbsp;洋酒','食品饮料,中外名酒,洋酒',629,0),(561,593,598,630,'食品饮料&nbsp;&gt;&nbsp;中外名酒&nbsp;&gt;&nbsp;葡萄酒','食品饮料,中外名酒,葡萄酒',630,0),(562,593,598,631,'食品饮料&nbsp;&gt;&nbsp;中外名酒&nbsp;&gt;&nbsp;啤酒','食品饮料,中外名酒,啤酒',631,0),(563,593,598,632,'食品饮料&nbsp;&gt;&nbsp;中外名酒&nbsp;&gt;&nbsp;黄酒','食品饮料,中外名酒,黄酒',632,0),(564,593,599,633,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;水','食品饮料,饮料冲调,水',633,0),(565,593,599,634,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;饮料','食品饮料,饮料冲调,饮料',634,0),(566,593,599,635,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;牛奶','食品饮料,饮料冲调,牛奶',635,0),(567,593,599,636,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;茶叶','食品饮料,饮料冲调,茶叶',636,0),(568,593,599,637,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;咖啡/奶茶','食品饮料,饮料冲调,咖啡/奶茶',637,0),(569,593,599,638,'食品饮料&nbsp;&gt;&nbsp;饮料冲调&nbsp;&gt;&nbsp;冲饮谷物','食品饮料,饮料冲调,冲饮谷物',638,0),(570,593,600,639,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;基础营养','食品饮料,营养健康,基础营养',639,0),(571,593,600,640,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;美体养颜','食品饮料,营养健康,美体养颜',640,0),(572,593,600,641,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;滋补调养','食品饮料,营养健康,滋补调养',641,0),(573,593,600,642,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;骨骼健康','食品饮料,营养健康,骨骼健康',642,0),(574,593,600,643,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;保健茶饮','食品饮料,营养健康,保健茶饮',643,0),(575,593,600,644,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;成分保健','食品饮料,营养健康,成分保健',644,0),(576,593,600,645,'食品饮料&nbsp;&gt;&nbsp;营养健康&nbsp;&gt;&nbsp;无糖食品','食品饮料,营养健康,无糖食品',645,0),(577,593,601,646,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;调节三高','食品饮料,亚健康调理,调节三高',646,0),(578,593,601,647,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;心脑养护','食品饮料,亚健康调理,心脑养护',647,0),(579,593,601,648,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;改善睡眠','食品饮料,亚健康调理,改善睡眠',648,0),(580,593,601,649,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;肝肾养护','食品饮料,亚健康调理,肝肾养护',649,0),(581,593,601,650,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;免疫调节','食品饮料,亚健康调理,免疫调节',650,0),(582,593,601,651,'食品饮料&nbsp;&gt;&nbsp;亚健康调理&nbsp;&gt;&nbsp;更多调理','食品饮料,亚健康调理,更多调理',651,0),(583,593,602,652,'食品饮料&nbsp;&gt;&nbsp;健康礼品&nbsp;&gt;&nbsp;参茸礼品','食品饮料,健康礼品,参茸礼品',652,0),(584,593,602,653,'食品饮料&nbsp;&gt;&nbsp;健康礼品&nbsp;&gt;&nbsp;更多礼品','食品饮料,健康礼品,更多礼品',653,0),(585,593,603,654,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;水果','食品饮料,生鲜食品,水果',654,0),(586,593,603,655,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;蔬菜','食品饮料,生鲜食品,蔬菜',655,0),(587,593,603,656,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;海鲜水产','食品饮料,生鲜食品,海鲜水产',656,0),(588,593,603,657,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;禽蛋','食品饮料,生鲜食品,禽蛋',657,0),(589,593,603,658,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;鲜肉','食品饮料,生鲜食品,鲜肉',658,0),(590,593,603,659,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;加工类肉食','食品饮料,生鲜食品,加工类肉食',659,0),(591,593,603,660,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;冻品','食品饮料,生鲜食品,冻品',660,0),(592,593,603,661,'食品饮料&nbsp;&gt;&nbsp;生鲜食品&nbsp;&gt;&nbsp;半成品','食品饮料,生鲜食品,半成品',661,0),(593,662,663,671,'运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外服装','运动健康,户外鞋服,户外服装',671,0),(594,662,663,672,'运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外鞋袜','运动健康,户外鞋服,户外鞋袜',672,0),(595,662,663,673,'运动健康&nbsp;&gt;&nbsp;户外鞋服&nbsp;&gt;&nbsp;户外配饰','运动健康,户外鞋服,户外配饰',673,0),(596,662,664,674,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;帐篷','运动健康,户外装备,帐篷',674,0),(597,662,664,675,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;睡袋','运动健康,户外装备,睡袋',675,0),(598,662,664,676,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;登山攀岩','运动健康,户外装备,登山攀岩',676,0),(599,662,664,677,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外背包','运动健康,户外装备,户外背包',677,0),(600,662,664,678,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外照明','运动健康,户外装备,户外照明',678,0),(601,662,664,679,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外垫子','运动健康,户外装备,户外垫子',679,0),(602,662,664,680,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外仪表','运动健康,户外装备,户外仪表',680,0),(603,662,664,681,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;户外工具','运动健康,户外装备,户外工具',681,0),(604,662,664,682,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;望远镜','运动健康,户外装备,望远镜',682,0),(605,662,664,683,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;垂钓用品','运动健康,户外装备,垂钓用品',683,0),(606,662,664,684,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;旅游用品','运动健康,户外装备,旅游用品',684,0),(607,662,664,685,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;便携桌椅床','运动健康,户外装备,便携桌椅床',685,0),(608,662,664,686,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;烧烤用品','运动健康,户外装备,烧烤用品',686,0),(609,662,664,687,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;野餐炊具','运动健康,户外装备,野餐炊具',687,0),(610,662,664,688,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;军迷用品','运动健康,户外装备,军迷用品',688,0),(611,662,664,689,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;游泳用具','运动健康,户外装备,游泳用具',689,0),(612,662,664,690,'运动健康&nbsp;&gt;&nbsp;户外装备&nbsp;&gt;&nbsp;泳衣','运动健康,户外装备,泳衣',690,0),(613,662,665,691,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;健身器械','运动健康,运动器械,健身器械',691,0),(614,662,665,692,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;运动器材','运动健康,运动器械,运动器材',692,0),(615,662,665,693,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;极限轮滑','运动健康,运动器械,极限轮滑',693,0),(616,662,665,694,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;骑行运动','运动健康,运动器械,骑行运动',694,0),(617,662,665,695,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;运动护具','运动健康,运动器械,运动护具',695,0),(618,662,665,696,'运动健康&nbsp;&gt;&nbsp;运动器械&nbsp;&gt;&nbsp;武术搏击','运动健康,运动器械,武术搏击',696,0),(619,662,666,697,'运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽垫','运动健康,纤体瑜伽,瑜伽垫',697,0),(620,662,666,698,'运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽服','运动健康,纤体瑜伽,瑜伽服',698,0),(621,662,666,699,'运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽配件','运动健康,纤体瑜伽,瑜伽配件',699,0),(622,662,666,700,'运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;瑜伽套装','运动健康,纤体瑜伽,瑜伽套装',700,0),(623,662,666,701,'运动健康&nbsp;&gt;&nbsp;纤体瑜伽&nbsp;&gt;&nbsp;舞蹈鞋服','运动健康,纤体瑜伽,舞蹈鞋服',701,0),(624,662,667,702,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;羽毛球','运动健康,体育娱乐,羽毛球',702,0),(625,662,667,703,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;乒乓球','运动健康,体育娱乐,乒乓球',703,0),(626,662,667,704,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;篮球','运动健康,体育娱乐,篮球',704,0),(627,662,667,705,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;足球','运动健康,体育娱乐,足球',705,0),(628,662,667,706,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;网球','运动健康,体育娱乐,网球',706,0),(629,662,667,707,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;排球','运动健康,体育娱乐,排球',707,0),(630,662,667,708,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;高尔夫球','运动健康,体育娱乐,高尔夫球',708,0),(631,662,667,709,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;棋牌麻将','运动健康,体育娱乐,棋牌麻将',709,0),(632,662,667,710,'运动健康&nbsp;&gt;&nbsp;体育娱乐&nbsp;&gt;&nbsp;其他','运动健康,体育娱乐,其他',710,0),(633,662,668,711,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;安全避孕','运动健康,成人用品,安全避孕',711,0),(634,662,668,712,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;验孕测孕','运动健康,成人用品,验孕测孕',712,0),(635,662,668,713,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;人体润滑','运动健康,成人用品,人体润滑',713,0),(636,662,668,714,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;情爱玩具','运动健康,成人用品,情爱玩具',714,0),(637,662,668,715,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;情趣内衣','运动健康,成人用品,情趣内衣',715,0),(638,662,668,716,'运动健康&nbsp;&gt;&nbsp;成人用品&nbsp;&gt;&nbsp;组合套装','运动健康,成人用品,组合套装',716,0),(639,662,669,717,'运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;养生器械','运动健康,保健器械,养生器械',717,0),(640,662,669,718,'运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;保健用品','运动健康,保健器械,保健用品',718,0),(641,662,669,719,'运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;康复辅助','运动健康,保健器械,康复辅助',719,0),(642,662,669,720,'运动健康&nbsp;&gt;&nbsp;保健器械&nbsp;&gt;&nbsp;家庭护理','运动健康,保健器械,家庭护理',720,0),(643,662,670,721,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;跌打损伤','运动健康,急救卫生,跌打损伤',721,0),(644,662,670,722,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;烫伤止痒','运动健康,急救卫生,烫伤止痒',722,0),(645,662,670,723,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;防裂抗冻','运动健康,急救卫生,防裂抗冻',723,0),(646,662,670,724,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;口腔咽部','运动健康,急救卫生,口腔咽部',724,0),(647,662,670,725,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;眼部保健','运动健康,急救卫生,眼部保健',725,0),(648,662,670,726,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;鼻炎健康','运动健康,急救卫生,鼻炎健康',726,0),(649,662,670,727,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;风湿骨痛','运动健康,急救卫生,风湿骨痛',727,0),(650,662,670,728,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;生殖泌尿','运动健康,急救卫生,生殖泌尿',728,0),(651,662,670,729,'运动健康&nbsp;&gt;&nbsp;急救卫生&nbsp;&gt;&nbsp;美体塑身','运动健康,急救卫生,美体塑身',729,0),(652,730,731,738,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;便携GPS导航','汽车用品,电子电器,便携GPS导航',738,0),(653,730,731,739,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;嵌入式导航','汽车用品,电子电器,嵌入式导航',739,0),(654,730,731,740,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;安全预警仪','汽车用品,电子电器,安全预警仪',740,0),(655,730,731,741,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;行车记录仪','汽车用品,电子电器,行车记录仪',741,0),(656,730,731,742,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;跟踪防盗器','汽车用品,电子电器,跟踪防盗器',742,0),(657,730,731,743,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;倒车雷达','汽车用品,电子电器,倒车雷达',743,0),(658,730,731,744,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载电源','汽车用品,电子电器,车载电源',744,0),(659,730,731,745,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载蓝牙','汽车用品,电子电器,车载蓝牙',745,0),(660,730,731,746,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载影音','汽车用品,电子电器,车载影音',746,0),(661,730,731,747,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载净化器','汽车用品,电子电器,车载净化器',747,0),(662,730,731,748,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载冰箱','汽车用品,电子电器,车载冰箱',748,0),(663,730,731,749,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载吸尘器','汽车用品,电子电器,车载吸尘器',749,0),(664,730,731,750,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;充气泵','汽车用品,电子电器,充气泵',750,0),(665,730,731,751,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;胎压监测','汽车用品,电子电器,胎压监测',751,0),(666,730,731,752,'汽车用品&nbsp;&gt;&nbsp;电子电器&nbsp;&gt;&nbsp;车载生活电器','汽车用品,电子电器,车载生活电器',752,0),(667,730,732,753,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;机油','汽车用品,系统养护,机油',753,0),(668,730,732,754,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;添加剂','汽车用品,系统养护,添加剂',754,0),(669,730,732,755,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;防冻冷却液','汽车用品,系统养护,防冻冷却液',755,0),(670,730,732,756,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;附属油','汽车用品,系统养护,附属油',756,0),(671,730,732,757,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;底盘装甲','汽车用品,系统养护,底盘装甲',757,0),(672,730,732,758,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;空调清洗剂','汽车用品,系统养护,空调清洗剂',758,0),(673,730,732,759,'汽车用品&nbsp;&gt;&nbsp;系统养护&nbsp;&gt;&nbsp;金属养护','汽车用品,系统养护,金属养护',759,0),(674,730,733,760,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;雨刷','汽车用品,改装配件,雨刷',760,0),(675,730,733,761,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;车灯','汽车用品,改装配件,车灯',761,0),(676,730,733,762,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;轮胎','汽车用品,改装配件,轮胎',762,0),(677,730,733,763,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;贴膜','汽车用品,改装配件,贴膜',763,0),(678,730,733,764,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;装饰贴','汽车用品,改装配件,装饰贴',764,0),(679,730,733,765,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;后视镜','汽车用品,改装配件,后视镜',765,0),(680,730,733,766,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;机油滤','汽车用品,改装配件,机油滤',766,0),(681,730,733,767,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;空气滤','汽车用品,改装配件,空气滤',767,0),(682,730,733,768,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;空调滤','汽车用品,改装配件,空调滤',768,0),(683,730,733,769,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;燃油滤','汽车用品,改装配件,燃油滤',769,0),(684,730,733,770,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;火花塞','汽车用品,改装配件,火花塞',770,0),(685,730,733,771,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;喇叭','汽车用品,改装配件,喇叭',771,0),(686,730,733,772,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;刹车片','汽车用品,改装配件,刹车片',772,0),(687,730,733,773,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;刹车盘','汽车用品,改装配件,刹车盘',773,0),(688,730,733,774,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;减震器','汽车用品,改装配件,减震器',774,0),(689,730,733,775,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;车身装饰','汽车用品,改装配件,车身装饰',775,0),(690,730,733,776,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;尾喉/排气管','汽车用品,改装配件,尾喉/排气管',776,0),(691,730,733,777,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;踏板','汽车用品,改装配件,踏板',777,0),(692,730,733,778,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;蓄电池','汽车用品,改装配件,蓄电池',778,0),(693,730,733,779,'汽车用品&nbsp;&gt;&nbsp;改装配件&nbsp;&gt;&nbsp;其他配件','汽车用品,改装配件,其他配件',779,0),(694,730,734,780,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;漆面美容','汽车用品,汽车美容,漆面美容',780,0),(695,730,734,781,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;漆面修复','汽车用品,汽车美容,漆面修复',781,0),(696,730,734,782,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;内饰清洁','汽车用品,汽车美容,内饰清洁',782,0),(697,730,734,783,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;玻璃美容','汽车用品,汽车美容,玻璃美容',783,0),(698,730,734,784,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;补漆笔','汽车用品,汽车美容,补漆笔',784,0),(699,730,734,785,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;轮胎轮毂清洗','汽车用品,汽车美容,轮胎轮毂清洗',785,0),(700,730,734,786,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车器','汽车用品,汽车美容,洗车器',786,0),(701,730,734,787,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车水枪','汽车用品,汽车美容,洗车水枪',787,0),(702,730,734,788,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车配件','汽车用品,汽车美容,洗车配件',788,0),(703,730,734,789,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;洗车液','汽车用品,汽车美容,洗车液',789,0),(704,730,734,790,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;车掸','汽车用品,汽车美容,车掸',790,0),(705,730,734,791,'汽车用品&nbsp;&gt;&nbsp;汽车美容&nbsp;&gt;&nbsp;擦车巾/海绵','汽车用品,汽车美容,擦车巾/海绵',791,0),(706,730,735,792,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;凉垫','汽车用品,座垫脚垫,凉垫',792,0),(707,730,735,793,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;四季垫','汽车用品,座垫脚垫,四季垫',793,0),(708,730,735,794,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;毛垫','汽车用品,座垫脚垫,毛垫',794,0),(709,730,735,795,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用座垫','汽车用品,座垫脚垫,专车专用座垫',795,0),(710,730,735,796,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用座套','汽车用品,座垫脚垫,专车专用座套',796,0),(711,730,735,797,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;通用座套','汽车用品,座垫脚垫,通用座套',797,0),(712,730,735,798,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;多功能垫','汽车用品,座垫脚垫,多功能垫',798,0),(713,730,735,799,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;专车专用脚垫','汽车用品,座垫脚垫,专车专用脚垫',799,0),(714,730,735,800,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;通用脚垫','汽车用品,座垫脚垫,通用脚垫',800,0),(715,730,735,801,'汽车用品&nbsp;&gt;&nbsp;座垫脚垫&nbsp;&gt;&nbsp;后备箱垫','汽车用品,座垫脚垫,后备箱垫',801,0),(716,730,736,802,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;车用香水','汽车用品,内饰精品,车用香水',802,0),(717,730,736,803,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;车用炭包','汽车用品,内饰精品,车用炭包',803,0),(718,730,736,804,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;空气净化','汽车用品,内饰精品,空气净化',804,0),(719,730,736,805,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;颈枕/头枕','汽车用品,内饰精品,颈枕/头枕',805,0),(720,730,736,806,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;抱枕/腰靠','汽车用品,内饰精品,抱枕/腰靠',806,0),(721,730,736,807,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;方向盘套','汽车用品,内饰精品,方向盘套',807,0),(722,730,736,808,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;挂件','汽车用品,内饰精品,挂件',808,0),(723,730,736,809,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;摆件','汽车用品,内饰精品,摆件',809,0),(724,730,736,810,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;布艺软饰','汽车用品,内饰精品,布艺软饰',810,0),(725,730,736,811,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;功能用品','汽车用品,内饰精品,功能用品',811,0),(726,730,736,812,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;整理收纳','汽车用品,内饰精品,整理收纳',812,0),(727,730,736,813,'汽车用品&nbsp;&gt;&nbsp;内饰精品&nbsp;&gt;&nbsp;CD夹','汽车用品,内饰精品,CD夹',813,0),(728,730,737,814,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;儿童安全座椅','汽车用品,安全自驾,儿童安全座椅',814,0),(729,730,737,815,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;应急救援','汽车用品,安全自驾,应急救援',815,0),(730,730,737,816,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;汽修工具','汽车用品,安全自驾,汽修工具',816,0),(731,730,737,817,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;自驾野营','汽车用品,安全自驾,自驾野营',817,0),(732,730,737,818,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;自驾照明','汽车用品,安全自驾,自驾照明',818,0),(733,730,737,819,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;保温箱','汽车用品,安全自驾,保温箱',819,0),(734,730,737,820,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;置物箱','汽车用品,安全自驾,置物箱',820,0),(735,730,737,821,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;车衣','汽车用品,安全自驾,车衣',821,0),(736,730,737,822,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;遮阳挡雪挡','汽车用品,安全自驾,遮阳挡雪挡',822,0),(737,730,737,823,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;车锁地锁','汽车用品,安全自驾,车锁地锁',823,0),(738,730,737,824,'汽车用品&nbsp;&gt;&nbsp;安全自驾&nbsp;&gt;&nbsp;摩托车装备','汽车用品,安全自驾,摩托车装备',824,0),(739,730,1054,1055,'汽车用品&nbsp;&gt;&nbsp;整车&nbsp;&gt;&nbsp;新车','汽车用品,整车,新车',1055,0),(740,730,1054,1056,'汽车用品&nbsp;&gt;&nbsp;整车&nbsp;&gt;&nbsp;二手车','汽车用品,整车,二手车',1056,0),(741,825,826,838,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;0-6个月','玩具乐器,适用年龄,0-6个月',838,0),(742,825,826,839,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;6-12个月','玩具乐器,适用年龄,6-12个月',839,0),(743,825,826,840,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;1-3岁','玩具乐器,适用年龄,1-3岁',840,0),(744,825,826,841,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;3-6岁','玩具乐器,适用年龄,3-6岁',841,0),(745,825,826,842,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;6-14岁','玩具乐器,适用年龄,6-14岁',842,0),(746,825,826,843,'玩具乐器&nbsp;&gt;&nbsp;适用年龄&nbsp;&gt;&nbsp;14岁以上','玩具乐器,适用年龄,14岁以上',843,0),(747,825,827,844,'玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控车','玩具乐器,遥控/电动,遥控车',844,0),(748,825,827,845,'玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控飞机','玩具乐器,遥控/电动,遥控飞机',845,0),(749,825,827,846,'玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;遥控船','玩具乐器,遥控/电动,遥控船',846,0),(750,825,827,847,'玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;机器人/电动','玩具乐器,遥控/电动,机器人/电动',847,0),(751,825,827,848,'玩具乐器&nbsp;&gt;&nbsp;遥控/电动&nbsp;&gt;&nbsp;轨道/助力','玩具乐器,遥控/电动,轨道/助力',848,0),(752,825,828,849,'玩具乐器&nbsp;&gt;&nbsp;毛绒布艺&nbsp;&gt;&nbsp;毛绒/布艺','玩具乐器,毛绒布艺,毛绒/布艺',849,0),(753,825,828,850,'玩具乐器&nbsp;&gt;&nbsp;毛绒布艺&nbsp;&gt;&nbsp;靠垫/抱枕','玩具乐器,毛绒布艺,靠垫/抱枕',850,0),(754,825,829,851,'玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;芭比娃娃','玩具乐器,娃娃玩具,芭比娃娃',851,0),(755,825,829,852,'玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;卡通娃娃','玩具乐器,娃娃玩具,卡通娃娃',852,0),(756,825,829,853,'玩具乐器&nbsp;&gt;&nbsp;娃娃玩具&nbsp;&gt;&nbsp;智能娃娃','玩具乐器,娃娃玩具,智能娃娃',853,0),(757,825,830,854,'玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;仿真模型','玩具乐器,模型玩具,仿真模型',854,0),(758,825,830,855,'玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;拼插模型','玩具乐器,模型玩具,拼插模型',855,0),(759,825,830,856,'玩具乐器&nbsp;&gt;&nbsp;模型玩具&nbsp;&gt;&nbsp;收藏爱好','玩具乐器,模型玩具,收藏爱好',856,0),(760,825,831,857,'玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;炫舞毯','玩具乐器,健身玩具,炫舞毯',857,0),(761,825,831,858,'玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;爬行垫/毯','玩具乐器,健身玩具,爬行垫/毯',858,0),(762,825,831,859,'玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;户外玩具','玩具乐器,健身玩具,户外玩具',859,0),(763,825,831,860,'玩具乐器&nbsp;&gt;&nbsp;健身玩具&nbsp;&gt;&nbsp;戏水玩具','玩具乐器,健身玩具,戏水玩具',860,0),(764,825,832,861,'玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;电影周边','玩具乐器,动漫玩具,电影周边',861,0),(765,825,832,862,'玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;卡通周边','玩具乐器,动漫玩具,卡通周边',862,0),(766,825,832,863,'玩具乐器&nbsp;&gt;&nbsp;动漫玩具&nbsp;&gt;&nbsp;网游周边','玩具乐器,动漫玩具,网游周边',863,0),(767,825,833,864,'玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;摇铃/床铃','玩具乐器,益智玩具,摇铃/床铃',864,0),(768,825,833,865,'玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;健身架','玩具乐器,益智玩具,健身架',865,0),(769,825,833,866,'玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;早教启智','玩具乐器,益智玩具,早教启智',866,0),(770,825,833,867,'玩具乐器&nbsp;&gt;&nbsp;益智玩具&nbsp;&gt;&nbsp;拖拉玩具','玩具乐器,益智玩具,拖拉玩具',867,0),(771,825,834,868,'玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;积木','玩具乐器,积木拼插,积木',868,0),(772,825,834,869,'玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;拼图','玩具乐器,积木拼插,拼图',869,0),(773,825,834,870,'玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;磁力棒','玩具乐器,积木拼插,磁力棒',870,0),(774,825,834,871,'玩具乐器&nbsp;&gt;&nbsp;积木拼插&nbsp;&gt;&nbsp;立体拼插','玩具乐器,积木拼插,立体拼插',871,0),(775,825,835,872,'玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;手工彩泥','玩具乐器,DIY玩具,手工彩泥',872,0),(776,825,835,873,'玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;绘画工具','玩具乐器,DIY玩具,绘画工具',873,0),(777,825,835,874,'玩具乐器&nbsp;&gt;&nbsp;DIY玩具&nbsp;&gt;&nbsp;情景玩具','玩具乐器,DIY玩具,情景玩具',874,0),(778,825,836,875,'玩具乐器&nbsp;&gt;&nbsp;创意减压&nbsp;&gt;&nbsp;减压玩具','玩具乐器,创意减压,减压玩具',875,0),(779,825,836,876,'玩具乐器&nbsp;&gt;&nbsp;创意减压&nbsp;&gt;&nbsp;创意玩具','玩具乐器,创意减压,创意玩具',876,0),(780,825,837,877,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;钢琴','玩具乐器,乐器相关,钢琴',877,0),(781,825,837,878,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;电子琴','玩具乐器,乐器相关,电子琴',878,0),(782,825,837,879,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;手风琴','玩具乐器,乐器相关,手风琴',879,0),(783,825,837,880,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;吉他/贝斯','玩具乐器,乐器相关,吉他/贝斯',880,0),(784,825,837,881,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;民族管弦乐器','玩具乐器,乐器相关,民族管弦乐器',881,0),(785,825,837,882,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;西洋管弦乐','玩具乐器,乐器相关,西洋管弦乐',882,0),(786,825,837,883,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;口琴/口风琴/竖笛','玩具乐器,乐器相关,口琴/口风琴/竖笛',883,0),(787,825,837,884,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;西洋打击乐器','玩具乐器,乐器相关,西洋打击乐器',884,0),(788,825,837,885,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;各式乐器配件','玩具乐器,乐器相关,各式乐器配件',885,0),(789,825,837,886,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;电脑音乐','玩具乐器,乐器相关,电脑音乐',886,0),(790,825,837,887,'玩具乐器&nbsp;&gt;&nbsp;乐器相关&nbsp;&gt;&nbsp;工艺礼品乐器','玩具乐器,乐器相关,工艺礼品乐器',887,0),(791,888,889,895,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;炒锅','厨具,烹饪锅具,炒锅',895,0),(792,888,889,896,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;煎锅','厨具,烹饪锅具,煎锅',896,0),(793,888,889,897,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;压力锅','厨具,烹饪锅具,压力锅',897,0),(794,888,889,898,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;蒸锅','厨具,烹饪锅具,蒸锅',898,0),(795,888,889,899,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;汤锅','厨具,烹饪锅具,汤锅',899,0),(796,888,889,900,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;奶锅','厨具,烹饪锅具,奶锅',900,0),(797,888,889,901,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;套锅','厨具,烹饪锅具,套锅',901,0),(798,888,889,902,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;煲类','厨具,烹饪锅具,煲类',902,0),(799,888,889,903,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;水壶','厨具,烹饪锅具,水壶',903,0),(800,888,889,904,'厨具&nbsp;&gt;&nbsp;烹饪锅具&nbsp;&gt;&nbsp;厨用杂件','厨具,烹饪锅具,厨用杂件',904,0),(801,888,890,905,'厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;单刀','厨具,刀剪菜板,单刀',905,0),(802,888,890,906,'厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;剪刀','厨具,刀剪菜板,剪刀',906,0),(803,888,890,907,'厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;套刀','厨具,刀剪菜板,套刀',907,0),(804,888,890,908,'厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;砧板','厨具,刀剪菜板,砧板',908,0),(805,888,890,909,'厨具&nbsp;&gt;&nbsp;刀剪菜板&nbsp;&gt;&nbsp;刀具配件','厨具,刀剪菜板,刀具配件',909,0),(806,888,891,910,'厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;保鲜盒','厨具,收纳保鲜,保鲜盒',910,0),(807,888,891,911,'厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;保鲜膜/袋','厨具,收纳保鲜,保鲜膜/袋',911,0),(808,888,891,912,'厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;调料器皿','厨具,收纳保鲜,调料器皿',912,0),(809,888,891,913,'厨具&nbsp;&gt;&nbsp;收纳保鲜&nbsp;&gt;&nbsp;饭盒/提锅','厨具,收纳保鲜,饭盒/提锅',913,0),(810,888,892,914,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;塑料杯','厨具,水具酒具,塑料杯',914,0),(811,888,892,915,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;运动水壶','厨具,水具酒具,运动水壶',915,0),(812,888,892,916,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;玻璃杯','厨具,水具酒具,玻璃杯',916,0),(813,888,892,917,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;陶瓷杯','厨具,水具酒具,陶瓷杯',917,0),(814,888,892,918,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;保温杯','厨具,水具酒具,保温杯',918,0),(815,888,892,919,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;保温壶','厨具,水具酒具,保温壶',919,0),(816,888,892,920,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;酒杯/套装','厨具,水具酒具,酒杯/套装',920,0),(817,888,892,921,'厨具&nbsp;&gt;&nbsp;水具酒具&nbsp;&gt;&nbsp;酒具配件','厨具,水具酒具,酒具配件',921,0),(818,888,893,922,'厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;餐具套装','厨具,餐具,餐具套装',922,0),(819,888,893,923,'厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;碗/碟/盘','厨具,餐具,碗/碟/盘',923,0),(820,888,893,924,'厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;筷勺/刀叉','厨具,餐具,筷勺/刀叉',924,0),(821,888,893,925,'厨具&nbsp;&gt;&nbsp;餐具&nbsp;&gt;&nbsp;一次性餐具','厨具,餐具,一次性餐具',925,0),(822,888,935,936,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;整套茶具','厨具,茶具/咖啡具,整套茶具',936,0),(823,888,935,937,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶杯','厨具,茶具/咖啡具,茶杯',937,0),(824,888,935,938,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶壶','厨具,茶具/咖啡具,茶壶',938,0),(825,888,935,939,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶盘茶托','厨具,茶具/咖啡具,茶盘茶托',939,0),(826,888,935,940,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶叶罐','厨具,茶具/咖啡具,茶叶罐',940,0),(827,888,935,941,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶具配件','厨具,茶具/咖啡具,茶具配件',941,0),(828,888,935,942,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;茶宠摆件','厨具,茶具/咖啡具,茶宠摆件',942,0),(829,888,935,943,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;咖啡具','厨具,茶具/咖啡具,咖啡具',943,0),(830,888,935,944,'厨具&nbsp;&gt;&nbsp;茶具/咖啡具&nbsp;&gt;&nbsp;其他','厨具,茶具/咖啡具,其他',944,0),(831,959,960,968,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;品牌奶粉','母婴用品,奶粉,品牌奶粉',968,0),(832,959,960,969,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;妈妈奶粉','母婴用品,奶粉,妈妈奶粉',969,0),(833,959,960,970,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;1段奶粉','母婴用品,奶粉,1段奶粉',970,0),(834,959,960,971,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;2段奶粉','母婴用品,奶粉,2段奶粉',971,0),(835,959,960,972,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;3段奶粉','母婴用品,奶粉,3段奶粉',972,0),(836,959,960,973,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;4段奶粉','母婴用品,奶粉,4段奶粉',973,0),(837,959,960,974,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;羊奶粉','母婴用品,奶粉,羊奶粉',974,0),(838,959,960,975,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;特殊配方','母婴用品,奶粉,特殊配方',975,0),(839,959,960,976,'母婴用品&nbsp;&gt;&nbsp;奶粉&nbsp;&gt;&nbsp;成人奶粉','母婴用品,奶粉,成人奶粉',976,0),(840,959,961,977,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;婴幼营养','母婴用品,营养辅食,婴幼营养',977,0),(841,959,961,978,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;初乳','母婴用品,营养辅食,初乳',978,0),(842,959,961,979,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;米粉/菜粉','母婴用品,营养辅食,米粉/菜粉',979,0),(843,959,961,980,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;果泥/果汁','母婴用品,营养辅食,果泥/果汁',980,0),(844,959,961,981,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;肉松/饼干','母婴用品,营养辅食,肉松/饼干',981,0),(845,959,961,982,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;辅食','母婴用品,营养辅食,辅食',982,0),(846,959,961,983,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;孕期营养','母婴用品,营养辅食,孕期营养',983,0),(847,959,961,984,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;清火/开胃','母婴用品,营养辅食,清火/开胃',984,0),(848,959,961,985,'母婴用品&nbsp;&gt;&nbsp;营养辅食&nbsp;&gt;&nbsp;面条/粥','母婴用品,营养辅食,面条/粥',985,0),(849,959,962,986,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;品牌尿裤','母婴用品,尿裤湿巾,品牌尿裤',986,0),(850,959,962,987,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;新生儿','母婴用品,尿裤湿巾,新生儿',987,0),(851,959,962,988,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;S号','母婴用品,尿裤湿巾,S号',988,0),(852,959,962,989,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;M号','母婴用品,尿裤湿巾,M号',989,0),(853,959,962,990,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;L号','母婴用品,尿裤湿巾,L号',990,0),(854,959,962,991,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;XL/XXL号','母婴用品,尿裤湿巾,XL/XXL号',991,0),(855,959,962,992,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;裤型尿裤','母婴用品,尿裤湿巾,裤型尿裤',992,0),(856,959,962,993,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;湿巾','母婴用品,尿裤湿巾,湿巾',993,0),(857,959,962,994,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;尿布/尿垫','母婴用品,尿裤湿巾,尿布/尿垫',994,0),(858,959,962,995,'母婴用品&nbsp;&gt;&nbsp;尿裤湿巾&nbsp;&gt;&nbsp;成人尿裤','母婴用品,尿裤湿巾,成人尿裤',995,0),(859,959,963,996,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;奶瓶','母婴用品,喂养用品,奶瓶',996,0),(860,959,963,997,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;奶嘴','母婴用品,喂养用品,奶嘴',997,0),(861,959,963,998,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;吸奶器','母婴用品,喂养用品,吸奶器',998,0),(862,959,963,999,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;暖奶/消毒','母婴用品,喂养用品,暖奶/消毒',999,0),(863,959,963,1000,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;餐具','母婴用品,喂养用品,餐具',1000,0),(864,959,963,1001,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;水具','母婴用品,喂养用品,水具',1001,0),(865,959,963,1002,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;牙胶/安抚','母婴用品,喂养用品,牙胶/安抚',1002,0),(866,959,963,1003,'母婴用品&nbsp;&gt;&nbsp;喂养用品&nbsp;&gt;&nbsp;辅助用品','母婴用品,喂养用品,辅助用品',1003,0),(867,959,964,1004,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;宝宝护肤','母婴用品,洗护用品,宝宝护肤',1004,0),(868,959,964,1005,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;洗浴用品','母婴用品,洗护用品,洗浴用品',1005,0),(869,959,964,1006,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;洗发沐浴','母婴用品,洗护用品,洗发沐浴',1006,0),(870,959,964,1007,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;清洁用品','母婴用品,洗护用品,清洁用品',1007,0),(871,959,964,1008,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;护理用品','母婴用品,洗护用品,护理用品',1008,0),(872,959,964,1009,'母婴用品&nbsp;&gt;&nbsp;洗护用品&nbsp;&gt;&nbsp;妈妈护肤','母婴用品,洗护用品,妈妈护肤',1009,0),(873,959,965,1010,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;婴儿推车','母婴用品,童车童床,婴儿推车',1010,0),(874,959,965,1011,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;餐椅摇椅','母婴用品,童车童床,餐椅摇椅',1011,0),(875,959,965,1012,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;婴儿床','母婴用品,童车童床,婴儿床',1012,0),(876,959,965,1013,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;学步车','母婴用品,童车童床,学步车',1013,0),(877,959,965,1014,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;三轮车','母婴用品,童车童床,三轮车',1014,0),(878,959,965,1015,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;自行车','母婴用品,童车童床,自行车',1015,0),(879,959,965,1016,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;电动车','母婴用品,童车童床,电动车',1016,0),(880,959,965,1017,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;健身车','母婴用品,童车童床,健身车',1017,0),(881,959,965,1018,'母婴用品&nbsp;&gt;&nbsp;童车童床&nbsp;&gt;&nbsp;安全座椅','母婴用品,童车童床,安全座椅',1018,0),(882,959,966,1019,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿外出服','母婴用品,服饰寝居,婴儿外出服',1019,0),(883,959,966,1020,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿内衣','母婴用品,服饰寝居,婴儿内衣',1020,0),(884,959,966,1021,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿礼盒','母婴用品,服饰寝居,婴儿礼盒',1021,0),(885,959,966,1022,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;婴儿鞋帽袜','母婴用品,服饰寝居,婴儿鞋帽袜',1022,0),(886,959,966,1023,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;安全防护','母婴用品,服饰寝居,安全防护',1023,0),(887,959,966,1024,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;家居床品','母婴用品,服饰寝居,家居床品',1024,0),(888,959,966,1025,'母婴用品&nbsp;&gt;&nbsp;服饰寝居&nbsp;&gt;&nbsp;其他','母婴用品,服饰寝居,其他',1025,0),(889,959,967,1026,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;包/背婴带','母婴用品,妈妈专区,包/背婴带',1026,0),(890,959,967,1027,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;妈妈护理','母婴用品,妈妈专区,妈妈护理',1027,0),(891,959,967,1028,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;产后塑身','母婴用品,妈妈专区,产后塑身',1028,0),(892,959,967,1029,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇内衣','母婴用品,妈妈专区,孕妇内衣',1029,0),(893,959,967,1030,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;防辐射服','母婴用品,妈妈专区,防辐射服',1030,0),(894,959,967,1031,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇装','母婴用品,妈妈专区,孕妇装',1031,0),(895,959,967,1032,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;孕妇食品','母婴用品,妈妈专区,孕妇食品',1032,0),(896,959,967,1033,'母婴用品&nbsp;&gt;&nbsp;妈妈专区&nbsp;&gt;&nbsp;妈妈美容','母婴用品,妈妈专区,妈妈美容',1033,0),(897,1037,1041,1044,'虚拟充值&nbsp;&gt;&nbsp;充值&nbsp;&gt;&nbsp;手机充值','虚拟充值,充值,手机充值',1044,0),(898,1037,1042,1045,'虚拟充值&nbsp;&gt;&nbsp;游戏&nbsp;&gt;&nbsp;游戏点卡','虚拟充值,游戏,游戏点卡',1045,0),(899,1037,1042,1046,'虚拟充值&nbsp;&gt;&nbsp;游戏&nbsp;&gt;&nbsp;QQ充值','虚拟充值,游戏,QQ充值',1046,0),(900,1037,1043,1047,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;电影票','虚拟充值,票务,电影票',1047,0),(901,1037,1043,1048,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;演唱会','虚拟充值,票务,演唱会',1048,0),(902,1037,1043,1049,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;话剧/歌剧/音乐剧','虚拟充值,票务,话剧/歌剧/音乐剧',1049,0),(903,1037,1043,1050,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;体育赛事','虚拟充值,票务,体育赛事',1050,0),(904,1037,1043,1051,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;舞蹈芭蕾','虚拟充值,票务,舞蹈芭蕾',1051,0),(905,1037,1043,1052,'虚拟充值&nbsp;&gt;&nbsp;票务&nbsp;&gt;&nbsp;戏曲综艺','虚拟充值,票务,戏曲综艺',1052,0);
/*!40000 ALTER TABLE `pmall_goods_class_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_common`
--

DROP TABLE IF EXISTS `pmall_goods_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_common` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_jingle` varchar(150) DEFAULT '' COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT '' COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) NOT NULL COMMENT '商品主图',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_custom` text NOT NULL COMMENT '商品自定义属性',
  `goods_body` text NOT NULL COMMENT '商品内容',
  `mobile_body` text NOT NULL COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned NOT NULL COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned NOT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_selltime` int(10) unsigned NOT NULL COMMENT '上架时间',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) NOT NULL COMMENT '市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '成本价',
  `goods_discount` float unsigned NOT NULL COMMENT '折扣',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商品货号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL COMMENT '库存报警值',
  `goods_barcode` varchar(20) DEFAULT '' COMMENT '商品条形码',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板',
  `transport_title` varchar(60) DEFAULT '' COMMENT '运费模板名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1是，0否，默认为0',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1是，0否',
  `areaid_1` int(10) unsigned NOT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `goods_stcids` varchar(255) DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1是，0否',
  `virtual_indate` int(10) unsigned DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款， 1是，0否',
  `sup_id` int(11) NOT NULL COMMENT '供应商id',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `manufacturer_id` bigint(20) DEFAULT '0' COMMENT '厂家ID关联pmall_manufacturer表',
  `goods_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品类型，0:未定义,1:药品,2:母婴用品,3:美容护肤,4:保健用品,5:成人用品,6:药膳礼品,7:医药器械,8:其他',
  `drugs_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '药品类型，0:非药品,1:处方药,2:OTC药(非处方)',
  `approval_number` varchar(200) NOT NULL DEFAULT '' COMMENT '批准文号',
  `specifications` varchar(200) NOT NULL DEFAULT '' COMMENT '商品规格',
  PRIMARY KEY (`goods_commonid`)
) ENGINE=InnoDB AUTO_INCREMENT=100024 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_common`
--

LOCK TABLES `pmall_goods_common` WRITE;
/*!40000 ALTER TABLE `pmall_goods_common` DISABLE KEYS */;
INSERT INTO `pmall_goods_common` VALUES (100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品','',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627678636481.jpg','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2tCEPaVXXXXX_XpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918768,0,'70000.00','70000.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100001,'劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210','【雅欧国际】：所有商品全新原装正品　　',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627707766698.png','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img03.taobaocdn.com/imgextra/i3/2010071101/TB2XkUKaVXXXXbOXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918773,0,'87500.00','87500.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','',587,530,540,587,'珠宝手表 &gt;钟表手表 &gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627750479728.png','N;','N;','<p>\r\n	<img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2x97LaVXXXXbqXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" />\r\n</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\" class=\"ke-zeroborder\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','',1,NULL,1,'',0,1468482393,0,'63.00','63200.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100003,'劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333','【雅欧国际】：所有商品全新原装正品　　',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627769865296.jpg','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2sjkWaVXXXXapXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918778,0,'89200.00','89200.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100004,'劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233','【雅欧国际】：所有商品全新原装正品　　',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627799921979.jpg','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2ThkGaVXXXXc6XpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918781,0,'97800.00','97800.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100005,'劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品','',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627843241680.jpg','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img03.taobaocdn.com/imgextra/i3/2010071101/TB2m.3ZaVXXXXXSXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918784,0,'65900.00','65900.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100006,'劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201','',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627871532105.png','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2p.wIaVXXXXbZXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918788,0,'100500.00','100500.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100007,'劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593','',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627900055146.png','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2iOs1aVXXXXXcXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,0,1421918790,0,'146300.00','146300.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','广告词是啥？',587,530,540,587,'珠宝手表 &gt;钟表手表 &gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627931531971.jpg','N;','N;','<p>\r\n	<img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB22FtebXXXXXaiXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','',1,NULL,1,NULL,0,1467797921,0,'209500.00','209500.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,1,1,0,0,0,'',''),(100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','【雅欧国际】：所有商品全新原装正品　　',587,530,540,587,'珠宝手表&gt;钟表手表&gt;瑞士品牌',1,'800方o2o','N;','N;',0,'',0,'1_04752627958339099.jpg','s:0:\"\";','s:0:\"\";','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>','',1,NULL,1,NULL,1,1421918796,0,'52800.00','52800.00','0.00',0,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100010,'测试商品1','测试商品1',12,1,4,12,'服饰鞋帽 &gt;女装 &gt;T恤',2,'eshop2','N;','N;',274,'嗳呵',0,'2_05211324717488064.jpg','N;','N;','测试商品1','',10,'管理员删除经营类目',1,NULL,0,1467788474,0,'80.00','90.00','60.00',88,'',0,'',0,'',1,'6.00',0,19,289,',1,',0,0,0,0,0,0,0,0,0,0,0,'',''),(100011,'欧姆龙血压计','欧姆龙血压计',12,1,4,12,'服饰鞋帽 &gt;女装 &gt;T恤',2,'eshop2','N;','N;',274,'嗳呵',0,'2_05211324717488064.jpg','N;','N;','欧姆龙血压计','',1,NULL,1,'',0,1468900383,0,'100.00','120.00','0.00',83,'',200,'',0,'',1,'10.00',0,19,289,',1,',0,0,0,0,0,0,0,0,0,0,0,'',''),(100012,'拖拉塞米片','拖拉塞米片',1060,1058,1059,1060,'中西成药 &gt;心脑血管 &gt;高血压',2,'eshop2','N;','N;',348,'奥唯嘉（Ovega）',6,'2_05213079227148488.jpg','N;','N;','拖拉塞米片','',1,NULL,1,NULL,0,1467963958,0,'480.00','670.00','0.00',71,'',0,'',0,'',1,'0.00',0,19,289,',1,',0,0,1,1469980799,1,0,0,0,0,0,0,'',''),(100014,'舒筋健骨丸','舒筋健骨丸',1060,1058,1059,1060,'中西成药 &gt;心脑血管 &gt;高血压',2,'eshop2','N;','N;',339,'安睡宝',6,'2_05216575160789666.jpg','N;','N;','舒筋健骨丸','',0,NULL,1,'',0,1468313536,0,'70.00','120.00','0.00',58,'',0,'',0,'',1,'8.00',0,19,289,',1,',0,0,0,0,0,0,0,0,0,0,0,'',''),(100015,'祛斑面霜','祛斑',481,470,471,481,'个护化妆 &gt;面部护理 &gt;乳液面霜',4,'咯咯小店','N;','N;',343,'三光云彩',0,'4_05219124589505593.jpg','N;','N;','<p style=\"text-align:center;\">\r\n	很好很好很好用\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/4/4_05219124589505593_1280.jpg\" alt=\"image\" /><span style=\"line-height:1.5;\"></span><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/4/4_05219124845199514_1280.jpg\" alt=\"image\" /><span style=\"line-height:1.5;\"></span> \r\n</p>','',1,NULL,1,'',0,1468570099,0,'10.00','200.00','8.00',5,'',0,'',0,'',1,'2.00',1,19,289,',3,6,',0,0,0,0,0,0,0,0,0,0,0,'',''),(100016,'啦啦啦啦','',108,1,9,108,'服饰鞋帽 &gt;男鞋 &gt;正装鞋',1,'800方o2o','N;','N;',0,'',0,'1_04752627750479728.png','N;','N;','','',0,NULL,1,'',0,1468582418,0,'10.00','15.00','0.00',66,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100017,'女装测试','',12,1,4,12,'服饰鞋帽 &gt;女装 &gt;T恤',2,'eshop2','N;','N;',0,'',0,'2_05222444906791674.jpg','N;','N;','','',10,'啦啦啦',1,'',0,1468900498,0,'100.00','100.00','0.00',100,'',0,'',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,'',''),(100018,'欧姆龙（OMRON）电子血压计 家用 HEM-7051（上臂式）','碉堡上臂式，不需要¥9,999，不需要¥999，只需要¥997',1071,1070,1071,0,'医疗器械 &gt;血压计',2,'eshop2','N;','N;',0,'',5,'2_05222598068424864.jpg','a:6:{i:32;a:2:{s:4:\"name\";s:6:\"类型\";i:0;s:6:\"不限\";}i:34;a:2:{s:4:\"name\";s:12:\"加压方式\";i:0;s:6:\"不限\";}i:35;a:2:{s:4:\"name\";s:12:\"检测方式\";i:0;s:6:\"不限\";}i:36;a:2:{s:4:\"name\";s:12:\"显示方式\";i:0;s:6:\"不限\";}i:37;a:2:{s:4:\"name\";s:6:\"精度\";i:0;s:6:\"不限\";}i:38;a:2:{s:4:\"name\";s:12:\"工作模式\";i:0;s:6:\"不限\";}}','a:5:{i:4;a:2:{s:4:\"name\";s:12:\"测量范围\";s:5:\"value\";s:29:\"压力：0~299mmHg(0~39.9kPa)\";}i:6;a:2:{s:4:\"name\";s:12:\"记忆组数\";s:5:\"value\";s:5:\"21组\";}i:7;a:2:{s:4:\"name\";s:9:\"脉搏数\";s:5:\"value\";s:13:\"40~180次/分\";}i:8;a:2:{s:4:\"name\";s:12:\"电源类型\";s:5:\"value\";s:51:\"4节5号电池 电源适配器（AC220V）另售出\";}i:9;a:2:{s:4:\"name\";s:12:\"电池寿命\";s:5:\"value\";s:100:\"若在23℃的室温下使用锰干电池，每天2次，加压至170mmHg(22.7kPa)可测量约300次\";}}','<p>\r\n	<span>不买注定你家老丈人不待见你！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601069826799_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601067019823_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601060816286_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601051054500_1280.jpg\" alt=\"image\" />','a:8:{i:0;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601073489611_1280.jpg\";}i:1;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:39:\"不买注定你家老丈人不待见你\";}i:2;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601069826799_1280.jpg\";}i:3;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:18:\"黑科技满满的\";}i:4;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601067019823_1280.jpg\";}i:5;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:18:\"国家认证产品\";}i:6;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601060816286_1280.jpg\";}i:7;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:21:\"疗效好，效率高\";}}',1,NULL,1,'',0,1468985688,0,'77.00','9999.00','0.00',0,'Blood-001',10,'12345678901',0,'',1,'6.00',0,19,289,',1,',0,0,0,0,0,0,0,0,0,0,0,'',''),(100019,'test0725','test0725',717,662,669,717,'运动健康 &gt;保健器械 &gt;养生器械',1,'800方o2o','N;','N;',0,'',0,'1_05227694227948989.jpg','N;','N;','test','',1,NULL,1,NULL,0,1469425426,0,'10.00','11.00','1.00',90,'test0725',11,'test0725',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100020,'test0725-1','test0725-1',157,2,151,157,'礼品箱包 &gt;潮流女包 &gt;手拿包',1,'800方o2o','N;','N;',0,'',0,'1_05227695267124957.jpg','N;','N;','','',1,NULL,1,NULL,0,1469425531,0,'111.00','111.00','11.00',100,'test0725-1',11,'test0725-1',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100021,'test0725-2','test0725-2',671,662,663,671,'运动健康 &gt;户外鞋服 &gt;户外服装',1,'800方o2o','N;','N;',0,'',0,'1_05227696969486977.jpg','N;','N;','','',10,'tge',1,NULL,0,1469425705,0,'12.00','122.00','11.00',9,'test0725-2',22,'test0725-2',0,'',1,'0.00',0,0,0,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100022,'test0725-3','test0725-3',157,2,151,157,'礼品箱包 &gt;潮流女包 &gt;手拿包',1,'800方o2o','N;','N;',0,'',0,'1_05227701535745608.jpg','N;','N;','test','a:2:{i:0;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_05227701535745608_1280.jpg\";}i:1;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:12:\"t+test0725-3\";}}',1,NULL,1,NULL,0,1469426243,0,'11.00','111.00','0.00',9,'test0725-3',2,'test0725-3',0,'',1,'0.00',0,19,289,'',0,0,0,0,0,0,0,1,0,0,0,'',''),(100023,'test0725-4','test0725-4',718,662,669,718,'运动健康 &gt;保健器械 &gt;保健用品',1,'800方o2o','N;','N;',0,'',0,'1_05227702508114739.jpg','N;','N;','','a:2:{i:0;a:2:{s:4:\"type\";s:5:\"image\";s:5:\"value\";s:90:\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_05227702559122792_1280.jpg\";}i:1;a:2:{s:4:\"type\";s:4:\"text\";s:5:\"value\";s:30:\"test0725-4test0725-4test0725-4\";}}',1,NULL,1,'',0,1469426716,0,'32.00','234.00','23.00',13,'test0725-4',23,'test0725-4',0,'',1,'0.00',0,19,0,'',0,0,0,0,0,0,0,1,0,0,0,'','');
/*!40000 ALTER TABLE `pmall_goods_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_fcode`
--

DROP TABLE IF EXISTS `pmall_goods_fcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_fcode` (
  `fc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'F码id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品sku',
  `fc_code` varchar(20) NOT NULL COMMENT 'F码',
  `fc_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0未使用，1已使用',
  PRIMARY KEY (`fc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品F码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_fcode`
--

LOCK TABLES `pmall_goods_fcode` WRITE;
/*!40000 ALTER TABLE `pmall_goods_fcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_goods_fcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_gift`
--

DROP TABLE IF EXISTS `pmall_goods_gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共id',
  `gift_goodsid` int(10) unsigned NOT NULL COMMENT '赠品商品id ',
  `gift_goodsname` varchar(50) NOT NULL COMMENT '主商品名称',
  `gift_goodsimage` varchar(100) NOT NULL COMMENT '主商品图片',
  `gift_amount` tinyint(3) unsigned NOT NULL COMMENT '赠品数量',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_gift`
--

LOCK TABLES `pmall_goods_gift` WRITE;
/*!40000 ALTER TABLE `pmall_goods_gift` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_goods_gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_images`
--

DROP TABLE IF EXISTS `pmall_goods_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_images` (
  `goods_image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共内容id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `color_id` int(10) unsigned NOT NULL COMMENT '颜色规格值id',
  `goods_image` varchar(1000) NOT NULL COMMENT '商品图片',
  `goods_image_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认主题，1是，0否',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='商品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_images`
--

LOCK TABLES `pmall_goods_images` WRITE;
/*!40000 ALTER TABLE `pmall_goods_images` DISABLE KEYS */;
INSERT INTO `pmall_goods_images` VALUES (1,100000,1,0,'1_04752627678636481.jpg',0,1),(2,100001,1,0,'1_04752627707766698.png',0,1),(3,100001,1,0,'1_04752627711844438.png',0,0),(4,100001,1,0,'1_04752627715984525.png',0,0),(5,100001,1,0,'1_04752627723007356.png',0,0),(6,100001,1,0,'1_04752627731269795.png',0,0),(7,100002,1,0,'1_04752627750479728.png',0,1),(8,100003,1,0,'1_04752627769865296.jpg',0,1),(9,100003,1,0,'1_04752627779656765.png',0,0),(10,100004,1,0,'1_04752627799921979.jpg',0,1),(11,100004,1,0,'1_04752627802778337.jpg',0,0),(12,100004,1,0,'1_04752627805681085.jpg',0,0),(13,100004,1,0,'1_04752627809660767.jpg',0,0),(14,100004,1,0,'1_04752627813773082.jpg',0,0),(15,100005,1,0,'1_04752627843241680.jpg',0,1),(16,100006,1,0,'1_04752627871532105.png',0,1),(17,100007,1,0,'1_04752627900055146.png',0,1),(18,100008,1,0,'1_04752627931531971.jpg',0,1),(19,100009,1,0,'1_04752627958339099.jpg',0,1),(20,100010,2,0,'2_05210447164396115.jpg',0,1),(21,100011,2,0,'2_05211324717488064.jpg',0,1),(22,100012,2,0,'2_05213079227148488.jpg',0,1),(25,100014,2,0,'2_05216575160789666.jpg',0,1),(26,100015,4,0,'4_05219124589505593.jpg',0,1),(27,100015,4,0,'4_05219124589505593.jpg',0,0),(28,100015,4,0,'4_05219124845199514.jpg',0,0),(29,100015,4,0,'4_05219124589505593.jpg',0,0),(30,100015,4,0,'4_05219124589505593.jpg',0,0),(31,100016,1,0,'1_04752627750479728.png',0,1),(32,100016,1,0,'1_04752627900055146.png',0,0),(33,100016,1,0,'1_04752627871532105.png',0,0),(34,100016,1,0,'1_04752627813773082.jpg',0,0),(35,100017,2,0,'2_05222444906791674.jpg',0,1),(36,100018,2,0,'2_05222598068424864.jpg',0,1),(37,100018,2,0,'2_05222600644047411.jpg',0,0),(38,100018,2,0,'2_05222600692894734.jpg',0,0),(39,100018,2,0,'2_05222600772248870.jpg',0,0),(40,100018,2,0,'2_05222600827349265.jpg',0,0),(41,100019,1,0,'1_04752627958339099.jpg',0,1),(42,100021,1,0,'1_05227696969486977.jpg',0,1),(43,100021,1,0,'1_05227697147908245.jpg',0,0),(44,100021,1,0,'1_05227697267821957.jpg',0,0),(45,100022,1,0,'1_05227701535745608.jpg',0,1),(46,100022,1,0,'1_05227702508114739.jpg',0,0),(47,100022,1,0,'1_05227702559122792.jpg',0,0),(48,100023,1,0,'1_05227702508114739.jpg',0,1),(49,100023,1,0,'1_04752627958339099.jpg',0,0),(50,100023,1,0,'1_04752627931531971.jpg',0,0),(51,100023,1,0,'1_05227691123264934.jpg',0,0),(52,100023,1,0,'1_05227697267821957.jpg',0,0);
/*!40000 ALTER TABLE `pmall_goods_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_goods_recommend`
--

DROP TABLE IF EXISTS `pmall_goods_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_goods_recommend` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rec_gc_id` mediumint(9) DEFAULT NULL COMMENT '最底级商品分类ID',
  `rec_goods_id` int(11) DEFAULT NULL COMMENT '商品goods_id',
  `rec_gc_name` varchar(150) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`rec_id`),
  KEY `rec_gc_id` (`rec_gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_goods_recommend`
--

LOCK TABLES `pmall_goods_recommend` WRITE;
/*!40000 ALTER TABLE `pmall_goods_recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_goods_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_groupbuy`
--

DROP TABLE IF EXISTS `pmall_groupbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_groupbuy` (
  `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购ID',
  `groupbuy_name` varchar(255) NOT NULL COMMENT '活动名称',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '团购价格',
  `groupbuy_rebate` decimal(10,2) NOT NULL COMMENT '折扣',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `upper_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买上限',
  `buyer_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `buy_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `groupbuy_intro` text COMMENT '本团介绍',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '团购状态 10-审核中 20-正常 30-审核失败 31-管理员关闭 32-已结束',
  `recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `class_id` int(10) unsigned NOT NULL COMMENT '团购类别编号',
  `s_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '团购2级分类id',
  `groupbuy_image` varchar(100) NOT NULL COMMENT '团购图片',
  `groupbuy_image1` varchar(100) DEFAULT NULL COMMENT '团购图片1',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `is_vr` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟团购 1是0否',
  `vr_city_id` int(11) DEFAULT NULL COMMENT '虚拟团购城市id',
  `vr_area_id` int(11) DEFAULT NULL COMMENT '虚拟团购区域id',
  `vr_mall_id` int(11) DEFAULT NULL COMMENT '虚拟团购商区id',
  `vr_class_id` int(11) DEFAULT NULL COMMENT '虚拟团购大分类id',
  `vr_s_class_id` int(11) DEFAULT NULL COMMENT '虚拟团购小分类id',
  PRIMARY KEY (`groupbuy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='团购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_groupbuy`
--

LOCK TABLES `pmall_groupbuy` WRITE;
/*!40000 ALTER TABLE `pmall_groupbuy` DISABLE KEYS */;
INSERT INTO `pmall_groupbuy` VALUES (1,'劳力士Rolex 日志型系列 116200 63200',1421942400,1453392000,100009,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',1,'800方o2o','52800.00','42800.00','8.11',0,0,0,0,'<img src=\"../data/upload/shop/store/goods/1/1_04752627958339099_1280.jpg\" alt=\"image\" />',20,0,0,0,0,'1_04752644979681500.jpg','','自动机械钢带男表联保正品',0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pmall_groupbuy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_groupbuy_class`
--

DROP TABLE IF EXISTS `pmall_groupbuy_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_groupbuy_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `class_name` varchar(20) NOT NULL COMMENT '类别名称',
  `class_parent_id` int(10) unsigned NOT NULL COMMENT '父类别编号',
  `sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `deep` tinyint(1) unsigned DEFAULT '0' COMMENT '深度',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_groupbuy_class`
--

LOCK TABLES `pmall_groupbuy_class` WRITE;
/*!40000 ALTER TABLE `pmall_groupbuy_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_groupbuy_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_groupbuy_price_range`
--

DROP TABLE IF EXISTS `pmall_groupbuy_price_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_groupbuy_price_range` (
  `range_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '价格区间编号',
  `range_name` varchar(20) NOT NULL COMMENT '区间名称',
  `range_start` int(10) unsigned NOT NULL COMMENT '区间下限',
  `range_end` int(10) unsigned NOT NULL COMMENT '区间上限',
  PRIMARY KEY (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购价格区间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_groupbuy_price_range`
--

LOCK TABLES `pmall_groupbuy_price_range` WRITE;
/*!40000 ALTER TABLE `pmall_groupbuy_price_range` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_groupbuy_price_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_groupbuy_quota`
--

DROP TABLE IF EXISTS `pmall_groupbuy_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_groupbuy_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '团购套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团购套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_groupbuy_quota`
--

LOCK TABLES `pmall_groupbuy_quota` WRITE;
/*!40000 ALTER TABLE `pmall_groupbuy_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_groupbuy_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_help`
--

DROP TABLE IF EXISTS `pmall_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_help` (
  `help_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助ID',
  `help_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `help_title` varchar(100) NOT NULL COMMENT '标题',
  `help_info` text COMMENT '帮助内容',
  `help_url` varchar(100) DEFAULT '' COMMENT '跳转链接',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `type_id` int(10) unsigned NOT NULL COMMENT '帮助类型',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1为店铺,2为会员,默认为1',
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='帮助内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_help`
--

LOCK TABLES `pmall_help` WRITE;
/*!40000 ALTER TABLE `pmall_help` DISABLE KEYS */;
INSERT INTO `pmall_help` VALUES (96,2,'消费者权益','<p>\r\n	<strong> <b>\r\n	\r\n		<b>消费者权益保障服务条款<span></span></b>\r\n	</b></strong></p>\r\n	<p class=\"MsoNormal\" style=\"text-align:center; text-align: center;\">\r\n		<b>&nbsp;</b>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-align: left;\">\r\n		本服务条款为《八百方商城开放平台服务协议》（以下称“协议”）的重要组成部分，与协议正文具有同等法律效力，对商家有合同约束力。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-align: left;\">\r\n		本服务条款由条款正文及公示于八百方平台的各项与“消费者权益保障”相关的规则组成，前述规则与条款正文具有相同的法律效力，共同组成本服务条款的完整内容。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-align: left;\">\r\n		本服务条款正文如下：<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-align: left;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第一条 定义<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1.1消费者权益保障服务：指商家根据与八百方签署的服务协议及八百方平台公示的相关规则，利用八百方平台发布商品信息、出售商品时，应履行的各项保护消费者权益的义务，包括但不限于“商品如实陈述”、“<span>7</span>天无理由退换货”、“三包”等服务。八百方将根据国家法律法规及政策的相关要求及行业惯例等，在八百方平台公示新增的消费者权益保障服务内容或对原消费者权益保障服务内容等进行修订。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1.2质保金：指商家根据本服务条款、平台服务协议及八百方平台相关规则，向八百方缴纳的，在商家未履行药品法、药品经营质量管理规范、消费者权益保障义务、违反平台服务协议或者八百方平台相关规则或流程时，用于对买家<span>(</span>指通过八百方平台购买商家商品的甲方其他用户，以下均称“买家”<span>)</span>进行赔付或对八百方和<span>/</span>或买家支付违约金的资金。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1.3先行赔付：指买家投诉商家有侵犯消费者权益或其他违反对买家承诺的行为时，八百方有权根据平台服务协议、本服务条款和八百方平台公示的各项规则及买家提交的相关证据材料，以普通人或非专业人员的知识水平标准判断商家是否应当承担赔付义务，若是，则八百方有权直接从商家缴纳的质保金中扣除相应的款项赔付给买家。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1.4自主售后：指商家利用八百方平台提供的售后服务系统，在买家提出售后服务要求时，根据“三包”规定、八百方平台相关规则及自身售后服务承诺向买家履行商品维修、退换货等售后服务义务，八百方有权对商家的自主售后服务进行监督和检查，并有权按照协议、本服务条款及八百方平台相关规则对商家的违规行为追究违约责任。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第二条 质保金<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		商家同意向甲方缴纳一定金额的质保金，作为履行平台服务协议、消费者权益保障义务及遵守八百方平台各项规则的保证，同意在商家违反上述协议、义务或八百方平台规则时，八百方有权根据相关约定扣除相应金额的质保金作为违约金或给予买家的赔偿。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.1质保金额度<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.1.1商家应根据八百方平台相关招商规则及自身申请经营的类目情况，在协议附件《信息确认表》中填写并确认须缴纳的质保金额度，并按照约定的时间及方式支付至八百方指定账户。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.1.2商家同意缴纳的质保金在任何情况下，均不计算任何利息。同时，八百方有权根据乙方经营类目的变化、商品实际销售情况、履约能力、资信状况等情形调整商家交付的质保金额度，商家应在甲方通知后<span> 5</span>日内补足相应金额的质保金，否则，八百方有权暂停向商家提供服务或提前终止协议。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.2质保金的管理和使用<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.2.1在下述情形下，八百方有权根据具体情况直接扣除部分或全部质保金，八百方扣除相应的质保金后，将通知商家补足，商家应在接到甲方通知后<span> 5</span>日内按八百方要求补足相应质保金。商家未按要求补足相应质保金或质保金不足以抵扣的，商家同意八百方从未结算款项中直接扣除相应金额：<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1) 商家违反协议或本条款项下的任何保证、承诺或义务的；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2) 商家之行为违反国家法律法规及其它规范性文件等规定的；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3) 商家在八百方平台发布商品、达成交易、履行交易相关活动中，违反法律、法规、政策、八百方平台任何规则或违反其对客户的承诺，或被客户投诉、索赔时，八百方根据自身的判断对客户进行赔付的；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		4) 商家违反协议、商家与甲方或甲方关联公司的其他协议或八百方平台任何规则，给甲方或八百方平台造成任何损失（包括但不限于诉讼赔偿、诉讼费用、律师费用等）的；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		5) 协议及八百方平台管理规则中约定的其它可扣除质保金的情形出现的。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.2.2八百方如使用质保金进行任何抵扣或赔付，将以书面方式（包括但不限于电子邮件、传真等）通知商家，并在书面通知中，说明抵扣和<span>/</span>或赔付原因及抵扣和<span>/</span>或赔付金额。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.2.3若商家质保金不足时，八百方没有使用自有资金为商家支付赔偿金、补偿金、抚恤金或其他任何款项的义务，但若八百方进行了该等支付，则八百方有权要求商家赔偿，包括但不限于：<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1) 要求商家赔付八百方损失，且在指定期限内补足质保金；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2) 从商家的销售货款中直接划扣，以补偿八百方所遭受的损失；如八百方的损失通过上述方式仍无法弥补，则八百方有权单方终止向商家提供的一切服务，且有权继续向商家追偿。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2.3质保金的退还<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		协议终止且所有商家已完成交易的商品质保期届满后，商家可向八百方提出退还质保金的书面申请，八百方审核通过后三个月内，扣除依据协议应扣除的部分后，将质保金余额退还商家，如商家支付的质保金，不足以抵扣应由商家支付、赔偿的款项的，八百方将不予退还商家质保金，并保留向商家追偿的权利。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\" style=\"text-indent:21.0pt;\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第三条 消费者权益保障的内容<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.1商家承诺按照平台服务协议、本服务条款及八百方平台相关规则履行保障消费者权益的义务，切实保障消费者的合法权益。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.2商家保证履行“如实陈述”义务。“如实陈述”指商家应对上传并发布于八百方平台的信息如实进行陈述，并对其发布的信息独立承担全部法律责任，并承担相应的举证责任。商家如实陈述义务包括如下内容：<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1)商家保证其有合法的权利发布商品信息并销售商品，且其发布商品信息和销售商品不侵犯任何第三方的合法权利，不违反国家相关规定；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2)商家保证发布的商品信息与实际销售的商品一致，其对规格、材质、数量、颜色、外观、功能、质量状况等的描述与商品实际情况一致，其对价格的陈述符合价格法规及八百方平台相关规则的要求。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3)商家保证发布商品信息所用的图片均是来自商品本身的实拍图片，展示商品外观、形状、颜色等外观性能的图片不含有夸大或虚假的内容。文字介绍及其他素材等均为自身设计或合法取得，对图片、文字及其他素材等的使用不侵犯任何第三方的合法权利；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		4)商家保证按照八百方平台规则的要求填写及上传商品的相关信息，且保证这些信息可完整被买家通过商品详情页直接查看，而无需通过链接或跳转等方式脱离八百方平台查看；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		5)商家在交易过程中使用八百方<span> IM</span>客服工具与买家进行交流或通过其他途径与买家沟通时，对商品本身信息、配送费、发货情况、赠品等向买家描述的内容也属于“如实陈述”的范围，商家应保证上述描述与实际情况相符；如买家投诉商家违反如实陈述义务的，商家应向八百方提交其履行如实陈述义务的证据，如商家不能提供相应证据或买家提交的证据足以证明商家违反了如实陈述义务的，八百方有权以普通人身份对相关证据材料做出判断并要求商家承担相应责任。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.3药品品类遵守国家相关规定，不支持售出后无理由退货，具体按八百方平台公示内容为准。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.4商家保证履行“正品保证”义务。正品保证指商家保证在八百方平台销售的商品均拥有<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		合法的来源渠道，商品质量合格，且在买家购买商品时可以向买家开具合法发票。如买家投诉商家未履行“正品保证”义务的，商家应积极与买家沟通解决，如商家未能与买家达成一致，妥善解决买家投诉的，八百方有权以普通人身份根据商家及买家提供的相关证明材料及八百方平台相关规则作出判断及处理决定，商家同意按照八百方的要求履行相应的义务。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.5商家保证履行“自主售后”义务。商家保证按照八百方平台相关自主售后规定，利用八百方平台提供的自主售后服务平台为买家提供“三包”等售后服务。若买家对商家提供的自主售后服务提出投诉或商家未按照八百方平台相关自主售后规定履行相应售后义务的，八百方有权根据协议、本服务条款及相关自主售后服务规则的要求，追究商家违约责任。商家的自主售后义务包括如下内容：<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		1)商家应按照八百方平台自主售后相关规定，在规定的时间内处理买家提出的售后服务申请并履行相应的义务；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		2)商家在提供自主售后服务过程中，应遵守八百方平台相关规则规定的标准及规范，对买家提供满意的服务，积极提升客户满意度；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3)商家在提供自主售后服务过程中，应接受八百方的监督和检查，对八百方提出的整改意见及提升服务质量的措施等应积极予以实施；<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		4)商家提供售后服务的标准不应低于国家相关规定，若商家对商品质量、售后服务等做出高于国家标准的承诺，商家应保证予以履行。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		3.6商家保证“遵守承诺”。遵守承诺指商家应保证履行其在八百方平台商品详情页、活动页或在与买家交流过程中做出的保证、承诺等义务，若商家违反其做出的承诺导致买家投诉的，商家应负责解决，若商家未能妥善解决的，八百方有权以普通人身份判断相关证据材料并做出决定，商家应对八百方做出的决定予以履行并承担相应的责任。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第四条 条款的变更及修改<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		4.1八百方有权根据国家相关消费者权益保护法律法规、其他规范性文件及政策的调整和变化，以及提升客户体验、提高商家商品销量及市场影响力等需求，不时制定、修改本服务条款及<span>/</span>或与消费者权益保障相关的规则，并以八百方平台公告的形式向商家公示，不再向商家另行通知。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		4.2变更后的服务条款或相关规则，一经在八百方平台公示，即发生法律效力。如商家对服务条款或相关规则有异议的，应当立即停止使用八百方提供的服务，如商家继续使用八百方提供的服务，包括但不限于继续上传商品信息、接受订单或对所发布信息进行更新等活动，均视为商家同意接受变更后的服务条款或规则。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第五条 违约处理<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		5.1商家违反协议、本服务条款或八百方平台相关规则约定的消费者权益保障义务导致买家投诉的，商家应积极予以处理，若商家未能妥善处理导致投诉扩大或未按上述约定的要求处理的，八百方有权以普通人身份，对买家及商家提供的证据材料进行认定，若判定属于商家未正确履行上述约定的义务的，八百方有权要求商家立即履行义务并承担相应的责任，八百方亦有权先行赔付。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		5.2八百方先行赔付的，商家应按照协议、本服务条款或八百方平台相关规则的要求补足相应的款项并支付相应的违约金，若商家未予以补足的，八百方有权从商家未结算款项中予以扣除，若不足以补偿八百方损失时，八百方保留继续向商家追偿相关损失的权利。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		5.3服务协议、本服务条款及八百方平台规则对商家违反消费者权益保障义务所应承担的违约责任另有约定的，依约定执行。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第六条 有限责任<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		6.1商家为消费者权益保障服务的责任主体，无论何时或任何原因，八百方都不应成为承担消费者权益保障或销售者责任的主体，若因某种情况，导致八百方承担了此类责任，商家应竭力使八百方免责并承担八百方因此遭受的所有损失。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		6.2商家同意八百方并非司法机关，亦非专业的纠纷解决机构，八百方对于商家及买家之间纠纷的处理完全是基于相关法规的规定、协议的约定及买卖双方的意愿，八百方仅能以普通非专业人士的知识水平和能力对买家和商家提交的相关证据材料进行鉴别和认定，八百方对据此作出的交易纠纷处理结果及质保金赔付决定等无法保证完全正确，也不对此承担任何责任。商家应对其提交的证明材料的真实性、合法性独立承担完全的法律责任，若八百方根据商家提供的证明材料做出的决定或处理结果被有关司法机关予以否定的，商家应承担因此导致的一切责任；若八百方据以做出判断的买家提供的证明材料被相关国家机关否定的，商家应独立向买家追索损失。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<br />\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<b>第七条 其他<span></span></b>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		7.1如商家违反平台服务协议、本服务条款或八百方平台相关规则而八百方放弃向商家主张权利的，不视为八百方放弃了商家以后发生的同样或类似违约行为时八百方向其主张权利的权利，即某一次未行使权利仅可被认为是针对该次商家违约行为放弃权利，而不是放弃该权利本身。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		7.2商家已仔细阅读本服务条款的所有内容，对本服务条款相关内容均已理解并同意接受，同时商家同意在平台服务协议签字页签字确认即视为对本服务条款所有内容的认可，只要平台服务协议生效，则商家即受本服务条款相关内容所约束。<span></span>\r\n	</p>\r\n	<p class=\"MsoNormal\">\r\n		<span>&nbsp;</span>\r\n	</p>\r\n\r\n\r\n<p>\r\n	<br />\r\n</p>','',1468303704,1,1),(97,1,'招商标准','<p>\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	本标准适用于除虚拟业务（包括但不限于旅游、酒店、票务、充值、彩票）外的平台开放平台所有卖家。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第一章 入驻</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.1&nbsp;&nbsp;&nbsp; 平台开放平台暂未授权任何机构进行代理招商服务，入驻申请流程及相关的收费说明均以平台开放平台官方招商页面为准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.2 &nbsp;&nbsp; 平台开放平台有权根据包括但不限于品牌需求、公司经营状况、服务水平等其他因素退回卖家申请。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.3 &nbsp;&nbsp; 平台开放平台有权在申请入驻及后续经营阶段要求卖家提供其他资质。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.4 &nbsp;&nbsp; 平台开放平台将结合各行业发展动态、国家相关规定及消费者购买需求，不定期更新招商标准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.5 &nbsp;&nbsp; 卖家必须如实提供资料和信息：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.5.1 请务必确保申请入驻及后续经营阶段提供的相关资质和信息的真实性、完整性、有效性（若卖家提供的相关资质为第三方提供，包括但不限于商标注册证、授权书\r\n等，请务必先行核实文件的真实有效完整性），一旦发现虚假资质或信息的，平台开放平台将不再与卖家进行合作并有权根据平台开放平台规则及与卖家签署的相关 协议之约定进行处理；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.5.2&nbsp; 卖家应如实提供其店铺运营的主体及相关信息，包括但不限于店铺实际经营主体、代理运营公司等信息；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.5.3&nbsp; 平台开放平台关于卖家信息和资料变更有相关规定的从其规定，但卖家如变更<span>1.5.2</span>项所列信息，应提前十日书面告知平台；如未提前告知平台，平台将根据平台开放平台规则进行处理。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.6&nbsp;&nbsp;&nbsp; 平台开放平台暂不接受个体工商户的入驻申请，卖家须为正式注册企业，亦暂时不接受非中国大陆注册企业的入驻申请。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	1.7&nbsp;&nbsp;&nbsp; 平台开放平台暂不接受未取得国家商标总局颁发的商标注册证或商标受理通知书的品牌开店申请，亦不接受纯图形类商标的入驻申请。卖家提供商标受理通知书（<span>TM</span>状态商标）的，注册申请时间须满六个月。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第二章 平台店铺类型及相关要求</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.1&nbsp;&nbsp;&nbsp;&nbsp; 旗舰店，卖家以自有品牌（商标为<span>R</span>或<span>TM</span>状态），或由权利人出具的在平台开放平台开设品牌旗舰店的授权文件（授权文件中应明确排他性、不可撤销性），入驻平台开放平台开设的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.1.1&nbsp; 旗舰店，可以有以下几种情形：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	经营一个自有品牌（商标为<span>R</span>或<span>TM</span>状态）商品入驻平台开放平台的卖家旗舰店，（自有品牌是指商标权利归卖家所有，自有品牌的子品牌可以放入旗舰店，主、子品牌的商标权利人应为同一实际控制人）；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	经营已获得明确排他性授权的一个品牌商品入驻平台开放平台的卖家旗舰店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	卖场型品牌（服务类商标）商标权人开设的旗舰店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.1.2&nbsp; 开店主体必须是品牌（商标）权利人或持有权利人出具的开设平台开放平台旗舰店排他性授权文件的被授权企业。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.2&nbsp;&nbsp;&nbsp;&nbsp; 专卖店，卖家持他人品牌（商标为<span>R</span>或<span>TM</span>状态）授权文件在平台开放平台开设的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.2.1&nbsp; 专卖店类型：经营一个或多个授权品牌商品（多个授权品牌的商标权人应为同一实际控制人）但未获得旗舰店排他授权入驻平台开放平台的卖家专卖店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.2.2 &nbsp; 品牌（商标）权利人出具的授权文件不应有地域限制。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.3&nbsp;&nbsp;&nbsp;&nbsp; 专营店，经营平台开放平台相同一级经营类目下两个及以上他人或自有品牌（商标为<span>R</span>或<span>TM</span>状态）商品的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.3.1&nbsp; 专营店，可以有以下几种情形：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	相同一级类目下经营两个及以上他人品牌商品入驻平台开放平台的卖家专营店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	相同一级类目下既经营他人品牌商品又经营自有品牌商品入驻平台开放平台的卖家专营店。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	2.4 &nbsp; &nbsp; 各类型店铺命名详细说明，请见<span>《平台开放平台卖家店铺命名规则》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第三章 平台申请入驻资质标准</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	3.1&nbsp;&nbsp;&nbsp; 平台开放平台申请入驻资质标准详见<span>《平台开放平台招商资质标准细则》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第四章 开店入驻限制</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.1&nbsp;&nbsp;&nbsp; 品牌入驻限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.1.1 与平台平台已有的自有品牌、频道、业务、类目等相同或相似名称的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.1.2&nbsp; 包含行业名称或通用名称的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.1.3&nbsp; 包含知名人士、地名的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.1.4&nbsp; 与知名品牌相同或近似的品牌。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.2&nbsp;&nbsp;&nbsp;&nbsp; 经营类目限制，卖家开店所经营的类目应当符合平台开放平台的相关标准，详细请参考<span>《平台开放平台经营类目资费一览表》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.3同一主体入驻的店铺限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.3.1&nbsp; 单个店铺只可对应一种经营模式。各经营模式内容请参考与卖家签署的对应合同；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.3.2&nbsp; 同一主体开设若干店铺的，经营模式总计不得超过两种，且须在开展第二种经营模式时提前<span>10</span>日向平台进行书面申请；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.3.3&nbsp; 商品重合度：要求店铺间经营的品牌及商品不得重复，<span>4.3.2</span>项下经过平台审批的店铺不受此项约束。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.4&nbsp;&nbsp;&nbsp;&nbsp; 同一主体重新入驻平台开放平台限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.4.1&nbsp; 严重违规、资质造假被平台清退的，永久限制入驻；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.4.2&nbsp; 若卖家一自然年内主动退出<span>2</span>次，则自最后一次完成退出之日起<span>12</span>个月内限制入驻。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	4.5&nbsp;&nbsp;&nbsp;&nbsp; 续签限制：须在每年<span>3</span>月<span>1</span>日<span>18</span>时之前完成续签申请的提交，每年<span>3</span>月<span>20</span>日<span>18</span>时之前完成平台使用费的缴纳，如果上一年及下一年资费及资料未补足，平台将在每年<span>3</span>月<span>31</span>日<span>24</span>时终止店铺服务并下架商品。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第五章 平台开放平台保证金<span>/</span>平台使用费<span>/</span>费率标准</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.1 &nbsp; &nbsp; 保证金：卖家向平台缴纳的用以保证店铺规范运营及对商品和服务质量进行担保的金额。当卖家发生违约、违规行为时，平台可以依照与卖家签署的协议中相关约定及平台开放平台规则扣除相应金额的保证金作为违约金或给予买家的赔偿。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.1.1&nbsp; 保证金的补足、退还、扣除等依据卖家签署的相关协议及平台开放平台规则约定办理；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.1.2&nbsp; 平台开放平台各经营类目对应的保证金标准详见<span>《平台开放平台经营类目资费一览表》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2&nbsp;&nbsp;&nbsp;&nbsp; 平台使用费：卖家依照与平台签署的相关协议使用平台开放平台各项服务时缴纳的固定技术服务费用。平台开放平台各经营类目对应的平台使用费标准详见<span>《平台开放平台经营类目资费一览表》。</span>续签卖家的续展服务期间对应平台使用费须在每年<span>3</span>月<span>20</span>日<span>18</span>时前一次性缴纳；新签卖家须在申请入驻获得批准时一次性缴纳相应服务期间的平台使用费。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2.1&nbsp;&nbsp; 平台使用费结算：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2.1.1卖家主动要求停止店铺服务的不返还平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2.1.2卖家因违规行为或资质造假被清退的不返还平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2.1.3每个店铺的平台使用费依据相应的服务期计算并缴纳。服务开通之日在每月的<span>1</span>日至<span>15</span>日（含）间的，开通当月按一个月收取平台使用费，服务开通之日在每月的<span>16</span>日（含）至月底最后一日间的，开通当月不收取平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.2.1.4拥有独立店铺<span>ID</span>的为一个店铺，若卖家根据经营情况须开通多个店铺的，须按照店铺数量缴纳相应的平台使用费。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	5.3&nbsp;&nbsp;&nbsp;&nbsp; 费率：卖家根据经营类目在达成每一单交易时按比例（该比例在与卖家签署的相关协议中称为“技术服务费费率”或“毛利保证率”）向平台缴纳的费用。平台开放平台各经营模式各经营类目对应的费率标准详见<span>《平台开放平台经营类目资费一览表》。 </span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<b>第六章 店铺服务期</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	6.1&nbsp;&nbsp;&nbsp;&nbsp; 卖家每个店铺的第一个服务期自服务开通之日起至最先到达的<span>3</span>月<span>31</span>日止，第二个服务期自<span>4</span>月<span>1</span>日起至次年<span>3</span>月<span>31</span>日止，第三个、第四个……服务期以此类推，以一年为周期，除非店铺或与卖家签署的相关协议提前终止。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	6.2&nbsp;&nbsp;&nbsp;&nbsp; 卖家每个店铺的服务开通之日以平台通知或系统记录的时间为准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	6.3&nbsp;&nbsp;&nbsp;&nbsp; 卖家应在店铺每个服务期届满前<span>30</span>日向甲方提出续展的申请，缴纳续展服务期的平台使用费和提交其经营所需的全部有效资质，并经平台审核。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	6.4&nbsp;&nbsp;&nbsp;&nbsp; 卖家未提出续展申请或申请未通过平台审核的，自店铺服务期满之日起，平台开放平台将不再向卖家提供该店铺的任何服务。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	发布日期：<span>2013</span>年<span>11</span>月<span>19</span>日\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	生效日期：<span>2014</span>年<span>1</span>月<span>1</span>日\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n	<a name=\"help2267\" id=\"help2267\"></a><b>平台开放平台招商资质标准细则</b><b></b> \r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span></span>&nbsp;\r\n</p>\r\n<img src=\"../data/upload/shop/article/help_store_04526250486031950.jpg\" alt=\"image\" /><img src=\"../data/upload/shop/article/help_store_04526250486031950.jpg\" alt=\"image\" /><img src=\"../data/upload/shop/article/help_store_04526250471329237.jpg\" alt=\"image\" />','',1468295450,1,1),(98,3,'资质要求','<p>\r\n    </p><p class=\"MsoNormal\" style=\"text-align:left;\">\r\n      <br />\r\n  </p>\r\n    <p class=\"MsoNormal\" style=\"text-align:left;\">\r\n      <a name=\"undefined\" id=\"undefined\"></a><b>平台开放平台招商资质标准细则</b> \r\n   </p>\r\n    <p class=\"MsoNormal\">\r\n       <span></span>&nbsp;\r\n </p>\r\n<img src=\"../data/upload/shop/article/help_store_04526250486031950.jpg\" alt=\"image\" /><img src=\"../data/upload/shop/article/help_store_04526250486031950.jpg\" alt=\"image\" /><img src=\"../data/upload/shop/article/help_store_04526250471329237.jpg\" alt=\"image\" />\r\n\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    本标准适用于除虚拟业务（包括但不限于旅游、酒店、票务、充值、彩票）外的平台开放平台所有卖家。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第一章 入驻</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    1.1&nbsp;&nbsp;&nbsp; 平台开放平台暂未授权任何机构进行代理招商服务，入驻申请流程及相关的收费说明均以平台开放平台官方招商页面为准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  1.2 &nbsp;&nbsp; 平台开放平台有权根据包括但不限于品牌需求、公司经营状况、服务水平等其他因素退回卖家申请。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 1.3 &nbsp;&nbsp; 平台开放平台有权在申请入驻及后续经营阶段要求卖家提供其他资质。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  1.4 &nbsp;&nbsp; 平台开放平台将结合各行业发展动态、国家相关规定及消费者购买需求，不定期更新招商标准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   1.5 &nbsp;&nbsp; 卖家必须如实提供资料和信息：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   1.5.1 请务必确保申请入驻及后续经营阶段提供的相关资质和信息的真实性、完整性、有效性（若卖家提供的相关资质为第三方提供，包括但不限于商标注册证、授权书\r\n等，请务必先行核实文件的真实有效完整性），一旦发现虚假资质或信息的，平台开放平台将不再与卖家进行合作并有权根据平台开放平台规则及与卖家签署的相关 协议之约定进行处理；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  1.5.2&nbsp; 卖家应如实提供其店铺运营的主体及相关信息，包括但不限于店铺实际经营主体、代理运营公司等信息；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    1.5.3&nbsp; 平台开放平台关于卖家信息和资料变更有相关规定的从其规定，但卖家如变更<span>1.5.2</span>项所列信息，应提前十日书面告知平台；如未提前告知平台，平台将根据平台开放平台规则进行处理。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 1.6&nbsp;&nbsp;&nbsp; 平台开放平台暂不接受个体工商户的入驻申请，卖家须为正式注册企业，亦暂时不接受非中国大陆注册企业的入驻申请。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   1.7&nbsp;&nbsp;&nbsp; 平台开放平台暂不接受未取得国家商标总局颁发的商标注册证或商标受理通知书的品牌开店申请，亦不接受纯图形类商标的入驻申请。卖家提供商标受理通知书（<span>TM</span>状态商标）的，注册申请时间须满六个月。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第二章 平台店铺类型及相关要求</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   2.1&nbsp;&nbsp;&nbsp;&nbsp; 旗舰店，卖家以自有品牌（商标为<span>R</span>或<span>TM</span>状态），或由权利人出具的在平台开放平台开设品牌旗舰店的授权文件（授权文件中应明确排他性、不可撤销性），入驻平台开放平台开设的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    2.1.1&nbsp; 旗舰店，可以有以下几种情形：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    经营一个自有品牌（商标为<span>R</span>或<span>TM</span>状态）商品入驻平台开放平台的卖家旗舰店，（自有品牌是指商标权利归卖家所有，自有品牌的子品牌可以放入旗舰店，主、子品牌的商标权利人应为同一实际控制人）；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 经营已获得明确排他性授权的一个品牌商品入驻平台开放平台的卖家旗舰店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    卖场型品牌（服务类商标）商标权人开设的旗舰店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   2.1.2&nbsp; 开店主体必须是品牌（商标）权利人或持有权利人出具的开设平台开放平台旗舰店排他性授权文件的被授权企业。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    2.2&nbsp;&nbsp;&nbsp;&nbsp; 专卖店，卖家持他人品牌（商标为<span>R</span>或<span>TM</span>状态）授权文件在平台开放平台开设的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 2.2.1&nbsp; 专卖店类型：经营一个或多个授权品牌商品（多个授权品牌的商标权人应为同一实际控制人）但未获得旗舰店排他授权入驻平台开放平台的卖家专卖店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   2.2.2 &nbsp; 品牌（商标）权利人出具的授权文件不应有地域限制。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 2.3&nbsp;&nbsp;&nbsp;&nbsp; 专营店，经营平台开放平台相同一级经营类目下两个及以上他人或自有品牌（商标为<span>R</span>或<span>TM</span>状态）商品的店铺。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  2.3.1&nbsp; 专营店，可以有以下几种情形：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    相同一级类目下经营两个及以上他人品牌商品入驻平台开放平台的卖家专营店；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   相同一级类目下既经营他人品牌商品又经营自有品牌商品入驻平台开放平台的卖家专营店。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  2.4 &nbsp; &nbsp; 各类型店铺命名详细说明，请见<span>《平台开放平台卖家店铺命名规则》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第三章 平台申请入驻资质标准</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    3.1&nbsp;&nbsp;&nbsp; 平台开放平台申请入驻资质标准详见<span>《平台开放平台招商资质标准细则》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第四章 开店入驻限制</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    4.1&nbsp;&nbsp;&nbsp; 品牌入驻限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 4.1.1 与平台平台已有的自有品牌、频道、业务、类目等相同或相似名称的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   4.1.2&nbsp; 包含行业名称或通用名称的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   4.1.3&nbsp; 包含知名人士、地名的品牌；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 4.1.4&nbsp; 与知名品牌相同或近似的品牌。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    4.2&nbsp;&nbsp;&nbsp;&nbsp; 经营类目限制，卖家开店所经营的类目应当符合平台开放平台的相关标准，详细请参考<span>《平台开放平台经营类目资费一览表》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    4.3同一主体入驻的店铺限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   4.3.1&nbsp; 单个店铺只可对应一种经营模式。各经营模式内容请参考与卖家签署的对应合同；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  4.3.2&nbsp; 同一主体开设若干店铺的，经营模式总计不得超过两种，且须在开展第二种经营模式时提前<span>10</span>日向平台进行书面申请；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    4.3.3&nbsp; 商品重合度：要求店铺间经营的品牌及商品不得重复，<span>4.3.2</span>项下经过平台审批的店铺不受此项约束。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  4.4&nbsp;&nbsp;&nbsp;&nbsp; 同一主体重新入驻平台开放平台限制：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 4.4.1&nbsp; 严重违规、资质造假被平台清退的，永久限制入驻；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   4.4.2&nbsp; 若卖家一自然年内主动退出<span>2</span>次，则自最后一次完成退出之日起<span>12</span>个月内限制入驻。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  4.5&nbsp;&nbsp;&nbsp;&nbsp; 续签限制：须在每年<span>3</span>月<span>1</span>日<span>18</span>时之前完成续签申请的提交，每年<span>3</span>月<span>20</span>日<span>18</span>时之前完成平台使用费的缴纳，如果上一年及下一年资费及资料未补足，平台将在每年<span>3</span>月<span>31</span>日<span>24</span>时终止店铺服务并下架商品。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第五章 平台开放平台保证金<span>/</span>平台使用费<span>/</span>费率标准</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    5.1 &nbsp; &nbsp; 保证金：卖家向平台缴纳的用以保证店铺规范运营及对商品和服务质量进行担保的金额。当卖家发生违约、违规行为时，平台可以依照与卖家签署的协议中相关约定及平台开放平台规则扣除相应金额的保证金作为违约金或给予买家的赔偿。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   5.1.1&nbsp; 保证金的补足、退还、扣除等依据卖家签署的相关协议及平台开放平台规则约定办理；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    5.1.2&nbsp; 平台开放平台各经营类目对应的保证金标准详见<span>《平台开放平台经营类目资费一览表》。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 5.2&nbsp;&nbsp;&nbsp;&nbsp; 平台使用费：卖家依照与平台签署的相关协议使用平台开放平台各项服务时缴纳的固定技术服务费用。平台开放平台各经营类目对应的平台使用费标准详见<span>《平台开放平台经营类目资费一览表》。</span>续签卖家的续展服务期间对应平台使用费须在每年<span>3</span>月<span>20</span>日<span>18</span>时前一次性缴纳；新签卖家须在申请入驻获得批准时一次性缴纳相应服务期间的平台使用费。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  5.2.1&nbsp;&nbsp; 平台使用费结算：\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    5.2.1.1卖家主动要求停止店铺服务的不返还平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 5.2.1.2卖家因违规行为或资质造假被清退的不返还平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n  5.2.1.3每个店铺的平台使用费依据相应的服务期计算并缴纳。服务开通之日在每月的<span>1</span>日至<span>15</span>日（含）间的，开通当月按一个月收取平台使用费，服务开通之日在每月的<span>16</span>日（含）至月底最后一日间的，开通当月不收取平台使用费；\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   5.2.1.4拥有独立店铺<span>ID</span>的为一个店铺，若卖家根据经营情况须开通多个店铺的，须按照店铺数量缴纳相应的平台使用费。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   5.3&nbsp;&nbsp;&nbsp;&nbsp; 费率：卖家根据经营类目在达成每一单交易时按比例（该比例在与卖家签署的相关协议中称为“技术服务费费率”或“毛利保证率”）向平台缴纳的费用。平台开放平台各经营模式各经营类目对应的费率标准详见<span>《平台开放平台经营类目资费一览表》。 </span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    <b>第六章 店铺服务期</b> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 6.1&nbsp;&nbsp;&nbsp;&nbsp; 卖家每个店铺的第一个服务期自服务开通之日起至最先到达的<span>3</span>月<span>31</span>日止，第二个服务期自<span>4</span>月<span>1</span>日起至次年<span>3</span>月<span>31</span>日止，第三个、第四个……服务期以此类推，以一年为周期，除非店铺或与卖家签署的相关协议提前终止。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    6.2&nbsp;&nbsp;&nbsp;&nbsp; 卖家每个店铺的服务开通之日以平台通知或系统记录的时间为准。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 6.3&nbsp;&nbsp;&nbsp;&nbsp; 卖家应在店铺每个服务期届满前<span>30</span>日向甲方提出续展的申请，缴纳续展服务期的平台使用费和提交其经营所需的全部有效资质，并经平台审核。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n 6.4&nbsp;&nbsp;&nbsp;&nbsp; 卖家未提出续展申请或申请未通过平台审核的，自店铺服务期满之日起，平台开放平台将不再向卖家提供该店铺的任何服务。\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   <br />\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n    发布日期：<span>2013</span>年<span>11</span>月<span>19</span>日\r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:left;\">\r\n   生效日期：<span>2014</span>年<span>1</span>月<span>1</span>日\r\n</p>\r\n<br />','',1399282350,1,1),(99,4,'资费标准','<br />\r\n<p>\r\n  </p><h3 class=\"help_tit\">\r\n       <strong>2014年开放平台重点招募品牌</strong> \r\n   </h3>\r\n   <div class=\"help_box\">\r\n      <p>\r\n         <img src=\"../data/upload/shop/editor/20140505170523_59415.jpg\" alt=\"\" /> \r\n       </p>\r\n    </div>\r\n\r\n<p>\r\n   <br />\r\n</p>\r\n<div class=\"help_box\">\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     发布日期：2014年04月20日&nbsp;\r\n  </p>\r\n    <p>\r\n     修订日期：2014年05月01日\r\n    </p>\r\n</div>','',1399282379,1,1),(101,155,'签署入驻协议','签署入驻协议','',1392949932,99,1),(102,156,'商家信息提交','商家信息提交','',1392949961,99,1),(103,157,'平台审核资质','平台审核资质','',1392949991,99,1),(104,158,'商家缴纳费用','商家缴纳费用','',1392950031,99,1),(105,159,'店铺开通','店铺开通','',1392950076,99,1),(106,255,'商品发布规则','商品发布规则','',1392950396,91,1),(107,255,'商品规格及属性','商品规格及属性','',1392950481,92,1),(108,255,'限时折扣说明','限时折扣说明','',1392950523,93,1),(109,255,'订单商品退款','订单商品退款','',1392950670,94,1),(110,255,'续约流程及费用','续约流程及费用','',1392950739,95,1);
/*!40000 ALTER TABLE `pmall_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_help_type`
--

DROP TABLE IF EXISTS `pmall_help_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_help_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(50) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `help_code` varchar(10) DEFAULT 'auto' COMMENT '调用编号(auto的可删除)',
  `help_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示,0为否,1为是,默认为1',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1为店铺,2为会员,默认为1',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='帮助类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_help_type`
--

LOCK TABLES `pmall_help_type` WRITE;
/*!40000 ALTER TABLE `pmall_help_type` DISABLE KEYS */;
INSERT INTO `pmall_help_type` VALUES (91,'规则体系',91,'sys_rules',1,1),(92,'商品管理',92,'sys_goods',1,1),(93,'促销方式',93,'sys_sales',1,1),(94,'订单及售后',94,'sys_order',1,1),(95,'店铺续约',95,'sys_renew',1,1),(99,'入驻流程',99,'store_in',1,1);
/*!40000 ALTER TABLE `pmall_help_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_inform`
--

DROP TABLE IF EXISTS `pmall_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人id',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品id',
  `inform_goods_name` varchar(100) NOT NULL COMMENT '被举报的商品名称',
  `inform_subject_id` int(11) NOT NULL COMMENT '举报主题id',
  `inform_subject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) DEFAULT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) DEFAULT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) DEFAULT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺id',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) NOT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) DEFAULT '' COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) DEFAULT '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_inform`
--

LOCK TABLES `pmall_inform` WRITE;
/*!40000 ALTER TABLE `pmall_inform` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_inform_subject`
--

DROP TABLE IF EXISTS `pmall_inform_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_inform_subject` (
  `inform_subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题id',
  `inform_subject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `inform_subject_type_id` int(11) NOT NULL COMMENT '举报类型id',
  `inform_subject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_subject_state` tinyint(11) NOT NULL COMMENT '举报主题状态(1可用/2失效)',
  PRIMARY KEY (`inform_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_inform_subject`
--

LOCK TABLES `pmall_inform_subject` WRITE;
/*!40000 ALTER TABLE `pmall_inform_subject` DISABLE KEYS */;
INSERT INTO `pmall_inform_subject` VALUES (1,'管制刀具、弓弩类、其他武器等',1,'出售禁售品',1),(2,'赌博用具类',1,'出售禁售品',1),(3,'枪支弹药',1,'出售禁售品',1),(4,'毒品及吸毒工具',1,'出售禁售品',1),(5,'色差大，质量差。',2,'产品质量问题',1);
/*!40000 ALTER TABLE `pmall_inform_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_inform_subject_type`
--

DROP TABLE IF EXISTS `pmall_inform_subject_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_inform_subject_type` (
  `inform_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型id',
  `inform_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `inform_type_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `inform_type_state` tinyint(4) NOT NULL COMMENT '举报类型状态(1有效/2失效)',
  PRIMARY KEY (`inform_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_inform_subject_type`
--

LOCK TABLES `pmall_inform_subject_type` WRITE;
/*!40000 ALTER TABLE `pmall_inform_subject_type` DISABLE KEYS */;
INSERT INTO `pmall_inform_subject_type` VALUES (1,'出售禁售品','销售商城禁止和限制交易规则下所规定的所有商品。',1),(2,'产品质量问题','产品质量差，与描述严重不相符。',1);
/*!40000 ALTER TABLE `pmall_inform_subject_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_invoice`
--

DROP TABLE IF EXISTS `pmall_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_invoice` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `inv_state` enum('1','2') DEFAULT NULL COMMENT '1普通发票2增值税发票',
  `inv_title` varchar(50) DEFAULT '' COMMENT '发票抬头[普通发票]',
  `inv_content` varchar(10) DEFAULT '' COMMENT '发票内容[普通发票]',
  `inv_company` varchar(50) DEFAULT '' COMMENT '单位名称',
  `inv_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号',
  `inv_reg_addr` varchar(50) DEFAULT '' COMMENT '注册地址',
  `inv_reg_phone` varchar(30) DEFAULT '' COMMENT '注册电话',
  `inv_reg_bname` varchar(30) DEFAULT '' COMMENT '开户银行',
  `inv_reg_baccount` varchar(30) DEFAULT '' COMMENT '银行账户',
  `inv_rec_name` varchar(20) DEFAULT '' COMMENT '收票人姓名',
  `inv_rec_mobphone` varchar(15) DEFAULT '' COMMENT '收票人手机号',
  `inv_rec_province` varchar(30) DEFAULT '' COMMENT '收票人省份',
  `inv_goto_addr` varchar(50) DEFAULT '' COMMENT '送票地址',
  PRIMARY KEY (`inv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='买家发票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_invoice`
--

LOCK TABLES `pmall_invoice` WRITE;
/*!40000 ALTER TABLE `pmall_invoice` DISABLE KEYS */;
INSERT INTO `pmall_invoice` VALUES (1,2,'1','广州八百方信息技术有限公司','明细','','','','','','','','','','');
/*!40000 ALTER TABLE `pmall_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_link`
--

DROP TABLE IF EXISTS `pmall_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `link_url` varchar(100) DEFAULT NULL COMMENT '链接',
  `link_pic` varchar(100) DEFAULT NULL COMMENT '图片',
  `link_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='合作伙伴表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_link`
--

LOCK TABLES `pmall_link` WRITE;
/*!40000 ALTER TABLE `pmall_link` DISABLE KEYS */;
INSERT INTO `pmall_link` VALUES (1,'网店运维','http://www.shopnc.com','04639165739281622.jpg',0),(2,'Q群111731672','http://www.shopnc.com','04639165739281622.jpg',8),(39,'交流中心','http://www.shopnc.com','',9);
/*!40000 ALTER TABLE `pmall_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_lock`
--

DROP TABLE IF EXISTS `pmall_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_lock` (
  `pid` bigint(20) unsigned NOT NULL COMMENT 'IP+TYPE',
  `pvalue` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '次数',
  `expiretime` int(11) NOT NULL DEFAULT '0' COMMENT '锁定截止时间',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='防灌水表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_lock`
--

LOCK TABLES `pmall_lock` WRITE;
/*!40000 ALTER TABLE `pmall_lock` DISABLE KEYS */;
INSERT INTO `pmall_lock` VALUES (32322356023,1,1467859294),(32322356241,1,1469513407),(32322356373,1,1468381961),(32322357243,1,1467701220),(32322357563,1,1468897317);
/*!40000 ALTER TABLE `pmall_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mail_cron`
--

DROP TABLE IF EXISTS `pmall_mail_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mail_cron` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息任务计划id',
  `mail` varchar(100) NOT NULL COMMENT '邮箱地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `contnet` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件任务计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mail_cron`
--

LOCK TABLES `pmall_mail_cron` WRITE;
/*!40000 ALTER TABLE `pmall_mail_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_mail_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mail_msg_temlates`
--

DROP TABLE IF EXISTS `pmall_mail_msg_temlates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mail_msg_temlates` (
  `name` varchar(100) NOT NULL COMMENT '模板名称',
  `title` varchar(100) DEFAULT NULL COMMENT '模板标题',
  `code` varchar(30) NOT NULL COMMENT '模板调用代码',
  `content` text NOT NULL COMMENT '模板内容',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mail_msg_temlates`
--

LOCK TABLES `pmall_mail_msg_temlates` WRITE;
/*!40000 ALTER TABLE `pmall_mail_msg_temlates` DISABLE KEYS */;
INSERT INTO `pmall_mail_msg_temlates` VALUES ('<strong>[用户]</strong>身份验证通知','账户安全认证 - {$site_name}','authenticate','【{$site_name}】您于{$send_time}提交账户安全验证，验证码是：{$verify_code}。'),('<strong>[用户]</strong>邮箱验证通知','邮箱验证通知 - {$site_name}','bind_email','<p>您好！</p>\r\n<p>请在24小时内点击以下链接完成邮箱验证</p>\r\n<p><a href=\"{$verify_url}\" target=\"_blank\">马上验证</a></p>\r\n<p>如果您不能点击上面链接，还可以将以下链接复制到浏览器地址栏中访问</p>\r\n<p>{$verify_url}</p>'),('<strong>[ç”¨æˆ·]</strong>æ‰‹æœºå·éªŒè¯é€šçŸ¥','手机号验证通知 - {$site_name}','mobile_verify_code','【{$site_name}】您的验证码是：{$verify_code}，在{$effect_minutes}分钟内有效，如非本人操作请忽略本短信。'),('<strong>[用户]</strong>手机验证通知','手机验证通知 - {$site_name}','modify_mobile','【{$site_name}】您于{$send_time}绑定手机号，验证码是：{$verify_code}。'),('<strong>[用户]</strong>重置密码通知','重置密码通知 - {$site_name}','reset_pwd','<p>您好！</p>\r\n<p>您刚才在{$site_name}重置了密码，新密码为：{$new_password}。</p>\r\n<p>请尽快登录 <a href=\"{$site_url}\" target=\"_blank\">{$site_url}</a> 修改密码。</p>'),('<strong>[用户]</strong>门店提货通知','门店提货通知 - {$site_name}','send_chain_code','【{$site_name}】您已成功下单，订单号：{$order_sn}，提货码：{$chain_code}，请持以上信息及时到门店取货。'),('<strong>[用户]</strong>自提通知','用户自提通知 - {$site_name}','send_pickup_code','【{$site_name}】您的订单已到达自提点，请上门取货！提货时请提供手机号/订单号/运单号及提货码：{$pickup_code}。'),('<strong>[用户]</strong>虚拟兑换码通知','虚拟兑换码通知 - {$site_name}','send_vr_code','【{$site_name}】您的虚拟兑换码是：{$vr_code}。');
/*!40000 ALTER TABLE `pmall_mail_msg_temlates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mall_consult`
--

DROP TABLE IF EXISTS `pmall_mall_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mall_consult` (
  `mc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询id',
  `mct_id` int(10) unsigned NOT NULL COMMENT '咨询类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `mc_content` varchar(500) NOT NULL COMMENT '咨询内容',
  `mc_addtime` int(10) unsigned NOT NULL COMMENT '咨询时间',
  `is_reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回复，1是，0否，默认0',
  `mc_reply` varchar(500) DEFAULT '' COMMENT '回复内容',
  `mc_reply_time` int(10) unsigned DEFAULT '0' COMMENT '回复时间',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(50) DEFAULT '' COMMENT '管理员名称',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mall_consult`
--

LOCK TABLES `pmall_mall_consult` WRITE;
/*!40000 ALTER TABLE `pmall_mall_consult` DISABLE KEYS */;
INSERT INTO `pmall_mall_consult` VALUES (1,1,14,'13560134398','有事咨询',1468551865,1,'啥事？没事退朝！',1468551891,1,'admin');
/*!40000 ALTER TABLE `pmall_mall_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mall_consult_type`
--

DROP TABLE IF EXISTS `pmall_mall_consult_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mall_consult_type` (
  `mct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询类型id',
  `mct_name` varchar(50) NOT NULL COMMENT '咨询类型名称',
  `mct_introduce` text NOT NULL COMMENT '平台客服咨询类型备注',
  `mct_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '咨询类型排序',
  PRIMARY KEY (`mct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mall_consult_type`
--

LOCK TABLES `pmall_mall_consult_type` WRITE;
/*!40000 ALTER TABLE `pmall_mall_consult_type` DISABLE KEYS */;
INSERT INTO `pmall_mall_consult_type` VALUES (1,'商品咨询','&lt;p&gt;\r\n  请写明商品链接，或平台货号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n   如果您对商品规格、介绍等有疑问，可以在商品详情页“购买咨询”处发起咨询，会得到及时专业的回复。\r\n&lt;/p&gt;',255),(2,'订单咨询','&lt;p&gt;\r\n  请写明要咨询的订单编号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n 如需处理交易中产生的纠纷，请选择投诉。\r\n&lt;/p&gt;',255);
/*!40000 ALTER TABLE `pmall_mall_consult_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_manufacturer`
--

DROP TABLE IF EXISTS `pmall_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_manufacturer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sda_code` varchar(50) DEFAULT NULL,
  `provice` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `legal_representative` varchar(100) DEFAULT NULL,
  `responsible_person` varchar(100) DEFAULT NULL,
  `register_address` varchar(500) DEFAULT NULL,
  `manufacturing_address` varchar(500) DEFAULT NULL,
  `production_scope` varchar(1000) DEFAULT NULL,
  `production_category` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `tmp_drug_base_id` bigint(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hhh` (`tmp_drug_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160935 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_manufacturer`
--

LOCK TABLES `pmall_manufacturer` WRITE;
/*!40000 ALTER TABLE `pmall_manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_category`
--

DROP TABLE IF EXISTS `pmall_mb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_category` (
  `gc_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '商城系统的分类ID',
  `gc_thumb` varchar(150) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一级分类缩略图[手机端]';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_category`
--

LOCK TABLES `pmall_mb_category` WRITE;
/*!40000 ALTER TABLE `pmall_mb_category` DISABLE KEYS */;
INSERT INTO `pmall_mb_category` VALUES (1,'05015381809285330.png'),(2,'05015381349504237.png'),(3,'05015381681266734.png'),(256,'05015381190111257.png'),(308,'05015382063902705.png'),(470,'05015382211209809.png'),(530,'05015382869763762.png'),(593,'05015382413708016.png'),(730,'05015382972892418.png'),(825,'05015383078446336.png'),(888,'05015382679643040.png'),(959,'05015383177958780.png'),(1037,'05015383410379550.png');
/*!40000 ALTER TABLE `pmall_mb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_feedback`
--

DROP TABLE IF EXISTS `pmall_mb_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL COMMENT '1来自手机端2来自PC端',
  `ftime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='意见反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_feedback`
--

LOCK TABLES `pmall_mb_feedback` WRITE;
/*!40000 ALTER TABLE `pmall_mb_feedback` DISABLE KEYS */;
INSERT INTO `pmall_mb_feedback` VALUES (1,'投诉太慢','wap',1468551579,14,'13560134398');
/*!40000 ALTER TABLE `pmall_mb_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_payment`
--

DROP TABLE IF EXISTS `pmall_mb_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(20) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` varchar(255) DEFAULT NULL COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机支付方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_payment`
--

LOCK TABLES `pmall_mb_payment` WRITE;
/*!40000 ALTER TABLE `pmall_mb_payment` DISABLE KEYS */;
INSERT INTO `pmall_mb_payment` VALUES (1,'alipay','支付宝','','0'),(2,'wxpay','微信支付','a:5:{s:11:\"wxpay_appid\";s:6:\"cesces\";s:15:\"wxpay_appsecret\";s:11:\"csecsecsecs\";s:12:\"wxpay_appkey\";s:0:\"\";s:15:\"wxpay_partnerid\";s:9:\"secsecsec\";s:16:\"wxpay_partnerkey\";s:8:\"secsecse\";}','1'),(3,'wxpay_jsapi','微信支付JSAPI','','0'),(4,'alipay_mb','支付宝移动支付','a:2:{s:17:\"mb_alipay_account\";s:9:\"cescesces\";s:17:\"mb_alipay_partner\";s:12:\"123123123123\";}','0');
/*!40000 ALTER TABLE `pmall_mb_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_seller_token`
--

DROP TABLE IF EXISTS `pmall_mb_seller_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_seller_token` (
  `token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_name` varchar(50) NOT NULL COMMENT '用户名',
  `token` varchar(50) NOT NULL COMMENT '登录令牌',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  `login_time` int(10) unsigned NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) NOT NULL COMMENT '客户端类型 windows',
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端商家登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_seller_token`
--

LOCK TABLES `pmall_mb_seller_token` WRITE;
/*!40000 ALTER TABLE `pmall_mb_seller_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_mb_seller_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_special`
--

DROP TABLE IF EXISTS `pmall_mb_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_special` (
  `special_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `special_desc` varchar(20) NOT NULL COMMENT '专题描述',
  PRIMARY KEY (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_special`
--

LOCK TABLES `pmall_mb_special` WRITE;
/*!40000 ALTER TABLE `pmall_mb_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_mb_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_special_item`
--

DROP TABLE IF EXISTS `pmall_mb_special_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_special_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题项目编号',
  `special_id` int(10) unsigned NOT NULL COMMENT '专题编号',
  `item_type` varchar(50) NOT NULL COMMENT '项目类型',
  `item_data` varchar(2000) NOT NULL COMMENT '项目内容',
  `item_usable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '项目是否可用 0-不可用 1-可用',
  `item_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '项目排序',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='手机专题项目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_special_item`
--

LOCK TABLES `pmall_mb_special_item` WRITE;
/*!40000 ALTER TABLE `pmall_mb_special_item` DISABLE KEYS */;
INSERT INTO `pmall_mb_special_item` VALUES (21,0,'adv_list','a:1:{s:4:\"item\";a:1:{s:24:\"s0_05230156041261502.png\";a:3:{s:5:\"image\";s:24:\"s0_05230156041261502.png\";s:4:\"type\";s:3:\"url\";s:4:\"data\";s:16:\"www.800pharm.com\";}}}',1,255),(23,0,'home3','a:2:{s:5:\"title\";s:0:\"\";s:4:\"item\";a:6:{s:24:\"s0_05230155043341905.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155043341905.png\";s:4:\"type\";s:3:\"url\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}s:24:\"s0_05230155497472387.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155497472387.png\";s:4:\"type\";s:3:\"url\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}s:24:\"s0_05230155677183303.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155677183303.png\";s:4:\"type\";s:0:\"\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}s:24:\"s0_05230155730512225.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155730512225.png\";s:4:\"type\";s:0:\"\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}s:24:\"s0_05230155795381781.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155795381781.png\";s:4:\"type\";s:0:\"\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}s:24:\"s0_05230155885576661.png\";a:3:{s:5:\"image\";s:24:\"s0_05230155885576661.png\";s:4:\"type\";s:0:\"\";s:4:\"data\";s:80:\"http://www.800pharm.com/shop/m/searchList.html?categoryId=32&amp;gg_code=Ydsygd4\";}}}',1,255);
/*!40000 ALTER TABLE `pmall_mb_special_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_mb_user_token`
--

DROP TABLE IF EXISTS `pmall_mb_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_mb_user_token` (
  `token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `token` varchar(50) NOT NULL COMMENT '登录令牌',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  `login_time` int(10) unsigned NOT NULL COMMENT '登录时间',
  `client_type` varchar(10) NOT NULL COMMENT '客户端类型 android wap',
  PRIMARY KEY (`token_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='移动端登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_mb_user_token`
--

LOCK TABLES `pmall_mb_user_token` WRITE;
/*!40000 ALTER TABLE `pmall_mb_user_token` DISABLE KEYS */;
INSERT INTO `pmall_mb_user_token` VALUES (1,1,'800@member.com','56d76dce6869f7101ae09ae304c46c56',NULL,1467603348,'wap'),(2,1,'800@member.com','2791588b87eb01df0f68d3202db47a2a',NULL,1467603486,'wap'),(3,1,'800@member.com','a1d2bd2c92848ec9a93bcd7fc05daf0f',NULL,1467610737,'wap'),(4,1,'800@member.com','903fffcf2e145203785b5b7f15df52b4',NULL,1467611822,'wap'),(5,2,'testuser','1888144878cc58abd2c7facb4b8e15bf',NULL,1467614374,'wap'),(6,3,'testuser2','d55201e21af427b55189144142cf613f',NULL,1467616774,'wap'),(7,2,'testuser','6ade70969d7624346a873bf5d8f8ba18',NULL,1467616925,'wap'),(8,3,'testuser2','7cfb350789d961410277559e293038e1',NULL,1467617101,'wap'),(9,2,'testuser','10a1d4adf79c77229ab4c9696fecc82b',NULL,1467617292,'wap'),(10,3,'testuser2','4214e5274cfc43826b03189eb89ca34c',NULL,1467622927,'wap'),(11,2,'testuser','bfd41a0266f813e5a659b293e2d147da',NULL,1467623775,'wap'),(12,6,'test3','7c84c23e5fae0d4898ce529523b904c0',NULL,1467623860,'wap'),(13,2,'testuser','f9682103dc5e39d8471b2a1c02d57664',NULL,1467623888,'wap'),(14,7,'kit','01d4be1a1405537c51132b9e65fb5370',NULL,1467800286,'wap'),(15,8,'test','b4e055f0e19da171b2e8cb247c63f0c0',NULL,1467858802,'wap'),(16,8,'test','decb8a3b6176d47ea4131050f1eca7a4',NULL,1467859427,'wap'),(17,1,'800@member.com','cacbe7a9332135633137175f2f706c33',NULL,1467941904,'wap'),(18,2,'testuser','d5c1612b2f7f41b929495aa95d8d9c0b',NULL,1467965488,'wap'),(19,9,'eveyb','6d396b4e20c7dd488373b773690f81db',NULL,1468230000,'wap'),(20,2,'testuser','7a57a3626e1b1b6f1b11c52c1152aca5',NULL,1468325394,'wap'),(21,9,'eveyb','8e12823c261a2c5f68d7e19e5d50a450',NULL,1468388475,'wap'),(22,9,'eveyb','5301254a1c7b033cf2bb5f5b15d32634',NULL,1468388489,'wap'),(23,9,'eveyb','7e068dcf00c7234577e990db13d764a8',NULL,1468388928,'wap'),(24,9,'eveyb','ed3ff3122ec085ad0e39893c46febe5c',NULL,1468388983,'wap'),(25,5,'eshop2','7e6a8ed33e0d734474d6b8fe37f0fde2',NULL,1468389126,'wap'),(26,2,'testuser','a2d7ea42d9fdbcafd705675ebf51642e',NULL,1468389390,'wap'),(27,9,'eveyb','cfab571c7a67ce30c2b22b1ebaa66562',NULL,1468391043,'wap'),(28,9,'eveyb','506a0288bd5f1df757b07b2599834197',NULL,1468391065,'wap'),(29,11,'15999904305','cc9614be676eaeba34f3e960da8a3401',NULL,1468401415,'wap'),(30,11,'15999904305','c35a5f3b279f68e398a2e58d8ce6bc62',NULL,1468547921,'wap'),(31,14,'13560134398','85bbfc4f9f4a78dd591e7b629bd80a09',NULL,1468550832,'wap'),(32,14,'13560134398','2d5196c248db94c7f1069719e0824fcc',NULL,1468552046,'wap'),(33,15,'13560134397','9aed8eaa4507629e2ad256f40006edeb',NULL,1468553067,'wap'),(34,11,'15999904305','06700e4d15f31dcd68de1a5b5d437c1b',NULL,1468810055,'wap'),(35,16,'Aidan','e3a7dab01b5c342450ad68c3bc75ca7d',NULL,1468900227,'wap'),(36,7,'kit','1717a381a89bbed632f192ccc5a6a2e2',NULL,1468925323,'wap'),(37,15,'13560134397','5c59cdc5fd2aab76c55cb978d09b668c',NULL,1469437673,'wap'),(38,16,'Aidan','763d64ffd5b25b09e387b8a96beaab09',NULL,1469437743,'wap'),(39,11,'15999904305','3296f04d177dfbec4e06029ec07b1d76',NULL,1469437974,'wap'),(40,16,'Aidan','60c02f17c334ec15960b654c34ce59fc',NULL,1469438028,'wap'),(41,14,'13560134398','fecbffcd5b77493e269d249439883499',NULL,1469438856,'wap'),(42,7,'kit','e46bf4396bb9ec8d8780b7b9ed25885d',NULL,1469521555,'wap'),(43,7,'kit','5731cd452e9a056377000f0b09fa02f6',NULL,1469529208,'wap'),(44,14,'13560134398','24d4eb7bf050607e8b4d66a5b571f174',NULL,1469582089,'wap'),(45,14,'13560134398','2a3f1cafae81d0cbc98d0b58b57adca8',NULL,1469587558,'wap'),(46,11,'15999904305','cd11c39999f762803c7d0f782fc78b62',NULL,1469615589,'wap');
/*!40000 ALTER TABLE `pmall_mb_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_member`
--

DROP TABLE IF EXISTS `pmall_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `b2c_member_id` int(11) unsigned DEFAULT NULL COMMENT 'B2Cç”¨æˆ·ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `member_truename` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `member_avatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别',
  `member_birthday` date DEFAULT NULL COMMENT '生日',
  `member_passwd` varchar(32) NOT NULL COMMENT '会员密码',
  `member_paypwd` char(32) DEFAULT NULL COMMENT '支付密码',
  `member_email` varchar(100) NOT NULL COMMENT '会员邮箱',
  `member_email_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_mobile` varchar(11) DEFAULT NULL COMMENT '手机号',
  `member_mobile_bind` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未绑定1已绑定',
  `member_qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `member_ww` varchar(100) DEFAULT NULL COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL DEFAULT '1' COMMENT '登录次数',
  `member_time` varchar(10) NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) DEFAULT NULL COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) DEFAULT NULL COMMENT '上次登录ip',
  `member_qqopenid` varchar(100) DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) DEFAULT NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `weixin_unionid` varchar(50) DEFAULT NULL COMMENT '微信用户统一标识',
  `weixin_openid` varchar(64) DEFAULT NULL COMMENT 'å¾®ä¿¡openid',
  `weixin_info` varchar(255) DEFAULT NULL COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `available_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额',
  `freeze_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buy` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_snsvisitnum` int(11) NOT NULL DEFAULT '0' COMMENT 'sns空间访问次数',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) DEFAULT NULL COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  `member_exppoints` int(11) NOT NULL DEFAULT '0' COMMENT '会员经验值',
  `invite_one` int(10) DEFAULT '0' COMMENT '一级会员',
  `invite_two` int(10) DEFAULT '0' COMMENT '二级会员',
  `invite_three` int(10) DEFAULT '0' COMMENT '三级会员',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'åˆ›å»ºæ—¶é—´',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`),
  KEY `weixin_openid` (`weixin_openid`),
  KEY `b2c_member_id` (`b2c_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_member`
--

LOCK TABLES `pmall_member` WRITE;
/*!40000 ALTER TABLE `pmall_member` DISABLE KEYS */;
INSERT INTO `pmall_member` VALUES (1,NULL,'800@member.com',NULL,NULL,NULL,NULL,'ae0498f01e226fc934a03b9aae923a92',NULL,'zhuangqh@800pharn.com',0,NULL,0,NULL,NULL,12,'1467600281','1469512745','1468382392','192.168.0.104','192.168.0.29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,150,'0.00','0.00','0.00','0.00',1,1,1,1,3,NULL,NULL,NULL,NULL,NULL,25,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,NULL,'testuser','',NULL,0,NULL,'5d9c68c6c50ed3d02a2fcf54f63993b6',NULL,'zhuangqh@800pharm.com',0,NULL,0,'','',5,'1467614374','1468403067','1467965374','192.168.0.117','192.168.0.204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,906,'70.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,954,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,NULL,'testuser2',NULL,NULL,NULL,NULL,'58dd024d49e1d1b83a5d307f09f32734',NULL,'testuset2@800pharm.com',0,NULL,0,NULL,NULL,7,'1467616774','1467700890','1467700816','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,850,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,505,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,NULL,'eshop',NULL,NULL,NULL,NULL,'0b27e23e74adc7e3f21cec75047ebd4f',NULL,'eshop123@123.com',0,NULL,0,NULL,NULL,1,'1467623093','1467623093','1467623093','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,NULL,'eshop2',NULL,NULL,NULL,NULL,'387d9f77a21fed3ec76298aa4e8f9d84',NULL,'',0,'13560134399',0,NULL,NULL,2,'1467623186','1468552094','1467623186','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'100.00','110.10','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,NULL,'test3',NULL,NULL,NULL,NULL,'8ad8757baa8564dc136c1e07507f4a98',NULL,'test3@test.com',0,NULL,0,NULL,NULL,1,'1467623860','1467623860','1467623860','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,NULL,'kit',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'kit.wu@800pharm.com',0,'18026231117',0,NULL,NULL,8,'1467700620','1469524884','1468924835','192.168.0.204','192.168.0.204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3370,'105800.02','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,2025,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,NULL,'test',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'wcf818520@sina.com',0,NULL,0,NULL,NULL,1,'1467858694','1467858694','1467858694','192.168.0.82','192.168.0.82',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,NULL,'eveyb',NULL,NULL,NULL,NULL,'dcd2a6184959e0480e1cdc71835c9919',NULL,'eveyb@email.com',0,NULL,0,NULL,NULL,2,'1468230000','1468389019','1468230000','192.168.0.14','192.168.0.14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,NULL,'eshop3','',NULL,0,NULL,'dfe66b1f8958fc789070de3cd11c858d',NULL,'eshop3@800pharm.com',0,NULL,0,'','',3,'1468381361','1468403746','1468391025','192.168.0.29','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,NULL,'15999904305',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'',0,'15999904305',1,NULL,NULL,1,'1468401415','1468401415','1468401415','192.168.0.14','192.168.0.14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,NULL,'luojuan','骆娟',NULL,0,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'luoj@800pharm.com',0,NULL,0,'','',3,'1468476522','1468548758','1468482153','192.168.0.41','192.168.0.41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,NULL,'eshop4',NULL,NULL,NULL,NULL,'d1e48789b1e5b0f33e53bde7f92da75b',NULL,'',0,NULL,0,NULL,NULL,1,'1468483851','1468483851','1468483851','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,NULL,'13560134398',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'',0,'13560134398',1,NULL,NULL,6,'1468550832','1468551928','1468551927','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,'0.00','0.00','0.00','0.00',1,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,NULL,'13560134397',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e',NULL,'',0,'13560134397',1,NULL,NULL,3,'1468553067','1468571131','1468553090','192.168.0.117','192.168.0.117',NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'9899.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,200,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,NULL,'Aidan',NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e','1550683349@qq.com',0,'15989264655',1,NULL,NULL,17,'1468896717','1469669184','1469669179','192.168.0.236','192.168.0.236',NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'9999799.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,5,0,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,NULL,'ceshi',NULL,NULL,NULL,NULL,'a27ededa6fc5986376aadb439afb5d99',NULL,'',0,NULL,0,NULL,NULL,1,'1469582086','1469582086','1469582086','192.168.0.204','192.168.0.204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'0.00','0.00','0.00','0.00',1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pmall_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_member_common`
--

DROP TABLE IF EXISTS `pmall_member_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_member_common` (
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `auth_code` char(6) DEFAULT NULL COMMENT '短信/邮件验证码',
  `send_acode_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '短信/邮件验证码发送时间',
  `send_mb_time` int(11) DEFAULT NULL COMMENT '发送短信验证码时间',
  `send_email_time` int(11) DEFAULT NULL COMMENT '发送邮件验证码时间',
  `send_mb_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送手机验证码次数',
  `send_acode_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发送验证码次数',
  `send_mobile` varchar(11) DEFAULT NULL COMMENT 'æ‰‹æœºå·',
  `send_email` varchar(100) DEFAULT NULL COMMENT 'é‚®ç®±åœ°å€',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'åˆ›å»ºæ—¶é—´',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `send_mobile` (`send_mobile`),
  KEY `send_email` (`send_email`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='会员扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_member_common`
--

LOCK TABLES `pmall_member_common` WRITE;
/*!40000 ALTER TABLE `pmall_member_common` DISABLE KEYS */;
INSERT INTO `pmall_member_common` VALUES (1,'ufffl9',1467799416,NULL,NULL,0,0,NULL,NULL,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,NULL,0,NULL,NULL,0,0,NULL,NULL,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,NULL,0,NULL,NULL,0,0,NULL,NULL,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,NULL,0,NULL,NULL,0,0,NULL,NULL,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,NULL,0,NULL,NULL,0,0,NULL,NULL,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,NULL,0,NULL,NULL,0,0,NULL,NULL,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'ee668o',1467784362,NULL,NULL,0,0,NULL,NULL,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,NULL,0,NULL,NULL,0,0,NULL,NULL,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,NULL,0,NULL,NULL,0,0,NULL,NULL,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,NULL,0,NULL,NULL,0,0,NULL,NULL,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(0,'421692',1468401400,1468401400,NULL,1,0,'15999904305',NULL,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,NULL,0,NULL,NULL,0,0,NULL,NULL,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(0,'414491',1469512392,1469512392,NULL,1,0,'13138656869',NULL,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,NULL,0,NULL,NULL,0,0,NULL,NULL,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,NULL,0,NULL,NULL,0,0,NULL,NULL,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(0,'378884',1468550815,1468550815,NULL,1,0,'13560134398',NULL,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,NULL,0,NULL,NULL,0,0,NULL,NULL,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(0,'698393',1468553050,1468553050,NULL,1,0,'13560134397',NULL,18,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,NULL,0,NULL,NULL,0,0,NULL,NULL,19,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'',0,1468897950,NULL,1,2,NULL,NULL,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(0,'526473',1469514378,1469514378,NULL,3,0,'15800240520',NULL,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,NULL,0,NULL,NULL,0,0,NULL,NULL,48,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pmall_member_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_member_msg_setting`
--

DROP TABLE IF EXISTS `pmall_member_msg_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_member_msg_setting` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  `is_receive` tinyint(3) unsigned NOT NULL COMMENT '是否接收 1是，0否',
  PRIMARY KEY (`mmt_code`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息接收设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_member_msg_setting`
--

LOCK TABLES `pmall_member_msg_setting` WRITE;
/*!40000 ALTER TABLE `pmall_member_msg_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_member_msg_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_member_msg_tpl`
--

DROP TABLE IF EXISTS `pmall_member_msg_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_member_msg_tpl` (
  `mmt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `mmt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `mmt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `mmt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `mmt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `mmt_short_content` varchar(255) NOT NULL COMMENT '短信接收内容',
  `mmt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `mmt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `mmt_mail_content` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mmt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_member_msg_tpl`
--

LOCK TABLES `pmall_member_msg_tpl` WRITE;
/*!40000 ALTER TABLE `pmall_member_msg_tpl` DISABLE KEYS */;
INSERT INTO `pmall_member_msg_tpl` VALUES ('arrival_notice','到货通知提醒',0,'您关注的商品 “{$goods_name}” 已经到货。<a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a>',0,'【{$site_name}】您关注的商品 “{$goods_name}” 已经到货。',0,'{$site_name}提醒：您关注的商品  “{$goods_name}” 已经到货。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您关注的商品 “{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n <a href=\"{$goods_url}\" target=\"_blank\">点击查看商品</a> \r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('consult_goods_reply','商品咨询回复提醒',0,'您关于商品 “{$goods_name}”的咨询，商家已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>',0,'【{$site_name}】您关于商品 “{$goods_name}” 的咨询，商家已经回复。',0,'{$site_name}提醒：您关于商品 “{$goods_name}”的咨询，商家已经回复。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您关注的商品“{$goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n  <a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />\r\n<div class=\"firebugResetStyles firebugBlockBackgroundColor\">\r\n <div style=\"background-color:transparent ! important;\" class=\"firebugResetStyles\">\r\n  </div>\r\n</div>'),('consult_mall_reply','平台客服回复提醒',0,'您的平台客服咨询已经回复。<a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a>',0,'【{$site_name}】您的平台客服咨询已经回复。',0,'{$site_name}提醒：您的平台客服咨询已经回复。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的平台客服咨询已经回复。\r\n</p>\r\n<p>\r\n    <a href=\"{$consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('order_book_end_pay','预定订单尾款支付提醒',0,'您的订单已经进入支付尾款时间。<a href=\"{$order_url}\" target=\"_blank\">点击支付尾款</a>',0,'【{$site_name}】您的订单已经进入支付尾款时间。订单编号 {$order_sn}。',0,'{$site_name}提醒：您的订单已经进入支付尾款时间。订单编号 {$order_sn}。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的订单已经进入支付尾款时间。订单编号 {$order_sn}。<br />\r\n<a href=\"{$order_url}\" target=\"_blank\">点击支付尾款</a>\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('order_deliver_success','商品出库提醒',1,'【八百方】【药店名】您的订单药房人员正在飞奔赶来，请保持电话畅通，准备签收',1,'【八百方】【药店名】您的订单药房人员正在飞奔赶来，请保持电话畅通，准备签收',0,'{$site_name}提醒：您的订单已经出库。订单编号 {$order_sn}。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的订单已经出库。订单编号 {$order_sn}。<br />\r\n<a href=\"{$order_url}\" target=\"_blank\">点击查看订单</a>\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('order_payment_success','付款成功提醒',1,'【八百方】【药店名】您的订单已提交成功，药房会尽快配送，请耐心等候',1,'【八百方】【药店名】您的订单已提交成功，药房会尽快配送，请耐心等候',0,'{$site_name}提醒：{$order_sn}的款项已经收到，请留意出库通知。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  {$order_sn}的款项已经收到，请留意出库通知。\r\n</p>\r\n<p>\r\n  <a href=\"{$order_url}\" target=\"_blank\">点击查看订单详情</a>\r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('predeposit_change','余额变动提醒',0,'你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化 ：{$av_amount}元，冻结金额变化：{$freeze_amount}元。<a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a>',0,'【{$site_name}】你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。',0,'{$site_name}提醒：你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化： {$av_amount}元，冻结金额变化：{$freeze_amount}元。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 {$time} 账户资金有变化，描述：{$desc}，可用金额变化：{$av_amount}元，冻结金额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"{$pd_url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('recharge_card_balance_change','充值卡余额变动提醒',0,'你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化 ：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。<a href=\"{$url}\" target=\"_blank\">点击查看充值卡余额</a>',0,'【{$site_name}】你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。',0,'{$site_name}提醒：你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化： {$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 {$time} 充值卡余额有变化，描述：{$description}，可用充值卡余额变化：{$available_amount}元，冻结充值卡余额变化：{$freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"{$url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>'),('refund_return_notice','退款退货提醒',0,'您的退款退货单有了变化。<a href=\"{$refund_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您的退款退货单有了变化。退款退货单编号：{$refund_sn}。',0,'{$site_name}提醒：您的退款退货单有了变化。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的退款退货单有了变化。退款退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    &lt;a href=\"{$refund_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />'),('rpt_use','红包使用提醒',0,'您有红包已经使用，编号：{$rpacket_code}。<a href=\"{$rpacket_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有红包已经使用，编号：{$rpacket_code}。',0,'{$site_name}提醒：您有红包已经使用，编号：{$rpacket_code}。','<p>\n  {$site_name}提醒：\n</p>\n<p>\n  您有红包已经使用，编号：{$rpacket_code}。\n</p>\n<p>\n &lt;a href=\"{$rpacket_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\n</p>\n<p>\n    <br />\n</p>\n<p>\n   <br />\n</p>\n<p>\n   <br />\n</p>\n<p style=\"text-align:right;\">\n {$site_name}\n</p>\n<p style=\"text-align:right;\">\n   {$mail_send_time}\n</p>\n<p>\n    <br />\n</p>\n<p>\n   <br />\n</p>'),('voucher_use','代金券使用提醒',0,'您有代金券已经使用，代金券编号：{$voucher_code}。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有代金券已经使用，代金券编号：{$voucher_code}。',0,'{$site_name}提醒：您有代金券已经使用，代金券编号：{$voucher_code}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有代金券已经使用，代金券编号：{$voucher_code}。\r\n</p>\r\n<p>\r\n &lt;a href=\"{$voucher_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>'),('voucher_will_expire','代金券即将到期提醒',0,'您有一个代金券即将在{$indate}过期，请记得使用。<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有一个代金券即将在{$indate}过期，请记得使用。',0,'{$site_name}提醒：您有一个代金券即将在{$indate}过期，请记得使用。','<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个代金券即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	<a href=\"{$voucher_url}\" target=\"_blank\">点击查看</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>'),('vr_code_will_expire','兑换码即将到期提醒',0,'您有一组兑换码即将在{$indate}过期，请记得使用。<a href=\"{$vr_order_url}\" target=\"_blank\">点击查看</a>',0,'【{$site_name}】您有一组兑换码即将在{$indate}过期，请记得使用。',0,'{$site_name}提醒：您有一组兑换码即将在{$indate}过期，请记得使用。','<p>\r\n	{$site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一组兑换码即将在{$indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	&lt;a href=\"{$vr_order_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	{$mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>');
/*!40000 ALTER TABLE `pmall_member_msg_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_message`
--

DROP TABLE IF EXISTS `pmall_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息索引id',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名',
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(255)),
  KEY `message_ismore` (`message_ismore`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='短消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_message`
--

LOCK TABLES `pmall_message` WRITE;
/*!40000 ALTER TABLE `pmall_message` DISABLE KEYS */;
INSERT INTO `pmall_message` VALUES (1,0,0,'3',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=9\" target=\"_blank\">点击查看订单</a>','1467623715','1467623715',0,0,1,'','',0,'',''),(2,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=11\" target=\"_blank\">点击查看订单</a>','1467718931','1467718931',0,0,1,'','',0,'',''),(3,0,0,'2',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=8\" target=\"_blank\">点击查看订单</a>','1467719239','1467719239',0,0,1,'','',0,'',''),(4,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=1\" target=\"_blank\">点击查看</a>','1467721125','1467721125',0,0,1,'','',0,'',''),(5,0,0,'7',NULL,'你的账户于 2016-07-05 20:20:35 账户资金有变化，描述：确认退款，订单号: 8000000000001101，可用金额变化 ：52800.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467721235','1467721235',0,0,1,'','',0,'',''),(6,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=1\" target=\"_blank\">点击查看</a>','1467721235','1467721235',0,0,1,'','',0,'',''),(7,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=12\" target=\"_blank\">点击查看订单</a>','1467777335','1467777335',0,0,1,'','',0,'',''),(8,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=2\" target=\"_blank\">点击查看</a>','1467782992','1467782992',0,0,1,'','',0,'',''),(9,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=13\" target=\"_blank\">点击查看订单</a>','1467783466','1467783466',0,0,1,'','',0,'',''),(10,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_return&op=view&return_id=3\" target=\"_blank\">点击查看</a>','1467783602','1467783602',0,0,1,'','',0,'',''),(11,0,0,'7',NULL,'关于订单：8000000000001001的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=10\" target=\"_blank\">点击查看订单详情</a>','1467784465','1467784465',0,0,1,'','',0,'',''),(12,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_return&op=view&return_id=3\" target=\"_blank\">点击查看</a>','1467784795','1467784795',0,0,1,'','',0,'',''),(13,0,0,'7',NULL,'你的账户于 2016-07-06 14:00:34 账户资金有变化，描述：确认退款，订单号: 8000000000001301，可用金额变化 ：52800.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467784834','1467784834',0,0,1,'','',0,'',''),(14,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&return_id=3\" target=\"_blank\">点击查看</a>','1467784834','1467784834',0,0,1,'','',0,'',''),(15,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=4\" target=\"_blank\">点击查看</a>','1467785120','1467785120',0,0,1,'','',0,'',''),(16,0,0,'7',NULL,'你的账户于 2016-07-06 14:05:52 账户资金有变化，描述：确认退款，订单号: 8000000000001001，可用金额变化 ：0.01元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467785152','1467785152',0,0,1,'','',0,'',''),(17,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=4\" target=\"_blank\">点击查看</a>','1467785152','1467785152',0,0,1,'','',0,'',''),(18,0,0,'7',NULL,'关于订单：8000000000001401的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=14\" target=\"_blank\">点击查看订单详情</a>','1467785664','1467785664',0,0,1,'','',0,'',''),(19,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=14\" target=\"_blank\">点击查看订单</a>','1467785692','1467785692',0,0,1,'','',0,'',''),(20,0,0,'7',NULL,'关于订单：8000000000001501的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=15\" target=\"_blank\">点击查看订单详情</a>','1467785803','1467785803',0,0,1,'','',0,'',''),(21,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_return&op=view&return_id=5\" target=\"_blank\">点击查看</a>','1467792942','1467792942',0,0,1,'','',0,'',''),(22,0,0,'7',NULL,'你的账户于 2016-07-06 16:17:47 账户资金有变化，描述：确认退款，订单号: 8000000000001401，可用金额变化 ：0.01元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467793067','1467793067',0,0,1,'','',0,'',''),(23,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&return_id=5\" target=\"_blank\">点击查看</a>','1467793067','1467793067',0,0,1,'','',0,'',''),(24,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=15\" target=\"_blank\">点击查看订单</a>','1467794211','1467794211',0,0,1,'','',0,'',''),(25,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_return&op=view&return_id=6\" target=\"_blank\">点击查看</a>','1467794316','1467794316',0,0,1,'','',0,'',''),(26,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_return&op=view&return_id=6\" target=\"_blank\">点击查看</a>','1467794340','1467794340',0,0,1,'','',0,'',''),(27,0,0,'7',NULL,'你的账户于 2016-07-06 16:39:13 账户资金有变化，描述：确认退款，订单号: 8000000000001501，可用金额变化 ：100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467794353','1467794353',0,0,1,'','',0,'',''),(28,0,0,'7',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&return_id=6\" target=\"_blank\">点击查看</a>','1467794353','1467794353',0,0,1,'','',0,'',''),(29,0,0,'2',NULL,'关于订单：8000000000002801的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=28\" target=\"_blank\">点击查看订单详情</a>','1467947548','1467947548',0,0,1,'','',0,'',''),(30,0,0,'2',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=28\" target=\"_blank\">点击查看订单</a>','1467965091','1467965091',0,0,1,'','',0,'',''),(31,0,0,'5',NULL,'你的账户于 2016-07-08 16:09:39 账户资金有变化，描述：卖出商品收入,扣除拥金9.9,订单号: 8000000000002801，可用金额变化 ：0.00元，冻结金额变化：110.10元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1467965379','1467965379',0,0,1,'','',0,'',''),(32,0,0,'7',NULL,'关于订单：8000000000002601的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=26\" target=\"_blank\">点击查看订单详情</a>','1468207285','1468207285',0,0,1,'','',0,'',''),(33,0,0,'2',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=34\" target=\"_blank\">点击查看订单</a>','1468307584','1468307584',0,0,1,'','',0,'',''),(34,0,0,'2',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=37\" target=\"_blank\">点击查看订单</a>','1468313649','1468313649',0,0,1,'','',0,'',''),(35,0,0,'2',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=38\" target=\"_blank\">点击查看订单</a>','1468389515','1468389515',0,0,1,'','',0,'',''),(36,0,15,'14',NULL,'hi','1468553122','1468553122',0,0,2,'','',0,'13560134397','13560134398'),(37,0,0,'15',NULL,'【八百方】【药店名】您的订单药房人员正在飞奔赶来，请保持电话畅通，准备签收','1468806479','1468806479',0,0,1,'','',0,'',''),(38,0,0,'16',NULL,'你的账户于 2016-07-19 11:07:45 账户资金有变化，描述：管理员调节预存款【增加】，充值单号: 430522241665960000，可用金额变化 ：10000000.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468897665','1468897665',0,0,1,'','',0,'',''),(39,0,0,'16',NULL,'你的账户于 2016-07-19 11:15:04 账户资金有变化，描述：下单，支付预存款，订单号: 8000000000004101，可用金额变化 ：-146300.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468898104','1468898104',0,0,1,'','',0,'',''),(40,0,0,'16',NULL,'你的账户于 2016-07-19 13:39:09 账户资金有变化，描述：下单，支付预存款，订单号: 8000000000004301，可用金额变化 ：-100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468906749','1468906749',0,0,1,'','',0,'',''),(41,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=9\" target=\"_blank\">点击查看</a>','1468907823','1468907823',0,0,1,'','',0,'',''),(42,0,0,'16',NULL,'你的账户于 2016-07-19 14:05:00 账户资金有变化，描述：确认退款，订单号: 8000000000004301，可用金额变化 ：100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468908300','1468908300',0,0,1,'','',0,'',''),(43,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=9\" target=\"_blank\">点击查看</a>','1468908300','1468908300',0,0,1,'','',0,'',''),(44,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=8\" target=\"_blank\">点击查看</a>','1468908706','1468908706',0,0,1,'','',0,'',''),(45,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=10\" target=\"_blank\">点击查看</a>','1468908788','1468908788',0,0,1,'','',0,'',''),(46,0,0,'16',NULL,'你的账户于 2016-07-19 14:13:34 账户资金有变化，描述：确认退款，订单号: 8000000000004101，可用金额变化 ：146300.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468908814','1468908814',0,0,1,'','',0,'',''),(47,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=10\" target=\"_blank\">点击查看</a>','1468908814','1468908814',0,0,1,'','',0,'',''),(48,0,0,'16',NULL,'你的账户于 2016-07-19 15:07:14 账户资金有变化，描述：下单，支付预存款，订单号: 8000000000004501，可用金额变化 ：-200.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468912034','1468912034',0,0,1,'','',0,'',''),(49,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=11\" target=\"_blank\">点击查看</a>','1468913366','1468913366',0,0,1,'','',0,'',''),(50,0,0,'16',NULL,'你的账户于 2016-07-19 15:35:48 账户资金有变化，描述：确认退款，订单号: 8000000000004501，可用金额变化 ：200.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468913748','1468913748',0,0,1,'','',0,'',''),(51,0,0,'16',NULL,'您的退款退货单有了变化。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_refund&op=view&refund_id=11\" target=\"_blank\">点击查看</a>','1468913748','1468913748',0,0,1,'','',0,'',''),(52,0,0,'15',NULL,'你的账户于 2016-07-19 15:48:28 账户资金有变化，描述：管理员调节预存款【增加】，充值单号: 910522258508674005，可用金额变化 ：9999.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468914508','1468914508',0,0,1,'','',0,'',''),(53,0,0,'16',NULL,'你的账户于 2016-07-19 15:49:51 账户资金有变化，描述：申请提现，冻结预存款，提现单号: 800522258591473016，可用金额变化 ：-1.00元，冻结金额变化：1.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468914591','1468914591',0,0,1,'','',0,'',''),(54,0,0,'16',NULL,'你的账户于 2016-07-19 16:09:53 账户资金有变化，描述：提现成功，提现单号: 800522258591473016，可用金额变化 ：0.00元，冻结金额变化：-1.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468915793','1468915793',0,0,1,'','',0,'',''),(55,0,0,'16',NULL,'你的账户于 2016-07-19 16:55:26 账户资金有变化，描述：下单，支付预存款，订单号: 8000000000004601，可用金额变化 ：-100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1468918526','1468918526',0,0,1,'','',0,'',''),(56,0,0,'15',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=44\" target=\"_blank\">点击查看订单</a>','1468976588','1468976588',0,0,1,'','',0,'',''),(57,0,0,'7',NULL,'关于订单：8000000000002301的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=23\" target=\"_blank\">点击查看订单详情</a>','1468977320','1468977320',0,0,1,'','',0,'',''),(58,0,0,'7',NULL,'您的订单已经出库。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=23\" target=\"_blank\">点击查看订单</a>','1468977368','1468977368',0,0,1,'','',0,'',''),(59,0,0,'7',NULL,'关于订单：8000000000005301的款项已经收到，请留意出库通知。<a href=\"http://shoptest16.800pharm.net/shop/index.php?act=member_order&op=show_order&order_id=53\" target=\"_blank\">点击查看订单详情</a>','1469524990','1469524990',0,0,1,'','',0,'',''),(60,0,0,'15',NULL,'你的账户于 2016-07-26 19:15:07 账户资金有变化，描述：管理员调节预存款【减少】，充值单号: 200522875707587005，可用金额变化 ：-100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1469531707','1469531707',0,0,1,'','',0,'',''),(61,0,0,'16',NULL,'你的账户于 2016-07-28 09:26:51 账户资金有变化，描述：下单，支付预存款，订单号: 8000000000005801，可用金额变化 ：-100.00元，冻结金额变化：0.00元。<a href=\"http://shoptest16.800pharm.net/member/index.php?act=predeposit&op=pd_log_list\" target=\"_blank\">点击查看余额</a>','1469669211','1469669211',0,0,1,'','',0,'','');
/*!40000 ALTER TABLE `pmall_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_adv`
--

DROP TABLE IF EXISTS `pmall_micro_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_adv` (
  `adv_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告编号',
  `adv_type` varchar(50) DEFAULT '' COMMENT '广告类型',
  `adv_name` varchar(255) DEFAULT '' COMMENT '广告名称',
  `adv_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `adv_url` varchar(255) DEFAULT '' COMMENT '广告链接',
  `adv_sort` tinyint(1) unsigned NOT NULL DEFAULT '255' COMMENT '广告排序',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_adv`
--

LOCK TABLES `pmall_micro_adv` WRITE;
/*!40000 ALTER TABLE `pmall_micro_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_comment`
--

DROP TABLE IF EXISTS `pmall_micro_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `comment_type` tinyint(1) NOT NULL COMMENT '评论类型编号',
  `comment_object_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `comment_message` varchar(255) NOT NULL COMMENT '评论内容',
  `comment_member_id` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_comment`
--

LOCK TABLES `pmall_micro_comment` WRITE;
/*!40000 ALTER TABLE `pmall_micro_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_goods`
--

DROP TABLE IF EXISTS `pmall_micro_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_goods` (
  `commend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_goods_id` int(10) unsigned NOT NULL COMMENT '推荐商品编号',
  `commend_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `commend_goods_store_id` int(10) unsigned NOT NULL COMMENT '推荐商品店铺编号',
  `commend_goods_name` varchar(100) NOT NULL COMMENT '推荐商品名称',
  `commend_goods_price` decimal(11,2) NOT NULL COMMENT '推荐商品价格',
  `commend_goods_image` varchar(100) NOT NULL COMMENT '推荐商品图片',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`commend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城推荐商品表随心看';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_goods`
--

LOCK TABLES `pmall_micro_goods` WRITE;
/*!40000 ALTER TABLE `pmall_micro_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_goods_class`
--

DROP TABLE IF EXISTS `pmall_micro_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_goods_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_parent_id` int(11) unsigned DEFAULT '0' COMMENT '父级分类编号',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_keyword` varchar(500) DEFAULT '' COMMENT '分类关键字',
  `class_image` varchar(100) DEFAULT '' COMMENT '分类图片',
  `class_commend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志0-不推荐 1-推荐到首页',
  `class_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认标志，0-非默认 1-默认',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品随心看分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_goods_class`
--

LOCK TABLES `pmall_micro_goods_class` WRITE;
/*!40000 ALTER TABLE `pmall_micro_goods_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_goods_relation`
--

DROP TABLE IF EXISTS `pmall_micro_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_goods_relation` (
  `relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关系编号',
  `class_id` int(10) unsigned NOT NULL COMMENT '微商城商品分类编号',
  `shop_class_id` int(10) unsigned NOT NULL COMMENT '商城商品分类编号',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城商品分类和商城商品分类对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_goods_relation`
--

LOCK TABLES `pmall_micro_goods_relation` WRITE;
/*!40000 ALTER TABLE `pmall_micro_goods_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_goods_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_like`
--

DROP TABLE IF EXISTS `pmall_micro_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_like` (
  `like_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '喜欢编号',
  `like_type` tinyint(1) NOT NULL COMMENT '喜欢类型编号',
  `like_object_id` int(10) unsigned NOT NULL COMMENT '喜欢对象编号',
  `like_member_id` int(10) unsigned NOT NULL COMMENT '喜欢人编号',
  `like_time` int(10) unsigned NOT NULL COMMENT '喜欢时间',
  PRIMARY KEY (`like_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城喜欢表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_like`
--

LOCK TABLES `pmall_micro_like` WRITE;
/*!40000 ALTER TABLE `pmall_micro_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_member_info`
--

DROP TABLE IF EXISTS `pmall_micro_member_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_member_info` (
  `member_id` int(11) unsigned NOT NULL COMMENT '用户编号',
  `visit_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '个人中心访问计数',
  `personal_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布个人秀数量',
  `goods_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已发布随心看数量',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_member_info`
--

LOCK TABLES `pmall_micro_member_info` WRITE;
/*!40000 ALTER TABLE `pmall_micro_member_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_member_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_personal`
--

DROP TABLE IF EXISTS `pmall_micro_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_personal` (
  `personal_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐编号',
  `commend_member_id` int(10) unsigned NOT NULL COMMENT '推荐人用户编号',
  `commend_image` text NOT NULL COMMENT '推荐图片',
  `commend_buy` text NOT NULL COMMENT '购买信息',
  `commend_message` varchar(1000) NOT NULL COMMENT '推荐信息',
  `commend_time` int(10) unsigned NOT NULL COMMENT '推荐时间',
  `class_id` int(10) unsigned NOT NULL,
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `microshop_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '首页推荐 0-否 1-推荐',
  `microshop_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`personal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城个人秀表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_personal`
--

LOCK TABLES `pmall_micro_personal` WRITE;
/*!40000 ALTER TABLE `pmall_micro_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_personal_class`
--

DROP TABLE IF EXISTS `pmall_micro_personal_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_personal_class` (
  `class_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `class_name` varchar(50) NOT NULL COMMENT '分类名称',
  `class_sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `class_image` varchar(100) DEFAULT '' COMMENT '分类图片',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城个人秀分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_personal_class`
--

LOCK TABLES `pmall_micro_personal_class` WRITE;
/*!40000 ALTER TABLE `pmall_micro_personal_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_personal_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_micro_store`
--

DROP TABLE IF EXISTS `pmall_micro_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_micro_store` (
  `microshop_store_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺街店铺编号',
  `shop_store_id` int(11) unsigned NOT NULL COMMENT '商城店铺编号',
  `microshop_sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `microshop_commend` tinyint(1) unsigned DEFAULT '1' COMMENT '推荐首页标志 1-正常 2-推荐',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`microshop_store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微商城店铺街表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_micro_store`
--

LOCK TABLES `pmall_micro_store` WRITE;
/*!40000 ALTER TABLE `pmall_micro_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_micro_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_navigation`
--

DROP TABLE IF EXISTS `pmall_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) DEFAULT NULL COMMENT '导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '导航链接',
  `nav_location` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航位置，0头部，1中部，2底部，默认为0',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类别ID，对应着nav_type中的内容，默认为0',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='页面导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_navigation`
--

LOCK TABLES `pmall_navigation` WRITE;
/*!40000 ALTER TABLE `pmall_navigation` DISABLE KEYS */;
INSERT INTO `pmall_navigation` VALUES (6,0,'关于ShopWWI','http://shoptest16.800pharm.net/member/index.php?act=article&article_id=22',2,0,255,0),(7,0,'联系我们','http://shoptest16.800pharm.net/member/index.php?act=article&article_id=23',2,0,240,0),(8,0,'合作及洽谈','http://shoptest16.800pharm.net/member/index.php?act=article&article_id=25',2,0,220,0),(9,0,'招聘英才','http://shoptest16.800pharm.net/member/index.php?act=article&article_id=24',2,0,210,0),(11,0,'门户','http://shoptest16.800pharm.net/cms',1,1,255,0),(12,0,'圈子','http://shoptest16.800pharm.net/circle',1,1,255,0),(13,0,'微商城','http://shoptest16.800pharm.net/microshop',1,1,255,0);
/*!40000 ALTER TABLE `pmall_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_offpay_area`
--

DROP TABLE IF EXISTS `pmall_offpay_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_offpay_area` (
  `store_id` int(8) unsigned NOT NULL COMMENT '商家ID',
  `area_id` text COMMENT '县ID组合',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_offpay_area`
--

LOCK TABLES `pmall_offpay_area` WRITE;
/*!40000 ALTER TABLE `pmall_offpay_area` DISABLE KEYS */;
INSERT INTO `pmall_offpay_area` VALUES (1,'a:123:{i:0;s:4:\"3036\";i:1;s:4:\"3037\";i:2;s:4:\"3038\";i:3;s:4:\"3039\";i:4;s:4:\"3040\";i:5;s:4:\"3041\";i:6;s:4:\"3042\";i:7;s:4:\"3043\";i:8;s:4:\"3044\";i:9;s:4:\"3045\";i:10;s:4:\"3046\";i:11;s:4:\"3047\";i:12;s:4:\"3048\";i:13;s:4:\"3049\";i:14;s:4:\"3050\";i:15;s:4:\"3051\";i:16;s:4:\"3052\";i:17;s:4:\"3053\";i:18;s:4:\"3054\";i:19;s:4:\"3055\";i:20;s:4:\"3056\";i:21;s:4:\"3057\";i:22;s:4:\"3058\";i:23;s:4:\"3059\";i:24;s:4:\"3060\";i:25;s:4:\"3061\";i:26;s:4:\"3062\";i:27;s:4:\"3063\";i:28;s:4:\"3064\";i:29;s:4:\"3065\";i:30;s:4:\"3066\";i:31;s:4:\"3067\";i:32;s:4:\"3068\";i:33;s:4:\"3069\";i:34;s:4:\"3070\";i:35;s:4:\"3071\";i:36;s:4:\"3072\";i:37;s:4:\"3073\";i:38;s:4:\"3074\";i:39;s:4:\"3075\";i:40;s:4:\"3076\";i:41;s:4:\"3077\";i:42;s:4:\"3078\";i:43;s:4:\"3079\";i:44;s:4:\"3080\";i:45;s:4:\"3081\";i:46;s:4:\"3082\";i:47;s:4:\"3083\";i:48;s:4:\"3084\";i:49;s:4:\"3085\";i:50;s:4:\"3086\";i:51;s:4:\"3087\";i:52;s:4:\"3088\";i:53;s:4:\"3089\";i:54;s:4:\"3090\";i:55;s:4:\"3091\";i:56;s:4:\"3092\";i:57;s:4:\"3093\";i:58;s:4:\"3094\";i:59;s:4:\"3095\";i:60;s:4:\"3096\";i:61;s:4:\"3097\";i:62;s:4:\"3098\";i:63;s:4:\"3099\";i:64;s:4:\"3100\";i:65;s:4:\"3101\";i:66;s:4:\"3102\";i:67;s:4:\"3103\";i:68;s:4:\"3104\";i:69;s:4:\"3105\";i:70;s:4:\"3106\";i:71;s:4:\"3107\";i:72;s:4:\"3108\";i:73;s:4:\"3109\";i:74;s:4:\"3110\";i:75;s:4:\"3111\";i:76;s:4:\"3112\";i:77;s:4:\"3113\";i:78;s:4:\"3114\";i:79;s:4:\"3115\";i:80;s:4:\"3116\";i:81;s:4:\"3117\";i:82;s:4:\"3118\";i:83;s:4:\"3119\";i:84;s:4:\"3120\";i:85;s:4:\"3121\";i:86;s:4:\"3122\";i:87;s:4:\"3123\";i:88;s:4:\"3124\";i:89;s:4:\"3125\";i:90;s:4:\"3126\";i:91;s:4:\"3127\";i:92;s:4:\"3128\";i:93;s:4:\"3129\";i:94;s:4:\"3130\";i:95;s:4:\"3131\";i:96;s:4:\"3132\";i:97;s:4:\"3133\";i:98;s:4:\"3134\";i:99;s:4:\"3135\";i:100;s:4:\"3136\";i:101;s:4:\"3137\";i:102;s:4:\"3138\";i:103;s:4:\"3139\";i:104;s:4:\"3140\";i:105;s:4:\"3141\";i:106;s:4:\"3142\";i:107;s:4:\"3143\";i:108;s:4:\"3144\";i:109;s:4:\"3145\";i:110;s:4:\"3146\";i:111;s:4:\"3147\";i:112;s:4:\"3148\";i:113;s:4:\"3149\";i:114;s:4:\"3150\";i:115;s:4:\"3151\";i:116;s:4:\"3152\";i:117;s:4:\"3153\";i:118;s:4:\"3154\";i:119;s:4:\"3155\";i:120;s:4:\"3156\";i:121;s:4:\"3157\";i:122;s:4:\"3158\";}');
/*!40000 ALTER TABLE `pmall_offpay_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_bill`
--

DROP TABLE IF EXISTS `pmall_order_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_bill` (
  `ob_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID作为新结算单编号',
  `ob_no` int(11) DEFAULT '0' COMMENT '结算单编号(年月店铺ID)',
  `ob_start_date` int(11) NOT NULL COMMENT '开始日期',
  `ob_end_date` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ob_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `ob_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `ob_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `ob_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_create_date` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `os_month` mediumint(6) unsigned DEFAULT NULL COMMENT '出账单应结时间,ob_end_date+1所在月(年月份)',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1默认2店家已确认3平台已审核4结算完成',
  `ob_pay_date` int(11) DEFAULT '0' COMMENT '付款日期',
  `ob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `ob_order_book_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '被关闭的预定订单的实收总金额',
  `ob_rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '下单时使用的红包值',
  `ob_rf_rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '全部退款时红包值',
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_bill`
--

LOCK TABLES `pmall_order_bill` WRITE;
/*!40000 ALTER TABLE `pmall_order_bill` DISABLE KEYS */;
INSERT INTO `pmall_order_bill` VALUES (1,0,1464710400,1467302399,'52800.00','0.00','0.00','0.00','0.00','0.00','52800.00',1467963435,201607,'1',0,'',1,'800方o2o','0.00','0.00','0.00'),(2,0,1467302400,1467302399,'0.00','0.00','0.00','0.00','0.00','0.00','0.00',1467967391,201607,'1',0,'',1,'800方o2o','0.00','0.00','0.00'),(3,0,1464710400,1467302399,'0.00','0.00','0.00','0.00','0.00','0.00','0.00',1467967537,201607,'1',0,'',2,'eshop2','0.00','0.00','0.00'),(4,0,1462032000,1464710399,'120.00','10.00','0.00','9.90','0.00','0.00','110.10',1467967537,201606,'4',1468425600,'已付款结算',2,'eshop2','0.00','0.00','0.00');
/*!40000 ALTER TABLE `pmall_order_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_book`
--

DROP TABLE IF EXISTS `pmall_order_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_book` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `book_step` tinyint(4) DEFAULT NULL COMMENT '预定时段,值为1 or 2,0为不分时段，全款支付',
  `book_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '定金or尾款金额',
  `book_pd_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '预存款支付金额',
  `book_rcb_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '充值卡支付金额',
  `book_pay_name` varchar(10) DEFAULT NULL COMMENT '支付方式(文字)',
  `book_trade_no` varchar(40) DEFAULT NULL COMMENT '第三方平台交易号',
  `book_pay_time` int(11) DEFAULT '0' COMMENT '支付时间',
  `book_end_time` int(11) DEFAULT '0' COMMENT '时段1:订单自动取消时间,时段2:时段结束时间',
  `book_buyer_phone` bigint(20) DEFAULT NULL COMMENT '买家接收尾款交款通知的手机,只在第2时段有值即可',
  `book_deposit_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '定金金额,只在全款支付时有值即可',
  `book_pay_notice` tinyint(4) DEFAULT '0' COMMENT '0未通知1已通知,该字段只对尾款时段有效',
  `book_real_pay` decimal(10,2) DEFAULT '0.00' COMMENT '订单被取消后最终支付金额（平台收款金额）',
  `book_cancel_time` int(11) DEFAULT '0' COMMENT '订单被取消时间,结算用,只有book_step是0或1时有值',
  `book_store_id` int(11) DEFAULT '0' COMMENT '商家 ID,只有book_step是0或1时有值即可',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定订单时段详细内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_book`
--

LOCK TABLES `pmall_order_book` WRITE;
/*!40000 ALTER TABLE `pmall_order_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_order_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_common`
--

DROP TABLE IF EXISTS `pmall_order_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_common` (
  `order_id` int(11) NOT NULL COMMENT '订单索引id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `shipping_express_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送公司ID',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `evalseller_time` int(10) unsigned DEFAULT NULL COMMENT '卖家评价买家的时间',
  `order_message` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `order_pointscount` int(11) NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `voucher_price` int(11) DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) DEFAULT NULL COMMENT '代金券编码',
  `deliver_explain` text COMMENT '发货备注',
  `daddress_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发货地址ID',
  `reciver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `reciver_info` varchar(500) NOT NULL COMMENT '收货人其它信息',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `reciver_city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人市级ID',
  `invoice_info` varchar(500) DEFAULT '' COMMENT '发票信息',
  `promotion_info` varchar(800) DEFAULT '' COMMENT '促销信息备注',
  `dlyo_pickup_code` varchar(6) DEFAULT NULL COMMENT '提货码',
  `promotion_total` decimal(10,2) DEFAULT '0.00' COMMENT '订单总优惠金额（代金券，满减，平台红包）',
  `discount` tinyint(4) DEFAULT '0' COMMENT '会员折扣x%',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_common`
--

LOCK TABLES `pmall_order_common` WRITE;
/*!40000 ALTER TABLE `pmall_order_common` DISABLE KEYS */;
INSERT INTO `pmall_order_common` VALUES (1,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(2,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(3,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(4,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(5,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(6,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(7,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生2','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地4楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地4楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(8,1,1467719239,0,0,NULL,'',800,NULL,NULL,'',1,'庄先生','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(9,1,1467623715,0,0,NULL,'',800,NULL,NULL,'',0,'庄先生2','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地4楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地4楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(10,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(11,1,1467718931,29,0,NULL,'',800,NULL,NULL,'',1,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(12,1,1467777335,0,0,NULL,'',800,NULL,NULL,'',1,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(13,1,1467783466,0,0,NULL,'',800,NULL,NULL,'adfs',1,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(14,1,1467785692,0,0,NULL,'',0,NULL,NULL,'阿萨德发的发发的说的发',1,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(15,1,1467794211,0,0,NULL,'',800,NULL,NULL,'adfsdf asdf',1,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(16,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(17,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(18,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'测试','a:6:{s:5:\"phone\";s:3:\"110\";s:9:\"mob_phone\";s:3:\"110\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 潮州市 湘桥区 测试地址\";s:4:\"area\";s:26:\"广东 潮州市 湘桥区\";s:6:\"street\";s:12:\"测试地址\";}',19,307,'a:0:{}','',NULL,'0.00',0),(19,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'测试','a:6:{s:5:\"phone\";s:3:\"110\";s:9:\"mob_phone\";s:3:\"110\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 潮州市 湘桥区 测试地址\";s:4:\"area\";s:26:\"广东 潮州市 湘桥区\";s:6:\"street\";s:12:\"测试地址\";}',19,307,'a:0:{}','',NULL,'0.00',0),(20,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'测试','a:6:{s:5:\"phone\";s:3:\"110\";s:9:\"mob_phone\";s:3:\"110\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 潮州市 湘桥区 测试地址\";s:4:\"area\";s:26:\"广东 潮州市 湘桥区\";s:6:\"street\";s:12:\"测试地址\";}',19,307,'a:0:{}','',NULL,'0.00',0),(21,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(22,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(23,2,1468977368,0,0,NULL,'',0,NULL,NULL,'',2,'adfasd','a:7:{s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:5:\"phone\";s:11:\"13812345678\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(24,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(25,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(26,2,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',19,289,'a:0:{}','',NULL,'0.00',0),(27,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',19,289,'a:0:{}','',NULL,'0.00',0),(28,2,1467965091,0,0,NULL,'',6,NULL,NULL,'adfsd',0,'庄先生','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',19,289,'a:0:{}','',NULL,'0.00',0),(29,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(30,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(31,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(32,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'王钦','a:6:{s:5:\"phone\";s:11:\"15999904305\";s:9:\"mob_phone\";s:11:\"15999904305\";s:9:\"tel_phone\";N;s:7:\"address\";s:33:\"北京 北京市 东城区 测试\";s:4:\"area\";s:26:\"北京 北京市 东城区\";s:6:\"street\";s:6:\"测试\";}',0,36,'a:0:{}','',NULL,'0.00',0),(33,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(34,2,1468307584,0,0,NULL,NULL,4,NULL,NULL,'发货啦，开心吧',2,'庄先生','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',0,289,'a:0:{}','',NULL,'0.00',0),(35,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,2,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(36,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,1,'庄先生','a:6:{s:5:\"phone\";s:11:\"13560134399\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";N;s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(37,2,1468313648,0,0,NULL,NULL,8,NULL,NULL,'',2,'庄先生','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',0,289,'a:0:{}','',NULL,'0.00',0),(38,2,1468389515,0,0,NULL,NULL,3,NULL,NULL,'',2,'庄先生','a:7:{s:7:\"address\";s:43:\"广东 广州市 海珠区 四季天地3楼\";s:5:\"phone\";s:11:\"13560134399\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:16:\"四季天地3楼\";s:9:\"mob_phone\";s:11:\"13560134399\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',0,289,'a:3:{s:6:\"类型\";s:13:\"普通发票 \";s:6:\"抬头\";s:39:\"广州八百方信息技术有限公司\";s:6:\"内容\";s:6:\"明细\";}','',NULL,'0.00',0),(39,1,0,0,0,NULL,NULL,0,NULL,NULL,NULL,1,'王钦','a:6:{s:5:\"phone\";s:11:\"15999904305\";s:9:\"mob_phone\";s:11:\"15999904305\";s:9:\"tel_phone\";N;s:7:\"address\";s:30:\"广东 广州市 海珠区 ...\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:3:\"...\";}',0,289,'a:0:{}','',NULL,'0.00',0),(40,2,1468806479,0,0,NULL,NULL,5,NULL,NULL,'',2,'庄先生','a:7:{s:7:\"address\";s:88:\"广东 广州市 海珠区 赤岗北路四季天地3楼八百方信息科技有限公司\";s:5:\"phone\";s:11:\"13560134397\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:61:\"赤岗北路四季天地3楼八百方信息科技有限公司\";s:9:\"mob_phone\";s:11:\"13560134397\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',0,289,'a:0:{}','',NULL,'0.00',0),(41,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(42,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(43,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(44,2,1468976588,0,0,NULL,NULL,5,NULL,NULL,'',2,'庄先生','a:7:{s:7:\"address\";s:88:\"广东 广州市 海珠区 赤岗北路四季天地3楼八百方信息科技有限公司\";s:5:\"phone\";s:11:\"13560134397\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:61:\"赤岗北路四季天地3楼八百方信息科技有限公司\";s:9:\"mob_phone\";s:11:\"13560134397\";s:9:\"tel_phone\";s:0:\"\";s:4:\"dlyp\";s:0:\"\";}',0,289,'a:0:{}','',NULL,'0.00',0),(45,2,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(46,2,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(47,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(48,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(49,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(50,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(51,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',0,289,'a:0:{}','',NULL,'0.00',0),(52,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',0,289,'a:0:{}','',NULL,'0.00',0),(53,2,0,0,0,NULL,'',0,NULL,NULL,NULL,2,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',0,289,'a:0:{}','',NULL,'0.00',0),(54,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(55,1,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'的的','a:6:{s:5:\"phone\";s:11:\"13560134398\";s:9:\"mob_phone\";s:11:\"13560134398\";s:9:\"tel_phone\";N;s:7:\"address\";s:39:\"广东 广州市 海珠区 四季天地\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:12:\"四季天地\";}',0,289,'a:0:{}','',NULL,'0.00',0),(56,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',0,289,'a:0:{}','',NULL,'0.00',0),(57,2,0,0,0,NULL,NULL,0,NULL,NULL,NULL,0,'adfasd','a:6:{s:5:\"phone\";s:11:\"13812345678\";s:9:\"mob_phone\";s:11:\"13812345678\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:36:\"广东 广州市 海珠区 adf asd a\";s:4:\"area\";s:26:\"广东 广州市 海珠区\";s:6:\"street\";s:9:\"adf asd a\";}',0,289,'a:0:{}','',NULL,'0.00',0),(58,2,0,0,0,NULL,'',0,NULL,NULL,NULL,2,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0),(59,2,0,0,0,NULL,'',0,NULL,NULL,NULL,0,'马蔚丹','a:6:{s:5:\"phone\";s:11:\"15989264655\";s:9:\"mob_phone\";s:11:\"15989264655\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:63:\"广东 广州市 天河区 赤岗北路118号四季天地三楼\";s:4:\"area\";s:26:\"广东 广州市 天河区\";s:6:\"street\";s:36:\"赤岗北路118号四季天地三楼\";}',0,289,'a:0:{}','',NULL,'0.00',0);
/*!40000 ALTER TABLE `pmall_order_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_goods`
--

DROP TABLE IF EXISTS `pmall_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_goods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表索引id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `goods_type` char(1) NOT NULL DEFAULT '1' COMMENT '1默认2团购商品3限时折扣商品4组合套装5赠品8加价购活动商品9加价购换购商品',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（团购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `goods_spec` varchar(255) DEFAULT NULL COMMENT '商品规格',
  `goods_contractid` varchar(100) DEFAULT NULL COMMENT '商品开启的消费者保障服务id',
  `invite_rates` smallint(5) DEFAULT '0' COMMENT '分销佣金',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_goods`
--

LOCK TABLES `pmall_order_goods` WRITE;
/*!40000 ALTER TABLE `pmall_order_goods` DISABLE KEYS */;
INSERT INTO `pmall_order_goods` VALUES (1,1,100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','63200.00',1,'1_04752627750479728.png','63200.00',1,2,'1',0,0,587,NULL,'',0),(2,2,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','209500.00',1,'1_04752627931531971.jpg','209500.00',1,2,'1',0,0,587,NULL,'',0),(3,3,100007,'劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593','146300.00',1,'1_04752627900055146.png','146300.00',1,2,'1',0,0,587,NULL,'',0),(4,4,100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品','70000.00',1,'1_04752627678636481.jpg','70000.00',1,2,'1',0,0,587,NULL,'',0),(5,5,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,2,'1',0,0,587,NULL,'',0),(6,6,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','209500.00',1,'1_04752627931531971.jpg','209500.00',1,2,'1',0,0,587,NULL,'',0),(7,7,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,3,'1',0,0,587,NULL,'',0),(8,8,100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','63200.00',1,'1_04752627750479728.png','63200.00',1,2,'1',0,0,587,NULL,'',0),(9,9,100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品','63200.00',1,'1_04752627750479728.png','63200.00',1,3,'1',0,0,587,NULL,'',0),(10,10,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(11,11,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(12,12,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(13,13,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(14,14,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(15,15,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',4,'1_04752627958339099.jpg','211200.00',1,7,'1',0,0,587,NULL,'',0),(16,16,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,7,'1',0,0,587,NULL,'',0),(17,17,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','100.00',1,'1_04752627931531971.jpg','100.00',1,7,'4',1,0,587,NULL,'',0),(18,17,100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品','0.10',1,'1_04752627678636481.jpg','0.10',1,7,'4',1,0,587,NULL,'',0),(19,18,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,8,'1',0,0,587,NULL,'',0),(20,19,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,8,'1',0,0,587,NULL,'',0),(21,20,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,8,'1',0,0,587,NULL,'',0),(22,21,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,2,'1',0,9,1069,'包装类型：精装','',0),(23,22,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,2,'1',0,9,1069,'包装类型：精装','',0),(24,23,100012,'欧姆龙血压计 普通装','100.00',1,'2_05211324717488064.jpg','100.00',2,7,'1',0,9,1069,'包装类型：普通装','',0),(25,24,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,7,'1',0,9,1069,'包装类型：精装','',0),(26,25,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,7,'1',0,9,1069,'包装类型：精装','',0),(27,26,100012,'欧姆龙血压计 普通装','100.00',1,'2_05211324717488064.jpg','100.00',2,7,'1',0,9,1069,'包装类型：普通装','',0),(28,27,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,2,'1',0,9,1069,'包装类型：精装','',0),(29,28,100011,'欧姆龙血压计 精装','110.00',1,'2_05211324717488064.jpg','110.00',2,2,'1',0,9,1069,'包装类型：精装','',0),(30,29,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'',0),(31,30,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'',0),(32,31,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'',0),(33,32,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,9,'1',0,200,587,NULL,'',0),(34,33,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'1',0),(35,34,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'1',0),(36,35,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'1',0),(37,36,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,2,'1',0,200,587,NULL,'',0),(38,37,100015,'舒筋健骨丸','70.00',1,'2_05216575160789666.jpg','70.00',2,2,'1',0,200,1060,NULL,'',0),(39,37,100014,'鱼跃保健盒','90.00',1,'2_05213919611710144.jpg','90.00',2,2,'1',0,200,1060,NULL,'1',0),(40,38,100015,'舒筋健骨丸','70.00',1,'2_05216575160789666.jpg','70.00',2,2,'1',0,200,1060,NULL,'',0),(41,39,100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品','52800.00',1,'1_04752627958339099.jpg','52800.00',1,11,'1',0,200,587,NULL,'1,2,3,4',0),(42,40,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,15,'1',0,200,12,NULL,'',0),(43,41,100007,'劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593','146300.00',1,'1_04752627900055146.png','146300.00',1,16,'1',0,200,587,NULL,'1,2,3,4',0),(44,42,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(45,43,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(46,44,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,15,'1',0,200,12,NULL,'',0),(47,45,100019,'女装测试','100.00',1,'2_05222444906791674.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(48,45,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(49,46,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(50,47,100029,'test0725-4','32.00',1,'1_05227702508114739.jpg','32.00',1,14,'1',0,200,718,NULL,'',0),(51,48,100029,'test0725-4','32.00',1,'1_05227702508114739.jpg','32.00',1,14,'1',0,200,718,NULL,'',0),(52,49,100029,'test0725-4','32.00',3,'1_05227702508114739.jpg','96.00',1,14,'1',0,200,718,NULL,'',0),(53,50,100029,'test0725-4','32.00',2,'1_05227702508114739.jpg','64.00',1,14,'1',0,200,718,NULL,'',0),(54,51,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,7,'1',0,200,12,NULL,'',0),(55,51,100024,'欧姆龙（OMRON）电子血压计 家用 HEM-7051（上臂式）','77.00',1,'2_05222598068424864.jpg','77.00',2,7,'1',0,200,1071,NULL,'',0),(56,52,100024,'欧姆龙（OMRON）电子血压计 家用 HEM-7051（上臂式）','77.00',1,'2_05222598068424864.jpg','77.00',2,7,'1',0,200,1071,NULL,'',0),(57,53,100024,'欧姆龙（OMRON）电子血压计 家用 HEM-7051（上臂式）','77.00',1,'2_05222598068424864.jpg','77.00',2,7,'1',0,200,1071,NULL,'',0),(58,54,100029,'test0725-4','32.00',1,'1_05227702508114739.jpg','32.00',1,14,'1',0,200,718,NULL,'',0),(59,55,100029,'test0725-4','32.00',1,'1_05227702508114739.jpg','32.00',1,14,'1',0,200,718,NULL,'',0),(60,56,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,7,'1',0,200,12,NULL,'',0),(61,57,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,7,'1',0,200,12,NULL,'',0),(62,58,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0),(63,59,100018,'欧姆龙血压计','100.00',1,'2_05211324717488064.jpg','100.00',2,16,'1',0,200,12,NULL,'',0);
/*!40000 ALTER TABLE `pmall_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_log`
--

DROP TABLE IF EXISTS `pmall_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `log_msg` varchar(150) DEFAULT '' COMMENT '文字描述',
  `log_time` int(10) unsigned NOT NULL COMMENT '处理时间',
  `log_role` varchar(10) NOT NULL COMMENT '操作角色',
  `log_user` varchar(30) DEFAULT '' COMMENT '操作人',
  `log_orderstate` enum('0','10','20','30','40') DEFAULT NULL COMMENT '订单状态：0(已取消)10:未付款;20:已付款;30:已发货;40:已收货;',
  `log_value` varchar(250) NOT NULL DEFAULT '' COMMENT 'æ—¥å¿—å€¼',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='订单处理历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_log`
--

LOCK TABLES `pmall_order_log` WRITE;
/*!40000 ALTER TABLE `pmall_order_log` DISABLE KEYS */;
INSERT INTO `pmall_order_log` VALUES (1,9,'发出货物(编辑信息)',1467623715,'商家','800@business.com','30',''),(2,9,'签收了货物',1467623745,'买家','testuser2','40',''),(3,8,'修改了价格( 63100.00 )',1467699970,'商家','800@member.com','20',''),(4,11,'发出货物(编辑信息)',1467718931,'商家','800@business.com','30',''),(5,11,'签收了货物',1467719000,'买家','kit','40',''),(6,8,'发出货物(编辑信息)',1467719239,'商家','800@business.com','30',''),(7,12,'发出货物(编辑信息)',1467777335,'商家','800@business.com','30',''),(8,12,'签收了货物',1467777594,'买家','kit','40',''),(9,10,'修改了价格( 0.01 )',1467783152,'商家','800@member.com','10',''),(10,13,'发出货物(编辑信息)',1467783466,'商家','800@business.com','30',''),(11,13,'签收了货物',1467783478,'买家','kit','40',''),(12,10,'收到货款(外部交易号:23423234134)',1467784465,'管理员','admin','20',''),(13,10,'取消了订单 ( 商品全部退款完成取消订单 )',1467785152,'系统','admin','0',''),(14,14,'修改了价格( 0.01 )',1467785648,'商家','800@member.com','10',''),(15,14,'收到货款(外部交易号:4234234331231)',1467785664,'管理员','admin','20',''),(16,14,'发出货物(编辑信息)',1467785692,'商家','800@business.com','30',''),(17,15,'收到货款(外部交易号:34134134134)',1467785803,'管理员','admin','20',''),(18,14,'商品全部退款，系统完成订单',1467793067,'系统','admin','40',''),(19,15,'发出货物(编辑信息)',1467794211,'商家','800@business.com','30',''),(20,15,'签收了货物',1467794377,'买家','kit','40',''),(21,17,'修改了价格( 0.1 )',1467800088,'商家','800@member.com','10',''),(22,28,'收到货款(外部交易号:3534353535)',1467947548,'管理员','admin','20',''),(23,28,'发出货物(编辑信息)',1467965091,'商家','eshop2','30',''),(24,28,'签收了货物',1467965379,'买家','testuser','40',''),(25,26,'收到货款(外部交易号:123212312312)',1468207285,'管理员','admin','20',''),(26,8,'签收了货物',1468217982,'买家','testuser','40',''),(27,34,'修改了运费( 6.00 )',1468307524,'商家','eshop2','20',''),(28,34,'修改了价格( 80.00 )',1468307532,'商家','eshop2','20',''),(29,34,'发出货物(编辑信息)',1468307584,'商家','eshop2','30',''),(30,34,'签收了货物',1468307594,'买家','testuser','40',''),(31,37,'发出货物(编辑信息)',1468313648,'商家','eshop2','30',''),(32,37,'签收了货物',1468313658,'买家','testuser','40',''),(33,38,'发出货物(编辑信息)',1468389515,'商家','eshop2','30',''),(34,38,'签收了货物',1468403025,'买家','testuser','40',''),(35,40,'发出货物(编辑信息)',1468806479,'商家','eshop2','30',''),(36,40,'签收了货物',1468806492,'买家','13560134397','40',''),(37,41,'支付订单',1468898104,'买家','','20',''),(38,42,'取消了订单 ( 改买其他商品 )',1468906730,'买家','Aidan','0',''),(39,43,'支付订单',1468906749,'买家','','20',''),(40,43,'取消了订单 ( 商品全部退款完成取消订单 )',1468908300,'系统','admin','0',''),(41,41,'取消了订单 ( 商品全部退款完成取消订单 )',1468908814,'系统','admin','0',''),(42,45,'支付订单',1468912034,'买家','','20',''),(43,45,'取消了订单 ( 商品全部退款完成取消订单 )',1468913748,'系统','admin','0',''),(44,46,'支付订单',1468918525,'买家','','20',''),(45,44,'发出货物(编辑信息)',1468976588,'商家','eshop2','30',''),(46,44,'签收了货物',1468976595,'买家','13560134397','40',''),(47,23,'收到货款(外部交易号:3423421343)',1468977319,'管理员','admin','20',''),(48,23,'发出货物(编辑信息)',1468977368,'商家','eshop2','30',''),(49,53,'收到货款(外部交易号:123123123123)',1469524990,'管理员','admin','20',''),(50,54,'取消了订单 ( 其它原因 )',1469587904,'买家','13560134398','0',''),(51,58,'支付订单',1469669211,'买家','','20',''),(52,57,'取消了订单 ( 无法备齐货物 )',1469669237,'商家','eshop2','0',''),(53,59,'取消了订单 ( 无法备齐货物 )',1469669298,'商家','eshop2','0','');
/*!40000 ALTER TABLE `pmall_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_pay`
--

DROP TABLE IF EXISTS `pmall_order_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_pay` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `api_pay_state` enum('0','1') DEFAULT '0' COMMENT '0默认未支付1已支付(只有第三方支付接口通知到时才会更改此状态)',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='订单支付表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_pay`
--

LOCK TABLES `pmall_order_pay` WRITE;
/*!40000 ALTER TABLE `pmall_order_pay` DISABLE KEYS */;
INSERT INTO `pmall_order_pay` VALUES (1,920520959507400002,2,'0'),(2,730520959731079002,2,'0'),(3,240520959748331002,2,'0'),(4,520520959758822002,2,'0'),(5,420520959770573002,2,'0'),(6,620520959785122002,2,'0'),(7,790520961236208003,3,'0'),(8,150520967659933002,2,'0'),(9,160520967694414003,3,'0'),(10,700521044749300007,7,'1'),(11,720521044816573007,7,'0'),(12,130521121247731007,7,'0'),(13,270521127430305007,7,'0'),(14,880521129548823007,7,'1'),(15,690521129785111007,7,'1'),(16,650521141505593007,7,'0'),(17,290521144030663007,7,'0'),(18,130521203103296008,8,'0'),(19,650521203221484008,8,'0'),(20,710521203559778008,8,'0'),(21,220521286062743002,2,'0'),(22,640521286068987002,2,'0'),(23,780521286342133007,7,'1'),(24,920521286511686007,7,'0'),(25,690521286535527007,7,'0'),(26,270521286580107007,7,'1'),(27,750521291367026002,2,'0'),(28,580521291447164002,2,'1'),(29,580521392021715002,2,'0'),(30,850521396199826002,2,'0'),(31,470521550830714002,2,'0'),(32,860521574043517009,9,'0'),(33,320521634026438002,2,'0'),(34,970521651186283002,2,'0'),(35,310521657055054002,2,'0'),(36,320521657057204002,2,'0'),(37,380521657616653002,2,'0'),(38,150521733448178002,2,'0'),(39,380521892018199011,11,'0'),(40,920522150466069015,15,'0'),(41,750522240832627016,16,'0'),(42,930522244647004016,16,'0'),(43,960522244693906016,16,'0'),(44,660522248022283015,15,'0'),(45,570522256026579016,16,'0'),(46,970522262519083016,16,'0'),(47,500522783605190014,14,'0'),(48,560522783635993014,14,'0'),(49,820522783968379014,14,'0'),(50,840522784123926014,14,'0'),(51,430522856928159007,7,'0'),(52,430522867745629007,7,'0'),(53,440522868960347007,7,'1'),(54,250522926435102014,14,'0'),(55,840522931841149014,14,'0'),(56,770522932520047007,7,'0'),(57,940522932527415007,7,'0'),(58,230523013196748016,16,'0'),(59,620523013284487016,16,'0');
/*!40000 ALTER TABLE `pmall_order_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_snapshot`
--

DROP TABLE IF EXISTS `pmall_order_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_snapshot` (
  `rec_id` int(11) NOT NULL COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `create_time` int(11) NOT NULL COMMENT '生成时间',
  `goods_attr` text COMMENT '属性',
  `goods_body` text COMMENT '详情',
  `plate_top` text COMMENT '顶部关联版式',
  `plate_bottom` text COMMENT '底部关联版式',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_snapshot`
--

LOCK TABLES `pmall_order_snapshot` WRITE;
/*!40000 ALTER TABLE `pmall_order_snapshot` DISABLE KEYS */;
INSERT INTO `pmall_order_snapshot` VALUES (1,100002,1467615507,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2x97LaVXXXXbqXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(2,100008,1467615731,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB22FtebXXXXXaiXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(3,100007,1467615748,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2iOs1aVXXXXXcXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(4,100000,1467615758,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2tCEPaVXXXXX_XpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(5,100009,1467615770,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(6,100008,1467615785,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB22FtebXXXXXaiXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(7,100009,1467617236,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(8,100002,1467623663,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2x97LaVXXXXbqXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(9,100002,1467623694,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2x97LaVXXXXbqXpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(10,100009,1467700749,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(11,100009,1467700816,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(12,100009,1467777247,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(13,100009,1467783438,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(14,100009,1467785548,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(15,100009,1467785785,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(16,100009,1467797505,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(17,100008,1467800030,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p>\r\n	<img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB22FtebXXXXXaiXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" /> \r\n</p>\r\n<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>',NULL,NULL),(18,100000,1467800030,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img04.taobaocdn.com/imgextra/i4/2010071101/TB2tCEPaVXXXXX_XpXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(19,100009,1467859103,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(20,100009,1467859221,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(21,100009,1467859559,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(22,100011,1467942062,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(23,100011,1467942069,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(24,100012,1467942342,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(25,100011,1467942511,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(26,100011,1467942535,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(27,100012,1467942580,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(28,100011,1467947367,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(29,100011,1467947447,'a:4:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";s:12:\"测量方式\";s:6:\"电子\";s:15:\"重量（克）\";s:3:\"100\";}','欧姆龙血压计',NULL,NULL),(30,100014,1468048021,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(31,100014,1468052199,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(32,100014,1468206830,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(33,100009,1468230048,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(34,100014,1468290026,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(35,100014,1468307186,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(36,100014,1468313057,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(37,100009,1468313057,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(38,100015,1468313616,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"安睡宝\";}','舒筋健骨丸',NULL,NULL),(39,100014,1468313616,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"爱仕达\";}','<div class=\"pName\" style=\"margin:0px;padding:0px;color:#333333;font-family:&quot;\">\r\n	<h1 style=\"font-size:12px;font-weight:normal;\">\r\n		<span id=\"pro_name\" style=\"font-size:14px;line-height:22px;\">鱼跃保健盒</span>\r\n	</h1>\r\n</div>',NULL,NULL),(40,100015,1468389448,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:9:\"安睡宝\";}','舒筋健骨丸',NULL,NULL),(41,100009,1468548018,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img01.taobaocdn.com/imgextra/i1/2010071101/TB2SjxdbXXXXXagXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absMiddle;\" /></p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(42,100018,1468806466,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(43,100007,1468896832,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','<p><img src=\"http://img02.taobaocdn.com/imgextra/i2/2010071101/TB2iOs1aVXXXXXcXXXXXXXXXXXX_!!2010071101.jpg\" alt=\"image\" style=\"text-align: absmiddle;\" /> </p><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"90%\"><tr><td>&nbsp;</td></tr></table>',NULL,NULL),(44,100018,1468900647,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(45,100018,1468900693,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(46,100018,1468904023,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(47,100019,1468912026,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(48,100018,1468912026,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(49,100018,1468918519,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(50,100029,1469439605,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(51,100029,1469439636,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(52,100029,1469439968,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(53,100029,1469440123,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(54,100018,1469512928,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(55,100024,1469512928,'a:13:{s:6:\"货号\";s:9:\"Blood-001\";s:6:\"品牌\";s:0:\"\";s:6:\"类型\";s:6:\"不限\";s:12:\"加压方式\";s:6:\"不限\";s:12:\"检测方式\";s:6:\"不限\";s:12:\"显示方式\";s:6:\"不限\";s:6:\"精度\";s:6:\"不限\";s:12:\"工作模式\";s:6:\"不限\";s:12:\"测量范围\";s:29:\"压力：0~299mmHg(0~39.9kPa)\";s:12:\"记忆组数\";s:5:\"21组\";s:9:\"脉搏数\";s:13:\"40~180次/分\";s:12:\"电源类型\";s:51:\"4节5号电池 电源适配器（AC220V）另售出\";s:12:\"电池寿命\";s:100:\"若在23℃的室温下使用锰干电池，每天2次，加压至170mmHg(22.7kPa)可测量约300次\";}','<p>\r\n	<span>不买注定你家老丈人不待见你！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601069826799_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601067019823_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601060816286_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601051054500_1280.jpg\" alt=\"image\" />',NULL,NULL),(56,100024,1469523745,'a:13:{s:6:\"货号\";s:9:\"Blood-001\";s:6:\"品牌\";s:0:\"\";s:6:\"类型\";s:6:\"不限\";s:12:\"加压方式\";s:6:\"不限\";s:12:\"检测方式\";s:6:\"不限\";s:12:\"显示方式\";s:6:\"不限\";s:6:\"精度\";s:6:\"不限\";s:12:\"工作模式\";s:6:\"不限\";s:12:\"测量范围\";s:29:\"压力：0~299mmHg(0~39.9kPa)\";s:12:\"记忆组数\";s:5:\"21组\";s:9:\"脉搏数\";s:13:\"40~180次/分\";s:12:\"电源类型\";s:51:\"4节5号电池 电源适配器（AC220V）另售出\";s:12:\"电池寿命\";s:100:\"若在23℃的室温下使用锰干电池，每天2次，加压至170mmHg(22.7kPa)可测量约300次\";}','<p>\r\n	<span>不买注定你家老丈人不待见你！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601069826799_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601067019823_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601060816286_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601051054500_1280.jpg\" alt=\"image\" />',NULL,NULL),(57,100024,1469524960,'a:13:{s:6:\"货号\";s:9:\"Blood-001\";s:6:\"品牌\";s:0:\"\";s:6:\"类型\";s:6:\"不限\";s:12:\"加压方式\";s:6:\"不限\";s:12:\"检测方式\";s:6:\"不限\";s:12:\"显示方式\";s:6:\"不限\";s:6:\"精度\";s:6:\"不限\";s:12:\"工作模式\";s:6:\"不限\";s:12:\"测量范围\";s:29:\"压力：0~299mmHg(0~39.9kPa)\";s:12:\"记忆组数\";s:5:\"21组\";s:9:\"脉搏数\";s:13:\"40~180次/分\";s:12:\"电源类型\";s:51:\"4节5号电池 电源适配器（AC220V）另售出\";s:12:\"电池寿命\";s:100:\"若在23℃的室温下使用锰干电池，每天2次，加压至170mmHg(22.7kPa)可测量约300次\";}','<p>\r\n	<span>不买注定你家老丈人不待见你！</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601069826799_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601067019823_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601060816286_1280.jpg\" alt=\"image\" /><img src=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/2/2_05222601051054500_1280.jpg\" alt=\"image\" />',NULL,NULL),(58,100029,1469582435,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(59,100029,1469587841,'a:2:{s:6:\"货号\";s:10:\"test0725-4\";s:6:\"品牌\";s:0:\"\";}','',NULL,NULL),(60,100018,1469588520,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(61,100018,1469588527,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(62,100018,1469669196,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL),(63,100018,1469669284,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:6:\"嗳呵\";}','欧姆龙血压计',NULL,NULL);
/*!40000 ALTER TABLE `pmall_order_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_order_statis`
--

DROP TABLE IF EXISTS `pmall_order_statis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_order_statis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_year` smallint(6) DEFAULT '0' COMMENT '年',
  `os_start_date` int(11) NOT NULL COMMENT '开始日期',
  `os_end_date` int(11) NOT NULL COMMENT '结束日期',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `os_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `os_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  `os_order_book_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '被关闭的预定订单的实收总金额',
  PRIMARY KEY (`os_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='月销量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_order_statis`
--

LOCK TABLES `pmall_order_statis` WRITE;
/*!40000 ALTER TABLE `pmall_order_statis` DISABLE KEYS */;
INSERT INTO `pmall_order_statis` VALUES (201606,2016,1464710400,1467302399,'0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00');
/*!40000 ALTER TABLE `pmall_order_statis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_orders`
--

DROP TABLE IF EXISTS `pmall_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `pay_sn` bigint(20) unsigned NOT NULL COMMENT '支付单号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) DEFAULT NULL COMMENT '买家电子邮箱',
  `buyer_phone` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0未评价，1已评价，2已过期未评价',
  `evaluation_again_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '追加评价状态 0未评价，1已评价，2已过期未评价',
  `order_state` tinyint(4) NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(4) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `lock_state` tinyint(4) unsigned DEFAULT '0' COMMENT '锁定状态:0是正常,大于0是锁定,默认是0',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态0未删除1放入回收站2彻底删除',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '延迟时间,默认为0',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `shipping_code` varchar(50) DEFAULT '' COMMENT '物流单号',
  `order_type` tinyint(4) DEFAULT '1' COMMENT '订单类型1普通订单(默认),2预定订单,3门店自提订单',
  `api_pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线支付动作时间,只要向第三方支付平台提交就会更新',
  `chain_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '自提门店ID',
  `chain_code` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '门店提货码',
  `rpt_amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '红包值',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '外部交易订单号',
  `distance` char(20) NOT NULL DEFAULT '' COMMENT 'è®¢å•é…é€è·ç¦»',
  `shipping_time` int(10) NOT NULL DEFAULT '0' COMMENT 'å‘è´§æ—¶é—´',
  `third_platform_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'ç¬¬ä¸‰æ–¹å¹³å°è¿è´¹',
  `logistics_company` varchar(50) NOT NULL DEFAULT '' COMMENT 'ç‰©æµå…¬å¸åç§°',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_orders`
--

LOCK TABLES `pmall_orders` WRITE;
/*!40000 ALTER TABLE `pmall_orders` DISABLE KEYS */;
INSERT INTO `pmall_orders` VALUES (1,8000000000000101,920520959507400002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615507,'online',0,0,'63200.00','63200.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(2,8000000000000201,730520959731079002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615730,'online',0,0,'209500.00','209500.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(3,8000000000000301,240520959748331002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615748,'online',0,0,'146300.00','146300.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(4,8000000000000401,520520959758822002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615758,'online',0,0,'70000.00','70000.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(5,8000000000000501,420520959770573002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615770,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(6,8000000000000601,620520959785122002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467615785,'online',0,0,'209500.00','209500.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(7,8000000000000701,790520961236208003,1,'800方o2o',3,'testuser2','testuset2@800pharm.com',13560134399,1467617236,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(8,8000000000000801,150520967659933002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1467623659,'offline',0,1468217982,'63100.00','63100.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1467719239,1,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(9,8000000000000901,160520967694414003,1,'800方o2o',3,'testuser2','testuset2@800pharm.com',13560134399,1467623694,'offline',0,1467623745,'63200.00','63200.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1467623715,1,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(10,8000000000001001,700521044749300007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467700749,'alipay',1467734400,0,'0.01','0.01','0.00','0.00','0.00',0,0,0,2,0,0,'0.01',1467785152,1,'',1,1467784410,0,0,'0.00','23423234134','',0,'0.00',''),(11,8000000000001101,720521044816573007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1465700816,'offline',0,1465719000,'52800.00','52800.00','0.00','0.00','0.00',2,2,40,2,0,0,'52800.00',1467721235,1,'1234567897855432123',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(12,8000000000001201,130521121247731007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467777247,'offline',0,1467777594,'52800.00','52800.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1467777335,1,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(13,8000000000001301,270521127430305007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467783430,'offline',0,1467783478,'52800.00','52800.00','0.00','0.00','0.00',0,0,40,2,0,0,'52800.00',1467784834,1,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(14,8000000000001401,880521129548823007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467785548,'alipay',1467734400,1467793067,'0.01','0.01','0.00','0.00','0.00',0,0,40,2,0,0,'0.01',1467793067,1,NULL,1,1467785556,0,0,'0.00','4234234331231','',0,'0.00',''),(15,8000000000001501,690521129785111007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1465785785,'alipay',1467734400,1465794377,'211200.00','211200.00','0.00','0.00','0.00',2,2,40,1,0,0,'100.00',1465794353,1,NULL,1,1467785787,0,0,'0.00','34134134134','',0,'0.00',''),(16,8000000000001601,650521141505593007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467797505,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,1,'',1,1467797507,0,0,'0.00',NULL,'',0,'0.00',''),(17,8000000000001701,290521144030663007,1,'800方o2o',7,'kit','kit.wu@800pharm.com',13812345678,1467800030,'online',0,0,'0.10','0.10','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,1,'',1,1467800033,0,0,'0.00',NULL,'',0,'0.00',''),(18,8000000000001801,130521203103296008,1,'800方o2o',8,'test','wcf818520@sina.com',110,1467859103,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(19,8000000000001901,650521203221484008,1,'800方o2o',8,'test','wcf818520@sina.com',110,1467859221,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(20,8000000000002001,710521203559778008,1,'800方o2o',8,'test','wcf818520@sina.com',110,1467859559,'online',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(21,8000000000002101,220521286062743002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1467942062,'online',0,0,'110.00','120.00','0.00','0.00','10.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(22,8000000000002201,640521286068987002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1467942068,'online',0,0,'110.00','120.00','0.00','0.00','10.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(23,8000000000002301,780521286342133007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1467942342,'alipay',1468944000,0,'100.00','110.00','0.00','0.00','10.00',0,0,30,0,0,0,'0.00',1468977368,1,NULL,1,1467942345,0,0,'0.00','3423421343','',0,'0.00',''),(24,8000000000002401,920521286511686007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1467942511,'online',0,0,'110.00','120.00','0.00','0.00','10.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(25,8000000000002501,690521286535527007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1467942535,'online',0,0,'110.00','120.00','0.00','0.00','10.00',0,0,10,0,0,0,'0.00',0,2,'',1,1469524893,0,0,'0.00',NULL,'',0,'0.00',''),(26,8000000000002601,270521286580107007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1467942580,'alipay',1468166400,0,'100.00','110.00','0.00','0.00','10.00',0,0,20,0,0,0,'0.00',0,1,'',1,1467942591,0,0,'0.00','123212312312','',0,'0.00',''),(27,8000000000002701,750521291367026002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1467947366,'online',0,0,'110.00','120.00','0.00','0.00','10.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(28,8000000000002801,580521291447164002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1463947447,'alipay',1465907200,1463965379,'110.00','120.00','0.00','0.00','10.00',2,2,40,0,0,0,'0.00',1463965091,1,NULL,1,1467947450,0,0,'0.00','3534353535','',0,'0.00',''),(29,8000000000002901,580521392021715002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468048021,'online',0,0,'90.00','98.00','0.00','0.00','8.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(30,8000000000003001,850521396199826002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468052199,'online',0,0,'90.00','98.00','0.00','0.00','8.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(31,8000000000003101,470521550830714002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468206830,'online',0,0,'90.00','98.00','0.00','0.00','8.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(32,8000000000003201,860521574043517009,1,'800方o2o',9,'eveyb','eveyb@email.com',15999904305,1468230043,'offline',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(33,8000000000003301,320521634026438002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468290026,'online',0,0,'90.00','98.00','0.00','0.00','8.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(34,8000000000003401,970521651186283002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468307186,'offline',0,1468307594,'80.00','86.00','0.00','0.00','6.00',0,0,40,0,0,0,'0.00',1468307584,2,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(35,8000000000003501,310521657055054002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468313054,'offline',0,0,'90.00','98.00','0.00','0.00','8.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(36,8000000000003502,310521657055054002,1,'800方o2o',2,'testuser','zhuangqh@800pharm.com',13560134399,1468313054,'offline',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(37,8000000000003701,380521657616653002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468313616,'offline',0,1468313658,'160.00','160.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1468313648,2,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(38,8000000000003801,150521733448178002,2,'eshop2',2,'testuser','zhuangqh@800pharm.com',13560134399,1468389448,'offline',0,1468403025,'70.00','78.00','0.00','0.00','8.00',0,0,40,2,0,0,'70.00',1468403355,2,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(39,8000000000003901,380521892018199011,1,'800方o2o',11,'15999904305','',15999904305,1468548018,'offline',0,0,'52800.00','52800.00','0.00','0.00','0.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(40,8000000000004001,920522150466069015,2,'eshop2',15,'13560134397','',13560134397,1468806465,'offline',0,1468806492,'100.00','100.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1468806479,2,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(41,8000000000004101,750522240832627016,1,'800方o2o',16,'Aidan','1550683349@qq.com',15989264655,1468896832,'predeposit',1468898104,0,'146300.00','146300.00','0.00','146300.00','0.00',0,0,0,2,0,0,'146300.00',1468908814,1,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(42,8000000000004201,930522244647004016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1468900646,'online',0,0,'100.00','100.00','0.00','0.00','0.00',0,0,0,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(43,8000000000004301,960522244693906016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1468900693,'predeposit',1468906749,0,'100.00','100.00','0.00','100.00','0.00',0,0,0,2,0,0,'100.00',1468908300,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(44,8000000000004401,660522248022283015,2,'eshop2',15,'13560134397','',13560134397,1468904022,'offline',0,1468976595,'100.00','100.00','0.00','0.00','0.00',0,0,40,0,0,0,'0.00',1468976588,2,NULL,1,0,0,0,'0.00',NULL,'',0,'0.00',''),(45,8000000000004501,570522256026579016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1468912026,'predeposit',1468912034,0,'200.00','200.00','0.00','200.00','0.00',0,0,0,2,0,0,'200.00',1468913748,1,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(46,8000000000004601,970522262519083016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1468918518,'predeposit',1468918525,0,'100.00','100.00','0.00','100.00','0.00',0,0,20,0,1,0,'0.00',0,1,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(47,8000000000004701,500522783605190014,1,'800方o2o',14,'13560134398','',13560134398,1469439605,'online',0,0,'32.00','32.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(48,8000000000004801,560522783635993014,1,'800方o2o',14,'13560134398','',13560134398,1469439635,'online',0,0,'32.00','32.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(49,8000000000004901,820522783968379014,1,'800方o2o',14,'13560134398','',13560134398,1469439968,'offline',0,0,'96.00','96.00','0.00','0.00','0.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(50,8000000000005001,840522784123926014,1,'800方o2o',14,'13560134398','',13560134398,1469440123,'online',0,0,'64.00','64.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(51,8000000000005101,430522856928159007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1469512927,'offline',0,0,'177.00','177.00','0.00','0.00','0.00',0,0,20,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(52,8000000000005201,430522867745629007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1469523745,'online',0,0,'77.00','83.00','0.00','0.00','6.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(53,8000000000005301,440522868960347007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1469524960,'wxpay',1469462400,0,'77.00','83.00','0.00','0.00','6.00',0,0,20,0,0,0,'0.00',0,1,'',1,1469524964,0,0,'0.00','123123123123','',0,'0.00',''),(54,8000000000005401,250522926435102014,1,'800方o2o',14,'13560134398','',13560134398,1469582434,'online',0,0,'32.00','32.00','0.00','0.00','0.00',0,0,0,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(55,8000000000005501,840522931841149014,1,'800方o2o',14,'13560134398','',13560134398,1469587840,'online',0,0,'32.00','32.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(56,8000000000005601,770522932520047007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1469588519,'online',0,0,'100.00','100.00','0.00','0.00','0.00',0,0,10,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(57,8000000000005701,940522932527415007,2,'eshop2',7,'kit','kit.wu@800pharm.com',13812345678,1469588527,'online',0,0,'100.00','100.00','0.00','0.00','0.00',0,0,0,0,0,0,'0.00',0,2,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(58,8000000000005801,230523013196748016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1469669196,'predeposit',1469669211,0,'100.00','100.00','0.00','100.00','0.00',0,0,20,0,0,0,'0.00',0,1,'',1,0,0,0,'0.00',NULL,'',0,'0.00',''),(59,8000000000005901,620523013284487016,2,'eshop2',16,'Aidan','1550683349@qq.com',15989264655,1469669284,'online',0,0,'100.00','100.00','0.00','0.00','0.00',0,0,0,0,0,0,'0.00',0,1,'',1,0,0,0,'0.00',NULL,'',0,'0.00','');
/*!40000 ALTER TABLE `pmall_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_book_quota`
--

DROP TABLE IF EXISTS `pmall_p_book_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_book_quota` (
  `bkq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预定套餐id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bkq_starttime` int(11) NOT NULL COMMENT '套餐开始时间',
  `bkq_endtime` int(11) NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`bkq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预定商品套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_book_quota`
--

LOCK TABLES `pmall_p_book_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_book_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_book_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_booth_goods`
--

DROP TABLE IF EXISTS `pmall_p_booth_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_booth_goods` (
  `booth_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐商品id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='展位商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_booth_goods`
--

LOCK TABLES `pmall_p_booth_goods` WRITE;
/*!40000 ALTER TABLE `pmall_p_booth_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_booth_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_booth_quota`
--

DROP TABLE IF EXISTS `pmall_p_booth_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_booth_quota` (
  `booth_quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `booth_quota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `booth_quota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `booth_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`booth_quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='展位套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_booth_quota`
--

LOCK TABLES `pmall_p_booth_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_booth_quota` DISABLE KEYS */;
INSERT INTO `pmall_p_booth_quota` VALUES (1,2,'eshop2',1469599164,1472191164,1);
/*!40000 ALTER TABLE `pmall_p_booth_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_bundling`
--

DROP TABLE IF EXISTS `pmall_p_bundling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) DEFAULT '0.00' COMMENT '运费',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_bundling`
--

LOCK TABLES `pmall_p_bundling` WRITE;
/*!40000 ALTER TABLE `pmall_p_bundling` DISABLE KEYS */;
INSERT INTO `pmall_p_bundling` VALUES (1,'好优惠哦',1,'800方o2o','100.10',1,'0.00',0);
/*!40000 ALTER TABLE `pmall_p_bundling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_bundling_goods`
--

DROP TABLE IF EXISTS `pmall_p_bundling_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `bl_appoint` tinyint(3) unsigned NOT NULL COMMENT '指定商品 1是，0否',
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_bundling_goods`
--

LOCK TABLES `pmall_p_bundling_goods` WRITE;
/*!40000 ALTER TABLE `pmall_p_bundling_goods` DISABLE KEYS */;
INSERT INTO `pmall_p_bundling_goods` VALUES (3,1,100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','1_04752627931531971.jpg','100.00',1),(4,1,100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品','1_04752627678636481.jpg','0.10',1);
/*!40000 ALTER TABLE `pmall_p_bundling_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_bundling_quota`
--

DROP TABLE IF EXISTS `pmall_p_bundling_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_bundling_quota` (
  `bl_quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `bl_quota_month` tinyint(3) unsigned NOT NULL COMMENT '购买数量（单位月）',
  `bl_quota_starttime` varchar(10) NOT NULL COMMENT '套餐开始时间',
  `bl_quota_endtime` varchar(10) NOT NULL COMMENT '套餐结束时间',
  `bl_state` tinyint(1) unsigned NOT NULL COMMENT '套餐状态：0关闭，1开启。默认为 1',
  PRIMARY KEY (`bl_quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_bundling_quota`
--

LOCK TABLES `pmall_p_bundling_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_bundling_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_bundling_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_combo_goods`
--

DROP TABLE IF EXISTS `pmall_p_combo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_combo_goods` (
  `cg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合id ',
  `cg_class` varchar(10) NOT NULL COMMENT '推荐组合名称',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共id',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `combo_goodsid` int(10) unsigned NOT NULL COMMENT '推荐组合商品id',
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐组合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_combo_goods`
--

LOCK TABLES `pmall_p_combo_goods` WRITE;
/*!40000 ALTER TABLE `pmall_p_combo_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_combo_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_combo_quota`
--

DROP TABLE IF EXISTS `pmall_p_combo_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_combo_quota` (
  `cq_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `cq_starttime` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `cq_endtime` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`cq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推荐组合套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_combo_quota`
--

LOCK TABLES `pmall_p_combo_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_combo_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_combo_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_cou`
--

DROP TABLE IF EXISTS `pmall_p_cou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_cou` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `quota_id` int(11) NOT NULL COMMENT '套餐ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常2结束3平台关闭',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `quota_id` (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_cou`
--

LOCK TABLES `pmall_p_cou` WRITE;
/*!40000 ALTER TABLE `pmall_p_cou` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_cou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_cou_level`
--

DROP TABLE IF EXISTS `pmall_p_cou_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_cou_level` (
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `xlevel` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `mincost` decimal(10,2) NOT NULL COMMENT '最低消费金额',
  `maxcou` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大可凑单数',
  PRIMARY KEY (`cou_id`,`xlevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_cou_level`
--

LOCK TABLES `pmall_p_cou_level` WRITE;
/*!40000 ALTER TABLE `pmall_p_cou_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_cou_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_cou_level_sku`
--

DROP TABLE IF EXISTS `pmall_p_cou_level_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_cou_level_sku` (
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `xlevel` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `sku_id` int(11) NOT NULL COMMENT '商品条目ID',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`cou_id`,`xlevel`,`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动换购商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_cou_level_sku`
--

LOCK TABLES `pmall_p_cou_level_sku` WRITE;
/*!40000 ALTER TABLE `pmall_p_cou_level_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_cou_level_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_cou_quota`
--

DROP TABLE IF EXISTS `pmall_p_cou_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_cou_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_cou_quota`
--

LOCK TABLES `pmall_p_cou_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_cou_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_cou_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_cou_sku`
--

DROP TABLE IF EXISTS `pmall_p_cou_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_cou_sku` (
  `sku_id` int(11) NOT NULL COMMENT '商品条目ID',
  `cou_id` int(11) NOT NULL COMMENT '加价购ID',
  `tstart` int(10) unsigned NOT NULL COMMENT '开始时间',
  `tend` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`sku_id`,`cou_id`),
  KEY `cou_id` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加价购活动商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_cou_sku`
--

LOCK TABLES `pmall_p_cou_sku` WRITE;
/*!40000 ALTER TABLE `pmall_p_cou_sku` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_cou_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_fcode_quota`
--

DROP TABLE IF EXISTS `pmall_p_fcode_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_fcode_quota` (
  `fcq_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'F码套餐id',
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `fcq_starttime` int(11) NOT NULL COMMENT '套餐开始时间',
  `fcq_endtime` int(11) NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`fcq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='F码商品套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_fcode_quota`
--

LOCK TABLES `pmall_p_fcode_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_fcode_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_fcode_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_mansong`
--

DROP TABLE IF EXISTS `pmall_p_mansong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `state` tinyint(1) unsigned NOT NULL COMMENT '活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束)',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_mansong`
--

LOCK TABLES `pmall_p_mansong` WRITE;
/*!40000 ALTER TABLE `pmall_p_mansong` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_mansong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_mansong_quota`
--

DROP TABLE IF EXISTS `pmall_p_mansong_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_mansong_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT '配额状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_mansong_quota`
--

LOCK TABLES `pmall_p_mansong_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_mansong_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_mansong_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_mansong_rule`
--

DROP TABLE IF EXISTS `pmall_p_mansong_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '级别价格',
  `discount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '减现金优惠金额',
  `mansong_goods_name` varchar(50) DEFAULT '' COMMENT '礼品名称',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品编号',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_mansong_rule`
--

LOCK TABLES `pmall_p_mansong_rule` WRITE;
/*!40000 ALTER TABLE `pmall_p_mansong_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_mansong_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_sole_goods`
--

DROP TABLE IF EXISTS `pmall_p_sole_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_sole_goods` (
  `sole_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '手机专享商品id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `sole_price` decimal(10,2) NOT NULL COMMENT '专享价格',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `sole_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`sole_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专享商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_sole_goods`
--

LOCK TABLES `pmall_p_sole_goods` WRITE;
/*!40000 ALTER TABLE `pmall_p_sole_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_sole_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_sole_quota`
--

DROP TABLE IF EXISTS `pmall_p_sole_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_sole_quota` (
  `sole_quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '套餐id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `sole_quota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `sole_quota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `sole_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1开启 0关闭 默认1',
  PRIMARY KEY (`sole_quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机专享套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_sole_quota`
--

LOCK TABLES `pmall_p_sole_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_sole_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_sole_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_xianshi`
--

DROP TABLE IF EXISTS `pmall_p_xianshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_xianshi` (
  `xianshi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `quota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `start_time` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买下限，1为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  PRIMARY KEY (`xianshi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_xianshi`
--

LOCK TABLES `pmall_p_xianshi` WRITE;
/*!40000 ALTER TABLE `pmall_p_xianshi` DISABLE KEYS */;
INSERT INTO `pmall_p_xianshi` VALUES (1,'新店大酬宾','新店大酬宾','劳力士经典腕表 九折 优惠',0,1421856000,1453392000,1,1,'800@member.com','800方o2o',1,1);
/*!40000 ALTER TABLE `pmall_p_xianshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_xianshi_goods`
--

DROP TABLE IF EXISTS `pmall_p_xianshi_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_xianshi_goods` (
  `xianshi_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时活动编号',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `xianshi_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `lower_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买下限，0为不限制',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  `xianshi_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '推荐标志 0-未推荐 1-已推荐',
  `gc_id_1` mediumint(9) DEFAULT '0' COMMENT '商品分类一级ID',
  PRIMARY KEY (`xianshi_goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_xianshi_goods`
--

LOCK TABLES `pmall_p_xianshi_goods` WRITE;
/*!40000 ALTER TABLE `pmall_p_xianshi_goods` DISABLE KEYS */;
INSERT INTO `pmall_p_xianshi_goods` VALUES (1,1,'新店大酬宾','新店大酬宾','劳力士经典腕表 九折 优惠',100008,1,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB','209500.00','188550.00','1_04752627931531971.jpg',1421856000,1453392000,1,1,0,530);
/*!40000 ALTER TABLE `pmall_p_xianshi_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_p_xianshi_quota`
--

DROP TABLE IF EXISTS `pmall_p_xianshi_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_p_xianshi_quota` (
  `quota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `start_time` int(10) unsigned NOT NULL COMMENT '套餐开始时间',
  `end_time` int(10) unsigned NOT NULL COMMENT '套餐结束时间',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_p_xianshi_quota`
--

LOCK TABLES `pmall_p_xianshi_quota` WRITE;
/*!40000 ALTER TABLE `pmall_p_xianshi_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_p_xianshi_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_payment`
--

DROP TABLE IF EXISTS `pmall_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_payment` (
  `payment_id` tinyint(1) unsigned NOT NULL COMMENT '支付索引id',
  `payment_code` char(10) NOT NULL COMMENT '支付代码名称',
  `payment_name` char(10) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_payment`
--

LOCK TABLES `pmall_payment` WRITE;
/*!40000 ALTER TABLE `pmall_payment` DISABLE KEYS */;
INSERT INTO `pmall_payment` VALUES (1,'offline','货到付款','a:1:{s:0:\"\";s:0:\"\";}','1'),(2,'alipay','支付宝','a:4:{s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:14:\"alipay_account\";s:18:\"hasubunbun@163.com\";s:10:\"alipay_key\";s:16:\"14u3lj;lj2934234\";s:14:\"alipay_partner\";s:8:\"61691448\";}','1'),(3,'tenpay','财付通','a:2:{s:14:\"tenpay_account\";s:0:\"\";s:10:\"tenpay_key\";s:0:\"\";}','0'),(4,'chinabank','网银在线','a:2:{s:17:\"chinabank_account\";s:0:\"\";s:13:\"chinabank_key\";s:0:\"\";}','0'),(5,'predeposit','站内余额支付','a:1:{s:0:\"\";s:0:\"\";}','1'),(6,'wxpay','微信支付','a:3:{s:5:\"appid\";s:9:\"cescesces\";s:5:\"mchid\";s:9:\"cescescse\";s:3:\"key\";s:7:\"scsecse\";}','1');
/*!40000 ALTER TABLE `pmall_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_pd_cash`
--

DROP TABLE IF EXISTS `pmall_pd_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_pd_cash` (
  `pdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdc_sn` bigint(20) NOT NULL COMMENT '记录唯一标示',
  `pdc_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdc_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdc_bank_name` varchar(40) NOT NULL COMMENT '收款银行',
  `pdc_bank_no` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `pdc_bank_user` varchar(10) DEFAULT NULL COMMENT '开户人姓名',
  `pdc_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdc_payment_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pdc_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '提现支付状态 0默认1支付完成',
  `pdc_payment_admin` varchar(30) DEFAULT NULL COMMENT '支付管理员',
  PRIMARY KEY (`pdc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_pd_cash`
--

LOCK TABLES `pmall_pd_cash` WRITE;
/*!40000 ALTER TABLE `pmall_pd_cash` DISABLE KEYS */;
INSERT INTO `pmall_pd_cash` VALUES (1,800522258591473016,16,'Aidan','1.00','中国建设银行','6227003328070136697','马蔚丹',1468914591,1468915793,'1','admin');
/*!40000 ALTER TABLE `pmall_pd_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_pd_log`
--

DROP TABLE IF EXISTS `pmall_pd_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_pd_log` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `lg_member_id` int(11) NOT NULL COMMENT '会员编号',
  `lg_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单支付预存款,order_freeze下单冻结预存款,order_cancel取消订单解冻预存款,order_comb_pay下单支付被冻结的预存款,recharge充值,cash_apply申请提现冻结预存款,cash_pay提现成功,cash_del取消提现申请，解冻预存款,refund退款',
  `lg_av_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额变更0表示未变更',
  `lg_freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额变更0表示未变更',
  `lg_add_time` int(11) NOT NULL COMMENT '添加时间',
  `lg_desc` varchar(150) DEFAULT NULL COMMENT '描述',
  `lg_invite_member_id` int(11) DEFAULT '0' COMMENT '原始会员编号',
  PRIMARY KEY (`lg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='预存款变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_pd_log`
--

LOCK TABLES `pmall_pd_log` WRITE;
/*!40000 ALTER TABLE `pmall_pd_log` DISABLE KEYS */;
INSERT INTO `pmall_pd_log` VALUES (1,7,'kit',NULL,'refund','52800.00','0.00',1467721235,'确认退款，订单号: 8000000000001101',NULL),(2,7,'kit',NULL,'refund','52800.00','0.00',1467784834,'确认退款，订单号: 8000000000001301',NULL),(3,7,'kit',NULL,'refund','0.01','0.00',1467785152,'确认退款，订单号: 8000000000001001',NULL),(4,7,'kit',NULL,'refund','0.01','0.00',1467793067,'确认退款，订单号: 8000000000001401',NULL),(5,7,'kit',NULL,'refund','100.00','0.00',1467794353,'确认退款，订单号: 8000000000001501',NULL),(6,5,'eshop2',NULL,'seller_money','0.00','110.10',1467965379,'卖出商品收入,扣除拥金9.9,订单号: 8000000000002801',NULL),(7,2,'testuser',NULL,'refund','70.00','0.00',1468403354,'确认退款，订单号: 8000000000003801',NULL),(8,5,'eshop2','admin','sys_add_money','100.00','0.00',1468464925,'管理员调节预存款【增加】，充值单号: 540521808925160005',NULL),(9,7,'kit','admin','sys_add_money','100.00','0.00',1468467383,'管理员调节预存款【增加】，充值单号: 500521811383442005',NULL),(10,16,'Aidan','admin','sys_add_money','10000000.00','0.00',1468897665,'管理员调节预存款【增加】，充值单号: 430522241665960000',NULL),(11,16,'Aidan',NULL,'order_pay','-146300.00','0.00',1468898104,'下单，支付预存款，订单号: 8000000000004101',NULL),(12,16,'Aidan',NULL,'order_pay','-100.00','0.00',1468906749,'下单，支付预存款，订单号: 8000000000004301',NULL),(13,16,'Aidan',NULL,'refund','100.00','0.00',1468908300,'确认退款，订单号: 8000000000004301',NULL),(14,16,'Aidan',NULL,'refund','146300.00','0.00',1468908814,'确认退款，订单号: 8000000000004101',NULL),(15,16,'Aidan',NULL,'order_pay','-200.00','0.00',1468912034,'下单，支付预存款，订单号: 8000000000004501',NULL),(16,16,'Aidan',NULL,'refund','200.00','0.00',1468913748,'确认退款，订单号: 8000000000004501',NULL),(17,15,'13560134397','admin','sys_add_money','9999.00','0.00',1468914508,'管理员调节预存款【增加】，充值单号: 910522258508674005',NULL),(18,16,'Aidan',NULL,'cash_apply','-1.00','1.00',1468914591,'申请提现，冻结预存款，提现单号: 800522258591473016',NULL),(19,16,'Aidan','admin','cash_pay','0.00','-1.00',1468915793,'提现成功，提现单号: 800522258591473016',NULL),(20,16,'Aidan',NULL,'order_pay','-100.00','0.00',1468918525,'下单，支付预存款，订单号: 8000000000004601',NULL),(21,15,'13560134397',NULL,'sys_del_money','-100.00','0.00',1469531707,'管理员调节预存款【减少】，充值单号: 200522875707587005',NULL),(22,16,'Aidan',NULL,'order_pay','-100.00','0.00',1469669211,'下单，支付预存款，订单号: 8000000000005801',NULL);
/*!40000 ALTER TABLE `pmall_pd_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_pd_recharge`
--

DROP TABLE IF EXISTS `pmall_pd_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_pd_recharge` (
  `pdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `pdr_sn` bigint(20) unsigned NOT NULL COMMENT '记录唯一标示',
  `pdr_member_id` int(11) NOT NULL COMMENT '会员编号',
  `pdr_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdr_payment_name` varchar(15) DEFAULT '' COMMENT '支付方式',
  `pdr_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  `pdr_add_time` int(11) NOT NULL COMMENT '添加时间',
  `pdr_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付1支付',
  `pdr_payment_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pdr_admin` varchar(30) DEFAULT '' COMMENT '管理员名',
  PRIMARY KEY (`pdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预存款充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_pd_recharge`
--

LOCK TABLES `pmall_pd_recharge` WRITE;
/*!40000 ALTER TABLE `pmall_pd_recharge` DISABLE KEYS */;
INSERT INTO `pmall_pd_recharge` VALUES (1,890521808831528005,5,'eshop2','100.00','','','',1468464831,'0',0,'');
/*!40000 ALTER TABLE `pmall_pd_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_cart`
--

DROP TABLE IF EXISTS `pmall_points_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_cart` (
  `pcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员编号',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`pcart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_cart`
--

LOCK TABLES `pmall_points_cart` WRITE;
/*!40000 ALTER TABLE `pmall_points_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_points_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_goods`
--

DROP TABLE IF EXISTS `pmall_points_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_goods` (
  `pgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品索引id',
  `pgoods_name` varchar(100) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换所需积分',
  `pgoods_image` varchar(100) DEFAULT '' COMMENT '积分礼品默认封面图片',
  `pgoods_tag` varchar(100) DEFAULT '' COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存数',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0表示下架 1表示上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品推荐',
  `pgoods_add_time` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text NOT NULL COMMENT '积分礼品详细内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态，0开启，1禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览次数',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制每会员兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '每会员限制兑换数量',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0为不限制 1为限制',
  `pgoods_limitmgrade` int(11) NOT NULL DEFAULT '0' COMMENT '限制参与兑换的会员级别',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '兑换结束时间',
  `pgoods_sort` int(11) NOT NULL DEFAULT '0' COMMENT '礼品排序',
  PRIMARY KEY (`pgoods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分礼品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_goods`
--

LOCK TABLES `pmall_points_goods` WRITE;
/*!40000 ALTER TABLE `pmall_points_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_points_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_log`
--

DROP TABLE IF EXISTS `pmall_points_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_log` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志编号',
  `pl_memberid` int(11) NOT NULL COMMENT '会员编号',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员编号',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数负数表示扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '操作阶段',
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_log`
--

LOCK TABLES `pmall_points_log` WRITE;
/*!40000 ALTER TABLE `pmall_points_log` DISABLE KEYS */;
INSERT INTO `pmall_points_log` VALUES (1,2,'testuser',NULL,NULL,20,1467614374,'注册会员','regist'),(2,3,'testuser2',NULL,NULL,20,1467616774,'注册会员','regist'),(3,4,'eshop',NULL,NULL,20,1467623093,'注册会员','regist'),(4,5,'eshop2',NULL,NULL,20,1467623186,'注册会员','regist'),(5,3,'testuser2',NULL,NULL,800,1467623745,'订单8000000000000901购物消费','order'),(6,6,'test3',NULL,NULL,20,1467623860,'注册会员','regist'),(7,1,'800@member.com',NULL,NULL,30,1467700561,'会员登录','login'),(8,7,'kit',NULL,NULL,20,1467700620,'注册会员','regist'),(9,3,'testuser2',NULL,NULL,30,1467700815,'会员登录','login'),(10,7,'kit',NULL,NULL,800,1467719000,'订单8000000000001101购物消费','order'),(11,7,'kit',NULL,NULL,30,1467777155,'会员登录','login'),(12,7,'kit',NULL,NULL,800,1467777594,'订单8000000000001201购物消费','order'),(13,7,'kit',NULL,NULL,800,1467783478,'订单8000000000001301购物消费','order'),(14,7,'kit',NULL,NULL,800,1467794377,'订单8000000000001501购物消费','order'),(15,1,'800@member.com',NULL,NULL,30,1467799158,'会员登录','login'),(16,8,'test',NULL,NULL,20,1467858694,'注册会员','regist'),(17,1,'800@member.com',NULL,NULL,30,1467860580,'会员登录','login'),(18,7,'kit',NULL,NULL,30,1467942334,'会员登录','login'),(19,2,'testuser',NULL,NULL,30,1467947438,'会员登录','login'),(20,2,'testuser',NULL,NULL,6,1467965379,'订单8000000000002801购物消费','order'),(21,2,'testuser',NULL,NULL,800,1468217982,'订单8000000000000801购物消费','order'),(22,9,'eveyb',NULL,NULL,20,1468230000,'注册会员','regist'),(23,2,'testuser',NULL,NULL,4,1468307594,'订单8000000000003401购物消费','order'),(24,2,'testuser',NULL,NULL,8,1468313658,'订单8000000000003701购物消费','order'),(25,10,'eshop3',NULL,NULL,20,1468381361,'注册会员','regist'),(26,1,'800@member.com',NULL,NULL,30,1468382190,'会员登录','login'),(27,9,'eveyb',NULL,NULL,30,1468389019,'会员登录','login'),(28,2,'testuser',NULL,NULL,5,1468390856,'','signin'),(29,11,'15999904305',NULL,NULL,20,1468401415,'注册会员','regist'),(30,2,'testuser',NULL,NULL,3,1468403025,'订单8000000000003801购物消费','order'),(31,2,'testuser',NULL,NULL,30,1468403067,'会员登录','login'),(32,12,'luojuan',NULL,NULL,20,1468476522,'注册会员','regist'),(33,7,'kit',NULL,NULL,30,1468479693,'会员登录','login'),(34,13,'eshop4',NULL,NULL,20,1468483851,'注册会员','regist'),(35,12,'luojuan',NULL,NULL,30,1468548758,'会员登录','login'),(36,14,'13560134398',NULL,NULL,20,1468550833,'注册会员','regist'),(37,5,'eshop2',NULL,NULL,30,1468552094,'会员登录','login'),(38,15,'13560134397',NULL,NULL,20,1468553067,'注册会员','regist'),(39,15,'13560134397',NULL,NULL,5,1468806492,'订单8000000000004001购物消费','order'),(40,16,'Aidan',NULL,NULL,20,1468896717,'注册会员','regist'),(41,7,'kit',NULL,NULL,30,1468924835,'会员登录','login'),(42,15,'13560134397',NULL,NULL,5,1468976595,'订单8000000000004401购物消费','order'),(43,1,'800@member.com',NULL,NULL,30,1469512745,'会员登录','login'),(44,7,'kit',NULL,NULL,30,1469524884,'会员登录','login'),(45,43,'ceshi',NULL,NULL,20,1469582086,'注册会员','regist'),(46,14,'13560134398',NULL,NULL,5,1469587747,'','signin'),(47,16,'Aidan',NULL,NULL,30,1469667921,'会员登录','login');
/*!40000 ALTER TABLE `pmall_points_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_order`
--

DROP TABLE IF EXISTS `pmall_points_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_order` (
  `point_orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单编号',
  `point_ordersn` varchar(20) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员id',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) NOT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单生成时间',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `point_shipping_ecode` varchar(30) DEFAULT NULL COMMENT '物流公司编码',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '20' COMMENT '订单状态：20(默认):已兑换并扣除积分;30:已发货;40:已收货;50已完成;2已取消',
  PRIMARY KEY (`point_orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_order`
--

LOCK TABLES `pmall_points_order` WRITE;
/*!40000 ALTER TABLE `pmall_points_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_points_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_orderaddress`
--

DROP TABLE IF EXISTS `pmall_points_orderaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_orderaddress` (
  `point_oaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `point_areaid` int(11) NOT NULL COMMENT '地区id',
  `point_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `point_address` varchar(200) NOT NULL COMMENT '详细地址',
  `point_telphone` varchar(20) DEFAULT '' COMMENT '电话号码',
  `point_mobphone` varchar(20) DEFAULT '' COMMENT '手机号码',
  PRIMARY KEY (`point_oaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_orderaddress`
--

LOCK TABLES `pmall_points_orderaddress` WRITE;
/*!40000 ALTER TABLE `pmall_points_orderaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_points_orderaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_points_ordergoods`
--

DROP TABLE IF EXISTS `pmall_points_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_points_ordergoods` (
  `point_recid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单礼品表索引',
  `point_orderid` int(11) NOT NULL COMMENT '订单id',
  `point_goodsid` int(11) NOT NULL COMMENT '礼品id',
  `point_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `point_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `point_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `point_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片',
  PRIMARY KEY (`point_recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_points_ordergoods`
--

LOCK TABLES `pmall_points_ordergoods` WRITE;
/*!40000 ALTER TABLE `pmall_points_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_points_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_rcb_log`
--

DROP TABLE IF EXISTS `pmall_rcb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_rcb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `member_id` int(11) NOT NULL COMMENT '会员编号',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay下单使用 order_freeze下单冻结 order_cancel取消订单解冻 order_comb_pay下单扣除被冻结 recharge平台充值卡充值 refund确认退款 vr_refund虚拟兑码退款',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `available_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额变更 0表示未变更',
  `freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额变更 0表示未变更',
  `description` varchar(150) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值卡余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_rcb_log`
--

LOCK TABLES `pmall_rcb_log` WRITE;
/*!40000 ALTER TABLE `pmall_rcb_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_rcb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_rec_position`
--

DROP TABLE IF EXISTS `pmall_rec_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_rec_position` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pic_type` enum('1','2','0') NOT NULL DEFAULT '1' COMMENT '0文字1本地图片2远程',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '序列化推荐位内容',
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='推荐位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_rec_position`
--

LOCK TABLES `pmall_rec_position` WRITE;
/*!40000 ALTER TABLE `pmall_rec_position` DISABLE KEYS */;
INSERT INTO `pmall_rec_position` VALUES (1,'1','测试','a:4:{s:4:\"body\";a:2:{i:0;a:2:{s:5:\"title\";s:42:\"shop/rec_position/878a0e5a42d066b58670.png\";s:3:\"url\";s:19:\"http://800pharm.com\";}i:1;a:2:{s:5:\"title\";s:42:\"shop/rec_position/5b1a355af3a5462a2251.png\";s:3:\"url\";s:0:\"\";}}s:5:\"width\";s:3:\"100\";s:6:\"height\";s:3:\"100\";s:6:\"target\";i:1;}');
/*!40000 ALTER TABLE `pmall_rec_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_rechargecard`
--

DROP TABLE IF EXISTS `pmall_rechargecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_rechargecard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sn` varchar(50) NOT NULL COMMENT '卡号',
  `denomination` decimal(10,2) NOT NULL COMMENT '面额',
  `batchflag` varchar(20) DEFAULT '' COMMENT '批次标识',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '创建者名称',
  `tscreated` int(10) unsigned NOT NULL COMMENT '创建时间',
  `tsused` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用时间',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0可用 1已用 2已删',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用者会员ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '使用者会员名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台充值卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_rechargecard`
--

LOCK TABLES `pmall_rechargecard` WRITE;
/*!40000 ALTER TABLE `pmall_rechargecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_rechargecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_redpacket`
--

DROP TABLE IF EXISTS `pmall_redpacket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_redpacket` (
  `rpacket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包编号',
  `rpacket_code` varchar(32) NOT NULL COMMENT '红包编码',
  `rpacket_t_id` int(11) NOT NULL COMMENT '红包模版编号',
  `rpacket_title` varchar(50) NOT NULL COMMENT '红包标题',
  `rpacket_desc` varchar(255) NOT NULL COMMENT '红包描述',
  `rpacket_start_date` int(11) NOT NULL COMMENT '红包有效期开始时间',
  `rpacket_end_date` int(11) NOT NULL COMMENT '红包有效期结束时间',
  `rpacket_price` int(11) NOT NULL COMMENT '红包面额',
  `rpacket_limit` decimal(10,2) NOT NULL COMMENT '红包使用时的订单限额',
  `rpacket_state` tinyint(4) NOT NULL COMMENT '红包状态(1-未用,2-已用,3-过期)',
  `rpacket_active_date` int(11) NOT NULL COMMENT '红包发放日期',
  `rpacket_owner_id` int(11) NOT NULL COMMENT '红包所有者id',
  `rpacket_owner_name` varchar(50) NOT NULL COMMENT '红包所有者名称',
  `rpacket_order_id` bigint(20) DEFAULT NULL COMMENT '使用该红包的订单支付单号',
  `rpacket_pwd` varchar(100) DEFAULT NULL COMMENT '红包卡密',
  `rpacket_pwd2` varchar(100) DEFAULT NULL COMMENT '红包卡密2',
  `rpacket_customimg` varchar(1000) DEFAULT NULL COMMENT '红包自定义图片',
  PRIMARY KEY (`rpacket_id`),
  UNIQUE KEY `rpacket_pwd` (`rpacket_pwd`),
  UNIQUE KEY `rpacket_pwd2` (`rpacket_pwd2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_redpacket`
--

LOCK TABLES `pmall_redpacket` WRITE;
/*!40000 ALTER TABLE `pmall_redpacket` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_redpacket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_redpacket_template`
--

DROP TABLE IF EXISTS `pmall_redpacket_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_redpacket_template` (
  `rpacket_t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包模版编号',
  `rpacket_t_title` varchar(50) NOT NULL COMMENT '红包模版名称',
  `rpacket_t_desc` varchar(255) NOT NULL COMMENT '红包模版描述',
  `rpacket_t_start_date` int(11) NOT NULL COMMENT '红包模版有效期开始时间',
  `rpacket_t_end_date` int(11) NOT NULL COMMENT '红包模版有效期结束时间',
  `rpacket_t_price` decimal(10,2) NOT NULL COMMENT '红包模版面额',
  `rpacket_t_limit` decimal(10,2) NOT NULL COMMENT '红包使用时的订单限额',
  `rpacket_t_adminid` int(11) NOT NULL COMMENT '修改管理员ID',
  `rpacket_t_state` tinyint(4) NOT NULL COMMENT '模版状态(1-有效,2-失效)',
  `rpacket_t_total` int(11) NOT NULL COMMENT '模版可发放的红包总数',
  `rpacket_t_giveout` int(11) NOT NULL COMMENT '模版已发放的红包数量',
  `rpacket_t_used` int(11) NOT NULL COMMENT '模版已经使用过的红包数量',
  `rpacket_t_updatetime` int(11) NOT NULL COMMENT '模版的创建时间',
  `rpacket_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `rpacket_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `rpacket_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义模板图片',
  `rpacket_t_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0不推荐 1推荐',
  `rpacket_t_gettype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '领取方式 1积分兑换 2卡密兑换 3免费领取',
  `rpacket_t_isbuild` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取方式为卡密兑换是否已经生成下属红包 0未生成 1已生成',
  `rpacket_t_mgradelimit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '领取限制的会员等级',
  PRIMARY KEY (`rpacket_t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='红包模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_redpacket_template`
--

LOCK TABLES `pmall_redpacket_template` WRITE;
/*!40000 ALTER TABLE `pmall_redpacket_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_redpacket_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_refund_detail`
--

DROP TABLE IF EXISTS `pmall_refund_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_refund_detail` (
  `refund_id` int(10) unsigned NOT NULL COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `batch_no` varchar(32) NOT NULL COMMENT '批次号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '在线退款金额',
  `pd_amount` decimal(10,2) DEFAULT '0.00' COMMENT '预存款金额',
  `rcb_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值卡金额',
  `refund_code` char(10) NOT NULL DEFAULT 'predeposit' COMMENT '退款支付代码',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为处理中,2为已完成,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线退款完成时间,默认为0',
  PRIMARY KEY (`refund_id`),
  KEY `batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款详细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_refund_detail`
--

LOCK TABLES `pmall_refund_detail` WRITE;
/*!40000 ALTER TABLE `pmall_refund_detail` DISABLE KEYS */;
INSERT INTO `pmall_refund_detail` VALUES (1,11,'201607052020191','52800.00','0.00','52800.00','0.00','predeposit',2,1467721219,0),(3,13,'201607061400073','52800.00','0.00','52800.00','0.00','predeposit',2,1467784807,0),(4,10,'201607061405344','0.01','0.00','0.01','0.00','alipay',2,1467785134,0),(5,14,'201607061617395','0.01','0.00','0.01','0.00','alipay',2,1467793059,0),(6,15,'201607061639066','100.00','0.00','100.00','0.00','alipay',2,1467794346,0),(7,38,'201607131748587','70.00','0.00','70.00','0.00','predeposit',2,1468403338,0),(9,43,'201607191401199','100.00','0.00','100.00','0.00','predeposit',2,1468908079,0),(10,41,'2016071914132910','146300.00','0.00','146300.00','0.00','predeposit',2,1468908809,0),(11,45,'2016071915354411','200.00','0.00','200.00','0.00','predeposit',2,1468913744,0);
/*!40000 ALTER TABLE `pmall_refund_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_refund_reason`
--

DROP TABLE IF EXISTS `pmall_refund_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_refund_reason` (
  `reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '原因ID',
  `reason_info` varchar(50) NOT NULL COMMENT '原因内容',
  `sort` tinyint(1) unsigned DEFAULT '255' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='退款退货原因表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_refund_reason`
--

LOCK TABLES `pmall_refund_reason` WRITE;
/*!40000 ALTER TABLE `pmall_refund_reason` DISABLE KEYS */;
INSERT INTO `pmall_refund_reason` VALUES (95,'效果不好不喜欢',123,1393480261),(96,'商品破损、有污渍',123,1393480261),(97,'保质期不符',123,1393480261),(98,'认为是假货',123,1393480261),(99,'不能按时发货',123,1393480261);
/*!40000 ALTER TABLE `pmall_refund_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_refund_return`
--

DROP TABLE IF EXISTS `pmall_refund_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_refund_return` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(50) NOT NULL COMMENT '订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID,全部退款是0',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,全部退款是0',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1默认2团购商品3限时折扣商品4组合套装',
  `refund_type` tinyint(1) unsigned DEFAULT '1' COMMENT '申请类型:1为退款,2为退货,默认为1',
  `seller_state` tinyint(1) unsigned DEFAULT '1' COMMENT '卖家处理状态:1为待审核,2为同意,3为不同意,默认为1',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '申请状态:1为处理中,2为待管理员处理,3为已完成,默认为1',
  `return_type` tinyint(1) unsigned DEFAULT '1' COMMENT '退货类型:1为不用退货,2为需要退货,默认为1',
  `order_lock` tinyint(1) unsigned DEFAULT '1' COMMENT '订单锁定类型:1为不用锁定,2为需要锁定,默认为1',
  `goods_state` tinyint(1) unsigned DEFAULT '1' COMMENT '物流状态:1为待发货,2为待收货,3为未收到,4为已收货,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间,默认为0',
  `reason_id` int(10) unsigned DEFAULT '0' COMMENT '原因ID:0为其它',
  `reason_info` varchar(300) DEFAULT '' COMMENT '原因内容',
  `pic_info` varchar(300) DEFAULT '' COMMENT '图片',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `seller_message` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `express_id` tinyint(1) unsigned DEFAULT '0' COMMENT '物流公司编号',
  `invoice_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` int(10) unsigned DEFAULT '0' COMMENT '发货时间,默认为0',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '收货延迟时间,默认为0',
  `receive_time` int(10) unsigned DEFAULT '0' COMMENT '收货时间,默认为0',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  `rpt_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '退款红包值，默认0，只有全部退款时才把该订单使用的红包金额写到此处',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='退款退货表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_refund_return`
--

LOCK TABLES `pmall_refund_return` WRITE;
/*!40000 ALTER TABLE `pmall_refund_return` DISABLE KEYS */;
INSERT INTO `pmall_refund_return` VALUES (1,11,'8000000000001101','405101160705201712',1,'800方o2o',7,'kit',100009,11,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',0,'52800.00','1_04752627958339099.jpg',1,1,2,3,1,1,1,1467721032,1467721125,1467721235,99,'不能按时发货','a:1:{s:5:\"buyer\";a:0:{}}','不好玩','同意','同意',0,NULL,0,0,0,NULL,0,'0.00'),(2,12,'8000000000001201','329101160706120121',1,'800方o2o',7,'kit',100009,12,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',0,'52800.00','1_04752627958339099.jpg',1,1,3,3,1,1,1,1467777681,1467782992,0,98,'认为是假货','a:1:{s:5:\"buyer\";a:1:{i:1;s:21:\"05211216810498063.png\";}}','假货假货','asdf',NULL,0,NULL,0,0,0,NULL,0,'0.00'),(3,13,'8000000000001301','414101160706133825',1,'800方o2o',7,'kit',100009,13,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',1,'52800.00','1_04752627958339099.jpg',1,2,2,3,2,1,4,1467783505,1467783602,1467784834,98,'认为是假货','a:1:{s:5:\"buyer\";a:0:{}}','假货假货','丰东股份','打发士大夫',29,'123321232123',1467783636,1467783636,1467784795,'确认收货完成',0,'0.00'),(4,10,'8000000000001001','410101160706140459',1,'800方o2o',7,'kit',0,0,'订单商品全部退款',1,'0.01',NULL,1,1,2,3,1,2,1,1467785099,1467785120,1467785152,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','要退款','阿蛋地方的','大的阿斯蒂芬阿萨德',0,NULL,0,0,0,NULL,0,'0.00'),(5,14,'8000000000001401','143101160706161502',1,'800方o2o',7,'kit',100009,14,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',1,'0.01','1_04752627958339099.jpg',1,2,2,3,1,2,1,1467792902,1467792942,1467793067,98,'认为是假货','a:1:{s:5:\"buyer\";a:0:{}}','1123123123123','123123123','adfasdfadfsdfasdfadf',0,NULL,0,0,0,NULL,0,'0.00'),(6,15,'8000000000001501','369101160706163811',1,'800方o2o',7,'kit',100009,15,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',2,'100.00','1_04752627958339099.jpg',1,2,2,3,2,2,4,1467794291,1467794316,1467794353,98,'认为是假货','a:1:{s:5:\"buyer\";a:0:{}}','爱的是犯法是哒','aefaef','爱的色放发的',40,'131231231',1467794329,1467794329,1467794340,'确认收货完成',0,'0.00'),(7,38,'8000000000003801','143102160713174450',2,'eshop2',2,'testuser',100015,40,'舒筋健骨丸',0,'70.00','2_05216575160789666.jpg',1,1,2,3,1,1,1,1468403090,1468403291,1468403355,0,'其他','a:1:{s:5:\"buyer\";a:0:{}}','不爽，就是要退货','退就退，怕你啊。','你们耍着玩呢？',0,NULL,0,0,0,NULL,200,'0.00'),(8,41,'8000000000004101','416101160719112121',1,'800方o2o',16,'Aidan',0,0,'订单商品全部退款',1,'146300.00',NULL,1,1,3,3,1,2,1,1468898481,1468908706,0,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','123','123',NULL,0,NULL,0,0,0,NULL,0,'0.00'),(9,43,'8000000000004301','933102160719134019',2,'eshop2',16,'Aidan',0,0,'订单商品全部退款',1,'100.00',NULL,1,1,2,3,1,2,1,1468906819,1468907823,1468908300,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','123','123','123',0,NULL,0,0,0,NULL,0,'0.00'),(10,41,'8000000000004101','897101160719141227',1,'800方o2o',16,'Aidan',0,0,'订单商品全部退款',1,'146300.00',NULL,1,1,2,3,1,2,1,1468908747,1468908788,1468908814,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','123','123','123',0,NULL,0,0,0,NULL,0,'0.00'),(11,45,'8000000000004501','576102160719152013',2,'eshop2',16,'Aidan',0,0,'订单商品全部退款',1,'200.00',NULL,1,1,2,3,1,2,1,1468912813,1468913366,1468913748,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','123','123','123',0,NULL,0,0,0,NULL,0,'0.00'),(12,46,'8000000000004601','837102160719165550',2,'eshop2',16,'Aidan',0,0,'订单商品全部退款',1,'100.00',NULL,1,1,1,1,1,2,1,1468918550,0,0,0,'取消订单，全部退款','a:1:{s:5:\"buyer\";a:0:{}}','123',NULL,NULL,0,NULL,0,0,0,NULL,0,'0.00'),(13,44,'8000000000004401','396102160720172813',2,'eshop2',15,'13560134397',100018,46,'欧姆龙血压计',1,'100.00','2_05211324717488064.jpg',1,1,1,1,1,1,1,1469006893,0,0,97,'保质期不符','a:1:{s:5:\"buyer\";a:3:{i:0;s:21:\"05223508921090123.jpg\";i:1;s:0:\"\";i:2;s:0:\"\";}}','不爽要退货',NULL,NULL,0,NULL,0,0,0,NULL,200,'0.00');
/*!40000 ALTER TABLE `pmall_refund_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_seller`
--

DROP TABLE IF EXISTS `pmall_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_seller` (
  `seller_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家编号',
  `seller_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_group_id` int(10) unsigned NOT NULL COMMENT '卖家组编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `is_admin` tinyint(3) unsigned NOT NULL COMMENT '是否管理员(0-不是 1-是)',
  `seller_quicklink` varchar(255) DEFAULT NULL COMMENT '卖家快捷操作',
  `last_login_time` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  `is_client` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否客户端用户 0-否 1-是',
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='卖家用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_seller`
--

LOCK TABLES `pmall_seller` WRITE;
/*!40000 ALTER TABLE `pmall_seller` DISABLE KEYS */;
INSERT INTO `pmall_seller` VALUES (1,'800@business.com',1,0,1,1,'store_promotion_bundling,store_promotion_xianshi,store_groupbuy',1469424549,0),(2,'eshop2',5,0,2,1,'',1469670037,0),(3,'eshop4',13,0,3,1,NULL,1468488984,0),(4,'lolo',12,0,4,1,NULL,1468549874,0),(5,'ceshi',43,0,5,1,NULL,NULL,0);
/*!40000 ALTER TABLE `pmall_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_seller_group`
--

DROP TABLE IF EXISTS `pmall_seller_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_seller_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家组编号',
  `group_name` varchar(50) NOT NULL COMMENT '组名',
  `limits` text NOT NULL COMMENT '权限',
  `smt_limits` text COMMENT '消息权限范围',
  `gc_limits` tinyint(3) unsigned DEFAULT '1' COMMENT '1拥有所有分类权限，0拥有部分分类权限',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='卖家用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_seller_group`
--

LOCK TABLES `pmall_seller_group` WRITE;
/*!40000 ALTER TABLE `pmall_seller_group` DISABLE KEYS */;
INSERT INTO `pmall_seller_group` VALUES (1,'超管','store_goods_add,taobao_import,store_goods_online,store_goods_offline,store_appoint,store_plate,store_spec,store_album,store_order,store_vr_order,store_deliver,store_deliver_set,store_waybill,store_evaluate,store_transport,order_call,store_groupbuy,store_promotion_cou,store_promotion_xianshi,store_promotion_mansong,store_promotion_bundling,store_promotion_booth,store_promotion_book,store_promotion_fcode,store_promotion_combo,store_promotion_sole,store_voucher,store_activity,store_setting,store_decoration,store_navigation,store_sns,store_info,store_goods_class,store_brand,store_supplier,store_map,store_contract,store_consult,store_complain,store_refund,store_return,statistics_general,statistics_goods,statistics_sale,statistics_industry,statistics_flow,store_bill,store_vr_bill,store_callcenter,store_msg,store_im,store_account,store_account_group,seller_log,store_cost,store_chain,seller_wechat,seller_wechat_follow,seller_wechat_keyword,seller_wechat_message,seller_wechat_menu','',1,1),(2,'普通药师','store_order,store_vr_order,store_deliver,store_deliver_set,store_waybill,store_evaluate,store_transport,order_call','complain,goods_storage_alarm,goods_verify,goods_violation,new_order,refund,refund_auto_process,return,return_auto_process,return_auto_receipt,store_bill_affirm,store_bill_gathering,store_cost,store_expire',0,1),(3,'账号组1','store_goods_add,taobao_import,store_goods_online,store_goods_offline,store_appoint,store_plate,store_spec,store_album,store_order,store_vr_order,store_deliver,store_deliver_set,store_waybill,store_evaluate,store_transport,order_call,store_groupbuy,store_promotion_cou,store_promotion_xianshi,store_promotion_mansong,store_promotion_bundling,store_promotion_booth,store_promotion_book,store_promotion_fcode,store_promotion_combo,store_promotion_sole,store_voucher,store_activity,store_setting,store_decoration,store_navigation,store_sns,store_info,store_goods_class,store_brand,store_supplier,store_map,store_contract,store_consult,store_complain,store_refund,store_return,statistics_general,statistics_goods,statistics_sale,statistics_industry,statistics_flow,store_bill,store_vr_bill,store_callcenter,store_msg,store_im,store_account,store_account_group,seller_log,store_cost,store_chain,seller_wechat,seller_wechat_follow,seller_wechat_keyword,seller_wechat_message,seller_wechat_menu','complain,goods_storage_alarm,goods_verify,goods_violation,new_order,refund,refund_auto_process,return,return_auto_process,return_auto_receipt,store_bill_affirm,store_bill_gathering,store_cost,store_expire',1,2);
/*!40000 ALTER TABLE `pmall_seller_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_seller_group_bclass`
--

DROP TABLE IF EXISTS `pmall_seller_group_bclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_seller_group_bclass` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned DEFAULT '0' COMMENT '权限组ID',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `gc_id` mediumint(9) unsigned DEFAULT '0' COMMENT '最底级分类',
  PRIMARY KEY (`bid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家内部组商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_seller_group_bclass`
--

LOCK TABLES `pmall_seller_group_bclass` WRITE;
/*!40000 ALTER TABLE `pmall_seller_group_bclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_seller_group_bclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_seller_log`
--

DROP TABLE IF EXISTS `pmall_seller_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_seller_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志编号',
  `log_content` varchar(500) NOT NULL COMMENT '日志内容',
  `log_time` int(10) unsigned NOT NULL COMMENT '日志时间',
  `log_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `log_seller_name` varchar(50) NOT NULL COMMENT '卖家账号',
  `log_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `log_seller_ip` varchar(50) NOT NULL COMMENT '卖家ip',
  `log_url` varchar(50) NOT NULL COMMENT '日志url',
  `log_state` tinyint(3) unsigned NOT NULL COMMENT '日志状态(0-失败 1-成功)',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='卖家日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_seller_log`
--

LOCK TABLES `pmall_seller_log` WRITE;
/*!40000 ALTER TABLE `pmall_seller_log` DISABLE KEYS */;
INSERT INTO `pmall_seller_log` VALUES (1,'登录成功',1467610389,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(2,'登录成功',1467610475,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(3,'设置广告词，SPU：100008',1467611060,1,'800@business.com',1,'192.168.0.204','store_goods_online&edit_jingle',1),(4,'编辑商品，SPU:100008',1467622901,1,'800@business.com',1,'192.168.0.117','goodsLogic&saveGoods',1),(5,'注销成功',1467623026,1,'800@business.com',1,'192.168.0.117','seller_logout&logout',1),(6,'登录成功',1467623322,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(7,'登录成功',1467623706,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(8,'登录成功',1467623755,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(9,'登录成功',1467623930,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(10,'登录成功',1467681595,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(11,'注销成功',1467700301,1,'800@business.com',1,'192.168.0.117','seller_logout&logout',1),(12,'登录成功',1467700492,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(13,'添加商品，SPU:100010',1467700768,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(14,'登录成功',1467700833,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(15,'登录成功',1467700908,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(16,'退款处理，退款编号：405101160705201712',1467721125,1,'800@business.com',1,'192.168.0.204','store_refund&edit',1),(17,'登录成功',1467776941,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(18,'退款处理，退款编号：329101160706120121',1467782992,1,'800@business.com',1,'192.168.0.204','store_refund&edit',1),(19,'退货处理，退货编号：414101160706133825',1467783602,1,'800@business.com',1,'192.168.0.204','store_return&edit',1),(20,'退货确认收货，退货编号：414101160706133825',1467784795,1,'800@business.com',1,'192.168.0.204','store_return&receive',1),(21,'登录成功',1467784916,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(22,'退款处理，退款编号：410101160706140459',1467785120,1,'800@business.com',1,'192.168.0.204','store_refund&edit',1),(23,'编辑商品，SPU:100010',1467788474,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(24,'退货处理，退货编号：143101160706161502',1467792942,1,'800@business.com',1,'192.168.0.204','store_return&edit',1),(25,'退货处理，退货编号：369101160706163811',1467794316,1,'800@business.com',1,'192.168.0.204','store_return&edit',1),(26,'退货确认收货，退货编号：369101160706163811',1467794340,1,'800@business.com',1,'192.168.0.204','store_return&receive',1),(27,'登录成功',1467797803,1,'800@business.com',1,'192.168.0.75','seller_login&login',1),(28,'编辑商品，SPU:100008',1467797921,1,'800@business.com',1,'192.168.0.204','goodsLogic&saveGoods',1),(29,'添加组成功，组编号1',1467798995,1,'800@business.com',1,'192.168.0.204','store_account_group&group_save',1),(30,'添加组成功，组编号2',1467799034,1,'800@business.com',1,'192.168.0.204','store_account_group&group_save',1),(31,'添加优惠套装，名称： id：1',1467799968,1,'800@business.com',1,'192.168.0.204','store_promotion_bundling&bundling_add',1),(32,'添加优惠套装，名称： id：1',1467799994,1,'800@business.com',1,'192.168.0.204','store_promotion_bundling&bundling_add',1),(33,'注销成功',1467800654,1,'800@business.com',1,'192.168.0.204','seller_logout&logout',1),(34,'登录成功',1467800976,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(35,'登录成功',1467801078,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(36,'登录成功',1467801089,1,'800@business.com',1,'192.168.0.49','seller_login&login',1),(37,'注销成功',1467801133,1,'800@business.com',1,'192.168.0.204','seller_logout&logout',1),(38,'登录成功',1467801141,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(39,'登录成功',1467854041,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(40,'登录成功',1467854947,1,'800@business.com',1,'192.168.0.82','seller_login&login',1),(41,'添加商品，SPU:100011',1467855455,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(42,'商品下架，SPU:100008,100007,100006,100005,100004,100003,100002,100001,100000',1467856734,1,'800@business.com',1,'192.168.0.82','goodsLogic&saveGoods',1),(43,'商品上架，SPU:100008',1467856742,1,'800@business.com',1,'192.168.0.82','goodsLogic&saveGoods',1),(44,'注销成功',1467858510,1,'800@business.com',1,'192.168.0.82','seller_logout&logout',1),(45,'登录成功',1467858601,1,'800@business.com',1,'192.168.0.82','seller_login&login',1),(46,'商品上架，SPU:100007,100006,100005,100004,100003,100002,100001,100000',1467858620,1,'800@business.com',1,'192.168.0.82','goodsLogic&saveGoods',1),(47,'登录成功',1467858920,1,'800@business.com',1,'192.168.0.82','seller_login&login',1),(48,'登录成功',1467860595,1,'800@business.com',1,'192.168.0.14','seller_login&login',1),(49,'登录成功',1467878144,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(50,'注销成功',1467886807,2,'eshop2',2,'192.168.0.204','seller_logout&logout',1),(51,'登录成功',1467886819,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(52,'登录成功',1467942312,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(53,'登录成功',1467947470,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(54,'编辑商品，SPU:100011',1467947936,2,'eshop2',2,'192.168.0.204','goodsLogic&saveGoods',1),(55,'添加商品，SPU:100012',1467963958,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(56,'注销成功',1467965020,2,'eshop2',2,'192.168.0.204','seller_logout&logout',1),(57,'登录成功',1467965079,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(58,'注销成功',1467965136,2,'eshop2',2,'192.168.0.204','seller_logout&logout',1),(59,'登录成功',1467965152,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(60,'注销成功',1467965503,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(61,'登录成功',1467965663,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(62,'添加组成功，组编号3',1468040790,2,'eshop2',2,'192.168.0.117','store_account_group&group_save',1),(63,'注销成功',1468047686,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(64,'登录成功',1468047888,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(65,'添加商品，SPU:100013',1468047986,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(66,'登录成功',1468197669,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(67,'注销成功',1468198949,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(68,'登录成功',1468198999,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(69,'注销成功',1468199120,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(70,'登录成功',1468199167,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(71,'登录成功',1468200914,1,'800@business.com',1,'192.168.0.163','seller_login&login',1),(72,'登录成功',1468202340,1,'800@business.com',1,'192.168.0.153','seller_login&login',1),(73,'登录成功',1468209467,1,'800@business.com',1,'192.168.0.236','seller_login&login',1),(74,'登录成功',1468216153,2,'eshop2',2,'192.168.0.14','seller_login&login',1),(75,'注销成功',1468228063,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(76,'登录成功',1468228070,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(77,'注销成功',1468228133,1,'800@business.com',1,'192.168.0.117','seller_logout&logout',1),(78,'登录成功',1468228141,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(79,'登录成功',1468288788,1,'800@business.com',1,'192.168.0.29','seller_login&login',1),(80,'登录成功',1468303400,1,'800@business.com',1,'192.168.0.19','seller_login&login',1),(81,'注销成功',1468306985,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(82,'登录成功',1468306992,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(83,'注销成功',1468306999,1,'800@business.com',1,'192.168.0.117','seller_logout&logout',1),(84,'登录成功',1468307006,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(85,'添加商品，SPU:100014',1468313536,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(86,'登录成功',1468319246,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(87,'注销成功',1468381040,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(88,'登录成功',1468382210,1,'800@business.com',1,'192.168.0.29','seller_login&login',1),(89,'登录成功',1468382294,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(90,'登录成功',1468389048,1,'800@business.com',1,'192.168.0.14','seller_login&login',1),(91,'登录成功',1468389165,1,'800@business.com',1,'192.168.0.75','seller_login&login',1),(92,'注销成功',1468389284,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(93,'登录成功',1468389462,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(94,'登录成功',1468390504,1,'800@business.com',1,'192.168.0.14','seller_login&login',1),(95,'注销成功',1468390940,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(96,'登录成功',1468391103,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(97,'登录成功',1468402854,1,'800@business.com',1,'192.168.0.14','seller_login&login',1),(98,'登录成功',1468403196,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(99,'退款处理，退款编号：143102160713174450',1468403291,2,'eshop2',2,'192.168.0.117','store_refund&edit',1),(100,'登录成功',1468458555,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(101,'登录成功',1468460293,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(102,'删除商品，SPU：100013',1468460445,2,'eshop2',2,'192.168.0.204','goodsLogic&saveGoods',1),(103,'删除商品，SPU：100013',1468460445,2,'eshop2',2,'192.168.0.204','store_goods_online&drop_goods',1),(104,'商品下架，SPU:100014',1468460464,2,'eshop2',2,'192.168.0.204','goodsLogic&saveGoods',1),(105,'登录成功',1468464810,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(106,'注销成功',1468467487,2,'eshop2',2,'192.168.0.204','seller_logout&logout',1),(107,'登录成功',1468467503,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(108,'登录成功',1468476248,1,'800@business.com',1,'192.168.0.41','seller_login&login',1),(109,'登录成功',1468478286,2,'eshop2',2,'192.168.0.236','seller_login&login',1),(110,'登录成功',1468482200,1,'800@business.com',1,'192.168.0.41','seller_login&login',1),(111,'编辑商品，SPU:100002',1468482393,1,'800@business.com',1,'192.168.0.41','goodsLogic&saveGoods',1),(112,'登录成功',1468488984,3,'eshop4',3,'192.168.0.117','seller_login&login',1),(113,'登录成功',1468548717,1,'800@business.com',1,'192.168.0.41','seller_login&login',1),(114,'注销成功',1468548757,3,'eshop4',3,'192.168.0.117','seller_logout&logout',1),(115,'登录成功',1468548766,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(116,'登录成功',1468549874,4,'lolo',4,'192.168.0.41','seller_login&login',1),(117,'注销成功',1468550652,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(118,'登录成功',1468551972,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(119,'登录成功',1468552128,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(120,'登录成功',1468552725,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(121,'登录成功',1468553038,1,'800@business.com',1,'192.168.0.14','seller_login&login',1),(122,'登录成功',1468566623,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(123,'添加商品，SPU:100015',1468568569,4,'lolo',4,'192.168.0.41','goodsLogic&saveGoods',1),(124,'编辑商品，SPU:100015',1468570099,4,'lolo',4,'192.168.0.41','goodsLogic&saveGoods',1),(125,'登录成功',1468580642,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(126,'注销成功',1468580822,2,'eshop2',2,'192.168.0.204','seller_logout&logout',1),(127,'登录成功',1468580835,1,'800@business.com',1,'192.168.0.204','seller_login&login',1),(128,'添加商品，SPU:100016',1468582418,1,'800@business.com',1,'192.168.0.204','goodsLogic&saveGoods',1),(129,'注销成功',1468582558,1,'800@business.com',1,'192.168.0.204','seller_logout&logout',1),(130,'登录成功',1468582565,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(131,'登录成功',1468805617,1,'800@business.com',1,'192.168.0.75','seller_login&login',1),(132,'登录成功',1468806090,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(133,'编辑商品，SPU:100011',1468806324,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(134,'编辑商品，SPU:100011',1468806387,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(135,'注销成功',1468807153,2,'eshop2',2,'192.168.0.117','seller_logout&logout',1),(136,'登录成功',1468807160,1,'800@business.com',1,'192.168.0.117','seller_login&login',1),(137,'登录成功',1468813442,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(138,'登录成功',1468898174,1,'800@business.com',1,'192.168.0.236','seller_login&login',1),(139,'登录成功',1468900088,2,'eshop2',2,'192.168.0.75','seller_login&login',1),(140,'编辑商品，SPU:100011',1468900383,2,'eshop2',2,'192.168.0.75','goodsLogic&saveGoods',1),(141,'添加商品，SPU:100017',1468900498,2,'eshop2',2,'192.168.0.75','goodsLogic&saveGoods',1),(142,'注销成功',1468906935,1,'800@business.com',1,'192.168.0.236','seller_logout&logout',1),(143,'登录成功',1468906953,2,'eshop2',2,'192.168.0.236','seller_login&login',1),(144,'退款处理，退款编号：933102160719134019',1468907823,2,'eshop2',2,'192.168.0.236','store_refund&edit',1),(145,'注销成功',1468908680,2,'eshop2',2,'192.168.0.236','seller_logout&logout',1),(146,'登录成功',1468908689,1,'800@business.com',1,'192.168.0.236','seller_login&login',1),(147,'退款处理，退款编号：416101160719112121',1468908706,1,'800@business.com',1,'192.168.0.236','store_refund&edit',1),(148,'退款处理，退款编号：897101160719141227',1468908788,1,'800@business.com',1,'192.168.0.236','store_refund&edit',1),(149,'注销成功',1468908853,1,'800@business.com',1,'192.168.0.236','seller_logout&logout',1),(150,'登录成功',1468908868,2,'eshop2',2,'192.168.0.236','seller_login&login',1),(151,'登录成功',1468909042,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(152,'退款处理，退款编号：576102160719152013',1468913366,2,'eshop2',2,'192.168.0.236','store_refund&edit',1),(153,'登录成功',1468914661,1,'800@business.com',1,'192.168.0.73','seller_login&login',1),(154,'商品下架，SPU:100016',1468915126,1,'800@business.com',1,'192.168.0.73','goodsLogic&saveGoods',1),(155,'添加商品，SPU:100018',1468916050,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(156,'编辑商品，SPU:100018',1468916283,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(157,'编辑商品，SPU:100018',1468916390,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(158,'编辑商品，SPU:100018',1468916538,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(159,'登录成功',1468926825,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(160,'登录成功',1468976575,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(161,'登录成功',1468977019,2,'eshop2',2,'192.168.0.236','seller_login&login',1),(162,'登录成功',1468977344,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(163,'编辑商品，SPU:100018',1468985688,2,'eshop2',2,'192.168.0.117','goodsLogic&saveGoods',1),(164,'登录成功',1469001793,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(165,'登录成功',1469063812,2,'eshop2',2,'192.168.0.117','seller_login&login',1),(166,'登录成功',1469415356,2,'eshop2',2,'192.168.0.75','seller_login&login',1),(167,'登录成功',1469417099,1,'800@business.com',1,'192.168.0.19','seller_login&login',1),(168,'登录成功',1469424549,1,'800@business.com',1,'192.168.0.19','seller_login&login',1),(169,'添加商品，SPU:100019',1469425381,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(170,'编辑商品，SPU:100019',1469425426,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(171,'添加商品，SPU:100020',1469425531,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(172,'添加商品，SPU:100021',1469425705,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(173,'添加商品，SPU:100022',1469426243,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(174,'添加商品，SPU:100023',1469426716,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(175,'商品上架，SPU:100022',1469427314,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(176,'商品下架，SPU:100023',1469427605,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(177,'商品上架，SPU:100023',1469430114,1,'800@business.com',1,'192.168.0.19','goodsLogic&saveGoods',1),(178,'登录成功',1469518917,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(179,'登录成功',1469582440,2,'eshop2',2,'192.168.0.204','seller_login&login',1),(180,'购买1套推荐展位，单价20元',1469599164,2,'eshop2',2,'192.168.0.204','store_promotion_booth&booth_quota_add',1),(181,'购买1份代金券套餐，单价20元',1469599982,2,'eshop2',2,'192.168.0.204','store_voucher&quotaadd',1),(182,'登录成功',1469667845,2,'eshop2',2,'192.168.0.236','seller_login&login',1),(183,'登录成功',1469670037,2,'eshop2',2,'192.168.0.204','seller_login&login',1);
/*!40000 ALTER TABLE `pmall_seller_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_seo`
--

DROP TABLE IF EXISTS `pmall_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_seo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  `type` varchar(20) NOT NULL COMMENT '类型',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_seo`
--

LOCK TABLES `pmall_seo` WRITE;
/*!40000 ALTER TABLE `pmall_seo` DISABLE KEYS */;
INSERT INTO `pmall_seo` VALUES (1,'{sitename} - Powered by shopnc','shopnc,PHP商城系统,shopnc商城系统,多用户商城系统,电商ERP,电商CRM,电子商务解决方案','shopnc专注于研发符合时代发展需要的电子商务商城系统，以专业化的服务水平为企业级用户提供B(2B)2C【B2B2C】电子商务平台解决方案，全力打造电商平台专项ERP(CRM)系统、ERP(RFID)系统等，引领中国电子商务行业企业级需求的发展方向。咨询电话：400-611-5098','index'),(2,'{sitename} - 团购','shopnc,{sitename}','shopnc专注于研发符合时代发展需要的电子商务商城系统，以专业化的服务水平为企业级用户提供B(2B)2C【B2B2C】电子商务平台解决方案，全力打造电商平台专项ERP(CRM)系统、ERP(RFID)系统等，引领中国电子商务行业企业级需求的发展方向。咨询电话：400-611-5098','group'),(3,'{sitename} - {name}','shopnc,{name},{sitename}','shopnc,{name},{sitename}','group_content'),(4,'{sitename} - 品牌','shopnc,{sitename}','shopnc,{sitename}','brand'),(5,'{sitename} - {name}','shopnc,{sitename},{name}','shopnc,{sitename},{name}','brand_list'),(7,'{sitename} - {name}','shopnc,{sitename},{name}','shopnc,{sitename},{name}','coupon_content'),(8,'{sitename} - 积分商城','shopnc,{sitename}','shopnc,{sitename}','point'),(9,'{sitename} - {name}','shopnc,{sitename},{key}','shopnc,{sitename},{description}','point_content'),(10,'{sitename} - {article_class}','shopnc,{sitename}','shopnc,{sitename}','article'),(11,'{sitename} - {name}','shopnc,{sitename},{key}','shopnc,{sitename},{description}','article_content'),(12,'{sitename} - {shopname}','shopnc,{sitename},{key}','shopnc,{sitename},{description}','shop'),(13,'{name} - {sitename}','shopnc,{sitename}','shopnc,{sitename}','product'),(14,'看{name}怎么淘到好的宝贝-{sitename}','shopnc,{sitename},{name}','shopnc,{sitename},{name}','sns');
/*!40000 ALTER TABLE `pmall_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_setting`
--

DROP TABLE IF EXISTS `pmall_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_setting` (
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '值',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_setting`
--

LOCK TABLES `pmall_setting` WRITE;
/*!40000 ALTER TABLE `pmall_setting` DISABLE KEYS */;
INSERT INTO `pmall_setting` VALUES ('app_qq_akey',''),('app_qq_isuse','0'),('app_qq_skey',''),('app_sina_akey',''),('app_sina_isuse','0'),('app_sina_skey',''),('app_weixin_appid',''),('app_weixin_isuse','0'),('app_weixin_secret',''),('captcha_status_goodsqa','1'),('captcha_status_login','1'),('captcha_status_register','1'),('circle_contentleast','10'),('circle_createsum','6'),('circle_exprelease','2'),('circle_expreleasemax','10'),('circle_expreplied','3'),('circle_exprepliedmax','1000'),('circle_expreply','1'),('circle_intervaltime','1'),('circle_iscreate','1'),('circle_istalk','1'),('circle_isuse','1'),('circle_joinsum','12'),('circle_loginpic','a:4:{i:1;a:2:{s:3:\"pic\";s:5:\"1.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:2;a:2:{s:3:\"pic\";s:5:\"2.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:3;a:2:{s:3:\"pic\";s:5:\"3.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}i:4;a:2:{s:3:\"pic\";s:5:\"4.jpg\";s:3:\"url\";s:22:\"http://www.shopnc.net/\";}}'),('circle_logo','logo.png'),('circle_managesum','4'),('circle_name','ShopNC圈子'),('circle_seodescription','发现精彩：圈子是买家们自己创建的私属领地，我们排斥广告分子，我们热爱真实分享！'),('circle_seokeywords','圈子,帮派,讨论小组,购物,生活,分享,show,秀,商品,电子商务,社区,消费者社区,论坛,资讯,热门话题,朋友'),('circle_seotitle','发现精彩 - ShopNC圈子'),('circle_wordfilter',NULL),('closed_reason','老板嫁女儿，今天全员放假。'),('cms_attitude_flag','1'),('cms_comment_flag','1'),('cms_isuse','1'),('cms_logo',''),('cms_seo_description','ShopNC,资讯,画报'),('cms_seo_keywords','ShopNC,资讯,画报'),('cms_seo_title','ShopNC资讯频道'),('cms_submit_flag','1'),('cms_submit_verify_flag','1'),('complain_time_limit','2592000'),('consult_prompt','因厂家更改商品包装、场地、附配件等不做提前通知，且每位咨询者购买、提问时间等不同。为此，客服给到的回复仅对提问者3天内有效，其他网友仅供参考！给您带来的不变还请谅解，谢谢！'),('contract_allow','1'),('default_goods_image','default_goods_image.gif'),('default_store_avatar','default_store_avatar.gif'),('default_store_logo','default_store_logo.gif'),('default_user_portrait','05228731858522304.png'),('delivery_isuse','1'),('deliver_region','1,36,37'),('email_addr',''),('email_host',''),('email_id',''),('email_pass',''),('email_port','25'),('email_type','1'),('enabled_subdomain','0'),('exppoints_rule','a:4:{s:9:\"exp_login\";s:1:\"5\";s:12:\"exp_comments\";s:2:\"10\";s:13:\"exp_orderrate\";s:1:\"1\";s:12:\"exp_ordermax\";s:3:\"500\";}'),('goods_verify','1'),('groupbuy_allow','1'),('groupbuy_price','10'),('groupbuy_review_day','0'),('guest_comment','1'),('hot_search','杜蕾斯,冈本,第六感,杰士邦'),('icp_number','ICP证粤B2-20100352'),('image_allow_ext','gif,jpg,jpeg,bmp,png,swf'),('image_dir_type','1'),('image_max_filesize','1024'),('live_color1','#fff'),('live_color2','#fff'),('live_color3','#fff'),('live_color4','#fff'),('live_link1','http://www.shopnc.com'),('live_link2','http://www.shopnc.com'),('live_link3',''),('live_link4',''),('live_pic1','04525999367706292.jpg'),('live_pic2','04525999367951893.jpg'),('live_pic3',''),('live_pic4',''),('login_pic','a:4:{i:0;s:5:\"1.jpg\";i:1;s:5:\"2.jpg\";i:2;s:5:\"3.jpg\";i:3;s:5:\"4.jpg\";}'),('malbum_max_sum','200'),('md5_key','2200dcd41afbc7d546b6ed9a9107acab'),('member_grade','a:4:{i:0;a:3:{s:5:\"level\";i:0;s:10:\"level_name\";s:2:\"V0\";s:9:\"exppoints\";i:0;}i:1;a:3:{s:5:\"level\";i:1;s:10:\"level_name\";s:2:\"V1\";s:9:\"exppoints\";i:1000;}i:2;a:3:{s:5:\"level\";i:2;s:10:\"level_name\";s:2:\"V2\";s:9:\"exppoints\";i:10000;}i:3;a:3:{s:5:\"level\";i:3;s:10:\"level_name\";s:2:\"V3\";s:9:\"exppoints\";i:20000;}}'),('member_logo','05228759461726772.png'),('microshop_goods_default_class','0'),('microshop_header_pic',''),('microshop_isuse','1'),('microshop_logo',''),('microshop_personal_limit','50'),('microshop_seo_description','ShopNC商城系统,微商城,随心看,个人秀,店铺街'),('microshop_seo_keywords','ShopNC商城系统,微商城,随心看,个人秀,店铺街,网上购物'),('microshop_store_banner',''),('microshop_style','default'),('mobile_apk',''),('mobile_apk_version','3.0'),('mobile_app','mb_app.png'),('mobile_ios',''),('mobile_isuse','1'),('mobile_wx',''),('pointprod_isuse','1'),('pointshop_isuse','0'),('points_comments','50'),('points_isuse','1'),('points_login','30'),('points_ordermax','800'),('points_orderrate','20'),('points_reg','20'),('points_signin','5'),('promotion_allow','1'),('promotion_book_price','20'),('promotion_booth_goods_sum','10'),('promotion_booth_price','20'),('promotion_bundling_goods_sum','5'),('promotion_bundling_price','20'),('promotion_bundling_sum','50'),('promotion_combo_price','20'),('promotion_cou_price','0'),('promotion_fcode_price','20'),('promotion_mansong_price','0'),('promotion_sole_price','0'),('promotion_voucher_buyertimes_limit','5'),('promotion_voucher_default_styleimg','default_voucher.jpg'),('promotion_voucher_price','0'),('promotion_voucher_storetimes_limit','20'),('promotion_xianshi_price','11'),('qq_appcode',''),('qq_appid',''),('qq_appkey',''),('qq_isuse','0'),('rec_search','a:1:{i:0;a:2:{s:4:\"name\";s:15:\"瑞士机械表\";s:5:\"value\";s:9:\"劳力士\";}}'),('redpacket_allow','1'),('seller_center_logo','05218255994184167.png'),('share_isuse','1'),('share_qqweibo_appid',''),('share_qqweibo_appkey',''),('share_qqweibo_isuse','0'),('share_sinaweibo_appcode',''),('share_sinaweibo_appid',''),('share_sinaweibo_appkey',''),('share_sinaweibo_isuse','0'),('shopnc_invite2','80'),('shopnc_invite3','70'),('shopnc_lc',''),('shopnc_phone','400-889-9646'),('shopnc_rc',NULL),('shopnc_sms_bz',''),('shopnc_sms_key',''),('shopnc_sms_pw',''),('shopnc_sms_signature',''),('shopnc_sms_tgs',''),('shopnc_sms_type','0'),('shopnc_sms_zh',''),('shopnc_stitle','好货·好快·好便宜'),('shopnc_time','08:00-22:30(周一至周日)'),('shopnc_top_banner_color','#f55'),('shopnc_top_banner_name','顶部广告管理'),('shopnc_top_banner_pic',''),('shopnc_top_banner_status','0'),('shopnc_top_banner_url','http://www.shopnc.com'),('shopnc_webchat_appid',''),('shopnc_webchat_appsecret',''),('shopwwi_sms_bz',''),('shopwwi_sms_key',''),('shopwwi_sms_pw','568202'),('shopwwi_sms_signature',''),('shopwwi_sms_tgs','梦网科技'),('shopwwi_sms_type','3'),('shopwwi_sms_zh','H10859'),('signin_isuse','1'),('sina_appcode',''),('sina_isuse','0'),('sina_wb_akey',''),('sina_wb_skey',''),('site_bank_account','银行:中国银行,币种:人民币,账号:xxxxxxxxxxx,姓名:ShopWWI,开户行:中国银行天津分行'),('site_email','abc@shopnc.com'),('site_logo','05228759461714901.png'),('site_name','八百方∙正字号'),('site_phone','23456789,88997788,123456,326556'),('site_status','1'),('sms_login','0'),('sms_password','0'),('sms_register','0'),('statistics_code',''),('stat_orderpricerange','a:1:{i:0;a:2:{s:1:\"s\";s:1:\"0\";s:1:\"e\";s:3:\"100\";}}'),('stat_pricerange','a:1:{i:0;a:2:{s:1:\"s\";s:1:\"0\";s:1:\"e\";s:3:\"100\";}}'),('store_joinin_pic','a:2:{s:3:\"pic\";a:2:{i:1;s:18:\"store_joinin_1.jpg\";i:2;s:18:\"store_joinin_2.jpg\";}s:8:\"show_txt\";s:263:\"shopnc【B2B2C】平台提供各类专业管家服务，协助您开通店铺、运营店铺、组织营销活动及分析运营数据，悉心为您解答各类疑问，引导您按相关规则展开运营；我们将竭尽全力，为您的店铺保驾护航。\";}'),('subdomain_edit','0'),('subdomain_length','3-12'),('subdomain_reserved','www'),('subdomain_times','3'),('taobao_api_isuse','0'),('taobao_app_key',''),('taobao_secret_key',''),('time_zone','Asia/Shanghai'),('ucenter_app_id','1'),('ucenter_app_key',''),('ucenter_connect_type',''),('ucenter_ip',''),('ucenter_mysql_name','shopnc'),('ucenter_mysql_passwd',''),('ucenter_mysql_pre','pre_ucenter_'),('ucenter_mysql_server','localhost'),('ucenter_mysql_username','root'),('ucenter_status','0'),('ucenter_type','discuz'),('ucenter_url',''),('voucher_allow','1'),('weixin_appid',''),('weixin_isuse','0'),('weixin_secret','');
/*!40000 ALTER TABLE `pmall_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sms_log`
--

DROP TABLE IF EXISTS `pmall_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sms_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `log_phone` char(11) NOT NULL COMMENT '手机号',
  `log_captcha` char(6) NOT NULL COMMENT '短信动态码',
  `log_ip` varchar(15) NOT NULL COMMENT '请求IP',
  `log_msg` varchar(300) NOT NULL COMMENT '短信内容',
  `log_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信类型:1为注册,2为登录,3为找回密码,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '会员ID,注册为0',
  `member_name` varchar(50) DEFAULT '' COMMENT '会员名',
  PRIMARY KEY (`log_id`),
  KEY `log_phone` (`log_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sms_log`
--

LOCK TABLES `pmall_sms_log` WRITE;
/*!40000 ALTER TABLE `pmall_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_albumclass`
--

DROP TABLE IF EXISTS `pmall_sns_albumclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_albumclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `ac_name` varchar(100) NOT NULL COMMENT '相册名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属会员id',
  `ac_des` varchar(255) DEFAULT '' COMMENT '相册描述',
  `ac_sort` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `ac_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为买家秀相册  1为是,0为否',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'åˆ›å»ºæ—¶é—´',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_albumclass`
--

LOCK TABLES `pmall_sns_albumclass` WRITE;
/*!40000 ALTER TABLE `pmall_sns_albumclass` DISABLE KEYS */;
INSERT INTO `pmall_sns_albumclass` VALUES (1,'买家秀',2,'买家秀默认相册',1,NULL,1467614374,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'买家秀',3,'买家秀默认相册',1,NULL,1467616774,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'买家秀',4,'买家秀默认相册',1,NULL,1467623093,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'买家秀',5,'买家秀默认相册',1,NULL,1467623186,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'买家秀',6,'买家秀默认相册',1,NULL,1467623860,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'买家秀',7,'买家秀默认相册',1,NULL,1467700620,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'买家秀',8,'买家秀默认相册',1,NULL,1467858694,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'买家秀',9,'买家秀默认相册',1,NULL,1468230000,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'买家秀',10,'买家秀默认相册',1,NULL,1468381361,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'买家秀',11,'买家秀默认相册',1,NULL,1468401415,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'买家秀',12,'买家秀默认相册',1,NULL,1468476522,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'买家秀',13,'买家秀默认相册',1,NULL,1468483851,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'买家秀',14,'买家秀默认相册',1,NULL,1468550832,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'买家秀',15,'买家秀默认相册',1,NULL,1468553067,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'买家秀',16,'买家秀默认相册',1,NULL,1468896717,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'买家秀',43,'买家秀默认相册',1,NULL,1469582086,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pmall_sns_albumclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_albumpic`
--

DROP TABLE IF EXISTS `pmall_sns_albumpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_albumpic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `ap_name` varchar(100) NOT NULL COMMENT '图片名称',
  `ac_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `ap_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `ap_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `ap_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `member_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  `upload_time` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ap_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型，0为无、1为买家秀',
  `item_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_albumpic`
--

LOCK TABLES `pmall_sns_albumpic` WRITE;
/*!40000 ALTER TABLE `pmall_sns_albumpic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_albumpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_binding`
--

DROP TABLE IF EXISTS `pmall_sns_binding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_binding` (
  `snsbind_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `snsbind_memberid` int(11) NOT NULL COMMENT '会员编号',
  `snsbind_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `snsbind_appsign` varchar(50) NOT NULL COMMENT '应用标志',
  `snsbind_updatetime` int(11) NOT NULL COMMENT '绑定更新时间',
  `snsbind_openid` varchar(100) NOT NULL COMMENT '应用用户编号',
  `snsbind_openinfo` text COMMENT '应用用户信息',
  `snsbind_accesstoken` varchar(100) NOT NULL COMMENT '访问第三方资源的凭证',
  `snsbind_expiresin` int(11) NOT NULL COMMENT 'accesstoken过期时间，以返回的时间的准，单位为秒，注意过期时提醒用户重新授权',
  `snsbind_refreshtoken` varchar(100) DEFAULT NULL COMMENT '刷新token',
  PRIMARY KEY (`snsbind_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分享应用用户绑定记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_binding`
--

LOCK TABLES `pmall_sns_binding` WRITE;
/*!40000 ALTER TABLE `pmall_sns_binding` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_binding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_comment`
--

DROP TABLE IF EXISTS `pmall_sns_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `comment_memberid` int(11) NOT NULL COMMENT '会员ID',
  `comment_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `comment_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `comment_originalid` int(11) NOT NULL COMMENT '原帖ID',
  `comment_originaltype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖类型 0表示动态信息 1表示分享商品 默认为0',
  `comment_content` varchar(500) NOT NULL COMMENT '评论内容',
  `comment_addtime` int(11) NOT NULL COMMENT '添加时间',
  `comment_ip` varchar(50) NOT NULL COMMENT '来源IP',
  `comment_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1屏蔽',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_comment`
--

LOCK TABLES `pmall_sns_comment` WRITE;
/*!40000 ALTER TABLE `pmall_sns_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_friend`
--

DROP TABLE IF EXISTS `pmall_sns_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_friend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `friend_frommid` int(11) NOT NULL COMMENT '会员id',
  `friend_frommname` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `friend_frommavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `friend_tomid` int(11) NOT NULL COMMENT '朋友id',
  `friend_tomname` varchar(100) NOT NULL COMMENT '好友会员名称',
  `friend_tomavatar` varchar(100) DEFAULT NULL COMMENT '朋友头像',
  `friend_addtime` int(11) NOT NULL COMMENT '添加时间',
  `friend_followstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关注状态 1为单方关注 2为双方关注',
  PRIMARY KEY (`friend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='好友数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_friend`
--

LOCK TABLES `pmall_sns_friend` WRITE;
/*!40000 ALTER TABLE `pmall_sns_friend` DISABLE KEYS */;
INSERT INTO `pmall_sns_friend` VALUES (1,15,'13560134397','',14,'13560134398','',1468553109,1);
/*!40000 ALTER TABLE `pmall_sns_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_goods`
--

DROP TABLE IF EXISTS `pmall_sns_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_goods` (
  `snsgoods_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `snsgoods_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `snsgoods_goodsimage` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `snsgoods_goodsprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `snsgoods_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `snsgoods_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `snsgoods_addtime` int(11) NOT NULL COMMENT '添加时间',
  `snsgoods_likenum` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `snsgoods_likemember` text COMMENT '喜欢过的会员ID，用逗号分隔',
  `snsgoods_sharenum` int(11) NOT NULL DEFAULT '0' COMMENT '分享数',
  UNIQUE KEY `snsgoods_goodsid` (`snsgoods_goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SNS商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_goods`
--

LOCK TABLES `pmall_sns_goods` WRITE;
/*!40000 ALTER TABLE `pmall_sns_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_membertag`
--

DROP TABLE IF EXISTS `pmall_sns_membertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_membertag` (
  `mtag_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员标签id',
  `mtag_name` varchar(20) NOT NULL COMMENT '会员标签名称',
  `mtag_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员标签排序',
  `mtag_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签推荐 0未推荐（默认），1为已推荐',
  `mtag_desc` varchar(50) DEFAULT '' COMMENT '标签描述',
  `mtag_img` varchar(50) DEFAULT NULL COMMENT '标签图片',
  PRIMARY KEY (`mtag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_membertag`
--

LOCK TABLES `pmall_sns_membertag` WRITE;
/*!40000 ALTER TABLE `pmall_sns_membertag` DISABLE KEYS */;
INSERT INTO `pmall_sns_membertag` VALUES (1,'感冒',0,1,'','');
/*!40000 ALTER TABLE `pmall_sns_membertag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_mtagmember`
--

DROP TABLE IF EXISTS `pmall_sns_mtagmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_mtagmember` (
  `mtag_id` int(11) NOT NULL COMMENT '会员标签表id',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，默认为0',
  PRIMARY KEY (`mtag_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员标签会员对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_mtagmember`
--

LOCK TABLES `pmall_sns_mtagmember` WRITE;
/*!40000 ALTER TABLE `pmall_sns_mtagmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_mtagmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_setting`
--

DROP TABLE IF EXISTS `pmall_sns_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_setting` (
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `setting_skin` varchar(50) DEFAULT NULL COMMENT '皮肤',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人中心设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_setting`
--

LOCK TABLES `pmall_sns_setting` WRITE;
/*!40000 ALTER TABLE `pmall_sns_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_sharegoods`
--

DROP TABLE IF EXISTS `pmall_sns_sharegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_sharegoods` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_goodsid` int(11) NOT NULL COMMENT '商品ID',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '分享操作时间',
  `share_likeaddtime` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢操作时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `share_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `share_isshare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分享 0为未分享 1为分享',
  `share_islike` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否喜欢 0为未喜欢 1为喜欢',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_sharegoods`
--

LOCK TABLES `pmall_sns_sharegoods` WRITE;
/*!40000 ALTER TABLE `pmall_sns_sharegoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_sharegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_sharestore`
--

DROP TABLE IF EXISTS `pmall_sns_sharestore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_sharestore` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `share_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `share_memberid` int(11) NOT NULL COMMENT '所属会员ID',
  `share_membername` varchar(100) NOT NULL COMMENT '所属会员名称',
  `share_content` varchar(500) DEFAULT NULL COMMENT '描述内容',
  `share_addtime` int(11) NOT NULL COMMENT '添加时间',
  `share_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='共享店铺表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_sharestore`
--

LOCK TABLES `pmall_sns_sharestore` WRITE;
/*!40000 ALTER TABLE `pmall_sns_sharestore` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_sharestore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_tracelog`
--

DROP TABLE IF EXISTS `pmall_sns_tracelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_tracelog` (
  `trace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `trace_originalid` int(11) NOT NULL DEFAULT '0' COMMENT '原动态ID 默认为0',
  `trace_originalmemberid` int(11) NOT NULL DEFAULT '0' COMMENT '原帖会员编号',
  `trace_originalstate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '原帖的删除状态 0为正常 1为删除',
  `trace_memberid` int(11) NOT NULL COMMENT '会员ID',
  `trace_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `trace_memberavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `trace_title` varchar(500) DEFAULT NULL COMMENT '动态标题',
  `trace_content` text NOT NULL COMMENT '动态内容',
  `trace_addtime` int(11) NOT NULL COMMENT '添加时间',
  `trace_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态  0正常 1为禁止显示 默认为0',
  `trace_privacy` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐私可见度 0所有人可见 1好友可见 2仅自己可见',
  `trace_commentcount` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `trace_copycount` int(11) NOT NULL DEFAULT '0' COMMENT '转发数',
  `trace_orgcommentcount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖评论次数',
  `trace_orgcopycount` int(11) NOT NULL DEFAULT '0' COMMENT '原帖转帖次数',
  `trace_from` tinyint(4) DEFAULT '1' COMMENT '来源 1=shop 2=storetracelog 3=microshop 4=cms 5=circle',
  PRIMARY KEY (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_tracelog`
--

LOCK TABLES `pmall_sns_tracelog` WRITE;
/*!40000 ALTER TABLE `pmall_sns_tracelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_sns_tracelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_sns_visitor`
--

DROP TABLE IF EXISTS `pmall_sns_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_sns_visitor` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `v_mid` int(11) NOT NULL COMMENT '访客会员ID',
  `v_mname` varchar(100) NOT NULL COMMENT '访客会员名称',
  `v_mavatar` varchar(100) DEFAULT NULL COMMENT '访客会员头像',
  `v_ownermid` int(11) NOT NULL COMMENT '主人会员ID',
  `v_ownermname` varchar(100) NOT NULL COMMENT '主人会员名称',
  `v_ownermavatar` varchar(100) DEFAULT NULL COMMENT '主人会员头像',
  `v_addtime` int(11) NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='sns访客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_sns_visitor`
--

LOCK TABLES `pmall_sns_visitor` WRITE;
/*!40000 ALTER TABLE `pmall_sns_visitor` DISABLE KEYS */;
INSERT INTO `pmall_sns_visitor` VALUES (1,15,'13560134397',NULL,14,'13560134398',NULL,1468553112);
/*!40000 ALTER TABLE `pmall_sns_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_spec`
--

DROP TABLE IF EXISTS `pmall_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_spec` (
  `sp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) DEFAULT NULL COMMENT '所属分类名称',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_spec`
--

LOCK TABLES `pmall_spec` WRITE;
/*!40000 ALTER TABLE `pmall_spec` DISABLE KEYS */;
INSERT INTO `pmall_spec` VALUES (1,'颜色',0,0,''),(34,'包装类型',0,1068,'血压计'),(35,'颜色',0,90,'平底鞋');
/*!40000 ALTER TABLE `pmall_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_spec_value`
--

DROP TABLE IF EXISTS `pmall_spec_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_spec_value` (
  `sp_value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值id',
  `sp_value_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sp_value_color` varchar(10) DEFAULT NULL COMMENT '规格颜色',
  `sp_value_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`sp_value_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品规格值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_spec_value`
--

LOCK TABLES `pmall_spec_value` WRITE;
/*!40000 ALTER TABLE `pmall_spec_value` DISABLE KEYS */;
INSERT INTO `pmall_spec_value` VALUES (1,'精装',34,1069,2,NULL,0),(2,'普通装',34,1069,2,NULL,0),(3,'abc',34,1069,1,NULL,0),(4,'bc',34,1069,1,NULL,0),(5,'奢侈装',34,1071,2,NULL,0),(6,'贫民装',34,1071,2,NULL,0),(7,'街边装',34,1071,2,NULL,0);
/*!40000 ALTER TABLE `pmall_spec_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_stat_member`
--

DROP TABLE IF EXISTS `pmall_stat_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_stat_member` (
  `statm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `statm_memberid` int(11) NOT NULL COMMENT '会员ID',
  `statm_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `statm_time` int(11) NOT NULL COMMENT '统计时间，当前按照最小时间单位为天',
  `statm_ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '下单量',
  `statm_orderamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '下单金额',
  `statm_goodsnum` int(11) NOT NULL DEFAULT '0' COMMENT '下单商品件数',
  `statm_predincrease` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款增加额',
  `statm_predreduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款减少额',
  `statm_pointsincrease` int(11) NOT NULL DEFAULT '0' COMMENT '积分增加额',
  `statm_pointsreduce` int(11) NOT NULL DEFAULT '0' COMMENT '积分减少额',
  `statm_updatetime` int(11) NOT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`statm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员相关数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_stat_member`
--

LOCK TABLES `pmall_stat_member` WRITE;
/*!40000 ALTER TABLE `pmall_stat_member` DISABLE KEYS */;
INSERT INTO `pmall_stat_member` VALUES (1,3,'testuser2',1467561600,1,'63200.00',1,'0.00','0.00',0,0,1467561600),(2,7,'kit',1465660800,1,'52800.00',1,'0.00','0.00',0,0,1467648000),(3,7,'kit',1467734400,4,'316800.01',7,'0.00','0.00',0,0,1467734400),(5,2,'testuser',1465920000,1,'120.00',1,'0.00','0.00',0,0,1467907200),(6,2,'testuser',1463932800,1,'120.00',1,'0.00','0.00',0,0,1467907200);
/*!40000 ALTER TABLE `pmall_stat_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_stat_order`
--

DROP TABLE IF EXISTS `pmall_stat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_stat_order` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级',
  `sc_id` int(11) DEFAULT '0' COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`),
  KEY `order_isvalid` (`order_isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_stat_order`
--

LOCK TABLES `pmall_stat_order` WRITE;
/*!40000 ALTER TABLE `pmall_stat_order` DISABLE KEYS */;
INSERT INTO `pmall_stat_order` VALUES (8,8000000000000801,1467623659,'offline','63100.00','0.00','0','30',0,'0.00','1',0,19,1,'800方o2o',0,0,2,'testuser'),(9,8000000000000901,1467623694,'offline','63200.00','0.00','0','40',0,'0.00','1',1,19,1,'800方o2o',0,0,3,'testuser2'),(10,8000000000001001,1467700749,'alipay','0.01','0.00','0','0',2,'0.01','1',1,19,1,'800方o2o',0,0,7,'kit'),(11,8000000000001101,1465700816,'offline','52800.00','0.00','1','40',2,'52800.00','1',1,19,1,'800方o2o',0,0,7,'kit'),(12,8000000000001201,1467777247,'offline','52800.00','0.00','0','40',0,'0.00','1',1,19,1,'800方o2o',0,0,7,'kit'),(13,8000000000001301,1467783430,'offline','52800.00','0.00','0','40',2,'52800.00','1',1,19,1,'800方o2o',0,0,7,'kit'),(14,8000000000001401,1467785548,'alipay','0.01','0.00','0','40',2,'0.01','1',1,19,1,'800方o2o',0,0,7,'kit'),(15,8000000000001501,1467785785,'alipay','211200.00','0.00','0','40',1,'100.00','1',1,19,1,'800方o2o',0,0,7,'kit'),(17,8000000000001701,1467800030,'online','0.10','0.00','0','10',0,'0.00','1',0,19,1,'800方o2o',0,0,7,'kit'),(28,8000000000002801,1465947447,'alipay','120.00','10.00','1','40',0,'0.00','1',1,19,2,'eshop2',0,0,2,'testuser');
/*!40000 ALTER TABLE `pmall_stat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_stat_ordergoods`
--

DROP TABLE IF EXISTS `pmall_stat_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_stat_ordergoods` (
  `rec_id` int(11) NOT NULL COMMENT '订单商品表索引id',
  `stat_updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存生成时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级',
  `sc_id` int(11) DEFAULT '0' COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称(+规格)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_commonname` varchar(50) DEFAULT '' COMMENT '商品公共表中商品名称',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `gc_parentid_1` int(11) DEFAULT '0' COMMENT '一级父类ID',
  `gc_parentid_2` int(11) DEFAULT '0' COMMENT '二级父类ID',
  `gc_parentid_3` int(11) DEFAULT '0' COMMENT '三级父类ID',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT '' COMMENT '品牌名称',
  `goods_serial` varchar(50) DEFAULT '' COMMENT '商家编号',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `goods_type` enum('1','2','3','4','5') NOT NULL DEFAULT '1' COMMENT '1默认2团购商品3限时折扣商品4优惠套装5赠品',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（团购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  UNIQUE KEY `rec_id` (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计功能订单商品缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_stat_ordergoods`
--

LOCK TABLES `pmall_stat_ordergoods` WRITE;
/*!40000 ALTER TABLE `pmall_stat_ordergoods` DISABLE KEYS */;
INSERT INTO `pmall_stat_ordergoods` VALUES (8,1467734399,8,8000000000000801,1467623659,'offline','63100.00','0.00','0','30',0,'0.00','1',0,19,1,'800方o2o',0,0,2,'testuser',100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品',100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品',587,530,540,587,0,'','','63200.00',1,'1_04752627750479728.png','63200.00','1',0,0),(9,1467647999,9,8000000000000901,1467623694,'offline','63200.00','0.00','0','40',0,'0.00','1',1,19,1,'800方o2o',0,0,3,'testuser2',100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品',100002,'劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品',587,530,540,587,0,'','','63200.00',1,'1_04752627750479728.png','63200.00','1',0,0),(10,1467820799,10,8000000000001001,1467700749,'alipay','0.01','0.00','0','0',2,'0.01','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',1,'1_04752627958339099.jpg','52800.00','1',0,0),(11,1467734399,11,8000000000001101,1465700816,'offline','52800.00','0.00','1','40',2,'52800.00','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',1,'1_04752627958339099.jpg','52800.00','1',0,0),(12,1467820799,12,8000000000001201,1467777247,'offline','52800.00','0.00','0','40',0,'0.00','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',1,'1_04752627958339099.jpg','52800.00','1',0,0),(13,1467820799,13,8000000000001301,1467783430,'offline','52800.00','0.00','0','40',2,'52800.00','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',1,'1_04752627958339099.jpg','52800.00','1',0,0),(14,1467820799,14,8000000000001401,1467785548,'alipay','0.01','0.00','0','40',2,'0.01','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',1,'1_04752627958339099.jpg','52800.00','1',0,0),(15,1467820799,15,8000000000001501,1467785785,'alipay','211200.00','0.00','0','40',1,'100.00','1',1,19,1,'800方o2o',0,0,7,'kit',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',100009,'劳力士Rolex 日志型系列 116200 63200 自动机械钢带男表联保正品',587,530,540,587,0,'','','52800.00',4,'1_04752627958339099.jpg','211200.00','1',0,0),(17,1467820799,17,8000000000001701,1467800030,'online','0.10','0.00','0','10',0,'0.00','1',0,19,1,'800方o2o',0,0,7,'kit',100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB',100008,'劳力士Rolex 宇宙计型迪通拿 自动机械皮带男表 正品116519 CR.TB',587,530,540,587,0,'','','100.00',1,'1_04752627931531971.jpg','100.00','4',1,0),(18,1467820799,17,8000000000001701,1467800030,'online','0.10','0.00','0','10',0,'0.00','1',0,19,1,'800方o2o',0,0,7,'kit',100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品',100000,'劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品',587,530,540,587,0,'','','0.10',1,'1_04752627678636481.jpg','0.10','4',1,0),(29,1467965500,28,8000000000002801,1465947447,'alipay','120.00','10.00','1','40',0,'0.00','1',1,19,2,'eshop2',0,0,2,'testuser',100011,'欧姆龙血压计 精装',100011,'欧姆龙血压计',1069,1067,1068,1069,274,'嗳呵','','110.00',1,'2_05211324717488064.jpg','110.00','1',0,9);
/*!40000 ALTER TABLE `pmall_stat_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store`
--

DROP TABLE IF EXISTS `pmall_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '店主卖家用户名',
  `sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺分类',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺所在省份ID',
  `area_info` varchar(100) NOT NULL DEFAULT '' COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `store_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT '0' COMMENT '店铺排序',
  `store_time` varchar(10) NOT NULL COMMENT '店铺时间',
  `store_end_time` varchar(10) DEFAULT NULL COMMENT '店铺关闭时间',
  `store_label` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `store_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `store_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `store_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `store_zy` text COMMENT '主营商品',
  `store_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) unsigned DEFAULT '0' COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL DEFAULT '0' COMMENT '店铺信用',
  `store_desccredit` float NOT NULL DEFAULT '0' COMMENT '描述相符度分数',
  `store_servicecredit` float NOT NULL DEFAULT '0' COMMENT '服务态度分数',
  `store_deliverycredit` float NOT NULL DEFAULT '0' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `store_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_decoration_switch` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `store_decoration_image_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺装修相册图片数量',
  `is_own_shop` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '自营店是否绑定全部分类 0否1是',
  `store_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `mb_title_img` varchar(150) DEFAULT NULL COMMENT '手机店铺 页头背景图',
  `mb_sliders` text COMMENT '手机店铺 轮播图链接地址',
  `left_bar_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '店铺商品页面左侧显示类型 1默认 2商城相关分类品牌商品推荐',
  `deliver_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `is_distribution` int(10) DEFAULT '0' COMMENT '是否分销店铺(0-否，1-是）',
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `sc_id` (`sc_id`),
  KEY `store_state` (`store_state`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store`
--

LOCK TABLES `pmall_store` WRITE;
/*!40000 ALTER TABLE `pmall_store` DISABLE KEYS */;
INSERT INTO `pmall_store` VALUES (1,'800方o2o',0,1,'800@member.com','800@business.com',0,NULL,0,'','','',1,NULL,0,'1467600281',NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,'default',0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00',1,1,0,1,1,NULL,NULL,NULL,1,'19 289 3041|广东 广州市 海珠区',0),(2,'eshop2',0,5,'eshop2','eshop2',0,NULL,0,'','','',1,NULL,0,'1467623186',NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,'default',0,0,0,0,1,NULL,NULL,NULL,NULL,0,'a:1:{i:0;a:3:{s:4:\"name\";s:7:\"售前1\";s:4:\"type\";i:3;s:3:\"num\";s:1:\"5\";}}','a:1:{i:0;a:3:{s:4:\"name\";s:7:\"售后1\";s:4:\"type\";i:3;s:3:\"num\";s:1:\"5\";}}','工作时间 AM 10:00 - PM 18:00','1.00',0,0,0,0,1,NULL,NULL,NULL,1,'19 289 3041|广东 广州市 海珠区',0),(3,'eshop4',0,13,'eshop4','eshop4',0,NULL,0,'','','',1,NULL,0,'1468483851',NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,'default',0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00',0,0,0,0,1,NULL,NULL,NULL,1,NULL,0),(4,'咯咯小店',3,12,'luojuan','lolo',2,'咯咯',0,'广东 广州市 天河区','棠下','',1,NULL,0,'1468549786','1531756799',NULL,NULL,NULL,'','',NULL,NULL,NULL,'',NULL,0,0,'default',0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00',0,0,0,0,0,NULL,NULL,NULL,1,NULL,0),(5,'测试',2,43,'ceshi','ceshi',2,NULL,0,'','','',1,'',0,'1469582086','1499270400',NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,0,0,'default',0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00',0,0,0,0,1,NULL,NULL,NULL,1,NULL,0);
/*!40000 ALTER TABLE `pmall_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_bind_class`
--

DROP TABLE IF EXISTS `pmall_store_bind_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_bind_class` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '店铺ID',
  `commis_rate` tinyint(4) unsigned DEFAULT '0' COMMENT '佣金比例',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0审核中1已审核 2平台自营店铺',
  PRIMARY KEY (`bid`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_bind_class`
--

LOCK TABLES `pmall_store_bind_class` WRITE;
/*!40000 ALTER TABLE `pmall_store_bind_class` DISABLE KEYS */;
INSERT INTO `pmall_store_bind_class` VALUES (6,2,10,1058,1059,1060,1),(8,2,10,1058,1059,1060,1),(9,2,8,1064,1065,1066,1),(10,4,10,1,4,18,1),(11,4,10,470,471,481,1),(12,2,0,1,4,12,1),(13,2,9,1070,1071,0,1);
/*!40000 ALTER TABLE `pmall_store_bind_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_class`
--

DROP TABLE IF EXISTS `pmall_store_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_class` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sc_name` varchar(50) NOT NULL COMMENT '分类名称',
  `sc_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '保证金数额',
  `sc_sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_class`
--

LOCK TABLES `pmall_store_class` WRITE;
/*!40000 ALTER TABLE `pmall_store_class` DISABLE KEYS */;
INSERT INTO `pmall_store_class` VALUES (1,'珠宝/首饰',0,8),(2,'服装鞋包',0,1),(3,'3C数码',0,2),(4,'美容护理',0,3),(5,'家居用品',0,4),(6,'食品/保健',0,5),(7,'母婴用品',0,6),(8,'文体/汽车',0,7),(9,'收藏/爱好',0,9),(10,'生活/服务',0,10);
/*!40000 ALTER TABLE `pmall_store_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_cost`
--

DROP TABLE IF EXISTS `pmall_store_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_cost` (
  `cost_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '费用编号',
  `cost_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `cost_seller_id` int(10) unsigned NOT NULL COMMENT '卖家编号',
  `cost_price` int(10) unsigned NOT NULL COMMENT '价格',
  `cost_remark` varchar(255) NOT NULL COMMENT '费用备注',
  `cost_state` tinyint(3) unsigned NOT NULL COMMENT '费用状态(0-未结算 1-已结算)',
  `cost_time` int(10) unsigned NOT NULL COMMENT '费用发生时间',
  PRIMARY KEY (`cost_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺费用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_cost`
--

LOCK TABLES `pmall_store_cost` WRITE;
/*!40000 ALTER TABLE `pmall_store_cost` DISABLE KEYS */;
INSERT INTO `pmall_store_cost` VALUES (1,2,2,20,'购买推荐展位',0,1469599164),(2,2,2,20,'购买代金券套餐',0,1469599982);
/*!40000 ALTER TABLE `pmall_store_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_decoration`
--

DROP TABLE IF EXISTS `pmall_store_decoration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_decoration` (
  `decoration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '装修编号',
  `decoration_name` varchar(50) NOT NULL COMMENT '装修名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `decoration_setting` varchar(500) DEFAULT NULL COMMENT '装修整体设置(背景、边距等)',
  `decoration_nav` varchar(5000) DEFAULT NULL COMMENT '装修导航',
  `decoration_banner` varchar(255) DEFAULT NULL COMMENT '装修头部banner',
  PRIMARY KEY (`decoration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='店铺装修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_decoration`
--

LOCK TABLES `pmall_store_decoration` WRITE;
/*!40000 ALTER TABLE `pmall_store_decoration` DISABLE KEYS */;
INSERT INTO `pmall_store_decoration` VALUES (1,'默认装修',1,NULL,NULL,NULL),(2,'默认装修',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pmall_store_decoration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_decoration_album`
--

DROP TABLE IF EXISTS `pmall_store_decoration_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_decoration_album` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `image_name` varchar(50) NOT NULL COMMENT '图片名称',
  `image_origin_name` varchar(50) NOT NULL COMMENT '图片原始名称',
  `image_width` int(10) unsigned NOT NULL COMMENT '图片宽度',
  `image_height` int(10) unsigned NOT NULL COMMENT '图片高度',
  `image_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `upload_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺装修相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_decoration_album`
--

LOCK TABLES `pmall_store_decoration_album` WRITE;
/*!40000 ALTER TABLE `pmall_store_decoration_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_decoration_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_decoration_block`
--

DROP TABLE IF EXISTS `pmall_store_decoration_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_decoration_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '装修块编号',
  `decoration_id` int(10) unsigned NOT NULL COMMENT '装修编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `block_layout` varchar(50) NOT NULL COMMENT '块布局',
  `block_content` text COMMENT '块内容',
  `block_module_type` varchar(50) DEFAULT NULL COMMENT '装修块模块类型',
  `block_full_width` tinyint(3) unsigned DEFAULT NULL COMMENT '是否100%宽度(0-否 1-是)',
  `block_sort` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '块排序',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺装修块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_decoration_block`
--

LOCK TABLES `pmall_store_decoration_block` WRITE;
/*!40000 ALTER TABLE `pmall_store_decoration_block` DISABLE KEYS */;
INSERT INTO `pmall_store_decoration_block` VALUES (1,1,1,'block_1',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `pmall_store_decoration_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_deposit`
--

DROP TABLE IF EXISTS `pmall_store_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_deposit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®ID',
  `disable_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'è´¦æˆ·çŠ¶æ€(0:ç¦ç”¨,1:å¯ç”¨)',
  `store_id` int(11) unsigned NOT NULL COMMENT 'åº—é“ºID',
  `total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'æ€»é‡‘é¢',
  `freezing_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'å†»ç»“é‡‘é¢',
  `warning_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'é¢„è­¦é‡‘é¢',
  `available_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'å¯ç”¨é‡‘é¢',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'åˆ é™¤æ—¶é—´ï¼ˆç”¨ä½œæ ‡è®°åˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_deposit`
--

LOCK TABLES `pmall_store_deposit` WRITE;
/*!40000 ALTER TABLE `pmall_store_deposit` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_extend`
--

DROP TABLE IF EXISTS `pmall_store_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_extend` (
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `express` text COMMENT '快递公司ID的组合',
  `pricerange` text COMMENT '店铺统计设置的商品价格区间',
  `orderpricerange` text COMMENT '店铺统计设置的订单价格区间',
  `bill_cycle` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '结算周期，单位天，默认0表示未设置，还是按月结算',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_extend`
--

LOCK TABLES `pmall_store_extend` WRITE;
/*!40000 ALTER TABLE `pmall_store_extend` DISABLE KEYS */;
INSERT INTO `pmall_store_extend` VALUES (1,'29,2,5,15',NULL,NULL,0),(2,'1,15,28',NULL,NULL,1),(3,NULL,NULL,NULL,0),(4,NULL,NULL,NULL,0),(5,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `pmall_store_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_goods_class`
--

DROP TABLE IF EXISTS `pmall_store_goods_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_goods_class` (
  `stc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `stc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `stc_parent_id` int(11) NOT NULL COMMENT '父级id',
  `stc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `stc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序',
  PRIMARY KEY (`stc_id`),
  KEY `stc_parent_id` (`stc_parent_id`,`stc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_goods_class`
--

LOCK TABLES `pmall_store_goods_class` WRITE;
/*!40000 ALTER TABLE `pmall_store_goods_class` DISABLE KEYS */;
INSERT INTO `pmall_store_goods_class` VALUES (1,'分类1',0,1,2,0),(2,'分类2',0,1,2,0),(3,'护肤品',0,1,4,0),(4,'护肤品',0,1,4,0),(5,'女装',0,1,4,0),(6,'面霜',3,1,4,0);
/*!40000 ALTER TABLE `pmall_store_goods_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_grade`
--

DROP TABLE IF EXISTS `pmall_store_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_grade` (
  `sg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) DEFAULT NULL COMMENT '模板内容',
  `sg_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '开店费用(元/年)',
  `sg_description` text COMMENT '申请说明',
  `sg_function` varchar(255) DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '级别，数目越大级别越高',
  PRIMARY KEY (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_grade`
--

LOCK TABLES `pmall_store_grade` WRITE;
/*!40000 ALTER TABLE `pmall_store_grade` DISABLE KEYS */;
INSERT INTO `pmall_store_grade` VALUES (1,'系统默认',100,500,100,6,'default|style1|style2|style3|style4|style5','100.00','用户选择“默认等级”，可以立即开通。','',0),(2,'白金店铺',200,1000,100,6,'default|style1|style2|style3|style4|style5','200.00','享受更多特权','editor_multimedia',2),(3,'钻石店铺',0,1000,100,6,'default|style1|style2|style3|style4|style5','1000.00','','editor_multimedia',100);
/*!40000 ALTER TABLE `pmall_store_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_joinin`
--

DROP TABLE IF EXISTS `pmall_store_joinin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_joinin` (
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_phone` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_employee_count` int(10) unsigned DEFAULT NULL COMMENT '员工总数',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_elc` varchar(50) DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) DEFAULT NULL COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(50) DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(50) DEFAULT NULL COMMENT '支行联行号',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) DEFAULT NULL COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) DEFAULT NULL COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certif_elc` varchar(50) DEFAULT NULL COMMENT '税务登记证号电子版',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家账号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `joinin_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `sg_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `sg_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sg_info` varchar(200) DEFAULT NULL COMMENT '店铺等级下的收费等信息',
  `sc_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `sc_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certif_exp` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺入住表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_joinin`
--

LOCK TABLES `pmall_store_joinin` WRITE;
/*!40000 ALTER TABLE `pmall_store_joinin` DISABLE KEYS */;
INSERT INTO `pmall_store_joinin` VALUES (5,'eshop2',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eshop2','eshop2',NULL,NULL,'40',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00'),(12,'luojuan','咯咯',0,'广东 广州市 天河区','棠下',NULL,NULL,NULL,'骆娟','18588510908','2249811214@qq.com','431123133213256456',NULL,NULL,NULL,'骆娟','05218928683574984.png',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'骆娟','2249811214@qq.com',NULL,NULL,NULL,NULL,NULL,NULL,'lolo','咯咯小店','a:2:{i:0;s:7:\"1,4,18,\";i:1;s:12:\"470,471,481,\";}','a:2:{i:0;s:30:\"服饰鞋帽,女装,连衣裙,\";i:1;s:39:\"个护化妆,面部护理,乳液面霜,\";}','40','',2,'钻石店铺',3,'a:1:{s:8:\"sg_price\";s:7:\"1000.00\";}','服装鞋包',2,0,'10,10','05218937591369009.png','','2000.00'),(13,'eshop4',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eshop4','eshop4',NULL,NULL,'40',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00'),(43,'ceshi',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ceshi','测试',NULL,NULL,'40',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'0.00');
/*!40000 ALTER TABLE `pmall_store_joinin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_map`
--

DROP TABLE IF EXISTS `pmall_store_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_map` (
  `map_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地图ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `sc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `name_info` varchar(20) NOT NULL COMMENT '详细名称',
  `address_info` varchar(30) NOT NULL COMMENT '详细地址',
  `phone_info` varchar(50) DEFAULT '' COMMENT '电话信息',
  `bus_info` varchar(250) DEFAULT '' COMMENT '公交信息',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `baidu_lng` float NOT NULL DEFAULT '0' COMMENT '百度经度',
  `baidu_lat` float NOT NULL DEFAULT '0' COMMENT '百度纬度',
  `baidu_province` varchar(15) NOT NULL COMMENT '百度省份',
  `baidu_city` varchar(15) NOT NULL COMMENT '百度城市',
  `baidu_district` varchar(15) NOT NULL COMMENT '百度区县',
  `baidu_street` varchar(15) DEFAULT '' COMMENT '百度街道',
  PRIMARY KEY (`map_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='店铺百度地图表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_map`
--

LOCK TABLES `pmall_store_map` WRITE;
/*!40000 ALTER TABLE `pmall_store_map` DISABLE KEYS */;
INSERT INTO `pmall_store_map` VALUES (2,1,0,'800方o2o','爸爸巴巴爸爸','广州市海珠区四季天地三楼','','',1467797658,113.334,23.1059,'广东省','广州市','海珠区','赤岗北路'),(4,2,0,'eshop2','八百方药店','海珠区赤岗北路118号四季天地广场3楼(近珠江帝景正门)','','',1468900341,113.328,23.1017,'广东省','广州市','海珠区','帝景正门'),(5,1,0,'800方o2o','四季天地','四季天地','13822211144','四季天地',1469433442,113.328,23.1001,'广东省','广州市','海珠区','四季天地'),(7,1,0,'800方o2o','广州火车站','广州火车站','','',1469434688,113.255,23.1469,'广东省','广州市','越秀区','火车站');
/*!40000 ALTER TABLE `pmall_store_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_msg`
--

DROP TABLE IF EXISTS `pmall_store_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_msg` (
  `sm_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消息id',
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sm_content` varchar(255) NOT NULL COMMENT '消息内容',
  `sm_addtime` int(10) unsigned NOT NULL COMMENT '发送时间',
  `sm_readids` varchar(255) DEFAULT '' COMMENT '已读卖家id',
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='店铺消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_msg`
--

LOCK TABLES `pmall_store_msg` WRITE;
/*!40000 ALTER TABLE `pmall_store_msg` DISABLE KEYS */;
INSERT INTO `pmall_store_msg` VALUES (1,'new_order',1,'您有订单需要处理，订单编号：8000000000000801。',1467623659,''),(2,'new_order',1,'您有订单需要处理，订单编号：8000000000000901。',1467623694,''),(3,'new_order',1,'您有订单需要处理，订单编号：8000000000001101。',1467700816,''),(4,'refund',1,'您有一个售后退款单需要处理，退款编号：405101160705201712。',1467721032,''),(5,'new_order',1,'您有订单需要处理，订单编号：8000000000001201。',1467777247,''),(6,'refund',1,'您有一个售后退款单需要处理，退款编号：329101160706120121。',1467777681,''),(7,'new_order',1,'您有订单需要处理，订单编号：8000000000001301。',1467783430,''),(8,'return',1,'您有一个售后退货单需要处理。退货编号：414101160706133825。',1467783505,''),(9,'new_order',1,'您有订单需要处理，订单编号：8000000000001001。',1467784465,''),(10,'refund',1,'您有一个售前退款单需要处理，退款编号：410101160706140459。',1467785099,''),(11,'new_order',1,'您有订单需要处理，订单编号：8000000000001401。',1467785664,''),(12,'new_order',1,'您有订单需要处理，订单编号：8000000000001501。',1467785803,''),(13,'return',1,'您有一个售前退货单需要处理。退货编号：143101160706161502。',1467792902,''),(14,'goods_violation',2,'您的商品被违规下架，原因：“管理员删除经营类目”。SPU：100010。',1467793993,',2,'),(15,'goods_violation',2,'您的商品被违规下架，原因：“管理员删除经营类目”。SPU：100010。',1467794047,',2,'),(16,'return',1,'您有一个售前退货单需要处理。退货编号：369101160706163811。',1467794291,''),(17,'new_order',2,'您有订单需要处理，订单编号：8000000000002801。',1467947548,',2,'),(18,'store_bill_affirm',1,'您有新的结算单等待确认，开始时间：2016-06-01 00:00:00，结束时间：2016-06-30 23:59:59，结算单号：1。',1467963435,''),(19,'store_bill_affirm',1,'您有新的结算单等待确认，开始时间：2016-07-01 00:00:00，结束时间：2016-06-30 23:59:59，结算单号：2。',1467967391,''),(20,'store_bill_affirm',2,'您有新的结算单等待确认，开始时间：2016-06-01 00:00:00，结束时间：2016-06-30 23:59:59，结算单号：3。',1467967537,',2,'),(21,'store_bill_affirm',2,'您有新的结算单等待确认，开始时间：2016-05-01 00:00:00，结束时间：2016-05-31 23:59:59，结算单号：4。',1467967538,',2,'),(22,'new_order',2,'您有订单需要处理，订单编号：8000000000002601。',1468207285,',2,'),(23,'new_order',1,'您有订单需要处理，订单编号：8000000000003201。',1468230043,''),(24,'new_order',2,'您有订单需要处理，订单编号：8000000000003401。',1468307186,',2,'),(25,'new_order',2,'您有订单需要处理，订单编号：8000000000003501。',1468313055,',2,'),(26,'new_order',2,'您有订单需要处理，订单编号：8000000000003701。',1468313616,',2,'),(27,'new_order',2,'您有订单需要处理，订单编号：8000000000003801。',1468389448,',2,'),(28,'refund',2,'您有一个售后退款单需要处理，退款编号：143102160713174450。',1468403090,',2,'),(29,'store_bill_gathering',2,'您的结算单平台已付款，请注意查收，结算单编号：4。',1468471485,',2,'),(30,'new_order',1,'您有订单需要处理，订单编号：8000000000003901。',1468548018,''),(31,'new_order',2,'您有订单需要处理，订单编号：8000000000004001。',1468806466,',2,'),(32,'new_order',1,'您有订单需要处理，订单编号：8000000000004101。',1468898104,''),(33,'refund',1,'您有一个售前退款单需要处理，退款编号：416101160719112121。',1468898481,''),(34,'new_order',2,'您有订单需要处理，订单编号：8000000000004401。',1468904022,',2,'),(35,'new_order',2,'您有订单需要处理，订单编号：8000000000004301。',1468906749,',2,'),(36,'refund',2,'您有一个售前退款单需要处理，退款编号：933102160719134019。',1468906819,',2,'),(37,'refund',1,'您有一个售前退款单需要处理，退款编号：897101160719141227。',1468908747,''),(38,'new_order',2,'您有订单需要处理，订单编号：8000000000004501。',1468912034,',2,'),(39,'refund',2,'您有一个售前退款单需要处理，退款编号：576102160719152013。',1468912813,',2,'),(40,'new_order',2,'您有订单需要处理，订单编号：8000000000004601。',1468918526,',2,'),(41,'refund',2,'您有一个售前退款单需要处理，退款编号：837102160719165550。',1468918550,',2,'),(42,'new_order',2,'您有订单需要处理，订单编号：8000000000002301。',1468977320,',2,'),(43,'refund',2,'您有一个售后退款单需要处理，退款编号：396102160720172813。',1469006893,',2,'),(44,'goods_verify',1,'您的商品没有通过管理员审核，原因：“test”。SPU：100023。',1469427266,''),(45,'goods_violation',1,'您的商品被违规下架，原因：“tge”。SPU：100021。',1469427629,''),(46,'new_order',1,'您有订单需要处理，订单编号：8000000000004901。',1469439968,''),(47,'new_order',2,'您有订单需要处理，订单编号：8000000000005101。',1469512928,''),(48,'new_order',2,'您有订单需要处理，订单编号：8000000000005301。',1469524990,''),(49,'goods_violation',2,'您的商品被违规下架，原因：“啦啦啦”。SPU：100017。',1469530946,''),(50,'store_cost',2,'您有一条新的店铺消费记录，金额：20，操作人：eshop2，备注：购买推荐展位。',1469599165,''),(51,'store_cost',2,'您有一条新的店铺消费记录，金额：20，操作人：eshop2，备注：购买代金券套餐。',1469599982,''),(52,'new_order',2,'您有订单需要处理，订单编号：8000000000005801。',1469669211,'');
/*!40000 ALTER TABLE `pmall_store_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_msg_read`
--

DROP TABLE IF EXISTS `pmall_store_msg_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_msg_read` (
  `sm_id` int(11) NOT NULL COMMENT '店铺消息id',
  `seller_id` int(11) NOT NULL COMMENT '卖家id',
  `read_time` int(11) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`sm_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息阅读表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_msg_read`
--

LOCK TABLES `pmall_store_msg_read` WRITE;
/*!40000 ALTER TABLE `pmall_store_msg_read` DISABLE KEYS */;
INSERT INTO `pmall_store_msg_read` VALUES (14,2,1469086227),(15,2,1469086227),(17,2,1469086219),(20,2,1469086219),(21,2,1469086219),(22,2,1469086219),(24,2,1469086219),(25,2,1469086219),(26,2,1469086219),(27,2,1469086219),(28,2,1469086219),(29,2,1469086219),(31,2,1469086210),(34,2,1469086210),(35,2,1469086210),(36,2,1469086210),(38,2,1469086210),(39,2,1469086210),(40,2,1469086210),(41,2,1469086210),(42,2,1469086203),(43,2,1469086200);
/*!40000 ALTER TABLE `pmall_store_msg_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_msg_setting`
--

DROP TABLE IF EXISTS `pmall_store_msg_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_msg_setting` (
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `sms_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关，0关闭，1开启',
  `sms_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短消息接收开关，0关闭，1开启',
  `sms_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关，0关闭，1开启',
  `sms_short_number` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sms_mail_number` varchar(100) DEFAULT '' COMMENT '邮箱号码',
  PRIMARY KEY (`smt_code`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺消息接收设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_msg_setting`
--

LOCK TABLES `pmall_store_msg_setting` WRITE;
/*!40000 ALTER TABLE `pmall_store_msg_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_msg_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_msg_tpl`
--

DROP TABLE IF EXISTS `pmall_store_msg_tpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_msg_tpl` (
  `smt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `smt_name` varchar(100) NOT NULL COMMENT '模板名称',
  `smt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信默认开关，0关，1开',
  `smt_message_content` varchar(255) NOT NULL COMMENT '站内信内容',
  `smt_message_forced` tinyint(3) unsigned NOT NULL COMMENT '站内信强制接收，0否，1是',
  `smt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信默认开关，0关，1开',
  `smt_short_content` varchar(255) NOT NULL COMMENT '短信内容',
  `smt_short_forced` tinyint(3) unsigned NOT NULL COMMENT '短信强制接收，0否，1是',
  `smt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件默认开，0关，1开',
  `smt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `smt_mail_content` text NOT NULL COMMENT '邮件内容',
  `smt_mail_forced` tinyint(3) unsigned NOT NULL COMMENT '邮件强制接收，0否，1是',
  PRIMARY KEY (`smt_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_msg_tpl`
--

LOCK TABLES `pmall_store_msg_tpl` WRITE;
/*!40000 ALTER TABLE `pmall_store_msg_tpl` DISABLE KEYS */;
INSERT INTO `pmall_store_msg_tpl` VALUES ('complain','商品被投诉提醒',0,'您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。',1,0,'【{$site_name}】您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。',0,0,'{$site_name}提醒：您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您售出的商品被投诉，等待商家申诉。投诉单编号：{$complain_id}。\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('goods_storage_alarm','商品库存预警',0,'您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。',1,0,'【{$site_name}】您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。',0,0,'{$site_name}提醒：您的商品库存不足，请及时补货。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品库存不足，请及时补货。SPU：{$common_id}，SKU：{$sku_id}。\r\n</p>\r\n<p>\r\n  点击下面链接查看商品详细信息\r\n</p>\r\n<p>\r\n   <a href=\"http://{$shop_site_url}/index.php?act=goods&amp;op=index&amp;goods_id={$sku_id}\" target=\"_blank\">http://{$shop_site_url}/index.php?act=goods&amp;op=index&amp;goods_id={$sku_id}</a> \r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<br />',0),('goods_verify','商品审核失败提醒',0,'您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。',1,0,'【{$site_name}】您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。',0,0,'{$site_name}提醒：您的商品没有通过管理员审核。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品没有通过管理员审核，原因：“{$remark}”。SPU：{$common_id}。\r\n </p><p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p style=\"text-align:right;\">\r\n       {$site_name}\r\n    </p>\r\n    <p style=\"text-align:right;\">\r\n       {$mail_send_time}\r\n   </p>',0),('goods_violation','商品违规被下架',0,'您的商品被违规下架，原因：“{$remark}”。SPU：{$common_id}。',1,0,'【{$site_name}】您的商品被违规下架，原因：“{$remark}”。SPU：{$common_id}。',0,0,'{$site_name}提醒：您的商品被违规下架。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的商品被违规下架。，原因：“{$remark}”。SPU：{$common_id}。\r\n</p>\r\n<p>\r\n <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('new_order','新订单提醒',1,'【八百方】您有新的订单生产，请尽快到后台进行处理',1,1,'【八百方】您有新的订单生产，请尽快到后台进行处理',0,0,'{$site_name}提醒：您有订单需要处理。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有订单需要处理，订单编号：{$order_sn}。\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<br />',0),('refund','退款提醒',1,'【八百方】您有一笔订单用户已退款，请及时处理，避免产生无效订单',1,1,'【八百方】您有一笔订单用户需要退款，请及时处理，避免产生无效订单',1,0,'{$site_name}提醒：您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一个{$type}退款单需要处理，退款编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',1),('refund_auto_process','退款自动处理提醒',0,'您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。',1,0,'【{$site_name}】您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。',0,0,'{site_name}提醒：您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。','<p>\r\n  {site_name}提醒：\r\n</p>\r\n<p>\r\n   您的{$type}退款单超期未处理，已自动同意买家退款申请。退款单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('return','退货提醒',0,'您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。',1,0,'【{site_name}】您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。',0,0,'{$site_name}提醒：您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。','<p>\r\n   {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一个{$type}退货单需要处理。退货编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<br />',0),('return_auto_process','退货自动处理提醒',0,'您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。',1,0,'【{$site_name}】您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。',0,0,'{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>',0),('return_auto_receipt','退货未收货自动处理提醒',0,'【八百方】您有一笔未发货订单用户已退款，请及时处理，避免产生无效订单',1,0,'【八百方】',0,0,'{$site_name}提醒：您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。','<p>\r\n  {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您的{$type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：{$refund_sn}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('store_bill_affirm','结算单等待确认提醒',1,'您有新的结算单等待确认，开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。',1,1,'【八百方】您的后台有超时未处理的订单，请尽快到后台处理，若有问题，请联系八百方人员',0,0,'{$site_name}提醒：您有新的结算单等待确认。','<p>\r\n {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有新的结算单等待确认，起止时间：开始时间：{$state_time}，结束时间：{$end_time}，结算单号：{$bill_no}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0),('store_bill_gathering','结算单已经付款提醒',0,'您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。',1,0,'【{$site_name}】您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。',0,0,'{$site_name}提醒：您的结算单平台已付款，请注意查收。','<p>\r\n </p><p>\r\n     {$site_name}提醒：\r\n </p>\r\n\r\n<p>\r\n 您的结算单平台已付款，请注意查收，结算单编号：{$bill_no}。\r\n  </p><p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p>\r\n     <br />\r\n  </p>\r\n    <p style=\"text-align:right;\">\r\n       {$site_name}\r\n    </p>\r\n    <p style=\"text-align:right;\">\r\n       {$mail_send_time}\r\n   </p>\r\n\r\n<br />',0),('store_cost','店铺消费提醒',0,'您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。',1,0,'【{$site_name}】您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。',0,0,'{$site_name}提醒：您有一条新的店铺消费记录。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  您有一条新的店铺消费记录，金额：{$price}，操作人：{$seller_name}，备注：{$remark}。\r\n</p>\r\n<p>\r\n    <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>',0),('store_expire','店铺到期提醒',0,'你的店铺即将到期，请及时续期。',1,0,'【{$site_name}】你的店铺即将到期，请及时续期。',0,0,'{$site_name}提醒：你的店铺即将到期，请及时续期。','<p>\r\n    {$site_name}提醒：\r\n</p>\r\n<p>\r\n  你的店铺即将到期，请及时续期。\r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n {$site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   {$mail_send_time}\r\n</p>\r\n<p>\r\n    <br />\r\n</p>',0);
/*!40000 ALTER TABLE `pmall_store_msg_tpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_navigation`
--

DROP TABLE IF EXISTS `pmall_store_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_navigation` (
  `sn_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '导航ID',
  `sn_title` varchar(50) NOT NULL COMMENT '导航名称',
  `sn_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺ID',
  `sn_content` text COMMENT '导航内容',
  `sn_sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `sn_if_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '导航是否显示',
  `sn_add_time` int(10) NOT NULL COMMENT '导航',
  `sn_url` varchar(255) DEFAULT NULL COMMENT '店铺导航的外链URL',
  `sn_new_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '店铺导航外链是否在新窗口打开：0不开新窗口1开新窗口，默认是0',
  PRIMARY KEY (`sn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卖家店铺导航信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_navigation`
--

LOCK TABLES `pmall_store_navigation` WRITE;
/*!40000 ALTER TABLE `pmall_store_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_plate`
--

DROP TABLE IF EXISTS `pmall_store_plate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_plate` (
  `plate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联板式id',
  `plate_name` varchar(10) NOT NULL COMMENT '关联板式名称',
  `plate_position` tinyint(3) unsigned NOT NULL COMMENT '关联板式位置 1顶部，0底部',
  `plate_content` text NOT NULL COMMENT '关联板式内容',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺id',
  PRIMARY KEY (`plate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关联板式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_plate`
--

LOCK TABLES `pmall_store_plate` WRITE;
/*!40000 ALTER TABLE `pmall_store_plate` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_plate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_reopen`
--

DROP TABLE IF EXISTS `pmall_store_reopen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_reopen` (
  `re_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `re_grade_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级ID',
  `re_grade_name` varchar(30) DEFAULT NULL COMMENT '等级名称',
  `re_grade_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '等级收费(元/年)',
  `re_year` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '续签时长(年)',
  `re_pay_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总金额',
  `re_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名字',
  `re_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `re_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0默认，未上传凭证1审核中2审核通过',
  `re_start_time` int(10) unsigned DEFAULT NULL COMMENT '有效期开始时间',
  `re_end_time` int(10) unsigned DEFAULT NULL COMMENT '有效期结束时间',
  `re_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录创建时间',
  `re_pay_cert` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `re_pay_cert_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='续签内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_reopen`
--

LOCK TABLES `pmall_store_reopen` WRITE;
/*!40000 ALTER TABLE `pmall_store_reopen` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_reopen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_sns_comment`
--

DROP TABLE IF EXISTS `pmall_store_sns_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_sns_comment` (
  `scomm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态评论id',
  `strace_id` int(11) NOT NULL COMMENT '店铺动态id',
  `scomm_content` varchar(150) DEFAULT NULL COMMENT '评论内容',
  `scomm_memberid` int(11) DEFAULT NULL COMMENT '会员id',
  `scomm_membername` varchar(45) DEFAULT NULL COMMENT '会员名称',
  `scomm_memberavatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `scomm_time` varchar(11) DEFAULT NULL COMMENT '评论时间',
  `scomm_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论状态 1正常，0屏蔽',
  PRIMARY KEY (`scomm_id`),
  UNIQUE KEY `scomm_id` (`scomm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_sns_comment`
--

LOCK TABLES `pmall_store_sns_comment` WRITE;
/*!40000 ALTER TABLE `pmall_store_sns_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_sns_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_sns_setting`
--

DROP TABLE IF EXISTS `pmall_store_sns_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_sns_setting` (
  `sauto_storeid` int(11) NOT NULL COMMENT '店铺id',
  `sauto_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新品,0为关闭/1为开启',
  `sauto_newtitle` varchar(150) DEFAULT '' COMMENT '新品内容',
  `sauto_coupon` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券,0为关闭/1为开启',
  `sauto_coupontitle` varchar(150) DEFAULT '' COMMENT '优惠券内容',
  `sauto_xianshi` tinyint(4) NOT NULL DEFAULT '1' COMMENT '限时折扣,0为关闭/1为开启',
  `sauto_xianshititle` varchar(150) DEFAULT '' COMMENT '限时折扣内容',
  `sauto_mansong` tinyint(4) NOT NULL DEFAULT '1' COMMENT '满即送,0为关闭/1为开启',
  `sauto_mansongtitle` varchar(150) DEFAULT '' COMMENT '满即送内容',
  `sauto_bundling` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组合销售,0为关闭/1为开启',
  `sauto_bundlingtitle` varchar(150) DEFAULT '' COMMENT '组合销售内容',
  `sauto_groupbuy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '团购,0为关闭/1为开启',
  `sauto_groupbuytitle` varchar(150) DEFAULT '' COMMENT '团购内容',
  PRIMARY KEY (`sauto_storeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺自动发布动态设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_sns_setting`
--

LOCK TABLES `pmall_store_sns_setting` WRITE;
/*!40000 ALTER TABLE `pmall_store_sns_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_sns_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_sns_tracelog`
--

DROP TABLE IF EXISTS `pmall_store_sns_tracelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_sns_tracelog` (
  `strace_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态id',
  `strace_storeid` int(11) DEFAULT NULL COMMENT '店铺id',
  `strace_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `strace_storelogo` varchar(255) DEFAULT '' COMMENT '店标',
  `strace_title` varchar(150) DEFAULT NULL COMMENT '动态标题',
  `strace_content` text COMMENT '发表内容',
  `strace_time` varchar(11) DEFAULT NULL COMMENT '发表时间',
  `strace_cool` int(11) DEFAULT '0' COMMENT '赞数量',
  `strace_spread` int(11) DEFAULT '0' COMMENT '转播数量',
  `strace_comment` int(11) DEFAULT '0' COMMENT '评论数量',
  `strace_type` tinyint(4) DEFAULT '1' COMMENT '1=relay,2=normal,3=new,4=coupon,5=xianshi,6=mansong,7=bundling,8=groupbuy,9=recommend,10=hotsell',
  `strace_goodsdata` text COMMENT '商品信息',
  `strace_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态状态 1正常，0屏蔽',
  PRIMARY KEY (`strace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_sns_tracelog`
--

LOCK TABLES `pmall_store_sns_tracelog` WRITE;
/*!40000 ALTER TABLE `pmall_store_sns_tracelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_sns_tracelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_supplier`
--

DROP TABLE IF EXISTS `pmall_store_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_supplier` (
  `sup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sup_store_id` int(11) DEFAULT NULL COMMENT '商家ID',
  `sup_store_name` varchar(50) DEFAULT NULL COMMENT '商家名称',
  `sup_name` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `sup_desc` varchar(200) DEFAULT NULL COMMENT '备注',
  `sup_man` varchar(30) DEFAULT NULL COMMENT '联系人',
  `sup_phone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='供货商表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_supplier`
--

LOCK TABLES `pmall_store_supplier` WRITE;
/*!40000 ALTER TABLE `pmall_store_supplier` DISABLE KEYS */;
INSERT INTO `pmall_store_supplier` VALUES (1,1,'800方o2o','药商通','啦啦啦啦','大白','13812345678');
/*!40000 ALTER TABLE `pmall_store_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_watermark`
--

DROP TABLE IF EXISTS `pmall_store_watermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_watermark` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '水印id',
  `jpeg_quality` int(3) NOT NULL DEFAULT '90' COMMENT 'jpeg图片质量',
  `wm_image_name` varchar(255) DEFAULT NULL COMMENT '水印图片的路径以及文件名',
  `wm_image_pos` tinyint(1) NOT NULL DEFAULT '1' COMMENT '水印图片放置的位置',
  `wm_image_transition` int(3) NOT NULL DEFAULT '20' COMMENT '水印图片与原图片的融合度 ',
  `wm_text` text COMMENT '水印文字',
  `wm_text_size` int(3) NOT NULL DEFAULT '20' COMMENT '水印文字大小',
  `wm_text_angle` tinyint(1) NOT NULL DEFAULT '4' COMMENT '水印文字角度',
  `wm_text_pos` tinyint(1) NOT NULL DEFAULT '3' COMMENT '水印文字放置位置',
  `wm_text_font` varchar(50) DEFAULT NULL COMMENT '水印文字的字体',
  `wm_text_color` varchar(7) NOT NULL DEFAULT '#CCCCCC' COMMENT '水印字体的颜色值',
  `wm_is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '水印是否开启 0关闭 1开启',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺id',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺水印图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_watermark`
--

LOCK TABLES `pmall_store_watermark` WRITE;
/*!40000 ALTER TABLE `pmall_store_watermark` DISABLE KEYS */;
INSERT INTO `pmall_store_watermark` VALUES (1,100,'05218245923215658.png',9,20,'您好',20,0,3,'arial','#CCCCCC',0,1);
/*!40000 ALTER TABLE `pmall_store_watermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_store_waybill`
--

DROP TABLE IF EXISTS `pmall_store_waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_store_waybill` (
  `store_waybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺运单模板编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `express_id` int(10) unsigned NOT NULL COMMENT '物流公司编号',
  `waybill_id` int(10) unsigned NOT NULL COMMENT '运单模板编号',
  `waybill_name` varchar(50) NOT NULL COMMENT '运单模板名称',
  `store_waybill_data` varchar(2000) DEFAULT NULL COMMENT '店铺自定义设置',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认模板',
  `store_waybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单左偏移',
  `store_waybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '店铺运单上偏移',
  PRIMARY KEY (`store_waybill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺运单模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_store_waybill`
--

LOCK TABLES `pmall_store_waybill` WRITE;
/*!40000 ALTER TABLE `pmall_store_waybill` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_store_waybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_transport`
--

DROP TABLE IF EXISTS `pmall_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_transport` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `title` varchar(30) NOT NULL COMMENT '运费模板名称',
  `send_tpl_id` mediumint(8) unsigned DEFAULT NULL COMMENT '发货地区模板ID',
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='运费模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_transport`
--

LOCK TABLES `pmall_transport` WRITE;
/*!40000 ALTER TABLE `pmall_transport` DISABLE KEYS */;
INSERT INTO `pmall_transport` VALUES (1,'顺丰物流',1,1,1467610949),(3,'四季天地',1,2,1468916031);
/*!40000 ALTER TABLE `pmall_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_transport_extend`
--

DROP TABLE IF EXISTS `pmall_transport_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_transport_extend` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `area_name` text COMMENT '地区name组成的串，以，隔开',
  `sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首件运费',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_transport_extend`
--

LOCK TABLES `pmall_transport_extend` WRITE;
/*!40000 ALTER TABLE `pmall_transport_extend` DISABLE KEYS */;
INSERT INTO `pmall_transport_extend` VALUES (1,',19,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,',',19,','广东','10.00',1,'顺丰物流'),(2,',20,310,311,312,313,314,315,316,317,318,319,320,321,322,323,',',20,','广西','5.00',1,'顺丰物流'),(4,',289,',',19,','广州市','6.00',3,'四季天地');
/*!40000 ALTER TABLE `pmall_transport_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_type`
--

DROP TABLE IF EXISTS `pmall_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(1) unsigned NOT NULL COMMENT '排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属分类id',
  `class_name` varchar(100) DEFAULT '' COMMENT '所属分类名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='商品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_type`
--

LOCK TABLES `pmall_type` WRITE;
/*!40000 ALTER TABLE `pmall_type` DISABLE KEYS */;
INSERT INTO `pmall_type` VALUES (5,'血压计',0,1068,'血压计');
/*!40000 ALTER TABLE `pmall_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_type_brand`
--

DROP TABLE IF EXISTS `pmall_type_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_type_brand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与品牌对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_type_brand`
--

LOCK TABLES `pmall_type_brand` WRITE;
/*!40000 ALTER TABLE `pmall_type_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_type_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_type_custom`
--

DROP TABLE IF EXISTS `pmall_type_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_type_custom` (
  `custom_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义属性id',
  `custom_name` varchar(50) NOT NULL COMMENT '自定义属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='自定义属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_type_custom`
--

LOCK TABLES `pmall_type_custom` WRITE;
/*!40000 ALTER TABLE `pmall_type_custom` DISABLE KEYS */;
INSERT INTO `pmall_type_custom` VALUES (4,'测量范围',5),(6,'记忆组数',5),(7,'脉搏数',5),(8,'电源类型',5),(9,'电池寿命',5);
/*!40000 ALTER TABLE `pmall_type_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_type_spec`
--

DROP TABLE IF EXISTS `pmall_type_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_type_spec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类型与规格对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_type_spec`
--

LOCK TABLES `pmall_type_spec` WRITE;
/*!40000 ALTER TABLE `pmall_type_spec` DISABLE KEYS */;
INSERT INTO `pmall_type_spec` VALUES (5,34);
/*!40000 ALTER TABLE `pmall_type_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_upload`
--

DROP TABLE IF EXISTS `pmall_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_upload` (
  `upload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `file_thumb` varchar(100) DEFAULT NULL COMMENT '缩微图片',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文件类别，0为无，1为文章图片，默认为0，2为帮助内容图片，3为店铺幻灯片，4为系统文章图片，5为积分礼品切换图片，6为积分礼品内容图片',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_upload`
--

LOCK TABLES `pmall_upload` WRITE;
/*!40000 ALTER TABLE `pmall_upload` DISABLE KEYS */;
INSERT INTO `pmall_upload` VALUES (175,'help_store_04526250471329237.jpg',NULL,93814,2,1399281047,97),(176,'help_store_04526250486031950.jpg',NULL,402109,2,1399281048,97),(177,'help_store_04526250504192250.jpg',NULL,248466,2,1399281050,97),(180,'help_store_04526254603037325.jpg',NULL,884442,2,1399281460,99);
/*!40000 ALTER TABLE `pmall_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_voucher`
--

DROP TABLE IF EXISTS `pmall_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券编号',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `voucher_t_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_start_date` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_end_date` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态(1-未用,2-已用,3-过期,4-收回)',
  `voucher_active_date` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) DEFAULT '0' COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者id',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号',
  `voucher_pwd` varchar(100) DEFAULT NULL COMMENT '代金券卡密不可逆',
  `voucher_pwd2` varchar(100) DEFAULT NULL COMMENT '代金券卡密2可逆',
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代金券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_voucher`
--

LOCK TABLES `pmall_voucher` WRITE;
/*!40000 ALTER TABLE `pmall_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_voucher_price`
--

DROP TABLE IF EXISTS `pmall_voucher_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_voucher_price` (
  `voucher_price_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值编号',
  `voucher_price_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面值',
  `voucher_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0',
  PRIMARY KEY (`voucher_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代金券面额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_voucher_price`
--

LOCK TABLES `pmall_voucher_price` WRITE;
/*!40000 ALTER TABLE `pmall_voucher_price` DISABLE KEYS */;
INSERT INTO `pmall_voucher_price` VALUES (1,'打发士大夫的',10,100);
/*!40000 ALTER TABLE `pmall_voucher_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_voucher_quota`
--

DROP TABLE IF EXISTS `pmall_voucher_quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_voucher_quota` (
  `quota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '套餐编号',
  `quota_memberid` int(11) NOT NULL COMMENT '会员编号',
  `quota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `quota_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `quota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `quota_starttime` int(11) NOT NULL COMMENT '开始时间',
  `quota_endtime` int(11) NOT NULL COMMENT '结束时间',
  `quota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1-可用/2-取消/3-结束)',
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_voucher_quota`
--

LOCK TABLES `pmall_voucher_quota` WRITE;
/*!40000 ALTER TABLE `pmall_voucher_quota` DISABLE KEYS */;
INSERT INTO `pmall_voucher_quota` VALUES (1,5,'eshop2',2,'eshop2',1469599982,1472191982,1);
/*!40000 ALTER TABLE `pmall_voucher_quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_voucher_template`
--

DROP TABLE IF EXISTS `pmall_voucher_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_voucher_template` (
  `voucher_t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版编号',
  `voucher_t_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `voucher_t_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `voucher_t_start_date` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `voucher_t_end_date` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `voucher_t_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `voucher_t_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_t_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺id',
  `voucher_t_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `voucher_t_sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺分类ID',
  `voucher_t_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者id',
  `voucher_t_state` tinyint(4) NOT NULL COMMENT '代金券模版状态(1-有效,2-失效)',
  `voucher_t_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `voucher_t_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `voucher_t_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `voucher_t_add_date` int(11) NOT NULL COMMENT '模版的创建时间',
  `voucher_t_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `voucher_t_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `voucher_t_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `voucher_t_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `voucher_t_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片',
  `voucher_t_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0不推荐 1推荐',
  `voucher_t_gettype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '领取方式 1积分兑换 2卡密兑换 3免费领取',
  `voucher_t_isbuild` tinyint(1) NOT NULL DEFAULT '0' COMMENT '领取方式为卡密兑换是否已经生成下属代金券 0未生成 1已生成',
  `voucher_t_mgradelimit` tinyint(2) NOT NULL DEFAULT '0' COMMENT '领取代金券限制的会员等级',
  PRIMARY KEY (`voucher_t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代金券模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_voucher_template`
--

LOCK TABLES `pmall_voucher_template` WRITE;
/*!40000 ALTER TABLE `pmall_voucher_template` DISABLE KEYS */;
INSERT INTO `pmall_voucher_template` VALUES (1,'啦啦啦','爱的法撒旦撒旦法',1469600378,1472191982,10,'100.00',2,'eshop2',0,5,1,100,0,0,1469600378,1,0,0,NULL,'05229443780821364.png',0,3,0,0);
/*!40000 ALTER TABLE `pmall_voucher_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_groupbuy_area`
--

DROP TABLE IF EXISTS `pmall_vr_groupbuy_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_groupbuy_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域id',
  `area_name` varchar(100) NOT NULL COMMENT '域区名称',
  `parent_area_id` int(11) NOT NULL COMMENT '域区id',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `first_letter` char(1) NOT NULL COMMENT '首字母',
  `area_number` varchar(10) DEFAULT NULL COMMENT '区号',
  `post` varchar(10) DEFAULT NULL COMMENT '邮编',
  `hot_city` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0.否 1.是',
  `area_num` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8 COMMENT='虚拟团购区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_groupbuy_area`
--

LOCK TABLES `pmall_vr_groupbuy_area` WRITE;
/*!40000 ALTER TABLE `pmall_vr_groupbuy_area` DISABLE KEYS */;
INSERT INTO `pmall_vr_groupbuy_area` VALUES (1,'天津',0,1395277186,'T','022','30000',1,0),(2,'北京',0,1368172202,'B','010','0',1,0),(3,'南开区',1,1395277206,'A','','0',0,0),(5,'和平区',1,1363832792,'H',NULL,NULL,1,1),(6,'大悦城',3,1395286450,'D','','0',0,0),(7,'鞍山',0,1367830248,'A',NULL,NULL,0,0),(8,'安顺',0,1367830274,'A',NULL,NULL,0,0),(9,'阿坝',0,1367830293,'A',NULL,NULL,0,0),(10,'阿拉善',0,1367830301,'A',NULL,NULL,0,0),(12,'包头',0,1367830350,'B',NULL,NULL,0,0),(13,'保定',0,1367830358,'B',NULL,NULL,0,0),(14,'巴中',0,1367830379,'B',NULL,NULL,0,0),(15,'成都',0,1367830392,'C',NULL,NULL,0,0),(16,'重庆',0,1367830411,'C',NULL,NULL,1,0),(17,'常州',0,1367830422,'C',NULL,NULL,0,0),(18,'长沙',0,1367830434,'C',NULL,NULL,1,0),(19,'长春',0,1367830446,'C',NULL,NULL,0,0),(20,'东莞',0,1367830459,'D',NULL,NULL,0,0),(21,'大连',0,1367830469,'D',NULL,NULL,1,0),(22,'东营',0,1367830479,'C',NULL,NULL,0,0),(23,'大庆',0,1367830489,'C',NULL,NULL,0,0),(24,'大同',0,1367830498,'A',NULL,NULL,0,0),(25,'恩施',0,1367830508,'E',NULL,NULL,0,0),(26,'鄂州',0,1367830518,'E',NULL,NULL,0,0),(27,'鄂尔多斯',0,1367830530,'E',NULL,NULL,0,0),(28,'福州',0,1367830542,'F',NULL,NULL,0,0),(29,'佛山',0,1367830555,'F',NULL,NULL,0,0),(30,'抚顺',0,1367830566,'F',NULL,NULL,0,0),(31,'阜阳',0,1367830578,'F',NULL,NULL,0,0),(32,'抚州',0,1367830590,'F',NULL,NULL,0,0),(33,'广州',0,1367830602,'G',NULL,NULL,1,0),(34,'贵阳',0,1367830612,'G',NULL,NULL,0,0),(35,'桂林',0,1367830622,'G',NULL,NULL,0,0),(36,'赣州',0,1367830635,'G',NULL,NULL,0,0),(37,'广元',0,1367830646,'G',NULL,NULL,0,0),(38,'杭州',0,1367830659,'H',NULL,NULL,1,0),(39,'哈尔滨',0,1367830670,'H',NULL,NULL,0,0),(40,'合肥',0,1367830683,'H',NULL,NULL,0,0),(41,'邯郸',0,1367830694,'H',NULL,NULL,0,0),(42,'惠州',0,1367830706,'H',NULL,NULL,0,0),(43,'济南',0,1367830720,'J',NULL,NULL,1,0),(44,'济宁',0,1367830732,'J',NULL,NULL,0,0),(45,'嘉兴',0,1367830769,'J',NULL,NULL,0,0),(46,'昆明',0,1367830783,'K',NULL,NULL,0,0),(47,'昆山',0,1367830792,'K',NULL,NULL,0,0),(48,'喀什',0,1367830803,'K',NULL,NULL,0,0),(49,'克拉玛依',0,1367830814,'K',NULL,NULL,0,0),(50,'兰州',0,1367830827,'L',NULL,NULL,0,0),(51,'临沂',0,1367830836,'L',NULL,NULL,0,0),(52,'连云港',0,1367830846,'L',NULL,NULL,0,0),(53,'马鞍山',0,1367830858,'M',NULL,NULL,0,0),(54,'绵阳',0,1367830867,'M',NULL,NULL,0,0),(55,'茂名',0,1367830878,'M',NULL,NULL,0,0),(56,'南京',0,1367830891,'N',NULL,NULL,1,0),(57,'宁波',0,1367830902,'N',NULL,NULL,0,0),(58,'南通',0,1367830914,'N',NULL,NULL,0,0),(59,'萍乡',0,1367830930,'P',NULL,NULL,0,0),(60,'平顶山',0,1367830940,'P',NULL,NULL,0,0),(61,'莆田',0,1367830951,'P',NULL,NULL,0,0),(62,'青岛',0,1367830963,'Q',NULL,NULL,1,0),(63,'泉州',0,1367830973,'Q',NULL,NULL,0,0),(64,'秦皇岛',0,1367830983,'Q',NULL,NULL,0,0),(65,'日照',0,1367830998,'R',NULL,NULL,0,0),(66,'日喀则',0,1367831009,'R',NULL,NULL,0,0),(67,'上海',0,1367831021,'S',NULL,NULL,1,0),(68,'深圳',0,1367831032,'S',NULL,NULL,0,0),(69,'沈阳',0,1367831042,'S',NULL,NULL,0,0),(70,'太原',0,1367831057,'T',NULL,NULL,1,0),(71,'泰安',0,1367831068,'T',NULL,NULL,0,0),(72,'武汉',0,1367831089,'W',NULL,NULL,0,0),(73,'无锡',0,1367831100,'W',NULL,NULL,0,0),(74,'温州',0,1367831112,'W',NULL,NULL,0,0),(75,'西安',0,1367831123,'X',NULL,NULL,0,0),(76,'西安',0,1367831133,'X',NULL,NULL,0,0),(77,'徐州',0,1367831146,'X',NULL,NULL,0,0),(78,'扬州',0,1367831158,'Y',NULL,NULL,0,0),(79,'烟台',0,1367831168,'Y',NULL,NULL,0,0),(80,'盐城',0,1367831180,'Y',NULL,NULL,0,0),(81,'郑州',0,1367831190,'Z',NULL,NULL,0,0),(82,'镇江',0,1367831200,'Z',NULL,NULL,0,0),(83,'中山',0,1367831213,'Z',NULL,NULL,0,0),(84,'阿里',0,1376357672,'A','','0',0,0),(85,'安康',0,1367889614,'A',NULL,NULL,0,0),(86,'阿克苏',0,1367889622,'A',NULL,NULL,0,0),(87,'安庆',0,1367889629,'A',NULL,NULL,0,0),(88,'阿勒泰',0,1367889638,'A',NULL,NULL,0,0),(89,'安阳',0,1367889646,'A',NULL,NULL,0,0),(90,'澳门',0,1367889653,'A',NULL,NULL,0,0),(91,'巴州',0,1367889663,'B',NULL,NULL,0,0),(92,'亳州',0,1367889677,'B',NULL,NULL,0,0),(93,'滨州',0,1367889687,'B',NULL,NULL,0,0),(94,'博尔塔拉',0,1367889697,'B',NULL,NULL,0,0),(95,'毕节',0,1367889707,'B',NULL,NULL,0,0),(96,'保山',0,1367889719,'B',NULL,NULL,0,0),(97,'本溪',0,1367889728,'B',NULL,NULL,0,0),(98,'百色',0,1367889738,'B',NULL,NULL,0,0),(99,'宝鸡',0,1367889748,'B',NULL,NULL,0,0),(100,'巴彦淖尔',0,1367889757,'B',NULL,NULL,0,0),(101,'北海',0,1367889766,'B',NULL,NULL,0,0),(102,'北海',0,1367889775,'B',NULL,NULL,0,0),(103,'白城',0,1367889785,'B',NULL,NULL,0,0),(104,'白银',0,1367889797,'B',NULL,NULL,0,0),(105,'承德',0,1367889808,'C',NULL,NULL,0,0),(106,'池州',0,1367889817,'C',NULL,NULL,0,0),(107,'昌都',0,1367889826,'C',NULL,NULL,0,0),(108,'朝阳',0,1367889834,'C',NULL,NULL,0,0),(109,'滁州',0,1367889845,'C',NULL,NULL,0,0),(110,'常德',0,1367889856,'C',NULL,NULL,0,0),(111,'郴州',0,1367889865,'C',NULL,NULL,0,0),(112,'沧州',0,1367889875,'C',NULL,NULL,0,0),(113,'昌吉',0,1367889885,'C',NULL,NULL,0,0),(114,'潮州',0,1367889895,'C',NULL,NULL,0,0),(115,'崇左',0,1367889906,'C',NULL,NULL,0,0),(116,'巢湖',0,1367889915,'C',NULL,NULL,0,0),(117,'长治',0,1367889924,'C',NULL,NULL,0,0),(118,'楚雄',0,1367889936,'C',NULL,NULL,0,0),(119,'赤峰',0,1367889945,'C',NULL,NULL,0,0),(120,'定西',0,1367889956,'D',NULL,NULL,0,0),(121,'德宏',0,1367889965,'D',NULL,NULL,0,0),(122,'大兴安岭',0,1367889974,'D',NULL,NULL,0,0),(123,'丹东',0,1367889983,'D',NULL,NULL,0,0),(124,'德州',0,1367889992,'D',NULL,NULL,0,0),(125,'达州',0,1367890002,'D',NULL,NULL,0,0),(126,'迪庆',0,1367890012,'D',NULL,NULL,0,0),(127,'德阳',0,1367890022,'D',NULL,NULL,0,0),(128,'大理',0,1367890031,'D',NULL,NULL,0,0),(129,'阜新',0,1367890041,'E',NULL,NULL,0,0),(130,'防城港',0,1367890050,'E',NULL,NULL,0,0),(131,'抚州',0,1367890059,'E',NULL,NULL,0,0),(132,'阜阳',0,1367890088,'F',NULL,NULL,0,0),(133,'贵港',0,1367890101,'G',NULL,NULL,0,0),(134,'广安',0,1367890120,'G',NULL,NULL,0,0),(135,'甘孜',0,1367890130,'G',NULL,NULL,0,0),(136,'甘南',0,1367890139,'G',NULL,NULL,0,0),(137,'固原',0,1367890148,'G',NULL,NULL,0,0),(138,'果洛',0,1367890157,'G',NULL,NULL,0,0),(139,'广元',0,1367890172,'G',NULL,NULL,0,0),(140,'葫芦岛',0,1367890183,'H',NULL,NULL,0,0),(141,'鹤壁',0,1367890192,'H',NULL,NULL,0,0),(142,'黄石',0,1367890203,'G',NULL,NULL,0,0),(143,'黄冈',0,1367890214,'H',NULL,NULL,0,0),(144,'汉中',0,1367890224,'H',NULL,NULL,0,0),(145,'红河',0,1367890233,'H',NULL,NULL,0,0),(146,'河源',0,1367890243,'H',NULL,NULL,0,0),(147,'衡水',0,1367890253,'H',NULL,NULL,0,0),(148,'呼伦贝尔',0,1367890265,'H',NULL,NULL,0,0),(149,'河池',0,1367890275,'H',NULL,NULL,0,0),(150,'怀化',0,1367890284,'H',NULL,NULL,0,0),(151,'贺州',0,1367890294,'H',NULL,NULL,0,0),(152,'海西',0,1367890304,'H',NULL,NULL,0,0),(153,'黄山',0,1367890314,'H',NULL,NULL,0,0),(154,'淮南',0,1367890327,'H',NULL,NULL,0,0),(155,'淮安',0,1367890337,'H',NULL,NULL,0,0),(156,'哈密',0,1367890346,'H',NULL,NULL,0,0),(157,'和田',0,1367890355,'H',NULL,NULL,0,0),(158,'黑河',0,1367890367,'H',NULL,NULL,0,0),(159,'九江',0,1367890378,'J',NULL,NULL,0,0),(160,'荆门',0,1367890386,'J',NULL,NULL,0,0),(161,'晋中',0,1367890396,'J',NULL,NULL,0,0),(162,'揭阳',0,1367890406,'J',NULL,NULL,0,0),(163,'晋城',0,1367890421,'J',NULL,NULL,0,0),(164,'济源',0,1367890431,'J',NULL,NULL,0,0),(165,'鸡西',0,1367890440,'J',NULL,NULL,0,0),(166,'金昌',0,1367890448,'J',NULL,NULL,0,0),(167,'酒泉',0,1367890459,'J',NULL,NULL,0,0),(168,'佳木斯',0,1367890468,'J',NULL,NULL,0,0),(169,'吉安',0,1367890484,'J',NULL,NULL,0,0),(170,'景德镇',0,1367890496,'J',NULL,NULL,0,0),(171,'江门',0,1367890505,'J',NULL,NULL,0,0),(172,'锦州',0,1367890515,'J',NULL,NULL,0,0),(173,'吉林',0,1367890524,'J',NULL,NULL,0,0),(174,'荆州',0,1367890533,'J',NULL,NULL,0,0),(175,'克州',0,1367890545,'K',NULL,NULL,0,0),(176,'开封',0,1367890554,'K',NULL,NULL,0,0),(177,'乐山',0,1367890567,'L',NULL,NULL,0,0),(178,'泸州',0,1367890576,'L',NULL,NULL,0,0),(179,'来宾',0,1367890585,'L',NULL,NULL,0,0),(180,'娄底',0,1367890596,'L',NULL,NULL,0,0),(181,'林芝',0,1367890606,'L',NULL,NULL,0,0),(182,'临夏',0,1367890615,'L',NULL,NULL,0,0),(183,'丽水',0,1367890623,'L',NULL,NULL,0,0),(184,'吕梁',0,1367890633,'L',NULL,NULL,0,0),(185,'漯河',0,1367890642,'L',NULL,NULL,0,0),(186,'莱芜',0,1367890652,'L',NULL,NULL,0,0),(187,'辽阳',0,1367890661,'L',NULL,NULL,0,0),(188,'辽源',0,1367890672,'L',NULL,NULL,0,0),(189,'拉萨',0,1367890681,'L',NULL,NULL,0,0),(190,'陇南',0,1367890693,'L',NULL,NULL,0,0),(191,'临沧',0,1367890701,'L',NULL,NULL,0,0),(192,'丽江',0,1367890712,'L',NULL,NULL,0,0),(193,'六安',0,1367890721,'L',NULL,NULL,0,0),(194,'凉山',0,1367890730,'L',NULL,NULL,0,0),(195,'六盘水',0,1367890739,'L',NULL,NULL,0,0),(196,'龙岩',0,1367890749,'L',NULL,NULL,0,0),(197,'廊坊',0,1367890758,'L',NULL,NULL,0,0),(198,'眉山',0,1367890772,'M',NULL,NULL,0,0),(199,'梅州',0,1367890781,'M',NULL,NULL,0,0),(200,'牡丹江',0,1367890791,'M',NULL,NULL,0,0),(201,'那曲',0,1367890800,'N',NULL,NULL,0,0),(202,'南阳',0,1367890810,'N',NULL,NULL,0,0),(203,'南平',0,1367890819,'N',NULL,NULL,0,0),(204,'怒江',0,1367890828,'N',NULL,NULL,0,0),(205,'内江',0,1367890837,'N',NULL,NULL,0,0),(206,'宁德',0,1367890845,'N',NULL,NULL,0,0),(207,'南充',0,1367890854,'N',NULL,NULL,0,0),(208,'南昌',0,1367890863,'N',NULL,NULL,0,0),(209,'盘锦',0,1367890872,'P',NULL,NULL,0,0),(210,'普洱',0,1367890884,'P',NULL,NULL,0,0),(211,'平凉',0,1367890894,'P',NULL,NULL,0,0),(212,'攀枝花',0,1367890907,'P',NULL,NULL,0,0),(213,'濮阳',0,1367890915,'P',NULL,NULL,0,0),(214,'清远',0,1367890927,'Q',NULL,NULL,0,0),(215,'七台河',0,1367890937,'Q',NULL,NULL,0,0),(216,'黔东南',0,1367890946,'Q',NULL,NULL,0,0),(217,'曲靖',0,1367890960,'Q',NULL,NULL,0,0),(218,'黔南',0,1367890978,'Q',NULL,NULL,0,0),(219,'钦州',0,1367890986,'Q',NULL,NULL,0,0),(220,'黔西南',0,1367890995,'Q',NULL,NULL,0,0),(221,'衢州',0,1367891003,'Q',NULL,NULL,0,0),(222,'商洛',0,1367891022,'S',NULL,NULL,0,0),(223,'宿州',0,1367891034,'S',NULL,NULL,0,0),(224,'汕头',0,1367891044,'S',NULL,NULL,0,0),(225,'双鸭山',0,1367891053,'S',NULL,NULL,0,0),(226,'石嘴山',0,1367891063,'S',NULL,NULL,0,0),(227,'三明',0,1367891071,'S',NULL,NULL,0,0),(228,'宿迁',0,1367891080,'S',NULL,NULL,0,0),(229,'三峡',0,1367891089,'S',NULL,NULL,0,0),(230,'四平',0,1367891098,'S',NULL,NULL,0,0),(231,'汕尾',0,1367891107,'S',NULL,NULL,0,0),(232,'随州',0,1367891116,'S',NULL,NULL,0,0),(233,'朔州',0,1367891125,'S',NULL,NULL,0,0),(234,'商丘',0,1367891135,'S',NULL,NULL,0,0),(235,'遂宁',0,1367891144,'S',NULL,NULL,0,0),(236,'邵阳',0,1367891153,'S',NULL,NULL,0,0),(237,'山南',0,1367891161,'S',NULL,NULL,0,0),(238,'三门峡',0,1367891172,'S',NULL,NULL,0,0),(239,'十堰',0,1367891181,'S',NULL,NULL,0,0),(240,'上饶',0,1367891190,'S',NULL,NULL,0,0),(241,'松原',0,1367891199,'S',NULL,NULL,0,0),(242,'绥化',0,1367891208,'S',NULL,NULL,0,0),(243,'韶关',0,1367891218,'S',NULL,NULL,0,0),(244,'通化',0,1367891228,'T',NULL,NULL,0,0),(245,'铁岭',0,1367891236,'T',NULL,NULL,0,0),(246,'通辽',0,1367891246,'T',NULL,NULL,0,0),(247,'天水',0,1367891255,'T',NULL,NULL,0,0),(248,'吐鲁番',0,1367891264,'T',NULL,NULL,0,0),(249,'铜仁',0,1367891274,'T',NULL,NULL,0,0),(250,'台北',0,1367891282,'T',NULL,NULL,0,0),(251,'铜川',0,1367891291,'T',NULL,NULL,0,0),(252,'铜陵',0,1367891299,'T',NULL,NULL,0,0),(253,'塔城',0,1367891307,'T',NULL,NULL,0,0),(254,'泰州',0,1367891316,'T',NULL,NULL,0,0),(255,'乌海',0,1367891328,'W',NULL,NULL,0,0),(256,'文山',0,1367891345,'W',NULL,NULL,0,0),(257,'乌兰察布',0,1367891352,'A',NULL,NULL,0,0),(258,'渭南',0,1367891361,'W',NULL,NULL,0,0),(259,'武威',0,1367891370,'W',NULL,NULL,0,0),(260,'吴忠',0,1367891380,'W',NULL,NULL,0,0),(261,'梧州',0,1367891389,'W',NULL,NULL,0,0),(262,'乌鲁木齐',0,1367891398,'W',NULL,NULL,0,0),(263,'潍坊',0,1367891407,'W',NULL,NULL,0,0),(264,'威海',0,1367891416,'W',NULL,NULL,0,0),(265,'芜湖',0,1367891426,'W',NULL,NULL,0,0),(266,'许昌',0,1367891436,'X',NULL,NULL,0,0),(267,'咸宁',0,1367891449,'X',NULL,NULL,0,0),(268,'信阳',0,1367891458,'X',NULL,NULL,0,0),(269,'香港',0,1367891466,'X',NULL,NULL,0,0),(270,'宣城',0,1367891475,'X',NULL,NULL,0,0),(271,'咸阳',0,1367891485,'X',NULL,NULL,0,0),(272,'忻州',0,1367891496,'X',NULL,NULL,0,0),(273,'湘西',0,1367891520,'X',NULL,NULL,0,0),(274,'新乡',0,1367891532,'X',NULL,NULL,0,0),(275,'邢台',0,1367891541,'X',NULL,NULL,0,0),(276,'兴安',0,1367891550,'X',NULL,NULL,0,0),(277,'锡林郭勒',0,1367891560,'X',NULL,NULL,0,0),(278,'湘潭',0,1367891568,'X',NULL,NULL,0,0),(279,'新余',0,1367891578,'X',NULL,NULL,0,0),(280,'西双版纳',0,1367891588,'X',NULL,NULL,0,0),(281,'孝感',0,1367891600,'X',NULL,NULL,0,0),(282,'伊春',0,1367891610,'Y',NULL,NULL,0,0),(283,'阳江',0,1367891619,'Y',NULL,NULL,0,0),(284,'延边',0,1367891632,'Y',NULL,NULL,0,0),(285,'云浮',0,1367891643,'Y',NULL,NULL,0,0),(286,'榆林',0,1367891652,'Y',NULL,NULL,0,0),(287,'延安',0,1367891662,'Y',NULL,NULL,0,0),(288,'阳泉',0,1367891672,'Y',NULL,NULL,0,0),(289,'玉溪',0,1367891681,'Y',NULL,NULL,0,0),(290,'益阳',0,1367891690,'Y',NULL,NULL,0,0),(291,'宜宾',0,1367891699,'Y',NULL,NULL,0,0),(292,'永州',0,1367891708,'Y',NULL,NULL,0,0),(293,'营口',0,1367891719,'Y',NULL,NULL,0,0),(294,'宜春',0,1367891733,'Y',NULL,NULL,0,0),(295,'玉树',0,1367891742,'Y',NULL,NULL,0,0),(296,'伊犁',0,1367891752,'Y',NULL,NULL,0,0),(297,'雅安',0,1367891761,'Y',NULL,NULL,0,0),(298,'鹰潭',0,1367891770,'Y',NULL,NULL,0,0),(299,'银川',0,1367891780,'Y',NULL,NULL,0,0),(300,'枣庄',0,1367891790,'Z',NULL,NULL,0,0),(301,'中卫',0,1367891801,'Z',NULL,NULL,0,0),(302,'资阳',0,1367891810,'Z',NULL,NULL,0,0),(303,'张家口',0,1367891821,'Z',NULL,NULL,0,0),(304,'驻马店',0,1367891830,'Z',NULL,NULL,0,0),(305,'周口',0,1367891840,'Z',NULL,NULL,0,0),(306,'张家界',0,1367891849,'Z',NULL,NULL,0,0),(307,'昭通',0,1367891858,'Z',NULL,NULL,0,0),(308,'张掖',0,1367891866,'Z',NULL,NULL,0,0),(309,'肇庆',0,1367891878,'Z',NULL,NULL,0,0),(310,'湛江',0,1367891888,'Z',NULL,NULL,0,0),(314,'河西区',1,1367915137,'A',NULL,NULL,0,0),(315,'河东区',1,1367915221,'A',NULL,NULL,0,0),(316,'水游城',3,1367915892,'A',NULL,NULL,0,0),(317,'河北区',1,1367916777,'H',NULL,NULL,0,0),(318,'红桥区',1,1367916799,'H',NULL,NULL,0,0),(319,'滨海新区',1,1367916834,'B',NULL,NULL,0,0),(320,'老城厢/大悦城',3,1367916878,'L',NULL,NULL,0,0),(321,'白堤路/风荷园',3,1367916904,'B',NULL,NULL,0,0),(322,'王顶堤/华苑',3,1367916922,'A',NULL,NULL,0,0),(323,'水上/天塔',3,1367916942,'S',NULL,NULL,0,0),(324,'时代奥城',3,1367916960,'A',NULL,NULL,0,0),(325,'长虹公园',3,1367916985,'C',NULL,NULL,0,0),(326,'南开公园',3,1367917001,'A',NULL,NULL,0,0),(327,'南开大学/八里台',3,1367917020,'A',NULL,NULL,0,0),(328,'海光寺/六里台',3,1367917047,'A',NULL,NULL,0,0),(329,'天拖地区',3,1367917062,'A',NULL,NULL,0,0),(330,'鼓楼/七向街',3,1367917077,'A',NULL,NULL,0,0),(331,'鞍山西道',3,1367917100,'A',NULL,NULL,0,0),(332,'东马路/新世界百货',3,1367917114,'A',NULL,NULL,0,0),(333,'滨江道',5,1367917139,'A',NULL,NULL,0,1),(334,'和平路',5,1367917155,'A',NULL,NULL,0,0),(335,'小白楼',5,1367917169,'A',NULL,NULL,0,0),(336,'鞍山道沿线',5,1367917185,'A',NULL,NULL,0,0),(337,'南市',5,1367917201,'A',NULL,NULL,0,0),(338,'五大道',5,1367917216,'A',NULL,NULL,0,0),(339,'西康路沿线',5,1367917235,'A',NULL,NULL,0,0),(340,'津湾广场',5,1367917249,'A',NULL,NULL,0,0),(341,'荣业大街',5,1367917267,'A',NULL,NULL,0,0),(342,'土城',314,1367917309,'A',NULL,NULL,0,0),(343,'小海地',314,1367917326,'A',NULL,NULL,0,0),(344,'体院北',314,1367917341,'A',NULL,NULL,0,0),(345,'图书大厦',314,1367917357,'A',NULL,NULL,0,0),(346,'梅江',314,1367917373,'A',NULL,NULL,0,0),(347,'永安道',314,1367917388,'A',NULL,NULL,0,0),(348,'尖山',314,1367917401,'A',NULL,NULL,0,0),(349,'佟楼',314,1367917424,'A',NULL,NULL,0,0),(350,'乐园道',314,1367917440,'A',NULL,NULL,0,0),(351,'下瓦房',314,1367917457,'A',NULL,NULL,0,0),(352,'南楼',314,1367917471,'A',NULL,NULL,0,0),(353,'越秀路',314,1367917485,'A',NULL,NULL,0,0),(354,'天津站后广场',315,1367917503,'A',NULL,NULL,0,0),(355,'卫国道',315,1367917740,'A',NULL,NULL,0,0),(356,'二宫',3,1367917756,'A',NULL,NULL,0,0),(357,'河东万达广场',3,1367917775,'A',NULL,NULL,0,0),(358,'万新村',315,1367917791,'A',NULL,NULL,0,0),(359,'工业大学',315,1367917805,'A',NULL,NULL,0,0),(360,'大王庄',315,1367917819,'A',NULL,NULL,0,0),(361,'大直沽',315,1367917833,'A',NULL,NULL,0,0),(362,'中山门',315,1367917849,'A',NULL,NULL,0,0),(363,'金钟河大街',317,1367917874,'A',NULL,NULL,0,0),(364,'狮子林大街',317,1367917885,'A',NULL,NULL,0,0),(365,'天泰路/榆关道',317,1367917899,'A',NULL,NULL,0,0),(366,'意大利风情区/火车站',317,1367917913,'A',NULL,NULL,0,0),(367,'中山路',317,1367917924,'A',NULL,NULL,0,0),(368,'王串场/民权门',317,1367917939,'A',NULL,NULL,0,0),(369,'汉沽城区',319,1367917968,'A',NULL,NULL,0,0),(370,'大港城区',319,1367917982,'A',NULL,NULL,0,0),(371,'大港油田',319,1367917995,'A',NULL,NULL,0,0),(372,'经济开发区',319,1367918007,'A',NULL,NULL,0,0),(373,'塘沽城区',319,1367918020,'A',NULL,NULL,0,0),(374,'大胡同',318,1367918039,'A',NULL,NULL,0,0),(375,'天津西站',318,1367918053,'A',NULL,NULL,0,0),(376,'创意街/水木天成',318,1367918065,'A',NULL,NULL,0,0),(377,'凯莱赛',318,1367918077,'A',NULL,NULL,0,0),(378,'本溪路/丁字沽',318,1367918094,'A',NULL,NULL,0,0),(379,'芥园道/水游城',318,1367918107,'A',NULL,NULL,0,0),(380,'东城区',2,1367978117,'A',NULL,NULL,0,0),(381,'西城区',2,1367978125,'A',NULL,NULL,0,0);
/*!40000 ALTER TABLE `pmall_vr_groupbuy_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_groupbuy_class`
--

DROP TABLE IF EXISTS `pmall_vr_groupbuy_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_groupbuy_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `class_name` varchar(100) NOT NULL COMMENT '分类名称',
  `parent_class_id` int(11) NOT NULL COMMENT '父类class_id',
  `class_sort` tinyint(3) unsigned DEFAULT NULL COMMENT '分类排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='虚拟团购分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_groupbuy_class`
--

LOCK TABLES `pmall_vr_groupbuy_class` WRITE;
/*!40000 ALTER TABLE `pmall_vr_groupbuy_class` DISABLE KEYS */;
INSERT INTO `pmall_vr_groupbuy_class` VALUES (2,'餐饮美食',0,2),(3,'休闲娱乐',0,2),(7,'生活服务',0,3),(8,'小吃快餐',2,1),(9,'火锅',2,2),(10,'自助餐',2,3),(12,'川菜',2,5),(13,'甜品饮品',2,6),(14,'日本料理',2,7),(15,'韩国料理',2,8),(16,'主题餐厅',2,9),(17,'KTV',3,1),(18,'酒吧',3,2),(19,'电影院',3,3),(20,'公园景点',3,4),(21,'足浴按摩',3,5),(22,'运动健身',3,6),(23,'瑜伽馆',3,7),(24,'书店',3,8),(25,'电玩',3,9),(26,'电影演出',0,4),(27,'商场超市',0,5),(29,'婚庆摄像',7,1),(30,'母婴服务',7,2),(31,'银行',7,3),(32,'搬家',7,4),(33,'维修',7,5),(34,'家政保姆',7,6),(35,'开锁',7,7),(36,'宠物服务',7,8),(37,'洗衣店',7,9),(38,'电子通票',26,1),(39,'帮你代购',26,2),(40,'万达院线',26,3),(41,'金逸院线',26,4),(42,'嘉禾院线',26,5),(43,'博纳院线',26,6),(44,'UME院线',26,7),(45,'中影国际',26,8),(46,'耀莱国际',26,9),(47,'物美超市',27,1),(48,'超市卡',27,2),(49,'商场卡',27,3),(50,'水果券',27,4),(51,'购物券',27,5),(52,'食品券',27,6),(53,'网店优惠券',27,7),(54,'新世界',27,8),(55,'银泰',27,9),(56,'新一佳',27,10),(69,'电子优惠',0,6),(74,'俏江南',69,1),(75,'哈根达斯',69,2),(76,'银泰百货',69,3),(77,'阳澄湖',69,4),(78,'许留山',69,5),(79,'酷圣石',69,6),(80,'克丽缇娜',69,7),(81,'一兆韦德',69,8),(82,'宝岛眼镜',69,9),(83,'金钱豹',69,10),(84,'摄像写真',0,7),(85,'婚纱摄影',84,1),(86,'儿童摄影',84,2),(87,'写真摄影',84,3),(88,'商品摄影',84,4),(89,'个人写真',84,5),(94,'教育培训',0,8),(95,'语言培训',94,1),(96,'中小学教育',94,2),(97,'少儿培训',94,3),(98,'公务员培训',94,4),(99,'学历教育',94,5),(100,'职业资格认证',94,6);
/*!40000 ALTER TABLE `pmall_vr_groupbuy_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_order`
--

DROP TABLE IF EXISTS `pmall_vr_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟订单索引id',
  `order_sn` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家登录名',
  `buyer_phone` varchar(11) NOT NULL COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL COMMENT '订单生成时间',
  `payment_code` char(10) DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `trade_no` varchar(35) DEFAULT NULL COMMENT '第三方平台交易号',
  `close_time` int(10) unsigned DEFAULT '0' COMMENT '关闭时间',
  `close_reason` varchar(50) DEFAULT NULL COMMENT '关闭原因',
  `finnshed_time` int(11) DEFAULT NULL COMMENT '完成时间',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格(支付金额)',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `order_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;40:已完成;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `buyer_msg` varchar(150) DEFAULT NULL COMMENT '买家留言',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态0未删除1放入回收站2彻底删除',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(9) DEFAULT '0' COMMENT '商品最底级分类ID',
  `vr_indate` int(11) DEFAULT NULL COMMENT '有效期',
  `vr_send_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '兑换码发送次数',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  `order_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单参加的促销类型 0无促销1团购',
  `promotions_id` mediumint(9) DEFAULT '0' COMMENT '促销ID，与order_promotion_type配合使用',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `evaluation_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评价状态0默认1已评价2禁止评价',
  `evaluation_time` int(11) NOT NULL DEFAULT '0' COMMENT '评价时间',
  `use_state` tinyint(4) DEFAULT '0' COMMENT '使用状态0默认，未使用1已使用，有一个被使用即为1',
  `api_pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线支付动作时间,只有站内+在线组合支付时记录',
  `goods_contractid` varchar(100) DEFAULT NULL COMMENT '商品开启的消费者保障服务id',
  `goods_spec` varchar(200) DEFAULT NULL COMMENT '规格',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='虚拟订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_order`
--

LOCK TABLES `pmall_vr_order` WRITE;
/*!40000 ALTER TABLE `pmall_vr_order` DISABLE KEYS */;
INSERT INTO `pmall_vr_order` VALUES (1,630521309550061002,2,'eshop2',2,'testuser','13560134399',1467965550,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(2,380521309553944002,2,'eshop2',2,'testuser','13560134399',1467965553,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(3,710521309554208002,2,'eshop2',2,'testuser','13560134399',1467965554,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(4,330521309554391002,2,'eshop2',2,'testuser','13560134399',1467965554,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(5,420521309554563002,2,'eshop2',2,'testuser','13560134399',1467965554,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(6,510521309554731002,2,'eshop2',2,'testuser','13560134399',1467965554,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(7,910521309554905002,2,'eshop2',2,'testuser','13560134399',1467965554,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(8,850521309555080002,2,'eshop2',2,'testuser','13560134399',1467965555,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL),(9,540521309555254002,2,'eshop2',2,'testuser','13560134399',1467965555,'',0,NULL,0,NULL,NULL,'480.00','0.00','0.00','0.00',10,0,'admin',0,100013,'拖拉塞米片','480.00',1,'2_05213079227148488.jpg',10,1060,1469980799,0,0,0,0,2,0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `pmall_vr_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_order_bill`
--

DROP TABLE IF EXISTS `pmall_vr_order_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_order_bill` (
  `ob_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键作为结算单号',
  `ob_no` int(11) DEFAULT '0' COMMENT '结算单编号(年月店铺ID)',
  `ob_start_date` int(11) NOT NULL COMMENT '开始日期',
  `ob_end_date` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_create_date` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `os_month` mediumint(6) unsigned DEFAULT NULL COMMENT '出账单应结时间,ob_end_date+1所在月(年月份)',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '1默认2店家已确认3平台已审核4结算完成',
  `ob_pay_date` int(11) DEFAULT '0' COMMENT '付款日期',
  `ob_pay_content` varchar(200) DEFAULT '' COMMENT '支付备注',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_order_bill`
--

LOCK TABLES `pmall_vr_order_bill` WRITE;
/*!40000 ALTER TABLE `pmall_vr_order_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_vr_order_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_order_code`
--

DROP TABLE IF EXISTS `pmall_vr_order_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_order_code` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码表索引id',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) DEFAULT NULL COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) DEFAULT NULL COMMENT '过期时间',
  `commis_rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `refund_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '退款锁定状态:0为正常,1为锁定,2为同意,默认为0',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1是0否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='兑换码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_order_code`
--

LOCK TABLES `pmall_vr_order_code` WRITE;
/*!40000 ALTER TABLE `pmall_vr_order_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_vr_order_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_order_snapshot`
--

DROP TABLE IF EXISTS `pmall_vr_order_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_order_snapshot` (
  `order_id` int(11) NOT NULL COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `create_time` int(11) NOT NULL COMMENT '生成时间',
  `goods_attr` text COMMENT '属性',
  `goods_body` text COMMENT '详情',
  `plate_top` text COMMENT '顶部关联版式',
  `plate_bottom` text COMMENT '底部关联版式',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单快照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_order_snapshot`
--

LOCK TABLES `pmall_vr_order_snapshot` WRITE;
/*!40000 ALTER TABLE `pmall_vr_order_snapshot` DISABLE KEYS */;
INSERT INTO `pmall_vr_order_snapshot` VALUES (1,100013,1467965550,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(2,100013,1467965553,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(3,100013,1467965554,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(4,100013,1467965554,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(5,100013,1467965554,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(6,100013,1467965554,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(7,100013,1467965554,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(8,100013,1467965555,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL),(9,100013,1467965555,'a:2:{s:6:\"货号\";s:0:\"\";s:6:\"品牌\";s:20:\"奥唯嘉（Ovega）\";}','拖拉塞米片',NULL,NULL);
/*!40000 ALTER TABLE `pmall_vr_order_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_order_statis`
--

DROP TABLE IF EXISTS `pmall_vr_order_statis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_order_statis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_year` smallint(6) DEFAULT '0' COMMENT '年',
  `os_start_date` int(11) NOT NULL COMMENT '开始日期',
  `os_end_date` int(11) NOT NULL COMMENT '结束日期',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_create_date` int(11) DEFAULT NULL COMMENT '创建记录日期',
  PRIMARY KEY (`os_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟订单月销量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_order_statis`
--

LOCK TABLES `pmall_vr_order_statis` WRITE;
/*!40000 ALTER TABLE `pmall_vr_order_statis` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_vr_order_statis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_refund`
--

DROP TABLE IF EXISTS `pmall_vr_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_refund` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '虚拟订单ID',
  `order_sn` varchar(50) NOT NULL COMMENT '虚拟订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '退款商品数量',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `code_sn` varchar(300) NOT NULL COMMENT '兑换码编号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `admin_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为待审核,2为同意,3为不同意,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间,默认为0',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '申请原因',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟兑码退款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_refund`
--

LOCK TABLES `pmall_vr_refund` WRITE;
/*!40000 ALTER TABLE `pmall_vr_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_vr_refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_vr_refund_detail`
--

DROP TABLE IF EXISTS `pmall_vr_refund_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_vr_refund_detail` (
  `refund_id` int(10) unsigned NOT NULL COMMENT '记录ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `batch_no` varchar(32) NOT NULL COMMENT '批次号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `pay_amount` decimal(10,2) DEFAULT '0.00' COMMENT '在线退款金额',
  `pd_amount` decimal(10,2) DEFAULT '0.00' COMMENT '预存款金额',
  `rcb_amount` decimal(10,2) DEFAULT '0.00' COMMENT '充值卡金额',
  `refund_code` char(10) NOT NULL DEFAULT 'predeposit' COMMENT '退款支付代码',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态:1为处理中,2为已完成,默认为1',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `pay_time` int(10) unsigned DEFAULT '0' COMMENT '在线退款完成时间,默认为0',
  PRIMARY KEY (`refund_id`),
  KEY `batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟兑码退款详细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_vr_refund_detail`
--

LOCK TABLES `pmall_vr_refund_detail` WRITE;
/*!40000 ALTER TABLE `pmall_vr_refund_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmall_vr_refund_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_waybill`
--

DROP TABLE IF EXISTS `pmall_waybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_waybill` (
  `waybill_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `waybill_name` varchar(50) NOT NULL,
  `waybill_image` varchar(50) NOT NULL,
  `waybill_width` int(10) unsigned NOT NULL COMMENT '宽度',
  `waybill_height` int(10) unsigned NOT NULL COMMENT '高度',
  `waybill_data` varchar(2000) DEFAULT NULL COMMENT '打印位置数据',
  `waybill_usable` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `waybill_top` int(11) NOT NULL DEFAULT '0' COMMENT '上偏移量',
  `waybill_left` int(11) NOT NULL DEFAULT '0' COMMENT '左偏移量',
  `express_id` tinyint(1) unsigned NOT NULL COMMENT '快递公司编号',
  `express_name` varchar(50) NOT NULL COMMENT '快递公司名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺编号(0-代表系统模板)',
  PRIMARY KEY (`waybill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='快递单打印模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_waybill`
--

LOCK TABLES `pmall_waybill` WRITE;
/*!40000 ALTER TABLE `pmall_waybill` DISABLE KEYS */;
INSERT INTO `pmall_waybill` VALUES (1,'百世汇通','04558238732336424.jpg',229,126,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"485\";s:3:\"top\";s:2:\"97\";s:5:\"width\";s:2:\"88\";s:6:\"height\";s:2:\"24\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"423\";s:3:\"top\";s:3:\"173\";s:5:\"width\";s:3:\"256\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"420\";s:3:\"top\";s:3:\"201\";s:5:\"width\";s:3:\"333\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"473\";s:3:\"top\";s:3:\"230\";s:5:\"width\";s:3:\"141\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"671\";s:3:\"top\";s:3:\"227\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"126\";s:3:\"top\";s:2:\"98\";s:5:\"width\";s:3:\"112\";s:6:\"height\";s:2:\"16\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"72\";s:3:\"top\";s:3:\"174\";s:5:\"width\";s:3:\"227\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"68\";s:3:\"top\";s:3:\"204\";s:5:\"width\";s:3:\"294\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"120\";s:3:\"top\";s:3:\"231\";s:5:\"width\";s:3:\"124\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"116\";s:3:\"top\";s:3:\"124\";s:5:\"width\";s:3:\"184\";s:6:\"height\";s:2:\"20\";}}',1,-3,-5,16,'汇通快递',0),(2,'申通','04559833067248352.jpg',229,127,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"497\";s:3:\"top\";s:2:\"99\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"492\";s:3:\"top\";s:3:\"165\";s:5:\"width\";s:3:\"191\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"426\";s:3:\"top\";s:3:\"200\";s:5:\"width\";s:3:\"322\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"551\";s:3:\"top\";s:3:\"235\";s:5:\"width\";s:3:\"122\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"688\";s:3:\"top\";s:3:\"236\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"132\";s:3:\"top\";s:3:\"100\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"125\";s:3:\"top\";s:3:\"169\";s:5:\"width\";s:3:\"218\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"68\";s:3:\"top\";s:3:\"208\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"171\";s:3:\"top\";s:3:\"238\";s:5:\"width\";s:3:\"159\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"140\";s:3:\"top\";s:3:\"136\";s:5:\"width\";s:3:\"217\";s:6:\"height\";s:2:\"20\";}}',1,-3,-5,28,'申通快递',0),(3,'顺风','04559894766651678.jpg',216,139,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"302\";s:3:\"top\";s:3:\"290\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"101\";s:3:\"top\";s:3:\"317\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:12:\"buyer_mobile\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"buyer_phone\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"seller_name\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:11:\"seller_area\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:14:\"seller_address\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:12:\"seller_phone\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}s:14:\"seller_company\";a:4:{s:4:\"left\";s:1:\"0\";s:3:\"top\";s:1:\"0\";s:5:\"width\";s:1:\"0\";s:6:\"height\";s:1:\"0\";}}',1,-4,-5,29,'顺丰快递',0),(4,'圆通速递','04577145745163834.jpg',229,127,'a:10:{s:10:\"buyer_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"471\";s:3:\"top\";s:3:\"105\";s:5:\"width\";s:3:\"179\";s:6:\"height\";s:2:\"20\";}s:10:\"buyer_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"469\";s:3:\"top\";s:3:\"144\";s:5:\"width\";s:3:\"242\";s:6:\"height\";s:2:\"20\";}s:13:\"buyer_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"419\";s:3:\"top\";s:3:\"173\";s:5:\"width\";s:3:\"343\";s:6:\"height\";s:2:\"20\";}s:12:\"buyer_mobile\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"507\";s:3:\"top\";s:3:\"201\";s:5:\"width\";s:2:\"93\";s:6:\"height\";s:2:\"20\";}s:11:\"buyer_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"613\";s:3:\"top\";s:3:\"198\";s:5:\"width\";s:3:\"109\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_name\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"116\";s:3:\"top\";s:3:\"104\";s:5:\"width\";s:3:\"100\";s:6:\"height\";s:2:\"20\";}s:11:\"seller_area\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"110\";s:3:\"top\";s:3:\"144\";s:5:\"width\";s:3:\"148\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_address\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:2:\"63\";s:3:\"top\";s:3:\"169\";s:5:\"width\";s:3:\"323\";s:6:\"height\";s:2:\"20\";}s:12:\"seller_phone\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"151\";s:3:\"top\";s:3:\"195\";s:5:\"width\";s:3:\"139\";s:6:\"height\";s:2:\"20\";}s:14:\"seller_company\";a:5:{s:5:\"check\";s:2:\"on\";s:4:\"left\";s:3:\"109\";s:3:\"top\";s:3:\"123\";s:5:\"width\";s:3:\"271\";s:6:\"height\";s:2:\"12\";}}',1,-3,-5,40,'圆通快递',0),(5,'test','05209674023314802.jpg',1,2,NULL,1,0,0,15,'共速达',1);
/*!40000 ALTER TABLE `pmall_waybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_web`
--

DROP TABLE IF EXISTS `pmall_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_web` (
  `web_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `web_name` varchar(20) DEFAULT '' COMMENT '模块名称',
  `style_name` varchar(20) DEFAULT 'orange' COMMENT '风格名称',
  `web_page` varchar(10) DEFAULT 'index' COMMENT '所在页面(暂时只有index)',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `web_sort` tinyint(1) unsigned DEFAULT '9' COMMENT '排序',
  `web_show` tinyint(1) unsigned DEFAULT '1' COMMENT '是否显示，0为否，1为是，默认为1',
  `web_html` text COMMENT '模块html代码',
  PRIMARY KEY (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COMMENT='页面模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_web`
--

LOCK TABLES `pmall_web` WRITE;
/*!40000 ALTER TABLE `pmall_web` DISABLE KEYS */;
INSERT INTO `pmall_web` VALUES (1,'红色','red','index',1449242303,1,0,NULL),(2,'女装/男装/内衣','pink','index',1467600405,1,1,'<div class=\"home-standard-layout style-pink\"><div class=\"left-sidebar\"><div class=\"title\">                   <a class=\"wwisp ds\"  href=\"\" ref=\"1F\" title=\"家电/数码/手机\">1F&nbsp;&nbsp;&nbsp;家电/数码/手机<i></i></a>    </div>   <!-- 推荐分类列表 --><ul class=\"links\"><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=108\" mff=\"sqde\" target=\"_blank\"  class=\"on\">正装鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=16\" mff=\"sqde\" target=\"_blank\" >卫衣</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=110\" mff=\"sqde\" target=\"_blank\" >凉鞋／沙滩鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=19\" mff=\"sqde\" target=\"_blank\"  class=\"on\">半身裙</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=24\" mff=\"sqde\" target=\"_blank\" >西服</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=26\" mff=\"sqde\" target=\"_blank\" >风衣</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=27\" mff=\"sqde\" target=\"_blank\"  class=\"on\">大衣</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=29\" mff=\"sqde\" target=\"_blank\" >棉服</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=31\" mff=\"sqde\" target=\"_blank\" >孕妇装</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=32\" mff=\"sqde\" target=\"_blank\" >大码装</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=33\" mff=\"sqde\" target=\"_blank\" >中老年装</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=107\" mff=\"sqde\" target=\"_blank\" >商务休闲鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=109\" mff=\"sqde\" target=\"_blank\" >休闲鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=111\" mff=\"sqde\" target=\"_blank\" >男靴</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=112\" mff=\"sqde\" target=\"_blank\" >功能鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=113\" mff=\"sqde\" target=\"_blank\" >拖鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=114\" mff=\"sqde\" target=\"_blank\" >传统布鞋</a></li><li><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=search&op=index&cate_id=116\" mff=\"sqde\" target=\"_blank\" >帆布鞋</a></li></ul><div class=\"bridge\"><ul> </ul><div class=\"img-box\"><a href=\"\" title=\"出游服装五折起\" target=\"_blank\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-23.jpg?761\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"出游服装五折起\" /></a></div></div>  </div>    <div class=\"middle-layout\"> <ul class=\"tabs-nav\">         <li class=\"tabs-selected\"><i class=\"arrow\"></i><h3>智能电视</h3></li>         <li class=\"\"><i class=\"arrow\"></i><h3>劳力士表</h3></li>    </ul><div class=\"right-side-focus\"><ul> <li><a href=\"\" title=\"\" target=\"_blank\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-28-1.jpg?493\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" width=\"349\" height=\"488\" /></a></li><li><a href=\"\" title=\"\" target=\"_blank\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-28-2.jpg?682\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" width=\"349\" height=\"488\" /></a></li></ul></div><div class=\"tabs-panel middle-banner-style01 fade-img \"><ul class=\"shopwwi-panel-r\"><li class=\"item tall\"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-11.jpg?585\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" alt=\"\"></a> </li><li class=\"item tall\"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-12.jpg?716\"   rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" alt=\"\"></a> </li><li class=\"item \"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-21.jpg?298\" mff=\"sqde\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" alt=\"\"></a> </li><li class=\"item bm\"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\"  shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-24.jpg?592\"   rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" alt=\"\"></a> </li><li class=\"item bm\"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-31.jpg?742\"   rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" alt=\"\"></a> </li><li class=\"item bm\"><div class=\"title\"><a href=\"\" target=\"_blank\"></a></div><p></p> <a href=\"\" class=\"pic\" target=\"_blank\"><img width=\"170\" height=\"170\" mff=\"sqde\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-2-25-1-32.jpg?651\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"   alt=\"\"></a> </li></ul></div>  <div class=\"tabs-panel middle-goods-list tabs-hide\"> <ul>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" title=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\">	劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627871532105_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\" /></a></dd> <dd class=\"goods-price\"><em>10.05万</em><span class=\"original\">10.05万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" title=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\">	劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627843241680_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\" /></a></dd> <dd class=\"goods-price\"><em>6.59万</em><span class=\"original\">6.59万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" title=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\">	劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627799921979_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\" /></a></dd> <dd class=\"goods-price\"><em>9.78万</em><span class=\"original\">9.78万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" title=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\">	劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627707766698_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\" /></a></dd> <dd class=\"goods-price\"><em>8.75万</em><span class=\"original\">8.75万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" title=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\">	劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627750479728_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\" /></a></dd> <dd class=\"goods-price\"><em>6.32万</em><span class=\"original\">6.32万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" title=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\">	劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627769865296_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\" /></a></dd> <dd class=\"goods-price\"><em>8.92万</em><span class=\"original\">8.92万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" title=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\">	劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627678636481_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\" /></a></dd> <dd class=\"goods-price\"><em>7.00万</em><span class=\"original\">7.00万</span></dd> </dl> </li>  <li> <dl><dt class=\"goods-name\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" title=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\">	劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593</a></dt> <dd class=\"goods-thumb\"><a target=\"_blank\" href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627900055146_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\"  alt=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\" /></a></dd> <dd class=\"goods-price\"><em>14.63万</em><span class=\"original\">14.63万</span></dd> </dl> </li> </ul> </div>                   </div> </div><ul class=\"shopwwi-brand clearfix\">        <li class=\"item1\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=104\" target=\"_blank\" title=\"esprit\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398090828687339_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item2\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=103\" target=\"_blank\" title=\"ELLE HOME\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398090611386532_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item3\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=102\" target=\"_blank\" title=\"她他/tata\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398090459092275_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item4\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=99\" target=\"_blank\" title=\"梦特娇\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398089942879365_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item5\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=96\" target=\"_blank\" title=\"佐丹奴\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398089412399747_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item6\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=90\" target=\"_blank\" title=\"金利来\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04397473042647991_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item7\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=84\" target=\"_blank\" title=\"阿迪达斯\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04397471910652190_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item8\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=85\" target=\"_blank\" title=\"猫人\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04397472152849925_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item9\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=79\" target=\"_blank\" title=\"justyle\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04397468710494742_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>       <li class=\"item10\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=brand&op=list&brand=116\" target=\"_blank\" title=\"Dior\"><img alt=\"\" shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/brand/04398099738566948_sm.jpg\" rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" ></a></li>    </ul>'),(3,'橘色','orange','index',1449242303,2,0,NULL),(4,'绿色','green','index',1449242303,3,0,NULL),(5,'蓝色','blue','index',1449242303,4,0,NULL),(6,'紫色','purple','index',1449242303,6,0,NULL),(7,'褐色','brown','index',1449242303,7,0,NULL),(8,'默认','default','index',1449242303,8,0,NULL),(101,'首页头部焦点图片','orange','index_pic',1467600405,100,1,'<ul id=\"fullScreenSlides\" class=\"full-screen-slides\">  <li style=\"background: #2D080F url(\'http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-101-1.jpg?454\') no-repeat center top\"><a href=\"\" target=\"_blank\" title=\"冬季名品-大牌季节日\">&nbsp;</a></li>  <li style=\"background: #F6BB3D url(\'http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-101-5.jpg?166\') no-repeat center top\"><a href=\"\" target=\"_blank\" title=\"全套茶具专场-年终盛典\">&nbsp;</a></li>  <li style=\"background: #36142C url(\'http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-101-2.jpg?331\') no-repeat center top\"><a href=\"\" target=\"_blank\" title=\"女人再忙也要留一天为自己疯抢\">&nbsp;</a></li>  <li style=\"background: #f2f2f2 url(\'http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-101-3.jpg?249\') no-repeat center top\"><a href=\"\" target=\"_blank\" title=\"全年爆款-年底清仓\">&nbsp;</a></li>  <li style=\"background: #ECBCB0 url(\'http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-101-4.jpg?250\') no-repeat center top\"><a href=\"\" target=\"_blank\" title=\"清仓年末特优-满99元包邮\">&nbsp;</a></li></ul><div class=\"wwi-new-slide ds\"><div class=\"jfocus-trigeminy\"><ul>  <li> <a href=\"\" target=\"_blank\" title=\"佳节大献礼-茶满中秋\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-1-1.jpg?842\" alt=\"佳节大献礼-茶满中秋\"></a> <a href=\"\" target=\"_blank\" title=\"孩子喜欢-遥控悍马\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-1-2.jpg?143\" alt=\"孩子喜欢-遥控悍马\"></a> <a href=\"\" target=\"_blank\" title=\"天气凉了-情侣家居服\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-1-3.jpg?114\" alt=\"天气凉了-情侣家居服\"></a> </li>  <li> <a href=\"\" target=\"_blank\" title=\"越中国越时尚-水晶中国风\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-2-1.jpg?824\" alt=\"越中国越时尚-水晶中国风\"></a> <a href=\"\" target=\"_blank\" title=\"领先全球首创-CoolTec冰爽剃须\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-2-2.jpg?851\" alt=\"领先全球首创-CoolTec冰爽剃须\"></a> <a href=\"\" target=\"_blank\" title=\"健康中的专家-欧姆龙血压计\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-2-3.jpg?734\" alt=\"健康中的专家-欧姆龙血压计\"></a> </li>  <li> <a href=\"\" target=\"_blank\" title=\"TOPTO秋季格调-衬衫促销季\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-3-1.jpg?191\" alt=\"TOPTO秋季格调-衬衫促销季\"></a> <a href=\"\" target=\"_blank\" title=\"骆驼早秋新品尝试-热销款推荐\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-3-2.jpg?628\" alt=\"骆驼早秋新品尝试-热销款推荐\"></a> <a href=\"\" target=\"_blank\" title=\"识得女人香-冰希利娇真我系列\"> <img src=\"http://shoptest16.800pharm.net/data/upload/shop/editor/web-101-102-3-3.jpg?851\" alt=\"识得女人香-冰希利娇真我系列\"></a> </li> </ul><script type=\"text/javascript\">update_screen_focus();</script>'),(121,'首页促销区','orange','index_sale',1467600405,120,1,' <div class=\"hd\"><a href=\"javascript:;\" class=\"changeBnt\" id=\"xxlChg\"><i></i>换一换</a></div> <ul class=\"picLB\" id=\"picLBxxl\">    <li><dl class=\"picDl\"><dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627900055146_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" title=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\">劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593</a></div><div class=\"text\">商城价：<em>14.63万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627871532105_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" title=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\">劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201</a></div><div class=\"text\">商城价：<em>10.05万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627843241680_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" title=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\">劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.59万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627799921979_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" title=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\">劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233</a></div><div class=\"text\">商城价：<em>9.78万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627750479728_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" title=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\">劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.32万</em></div></div></dd>       </dl></li>  <li><dl class=\"picDl\"><dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627750479728_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" title=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\">劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.32万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627678636481_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" title=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\">劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>7.00万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627707766698_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" title=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\">劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210</a></div><div class=\"text\">商城价：<em>8.75万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627769865296_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" title=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\">劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333</a></div><div class=\"text\">商城价：<em>8.92万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627843241680_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" title=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\">劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.59万</em></div></div></dd>       </dl></li>  <li><dl class=\"picDl\"><dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627871532105_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" title=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\">劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201</a></div><div class=\"text\">商城价：<em>10.05万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627799921979_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" title=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\">劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233</a></div><div class=\"text\">商城价：<em>9.78万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627707766698_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" title=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\">劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210</a></div><div class=\"text\">商城价：<em>8.75万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627750479728_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" title=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\">劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.32万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627769865296_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" title=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\">劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333</a></div><div class=\"text\">商城价：<em>8.92万</em></div></div></dd>       </dl></li>  <li><dl class=\"picDl\"><dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627769865296_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100003\" title=\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\">劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333</a></div><div class=\"text\">商城价：<em>8.92万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627707766698_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100001\" title=\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\">劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210</a></div><div class=\"text\">商城价：<em>8.75万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627750479728_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100002\" title=\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\">劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.32万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627678636481_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" title=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\">劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>7.00万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627900055146_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" title=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\">劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593</a></div><div class=\"text\">商城价：<em>14.63万</em></div></div></dd>       </dl></li>  <li><dl class=\"picDl\"><dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627871532105_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100006\" title=\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\">劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201</a></div><div class=\"text\">商城价：<em>10.05万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627843241680_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100005\" title=\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\">劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>6.59万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627799921979_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100004\" title=\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\">劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233</a></div><div class=\"text\">商城价：<em>9.78万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627900055146_240.png\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100007\" title=\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\">劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593</a></div><div class=\"text\">商城价：<em>14.63万</em></div></div></dd>      <dd><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" class=\"pic\"><img shopwwi-url=\"http://shoptest16.800pharm.net/data/upload/shop/store/goods/1/1_04752627678636481_240.jpg\"  rel=\'lazy\' src=\"http://shoptest16.800pharm.net/shop/img/loading.gif\" mff=\"sqde\" alt=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\"/></a><div class=\"ftBox\"><div class=\"tit\"><a href=\"http://shoptest16.800pharm.net/shop/index.php?act=goods&op=index&goods_id=100000\" title=\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\">劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品</a></div><div class=\"text\">商城价：<em>7.00万</em></div></div></dd>       </dl></li></ul>'),(601,'演示频道--顶部','default','channel_tp',1469602811,255,1,'\r\n<div class=\"channel-focus-layout style-601\">\r\n  <div class=\"channel-category\">\r\n    <ul class=\"menu\">\r\n          </ul>\r\n  </div>\r\n  <ul id=\"fullScreenSlides\" class=\"full-screen-slides\">\r\n      </ul>\r\n  <div class=\"jfocus-trigeminy\">\r\n    <ul>\r\n          </ul>\r\n  </div>\r\n  <div class=\"right-sidebar\"> </div>\r\n</div>\r\n'),(610,'演示频道--中部','default','channel_fl',1415167497,255,1,NULL);
/*!40000 ALTER TABLE `pmall_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_web_channel`
--

DROP TABLE IF EXISTS `pmall_web_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_web_channel` (
  `channel_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `channel_name` varchar(50) DEFAULT '' COMMENT '频道名称',
  `channel_style` varchar(20) DEFAULT '' COMMENT '颜色风格',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '绑定分类ID',
  `gc_name` varchar(50) DEFAULT '' COMMENT '分类名称',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键词',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `top_id` int(10) unsigned DEFAULT '0' COMMENT '顶部楼层编号',
  `floor_ids` varchar(100) DEFAULT '' COMMENT '中部楼层编号',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `channel_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态，0为否，1为是，默认为1',
  PRIMARY KEY (`channel_id`),
  KEY `gc_id` (`gc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8 COMMENT='商城频道表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_web_channel`
--

LOCK TABLES `pmall_web_channel` WRITE;
/*!40000 ALTER TABLE `pmall_web_channel` DISABLE KEYS */;
INSERT INTO `pmall_web_channel` VALUES (601,'演示频道','red',1062,'中西成药 > 男科疾病','演示频道','演示频道',601,'',1469532642,1);
/*!40000 ALTER TABLE `pmall_web_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmall_web_code`
--

DROP TABLE IF EXISTS `pmall_web_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmall_web_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `web_id` int(10) unsigned NOT NULL COMMENT '模块ID',
  `code_type` varchar(10) NOT NULL DEFAULT 'array' COMMENT '数据类型:array,html,json',
  `var_name` varchar(20) NOT NULL COMMENT '变量名称',
  `code_info` text COMMENT '内容数据',
  `show_name` varchar(20) DEFAULT '' COMMENT '页面名称',
  PRIMARY KEY (`code_id`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8 COMMENT='模块内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmall_web_code`
--

LOCK TABLES `pmall_web_code` WRITE;
/*!40000 ALTER TABLE `pmall_web_code` DISABLE KEYS */;
INSERT INTO `pmall_web_code` VALUES (11,1,'array','tit','','标题图片'),(12,1,'array','category_list','','推荐分类'),(13,1,'array','act','','活动图片'),(15,1,'array','recommend_list','','商品推荐'),(18,1,'array','adv','','广告图片'),(19,1,'array','brand_list','','品牌推荐'),(21,2,'array','tit','a:5:{s:3:\"pic\";s:0:\"\";s:3:\"url\";s:0:\"\";s:4:\"type\";s:3:\"txt\";s:5:\"floor\";s:2:\"1F\";s:5:\"title\";s:20:\"家电/数码/手机\";}','标题图片'),(22,2,'array','category_list','a:1:{s:11:\"goods_class\";a:18:{i:108;a:2:{s:5:\"gc_id\";s:3:\"108\";s:7:\"gc_name\";s:9:\"正装鞋\";}i:16;a:2:{s:5:\"gc_id\";s:2:\"16\";s:7:\"gc_name\";s:6:\"卫衣\";}i:110;a:2:{s:5:\"gc_id\";s:3:\"110\";s:7:\"gc_name\";s:18:\"凉鞋／沙滩鞋\";}i:19;a:2:{s:5:\"gc_id\";s:2:\"19\";s:7:\"gc_name\";s:9:\"半身裙\";}i:24;a:2:{s:5:\"gc_id\";s:2:\"24\";s:7:\"gc_name\";s:6:\"西服\";}i:26;a:2:{s:5:\"gc_id\";s:2:\"26\";s:7:\"gc_name\";s:6:\"风衣\";}i:27;a:2:{s:5:\"gc_id\";s:2:\"27\";s:7:\"gc_name\";s:6:\"大衣\";}i:29;a:2:{s:5:\"gc_id\";s:2:\"29\";s:7:\"gc_name\";s:6:\"棉服\";}i:31;a:2:{s:5:\"gc_id\";s:2:\"31\";s:7:\"gc_name\";s:9:\"孕妇装\";}i:32;a:2:{s:5:\"gc_id\";s:2:\"32\";s:7:\"gc_name\";s:9:\"大码装\";}i:33;a:2:{s:5:\"gc_id\";s:2:\"33\";s:7:\"gc_name\";s:12:\"中老年装\";}i:107;a:2:{s:5:\"gc_id\";s:3:\"107\";s:7:\"gc_name\";s:15:\"商务休闲鞋\";}i:109;a:2:{s:5:\"gc_id\";s:3:\"109\";s:7:\"gc_name\";s:9:\"休闲鞋\";}i:111;a:2:{s:5:\"gc_id\";s:3:\"111\";s:7:\"gc_name\";s:6:\"男靴\";}i:112;a:2:{s:5:\"gc_id\";s:3:\"112\";s:7:\"gc_name\";s:9:\"功能鞋\";}i:113;a:2:{s:5:\"gc_id\";s:3:\"113\";s:7:\"gc_name\";s:6:\"拖鞋\";}i:114;a:2:{s:5:\"gc_id\";s:3:\"114\";s:7:\"gc_name\";s:12:\"传统布鞋\";}i:116;a:2:{s:5:\"gc_id\";s:3:\"116\";s:7:\"gc_name\";s:9:\"帆布鞋\";}}}','推荐分类'),(23,2,'array','act','a:4:{s:3:\"pic\";s:28:\"shop/editor/web-2-23.jpg?761\";s:4:\"type\";s:3:\"pic\";s:5:\"title\";s:21:\"出游服装五折起\";s:3:\"url\";s:0:\"\";}','活动图片'),(25,2,'array','recommend_list','a:2:{i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"智能电视\";}s:8:\"pic_list\";a:9:{i:11;a:4:{s:6:\"pic_id\";s:2:\"11\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-11.jpg?585\";}i:12;a:4:{s:6:\"pic_id\";s:2:\"12\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-12.jpg?716\";}i:14;a:4:{s:6:\"pic_id\";s:2:\"14\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-14.jpg?859\";}i:21;a:4:{s:6:\"pic_id\";s:2:\"21\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-21.jpg?298\";}i:24;a:4:{s:6:\"pic_id\";s:2:\"24\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-24.jpg?592\";}i:31;a:4:{s:6:\"pic_id\";s:2:\"31\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-31.jpg?742\";}i:32;a:4:{s:6:\"pic_id\";s:2:\"32\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-32.jpg?651\";}i:33;a:4:{s:6:\"pic_id\";s:2:\"33\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-33.jpg?709\";}i:34;a:4:{s:6:\"pic_id\";s:2:\"34\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:33:\"shop/editor/web-2-25-1-34.jpg?979\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"劳力士表\";}s:10:\"goods_list\";a:8:{i:100006;a:5:{s:8:\"goods_id\";s:6:\"100006\";s:12:\"market_price\";s:9:\"100500.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\";s:11:\"goods_price\";s:9:\"100500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627871532105_240.png\";}i:100005;a:5:{s:8:\"goods_id\";s:6:\"100005\";s:12:\"market_price\";s:8:\"65900.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"65900.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627843241680_240.jpg\";}i:100004;a:5:{s:8:\"goods_id\";s:6:\"100004\";s:12:\"market_price\";s:8:\"97800.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\";s:11:\"goods_price\";s:8:\"97800.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627799921979_240.jpg\";}i:100001;a:5:{s:8:\"goods_id\";s:6:\"100001\";s:12:\"market_price\";s:8:\"87500.00\";s:10:\"goods_name\";s:80:\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\";s:11:\"goods_price\";s:8:\"87500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627707766698_240.png\";}i:100002;a:5:{s:8:\"goods_id\";s:6:\"100002\";s:12:\"market_price\";s:8:\"63200.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"63200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627750479728_240.png\";}i:100003;a:5:{s:8:\"goods_id\";s:6:\"100003\";s:12:\"market_price\";s:8:\"89200.00\";s:10:\"goods_name\";s:78:\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\";s:11:\"goods_price\";s:8:\"89200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627769865296_240.jpg\";}i:100000;a:5:{s:8:\"goods_id\";s:6:\"100000\";s:12:\"market_price\";s:8:\"70000.00\";s:10:\"goods_name\";s:79:\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"70000.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627678636481_240.jpg\";}i:100007;a:5:{s:8:\"goods_id\";s:6:\"100007\";s:12:\"market_price\";s:9:\"146300.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\";s:11:\"goods_price\";s:9:\"146300.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627900055146_240.png\";}}}}','商品推荐'),(28,2,'array','adv','a:2:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-1.jpg?493\";}i:2;a:4:{s:8:\"pic_name\";s:0:\"\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"2\";s:7:\"pic_img\";s:30:\"shop/editor/web-2-28-2.jpg?682\";}}','广告图片'),(29,2,'array','brand_list','a:12:{i:104;a:3:{s:8:\"brand_id\";s:3:\"104\";s:10:\"brand_name\";s:6:\"esprit\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090828687339_sm.jpg\";}i:103;a:3:{s:8:\"brand_id\";s:3:\"103\";s:10:\"brand_name\";s:9:\"ELLE HOME\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090611386532_sm.jpg\";}i:102;a:3:{s:8:\"brand_id\";s:3:\"102\";s:10:\"brand_name\";s:11:\"她他/tata\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090459092275_sm.jpg\";}i:99;a:3:{s:8:\"brand_id\";s:2:\"99\";s:10:\"brand_name\";s:9:\"梦特娇\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089942879365_sm.jpg\";}i:96;a:3:{s:8:\"brand_id\";s:2:\"96\";s:10:\"brand_name\";s:9:\"佐丹奴\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089412399747_sm.jpg\";}i:90;a:3:{s:8:\"brand_id\";s:2:\"90\";s:10:\"brand_name\";s:9:\"金利来\";s:9:\"brand_pic\";s:35:\"shop/brand/04397473042647991_sm.jpg\";}i:84;a:3:{s:8:\"brand_id\";s:2:\"84\";s:10:\"brand_name\";s:12:\"阿迪达斯\";s:9:\"brand_pic\";s:35:\"shop/brand/04397471910652190_sm.jpg\";}i:85;a:3:{s:8:\"brand_id\";s:2:\"85\";s:10:\"brand_name\";s:6:\"猫人\";s:9:\"brand_pic\";s:35:\"shop/brand/04397472152849925_sm.jpg\";}i:79;a:3:{s:8:\"brand_id\";s:2:\"79\";s:10:\"brand_name\";s:7:\"justyle\";s:9:\"brand_pic\";s:35:\"shop/brand/04397468710494742_sm.jpg\";}i:116;a:3:{s:8:\"brand_id\";s:3:\"116\";s:10:\"brand_name\";s:4:\"Dior\";s:9:\"brand_pic\";s:35:\"shop/brand/04398099738566948_sm.jpg\";}i:100;a:3:{s:8:\"brand_id\";s:3:\"100\";s:10:\"brand_name\";s:6:\"宝姿\";s:9:\"brand_pic\";s:35:\"shop/brand/04398090061006740_sm.jpg\";}i:95;a:3:{s:8:\"brand_id\";s:2:\"95\";s:10:\"brand_name\";s:6:\"李宁\";s:9:\"brand_pic\";s:35:\"shop/brand/04398089270610035_sm.jpg\";}}','品牌推荐'),(31,3,'array','tit','','标题图片'),(32,3,'array','category_list','','推荐分类'),(33,3,'array','act','','活动图片'),(35,3,'array','recommend_list','','商品推荐'),(38,3,'array','adv','','广告图片'),(39,3,'array','brand_list','','品牌推荐'),(41,4,'array','tit','','标题图片'),(42,4,'array','category_list','','推荐分类'),(43,4,'array','act','','活动图片'),(45,4,'array','recommend_list','','商品推荐'),(48,4,'array','adv','','广告图片'),(49,4,'array','brand_list','','品牌推荐'),(51,5,'array','tit','','标题图片'),(52,5,'array','category_list','a:1:{s:11:\"goods_class\";a:6:{i:960;a:2:{s:5:\"gc_id\";s:3:\"960\";s:7:\"gc_name\";s:6:\"奶粉\";}i:961;a:2:{s:5:\"gc_id\";s:3:\"961\";s:7:\"gc_name\";s:12:\"营养辅食\";}i:962;a:2:{s:5:\"gc_id\";s:3:\"962\";s:7:\"gc_name\";s:12:\"尿裤湿巾\";}i:964;a:2:{s:5:\"gc_id\";s:3:\"964\";s:7:\"gc_name\";s:12:\"洗护用品\";}i:966;a:2:{s:5:\"gc_id\";s:3:\"966\";s:7:\"gc_name\";s:12:\"服饰寝居\";}i:967;a:2:{s:5:\"gc_id\";s:3:\"967\";s:7:\"gc_name\";s:12:\"妈妈专区\";}}}','推荐分类'),(53,5,'array','act','','活动图片'),(55,5,'array','recommend_list','','商品推荐'),(58,5,'array','adv','','广告图片'),(59,5,'array','brand_list','','品牌推荐'),(61,6,'array','tit','','标题图片'),(62,6,'array','category_list','','活动图片'),(63,6,'array','act','','活动图片'),(65,6,'array','recommend_list','','商品推荐'),(68,6,'array','adv','','广告图片'),(69,6,'array','brand_list','','品牌推荐'),(71,7,'array','tit','','标题图片'),(72,7,'array','category_list','','推荐分类'),(73,7,'array','act','','活动图片'),(75,7,'array','recommend_list','','商品推荐'),(78,7,'array','adv','','广告图片'),(79,7,'array','brand_list','','品牌推荐'),(81,8,'array','tit','','标题图片'),(82,8,'array','category_list','','推荐分类'),(83,8,'array','act','','活动图片'),(85,8,'array','recommend_list','','商品推荐'),(88,8,'array','adv','','广告图片'),(89,8,'array','brand_list','','品牌推荐'),(101,101,'array','screen_list','a:5:{i:1;a:5:{s:8:\"pic_name\";s:28:\"冬季名品-大牌季节日\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#2D080F\";s:6:\"pic_id\";s:1:\"1\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-1.jpg?454\";}i:5;a:5:{s:6:\"pic_id\";s:1:\"5\";s:8:\"pic_name\";s:31:\"全套茶具专场-年终盛典\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#F6BB3D\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-5.jpg?166\";}i:2;a:5:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:42:\"女人再忙也要留一天为自己疯抢\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#36142C\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-2.jpg?331\";}i:3;a:5:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:25:\"全年爆款-年底清仓\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#f2f2f2\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-3.jpg?249\";}i:4;a:5:{s:6:\"pic_id\";s:1:\"4\";s:8:\"pic_name\";s:33:\"清仓年末特优-满99元包邮\";s:7:\"pic_url\";s:0:\"\";s:5:\"color\";s:7:\"#ECBCB0\";s:7:\"pic_img\";s:33:\"shop/editor/web-101-101-4.jpg?250\";}}','切换大图'),(102,101,'array','focus_list','a:3:{i:1;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:28:\"佳节大献礼-茶满中秋\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-1.jpg?842\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:25:\"孩子喜欢-遥控悍马\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-2.jpg?143\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:28:\"天气凉了-情侣家居服\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-1-3.jpg?114\";}}}i:2;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:34:\"越中国越时尚-水晶中国风\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-1.jpg?824\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:38:\"领先全球首创-CoolTec冰爽剃须\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-2.jpg?851\";}i:3;a:4:{s:6:\"pic_id\";s:1:\"3\";s:8:\"pic_name\";s:37:\"健康中的专家-欧姆龙血压计\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-2-3.jpg?734\";}}}i:3;a:1:{s:8:\"pic_list\";a:3:{i:1;a:4:{s:6:\"pic_id\";s:1:\"1\";s:8:\"pic_name\";s:33:\"TOPTO秋季格调-衬衫促销季\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-1.jpg?191\";}i:2;a:4:{s:6:\"pic_id\";s:1:\"2\";s:8:\"pic_name\";s:40:\"骆驼早秋新品尝试-热销款推荐\";s:7:\"pic_url\";s:0:\"\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-2.jpg?628\";}i:3;a:4:{s:8:\"pic_name\";s:40:\"识得女人香-冰希利娇真我系列\";s:7:\"pic_url\";s:0:\"\";s:6:\"pic_id\";s:1:\"3\";s:7:\"pic_img\";s:35:\"shop/editor/web-101-102-3-3.jpg?851\";}}}}','切换小图'),(121,121,'array','sale_list','a:5:{i:3;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热卖商品\";}s:10:\"goods_list\";a:5:{i:100007;a:5:{s:8:\"goods_id\";s:6:\"100007\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\";s:11:\"goods_price\";s:9:\"146300.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627900055146_240.png\";}i:100006;a:5:{s:8:\"goods_id\";s:6:\"100006\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\";s:11:\"goods_price\";s:9:\"100500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627871532105_240.png\";}i:100005;a:5:{s:8:\"goods_id\";s:6:\"100005\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"65900.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627843241680_240.jpg\";}i:100004;a:5:{s:8:\"goods_id\";s:6:\"100004\";s:12:\"market_price\";s:8:\"97800.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\";s:11:\"goods_price\";s:8:\"97800.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627799921979_240.jpg\";}i:100002;a:5:{s:8:\"goods_id\";s:6:\"100002\";s:12:\"market_price\";s:8:\"63200.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"63200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627750479728_240.png\";}}}i:1;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"疯狂抢购\";}s:10:\"goods_list\";a:5:{i:100002;a:5:{s:8:\"goods_id\";s:6:\"100002\";s:12:\"market_price\";s:8:\"63200.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"63200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627750479728_240.png\";}i:100000;a:5:{s:8:\"goods_id\";s:6:\"100000\";s:12:\"market_price\";s:8:\"70000.00\";s:10:\"goods_name\";s:79:\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"70000.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627678636481_240.jpg\";}i:100001;a:5:{s:8:\"goods_id\";s:6:\"100001\";s:12:\"market_price\";s:8:\"87500.00\";s:10:\"goods_name\";s:80:\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\";s:11:\"goods_price\";s:8:\"87500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627707766698_240.png\";}i:100003;a:5:{s:8:\"goods_id\";s:6:\"100003\";s:12:\"market_price\";s:8:\"89200.00\";s:10:\"goods_name\";s:78:\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\";s:11:\"goods_price\";s:8:\"89200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627769865296_240.jpg\";}i:100005;a:5:{s:8:\"goods_id\";s:6:\"100005\";s:12:\"market_price\";s:8:\"65900.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"65900.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627843241680_240.jpg\";}}}i:2;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"猜您喜欢\";}s:10:\"goods_list\";a:5:{i:100006;a:5:{s:8:\"goods_id\";s:6:\"100006\";s:12:\"market_price\";s:9:\"100500.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\";s:11:\"goods_price\";s:9:\"100500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627871532105_240.png\";}i:100004;a:5:{s:8:\"goods_id\";s:6:\"100004\";s:12:\"market_price\";s:8:\"97800.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\";s:11:\"goods_price\";s:8:\"97800.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627799921979_240.jpg\";}i:100001;a:5:{s:8:\"goods_id\";s:6:\"100001\";s:12:\"market_price\";s:8:\"87500.00\";s:10:\"goods_name\";s:80:\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\";s:11:\"goods_price\";s:8:\"87500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627707766698_240.png\";}i:100002;a:5:{s:8:\"goods_id\";s:6:\"100002\";s:12:\"market_price\";s:8:\"63200.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"63200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627750479728_240.png\";}i:100003;a:5:{s:8:\"goods_id\";s:6:\"100003\";s:12:\"market_price\";s:8:\"89200.00\";s:10:\"goods_name\";s:78:\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\";s:11:\"goods_price\";s:8:\"89200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627769865296_240.jpg\";}}}i:4;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"热评商品\";}s:10:\"goods_list\";a:5:{i:100003;a:5:{s:8:\"goods_id\";s:6:\"100003\";s:12:\"market_price\";s:8:\"89200.00\";s:10:\"goods_name\";s:78:\"劳力士Rolex 日志型系列 自动机械钢带男士表 联保正品 116333\";s:11:\"goods_price\";s:8:\"89200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627769865296_240.jpg\";}i:100001;a:5:{s:8:\"goods_id\";s:6:\"100001\";s:12:\"market_price\";s:8:\"87500.00\";s:10:\"goods_name\";s:80:\"劳力士Rolex 深海系列 自动机械钢带男士表 联保正品116660 98210\";s:11:\"goods_price\";s:8:\"87500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627707766698_240.png\";}i:100002;a:5:{s:8:\"goods_id\";s:6:\"100002\";s:12:\"market_price\";s:8:\"63200.00\";s:10:\"goods_name\";s:75:\"劳力士Rolex MILGAUSS 116400GV-72400 自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"63200.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627750479728_240.png\";}i:100000;a:5:{s:8:\"goods_id\";s:6:\"100000\";s:12:\"market_price\";s:8:\"70000.00\";s:10:\"goods_name\";s:79:\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"70000.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627678636481_240.jpg\";}i:100007;a:5:{s:8:\"goods_id\";s:6:\"100007\";s:12:\"market_price\";s:9:\"146300.00\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\";s:11:\"goods_price\";s:9:\"146300.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627900055146_240.png\";}}}i:5;a:2:{s:9:\"recommend\";a:1:{s:4:\"name\";s:12:\"新品上架\";}s:10:\"goods_list\";a:5:{i:100006;a:5:{s:8:\"goods_id\";s:6:\"100006\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列 自动机械钢带男表 正品116231-G-63201\";s:11:\"goods_price\";s:9:\"100500.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627871532105_240.png\";}i:100005;a:5:{s:8:\"goods_id\";s:6:\"100005\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动 115234-CA-72190自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"65900.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627843241680_240.jpg\";}i:100004;a:5:{s:8:\"goods_id\";s:6:\"100004\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:75:\"劳力士Rolex 日志型系列 自动机械钢带男表 联保正品 116233\";s:11:\"goods_price\";s:8:\"97800.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627799921979_240.jpg\";}i:100007;a:5:{s:8:\"goods_id\";s:6:\"100007\";s:12:\"market_price\";s:0:\"\";s:10:\"goods_name\";s:79:\"劳力士Rolex 蚝式恒动系列自动机械钢带男表正品116523-8DI-78593\";s:11:\"goods_price\";s:9:\"146300.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627900055146_240.png\";}i:100000;a:5:{s:8:\"goods_id\";s:6:\"100000\";s:12:\"market_price\";s:8:\"70000.00\";s:10:\"goods_name\";s:79:\"劳力士ROLEX-潜航者型 116610-LV-97200自动机械钢带男表联保正品\";s:11:\"goods_price\";s:8:\"70000.00\";s:9:\"goods_pic\";s:46:\"shop/store/goods/1/1_04752627678636481_240.jpg\";}}}}','促销区'),(601,601,'array','channel_category','','频道顶部分类'),(602,601,'array','channel_slide','','频道顶部切换'),(603,601,'array','channel_adv','','频道顶部广告'),(611,610,'array','channel_tit','','频道中部标题'),(612,610,'array','channel_act','','频道中部活动'),(613,610,'array','recommend_list','','频道中部商品'),(617,610,'array','adv_a','','频道中部广告1'),(618,610,'array','adv_b','','频道中部广告2'),(619,610,'array','adv_c','','频道中部广告3');
/*!40000 ALTER TABLE `pmall_web_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-28 13:48:02
