# B2PMall Development Document

## 订单模块
** [流程] **
1. A用户线下门店扫码商品
> 如果线下门店再进来一位其他用户扫码下单，该单则是其他拼团订单，和A用户订单拼团不重叠
2. 点击下单支付创建拼团，成为拼团第一人
> 全额支付未享有优惠，分享出去拼团成功以后，优惠金额自动退款至该用户微信账号里
3. 分享创建的拼团订单
4. B用户通过打开分享商品页面去下单，并且是拼团第二人时，下的单才享有优惠
> 需要提示用户是否新开团

** [备注] **
1. 用户不能参与自己的拼团
2. 拼团时间超过24小时候未有第二人参加时，拼团失效。
3. 订单支付以后，需要给到用户积分支付金额100兑换1积分。
> 这里需要确认拼团成功后的第一人是否也是按全额支付金额给定积分。
4. [重要]支付成功才算下单成功，这里需要解决并发处理问题
> plan A:
> 锁定最新发起支付之人，如果取消支付，则删除该次操作，存在取消操作回掉不到网站，删除该次操作问题。
> plan B:
> 生成拼团订单时创建两个pay_sn第一个由拼团第一人支付，第二个用于拼团第二人发起支付，存在pay_sn在发起微信支付时是否可以，针对不同用户openid，需要验证。


### 订单支付
** 功能描述 **
订单支付是提供给用户，下单拼团发起支付功能，支付成功时才算作下订单成功。
订单支付时需要做以下判断
1. 如果A用户是创建拼团的第一人时，A用户需要全额付款，等待第二人参与拼团成功后，通过微信返回优惠金额至微信用户账号中
2. 如果B用户是创建拼团的第二人时，B用户直接支付的是拼团优惠金额，未有返还优惠金额后续流程
> 当拼团第二人支付完成后，需要触发返还拼团第一人的优惠金额操作。


### 创建订单
** 功能描述 **

** 实现方案 **

```php
// $input_data传入group_id的话则代表是加入拼团如果未传入则是创建拼团
$input_date['group_id'] = 801003;
$input_date['user_id'] = 277;
$input_date['sku_id'] = 666;
//如果传入group_id但是判断拼团已结束，则返回err_code提示该拼团已经结束，前端需要做判断选择是否新建拼团
//如果是创建拼团时，首先要生成pay_sn去支付，支付成功回调后才生成订单，同时生成第拼团第二单pay_sn
//如果是拼团第二单则在拉取支付前，则使用生成的拼团第二单pay_sn进行支付，并且缓存锁定该团不允许其它用户再加入该团
$res = Order::joinGroup($input_date);
```


### 分享
** 功能描述 **
用户进入订单详情页，通过点击分享，将该条拼团信息分享至微信朋友圈。
> 这里需要确定是否只能分享朋友自己的拼团订单

** 实现方案 **
通过调用微信jsdk实现将该条信息分享至微信朋友圈，不考虑该条信息是否已经拼团完结或者失败，只以进入到拼团详情页面时候状态为准。


### 订单详情
** 功能描述 **
订单详情用于提供给用户查看所有正在进行的拼团订单，包括自己的拼团的订单，但是自己的拼团订单不提供加入拼团按钮
> 订单详情页将提供我的订单和所有的订单选项卡进行筛选

** 实现方案 **
查找出所有用户正在拼团的订单，自己所创建的订单，分页显示每次20条，用户自己的订单，将不显示加入拼团按钮，只提供分享该拼团按钮。

** 实现代码 **


### 数据表设计

** zo_orders **
```sql
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
```

** zo_pay_sn **
```sql
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
```

** zo_pay_sn_tmp **
```sql
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
```

** zo_pay_log **
```sql
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
```

** zo_order_goods **
```sql
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
```






































