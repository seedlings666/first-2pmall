-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: b2p_mall
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`(191)),
  KEY `password_resets_token_index` (`token`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `goods_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_desc` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品描述',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量，商品 sku 的总量',
  `is_on_sale` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架售卖,1=>是,0=>否，默认为1',
  `shop_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT '商品的售卖价格,取值于 sku 表的最低价格',
  `market_price` decimal(16,2) NOT NULL DEFAULT '0.00' COMMENT ' 商品市场价格，取值于 ski 中 shop_price 相对应数据的 market_price',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '商品的详情',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_goods_attr`
--

DROP TABLE IF EXISTS `zo_goods_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'yew 业务 id,属性 id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品 id',
  `attr_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `value_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '属性值',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `ext_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展名',
  `mime` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'mime 类型',
  `origin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件原名',
  `file_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件目录',
  `file_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件存储名称',
  `base_code` text COLLATE utf8mb4_unicode_ci COMMENT 'base_64码',
  `url_links` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url 访问时候的相对地址',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据创建时间，',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据最后修改时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '数据删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_goods_sku`
--

DROP TABLE IF EXISTS `zo_goods_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_goods_sku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'sku_id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 商品 id',
  `sku_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sku 名称',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_manage`
--

DROP TABLE IF EXISTS `zo_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_manage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `work_number` char(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_name` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nick_name` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mobile_phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT ', 0=> ,1 => ',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_manage_shop_relation`
--

DROP TABLE IF EXISTS `zo_manage_shop_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_manage_shop_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_order_goods`
--

DROP TABLE IF EXISTS `zo_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `sku_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'skuid',
  `goods_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品购买数量',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品销售价格',
  `buy_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品实际购买价格',
  `goods_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_spec` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品规格',
  `goods_img` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品显示图片',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zo_order_goods_order_id_index` (`order_id`),
  KEY `zo_order_goods_goods_id_index` (`goods_id`),
  KEY `zo_order_goods_sku_id_index` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_orders`
--

DROP TABLE IF EXISTS `zo_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_rp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '拼团顺序：1拼团第一单,2为拼团第二单',
  `order_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态:0初始,1创建订单成功,2拼团成功',
  `pay_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付状态:0初始,1支付中,2支付成功,3返还现金',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id,使用拼团第一单的order_id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_sn` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单编号',
  `pay_sn` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '支付编号,用于订单支付时所用编号',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额,实际支付金额',
  `preferential_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单实际优惠金额',
  `group_preferential_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单拼团优惠金额，拼团成功后该金额才会给定到coupon_amount',
  `order_subject` char(168) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单标题',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zo_orders_order_sn_unique` (`order_sn`),
  KEY `zo_orders_group_rp_index` (`group_rp`),
  KEY `zo_orders_order_status_index` (`order_status`),
  KEY `zo_orders_pay_status_index` (`pay_status`),
  KEY `zo_orders_group_id_index` (`group_id`),
  KEY `zo_orders_user_id_index` (`user_id`),
  KEY `zo_orders_order_sn_index` (`order_sn`),
  KEY `zo_orders_pay_sn_index` (`pay_sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_pay_log`
--

DROP TABLE IF EXISTS `zo_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型:0初始,1支付,2退款',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付:0初始,1支付成功,2退款成功',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `pay_sn` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '支付编号,用于订单支付和退款时所用编号',
  `pay_code` char(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '支付方式代码',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '记录数据',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zo_pay_log_type_index` (`type`),
  KEY `zo_pay_log_status_index` (`status`),
  KEY `zo_pay_log_user_id_index` (`user_id`),
  KEY `zo_pay_log_order_id_index` (`order_id`),
  KEY `zo_pay_log_pay_sn_index` (`pay_sn`),
  KEY `zo_pay_log_pay_code_index` (`pay_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_pay_sn`
--

DROP TABLE IF EXISTS `zo_pay_sn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_pay_sn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_rp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '拼团顺序：1拼团第一单,2为拼团第二单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单编号状态:0初始,1该编号已被订单使用',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '拼团id,使用拼团第一单的order_id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `pay_sn` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '支付编号,用于订单支付时所用编号',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attach` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '支付编号,附属数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zo_pay_sn_pay_sn_unique` (`pay_sn`),
  KEY `zo_pay_sn_group_rp_index` (`group_rp`),
  KEY `zo_pay_sn_status_index` (`status`),
  KEY `zo_pay_sn_user_id_index` (`user_id`),
  KEY `zo_pay_sn_group_id_index` (`group_id`),
  KEY `zo_pay_sn_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_pay_sn_tmp`
--

DROP TABLE IF EXISTS `zo_pay_sn_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_pay_sn_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pay_sn_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付编号',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attach` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '临时支付编号,附属数据，用于多用于对一个支付编号所用',
  PRIMARY KEY (`id`),
  KEY `zo_pay_sn_tmp_pay_sn_id_index` (`pay_sn_id`),
  KEY `zo_pay_sn_tmp_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_shop`
--

DROP TABLE IF EXISTS `zo_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT ', 0=> ,1 => ',
  `shopkeeper_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'id,zo_manage.id',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_user_weixin`
--

DROP TABLE IF EXISTS `zo_user_weixin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_user_weixin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscribe` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-1 ',
  `unsubscribed` tinyint(4) NOT NULL DEFAULT '0',
  `sex` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  `scan_subscribe_time` int(11) unsigned NOT NULL DEFAULT '0',
  `location_time` int(11) unsigned NOT NULL DEFAULT '0',
  `subscribe_time` int(11) unsigned NOT NULL DEFAULT '0',
  `unsubscribed_time` int(11) unsigned NOT NULL DEFAULT '0',
  `language` char(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `latitude` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `longitude` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `precision` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `openid` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'openid',
  `unionid` varchar(29) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'unionid',
  `country` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privilege` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT ',,',
  `nickname` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `headimgurl` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`),
  KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zo_users`
--

DROP TABLE IF EXISTS `zo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zo_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT ':0=,1=,2=',
  `source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '([0=>,3=>])',
  `points` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `avatar` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `reg_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nick_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-10  5:35:23
