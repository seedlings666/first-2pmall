-- MySQL dump 10.13  Distrib 5.7.14, for osx10.11 (x86_64)
--
-- Host: localhost    Database: b2p_mall
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `zo_goods`
--

DROP TABLE IF EXISTS `zo_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 业务 id,商品 id',
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺 id,在此系统理解为后台管理人员 id',
  `is_sku` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否多 sku 商品，当设置了多属性时，此表示即固定为1，单品与多 sku 商品不得切换',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_desc` varchar(150) NOT NULL DEFAULT '' COMMENT '商品描述',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量，商品 sku 的总量',
  `is_on_sale` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架售卖,1=>是,0=>否，默认为1',
  `shop_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '商品的售卖价格,取值于 sku 表的最低价格',
  `market_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT ' 商品市场价格，取值于 ski 中 shop_price 相对应数据的 market_price',
  `content` text COMMENT '商品的详情',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zo_goods`
--

LOCK TABLES `zo_goods` WRITE;
/*!40000 ALTER TABLE `zo_goods` DISABLE KEYS */;
INSERT INTO `zo_goods` VALUES (1,10,1,'测试商品名称-567552121啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','商品描述啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊',1100,1,100.00,200.00,'\n                        \n                        contentcontentcontentcontentcontentcontentconaaaaaaaaaaaaaaaaaaaaaa\n                    ','2016-08-28 05:00:38','2016-09-07 07:38:23',NULL),(2,10,0,'测试单品aaaaaaaaaaaaaa','这是测试单品啊aaaaaaa',999,1,1000.00,30.00,'\n                        \n                        \n                        内容你妹..aaaaaaaaaaaaaaaaaaaaaaaaaa\n                    ','2016-09-03 07:30:09','2016-09-07 07:32:17',NULL),(3,10,0,'test','test desc',100,1,10.00,100.00,'内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi内容ceshiceshi','2016-09-07 07:09:28','2016-09-07 07:09:28',NULL),(19,10,0,'测试商品名称-1904593207','商品描述',100,1,10.00,20.20,'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent','2016-09-07 07:15:26','2016-09-07 07:15:26',NULL),(20,10,0,'测试商品名称-1076447354','商品描述',100,1,10.00,20.20,'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent','2016-09-07 07:15:58','2016-09-07 07:15:58',NULL),(21,10,0,'测试商品名称-1745455035','商品描述',100,1,10.00,20.20,'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent','2016-09-07 07:16:07','2016-09-07 07:16:07',NULL),(22,10,1,'测试商品名称-787161980','商品描述',100,1,0.50,0.60,'contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL);
/*!40000 ALTER TABLE `zo_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zo_goods_attr`
--

DROP TABLE IF EXISTS `zo_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'yew 业务 id,属性 id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品 id',
  `attr_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性名称',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zo_goods_attr`
--

LOCK TABLES `zo_goods_attr` WRITE;
/*!40000 ALTER TABLE `zo_goods_attr` DISABLE KEYS */;
INSERT INTO `zo_goods_attr` VALUES (1,1,'颜色','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(2,1,'尺寸','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(3,22,'颜色','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL),(4,22,'尺寸','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL);
/*!40000 ALTER TABLE `zo_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zo_goods_attr_value`
--

DROP TABLE IF EXISTS `zo_goods_attr_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_attr_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值 id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品 id',
  `attr_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '属性 id',
  `value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zo_goods_attr_value`
--

LOCK TABLES `zo_goods_attr_value` WRITE;
/*!40000 ALTER TABLE `zo_goods_attr_value` DISABLE KEYS */;
INSERT INTO `zo_goods_attr_value` VALUES (1,1,1,'red','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(2,1,2,'10寸','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(3,1,1,'blue','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(4,1,2,'20寸','2016-08-28 05:00:38','2016-08-28 05:00:38',NULL),(5,22,3,'red','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL),(6,22,4,'10寸','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL),(7,22,3,'blue','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL),(8,22,4,'20寸','2016-09-07 07:17:25','2016-09-07 07:17:25',NULL),(9,1,1,'黄色','2016-09-07 07:38:23','2016-09-07 07:38:23',NULL),(10,1,2,'10','2016-09-07 07:38:23','2016-09-07 07:38:23',NULL),(11,1,1,'橙色','2016-09-07 07:38:23','2016-09-07 07:38:23',NULL),(12,1,2,'20','2016-09-07 07:38:23','2016-09-07 07:38:23',NULL);
/*!40000 ALTER TABLE `zo_goods_attr_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zo_goods_images`
--

DROP TABLE IF EXISTS `zo_goods_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品 id',
  `size` int(10) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `width` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '图片的宽度',
  `height` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '图片高度',
  `ext_name` varchar(10) NOT NULL DEFAULT '' COMMENT '扩展名',
  `mime` varchar(10) NOT NULL DEFAULT '' COMMENT 'mime 类型',
  `origin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '文件原名',
  `file_path` varchar(100) NOT NULL DEFAULT '' COMMENT '文件目录',
  `file_name` varchar(30) NOT NULL DEFAULT '' COMMENT '文件存储名称',
  `base_code` text COMMENT 'base_64码',
  `url_links` varchar(150) NOT NULL DEFAULT '' COMMENT 'url 访问时候的相对地址',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zo_goods_images`
--

LOCK TABLES `zo_goods_images` WRITE;
/*!40000 ALTER TABLE `zo_goods_images` DISABLE KEYS */;
INSERT INTO `zo_goods_images` VALUES (1,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/8/','20160828130037.png','','/file/images/goods/2016/8/20160828130037.png','2016-08-28 05:00:37','2016-09-04 01:48:31','2016-09-04 01:48:31'),(2,22,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/8/','20160828133916.png','','/file/images/goods/2016/8/20160828133916.png','2016-08-28 05:39:17','2016-09-07 07:17:25',NULL),(3,22,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/8/','20160828135113.png','','/file/images/goods/2016/8/20160828135113.png','2016-08-28 05:51:13','2016-09-07 07:17:25',NULL),(4,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','20160903123441.png','','/file/images/goods/2016/9/20160903123441.png','2016-09-03 04:34:41','2016-09-03 04:34:41',NULL),(5,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','20160903123504.png','','/file/images/goods/2016/9/20160903123504.png','2016-09-03 04:35:04','2016-09-03 04:35:04',NULL),(6,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472912549_11649000.png','','/file/images/goods/2016/9/1472912549_11649000.png','2016-09-03 06:22:29','2016-09-03 06:22:29',NULL),(7,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472916601_31919000.png','','/file/images/goods/2016/9/1472916601_31919000.png','2016-09-03 07:30:01','2016-09-03 07:30:09',NULL),(8,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982366_95227800.png','','/file/images/goods/2016/9/1472982366_95227800.png','2016-09-04 01:46:07','2016-09-04 01:48:31','2016-09-04 01:48:31'),(9,0,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982416_26234300.jpg','','/file/images/goods/2016/9/1472982416_26234300.jpg','2016-09-04 01:46:56','2016-09-04 01:48:31','2016-09-04 01:48:31'),(10,22,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp 3.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982497_37850700.jpg','','/file/images/goods/2016/9/1472982497_37850700.jpg','2016-09-04 01:48:17','2016-09-07 07:17:25',NULL),(11,22,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982497_37972500.jpg','','/file/images/goods/2016/9/1472982497_37972500.jpg','2016-09-04 01:48:17','2016-09-07 07:17:25',NULL),(12,0,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982510_16700700.jpg','','/file/images/goods/2016/9/1472982510_16700700.jpg','2016-09-04 01:48:30','2016-09-04 01:48:47','2016-09-04 01:48:47'),(13,22,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp 3.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982523_82651300.jpg','','/file/images/goods/2016/9/1472982523_82651300.jpg','2016-09-04 01:48:43','2016-09-07 07:17:25',NULL),(14,0,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp 2.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982523_83444700.jpg','','/file/images/goods/2016/9/1472982523_83444700.jpg','2016-09-04 01:48:43','2016-09-04 01:48:47',NULL),(15,0,51088,550.00,365.00,'jpg','image/jpeg','20160426_070f7e4425c55919b5812mrngml1bqlg_sp.jpg','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1472982523_94356900.jpg','','/file/images/goods/2016/9/1472982523_94356900.jpg','2016-09-04 01:48:43','2016-09-04 01:48:47',NULL),(16,0,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1473260955_45892700_10022.png','','/file/images/goods/2016/9/1473260955_45892700_10022.png','2016-09-07 07:09:15','2016-09-07 07:09:28',NULL),(17,2,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1473261622_81813200_75676.png','','/file/images/goods/2016/9/1473261622_81813200_75676.png','2016-09-07 07:20:22','2016-09-07 07:24:48',NULL),(18,1,163493,933.00,1270.00,'png','image/png','拼团.png','/usr/local/var/www/waibao/first-2pmall/www/b2p.mall.com/public/file/images/goods/2016/9/','1473262436_81094100_4645.png','','/file/images/goods/2016/9/1473262436_81094100_4645.png','2016-09-07 07:33:56','2016-09-07 07:33:57',NULL);
/*!40000 ALTER TABLE `zo_goods_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zo_goods_sku`
--

DROP TABLE IF EXISTS `zo_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sku_id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 商品 id',
  `sku_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'sku 名称',
  `shop_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '店铺价格，实际的购买价格',
  `market_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `sku_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'sku 数量',
  `sku_attr_1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品第一个属性',
  `sku_attr_2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品第二个属性',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  `is_on_sale` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架,0=>否,1=>是，默认为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zo_goods_sku`
--

LOCK TABLES `zo_goods_sku` WRITE;
/*!40000 ALTER TABLE `zo_goods_sku` DISABLE KEYS */;
INSERT INTO `zo_goods_sku` VALUES (1,1,'sku名称',120.10,200.20,10,1,2,'2016-08-28 05:00:38','2016-08-28 05:07:27',NULL,0),(2,1,'sku名称2',120.50,260.60,100,3,4,'2016-08-28 05:00:38','2016-08-28 05:18:42',NULL,1),(3,2,'默认 sku',1000.00,30.00,999,0,0,'2016-09-03 07:30:09','2016-09-07 07:32:17',NULL,1),(4,3,'默认 sku',10.00,100.00,100,0,0,'2016-09-07 07:09:28','2016-09-07 07:09:28',NULL,1),(5,19,'默认 sku',10.00,20.20,100,0,0,'2016-09-07 07:15:26','2016-09-07 07:15:26',NULL,1),(6,20,'默认 sku',10.00,20.20,100,0,0,'2016-09-07 07:15:58','2016-09-07 07:15:58',NULL,1),(7,21,'默认 sku',10.00,20.20,100,0,0,'2016-09-07 07:16:07','2016-09-07 07:16:07',NULL,1),(8,22,'sku名称',10.10,20.20,10,5,6,'2016-09-07 07:17:25','0000-00-00 00:00:00',NULL,0),(9,22,'sku名称2',0.50,0.60,100,7,8,'2016-09-07 07:17:25','0000-00-00 00:00:00',NULL,1),(10,1,'sb',100.00,200.00,1000,9,10,'2016-09-07 07:38:23','2016-09-07 07:38:23',NULL,1),(11,1,'kao',250.00,299.00,999,11,12,'2016-09-07 07:38:23','2016-09-07 07:38:23',NULL,0);
/*!40000 ALTER TABLE `zo_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-08 22:28:17
