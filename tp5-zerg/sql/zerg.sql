-- 建立数据库
CREATE DATABASE `zerg` DEFAULT charset=utf8;
USE `zerg`;

-- 测试表建立
DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` VARCHAR(128) NOT NULL COMMENT '测试',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updata_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '状态(单选):0=未激活,1=激活',
  PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表管理';

INSERT INTO `test` (`title`) VALUES ('测试');

-- 轮播图数据表
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(128) NOT NULL COMMENT 'Banner名称，通常作为标识',
  `description` VARCHAR(256) DEFAULT NULL COMMENT 'Banner描述',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '状态(单选):0=未激活,1=激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='banner管理表';

INSERT INTO `banner` (`name`, `description`) VALUES ('首页置顶', '首页轮播图');

-- 轮播图子类数据表
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img_id` INT UNSIGNED NOT NULL COMMENT '外键，关联image表',
  `banner_id` INT UNSIGNED NOT NULL COMMENT '外键，关联banner表',
  `key_word` VARCHAR(128) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '状态(单选)跳转类型，可能导向商品，可能导向专题，可能导向其他。:0=无导向,1=导向商品,2=导向专题',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='轮播图子类数据表';

INSERT INTO `banner_item` (`img_id`, `banner_id`,`key_word`,`type`) VALUES ('65', '6', '1','1');
INSERT INTO `banner_item` (`img_id`, `banner_id`,`key_word`,`type`) VALUES ('2', '25', '1','1');
INSERT INTO `banner_item` (`img_id`, `banner_id`,`key_word`,`type`) VALUES ('3', '11', '1','1');
INSERT INTO `banner_item` (`img_id`, `banner_id`,`key_word`,`type`) VALUES ('1', '10', '1','1');

-- 商品类目
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(64) NOT NULL COMMENT '分类名称',
  `topic_img_id` INT UNSIGNED DEFAULT NULL COMMENT '外键，关联image表',
  `description` VARCHAR(256) DEFAULT NULL COMMENT '描述',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类目';

INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('果味', '6');
INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('蔬菜', '5');
INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('炒货', '7');
INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('点心', '4');
INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('粗茶', '8');
INSERT INTO `category` (`name`, `topic_img_id`) VALUES ('淡饭', '9');

-- 图片总表
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` VARCHAR(256) NOT NULL COMMENT '图片路径',
  `from` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '状态(单选):1=来自本地，2=来自公网',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片总表';

INSERT INTO `image` (`url`) VALUES ('/banner-1a.png');
INSERT INTO `image` (`url`) VALUES ('/banner-2a.png');
INSERT INTO `image` (`url`) VALUES ('/banner-3a.png');
INSERT INTO `image` (`url`) VALUES ('/category-cake.png');
INSERT INTO `image` (`url`) VALUES ('/category-vg.png');
INSERT INTO `image` (`url`) VALUES ('/category-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/category-fry-a.png');
INSERT INTO `image` (`url`) VALUES ('/category-tea.png');
INSERT INTO `image` (`url`) VALUES ('/category-rice.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-vg@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@6.png');
INSERT INTO `image` (`url`) VALUES ('/1@theme.png');
INSERT INTO `image` (`url`) VALUES ('/2@theme.png');
INSERT INTO `image` (`url`) VALUES ('/3@theme.png');
INSERT INTO `image` (`url`) VALUES ('/detail-1@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-2@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-3@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-4@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-5@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-6@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-7@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-8@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-9@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-11@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-10@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-tea@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@3.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@4.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@5.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit-a@6.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@7.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@3.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@4.png');
INSERT INTO `image` (`url`) VALUES ('/product-fry@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-fry@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-fry@3.png');
INSERT INTO `image` (`url`) VALUES ('/product-tea@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-tea@3.png');
INSERT INTO `image` (`url`) VALUES ('/1@theme-head.png');
INSERT INTO `image` (`url`) VALUES ('/2@theme-head.png');
INSERT INTO `image` (`url`) VALUES ('/3@theme-head.png');
INSERT INTO `image` (`url`) VALUES ('/product-cake@1.png');
INSERT INTO `image` (`url`) VALUES ('/product-cake@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-cake-a@3.png');
INSERT INTO `image` (`url`) VALUES ('/product-cake-a@4.png');
INSERT INTO `image` (`url`) VALUES ('/product-dryfruit@8.png');
INSERT INTO `image` (`url`) VALUES ('/product-fry@4.png');
INSERT INTO `image` (`url`) VALUES ('/product-fry@5.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@5.png');
INSERT INTO `image` (`url`) VALUES ('/product-rice@7.png');
INSERT INTO `image` (`url`) VALUES ('/detail-12@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/detail-13@1-dryfruit.png');
INSERT INTO `image` (`url`) VALUES ('/banner-4a.png');
INSERT INTO `image` (`url`) VALUES ('/product-vg@4.png');
INSERT INTO `image` (`url`) VALUES ('/product-vg@5.png');
INSERT INTO `image` (`url`) VALUES ('/product-vg@2.png');
INSERT INTO `image` (`url`) VALUES ('/product-vg@3.png');

-- 订单表
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` VARCHAR(32) NOT NULL COMMENT '订单号',
  `user_id` INT NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `total_price` DECIMAL(6,2) NOT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1:未支付,2:已支付,3:已发货,4:已支付，但库存不足',
  `snap_img` VARCHAR(256) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` VARCHAR(128) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` INT NOT NULL DEFAULT '0',
  `snap_items` TEXT COMMENT '订单其他信息快照（json)',
  `snap_address` VARCHAR(512) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` VARCHAR(128) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- 订单产品关联表
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` INT NOT NULL COMMENT '联合主键，订单id',
  `product_id` INT NOT NULL COMMENT '联合主键，商品id',
  `count` INT NOT NULL COMMENT '商品数量',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`,`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单产品关联表';

-- 产品表
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` INT UNSIGNED DEFAULT NULL,
  `img_id` INT UNSIGNED NOT NULL COMMENT '图片外键',
  `name` VARCHAR(128) NOT NULL COMMENT '商品名称',
  `price` DECIMAL(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` INT NOT NULL DEFAULT '0' COMMENT '库存量',
  `main_img_url` VARCHAR(256) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '图片来自:1=本地,2=公网',
  `summary` VARCHAR(64) DEFAULT NULL COMMENT '摘要',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('芹菜 半斤', '0.01', '998', null, '3', '/product-vg@1.png', '13');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('梨花带雨 3个', '0.01', '984', null, '2', '/product-dryfruit@1.png', '10');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('素米 327克', '0.01', '996', null, '7', '/product-rice@1.png', '31');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('红袖枸杞 6克*3袋', '0.01', '998', null, '6', '/product-tea@1.png', '32');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('春生龙眼 500克', '0.01', '995', null, '2', '/product-dryfruit@2.png', '33');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('小红的猪耳朵 120克', '0.01', '997', null, '5', '/product-cake@2.png', '53');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('泥蒿 半斤', '0.01', '998', null, '3', '/product-vg@2.png', '68');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('夏日芒果 3个', '0.01', '995', null, '2', '/product-dryfruit@3.png', '36');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('冬木红枣 500克', '0.01', '996', null, '2', '/product-dryfruit@4.png', '37');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('万紫千凤梨 300克', '0.01', '996', null, '2', '/product-dryfruit@5.png', '38');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('贵妃笑 100克', '0.01', '994', null, '2', '/product-dryfruit-a@6.png', '39');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('珍奇异果 3个', '0.01', '999', null, '2', '/product-dryfruit@7.png', '40');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('绿豆 125克', '0.01', '999', null, '7', '/product-rice@2.png', '41');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('芝麻 50克', '0.01', '999', null, '7', '/product-rice@3.png', '42');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('猴头菇 370克', '0.01', '999', null, '7', '/product-rice@4.png', '43');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('西红柿 1斤', '0.01', '999', null, '3', '/product-vg@3.png', '69');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('油炸花生 300克', '0.01', '999', null, '4', '/product-fry@1.png', '44');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('春泥西瓜子 128克', '0.01', '997', null, '4', '/product-fry@2.png', '45');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('碧水葵花籽 128克', '0.01', '999', null, '4', '/product-fry@3.png', '46');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('碧螺春 12克*3袋', '0.01', '999', null, '6', '/product-tea@2.png', '47');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('西湖龙井 8克*3袋', '0.01', '998', null, '6', '/product-tea@3.png', '48');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('梅兰清花糕 1个', '0.01', '997', null, '5', '/product-cake-a@3.png', '54');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('清凉薄荷糕 1个', '0.01', '998', null, '5', '/product-cake-a@4.png', '55');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('小明的妙脆角 120克', '0.01', '999', null, '5', '/product-cake@1.png', '52');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('红衣青瓜 混搭160克', '0.01', '999', null, '2', '/product-dryfruit@8.png', '56');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('锈色瓜子 100克', '0.01', '998', null, '4', '/product-fry@4.png', '57');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('春泥花生 200克', '0.01', '999', null, '4', '/product-fry@5.png', '58');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('冰心鸡蛋 2个', '0.01', '999', null, '7', '/product-rice@5.png', '59');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('八宝莲子 200克', '0.01', '999', null, '7', '/product-rice@6.png', '14');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('深涧木耳 78克', '0.01', '999', null, '7', '/product-rice@7.png', '60');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('土豆 半斤', '0.01', '999', null, '3', '/product-vg@4.png', '66');
INSERT INTO `product` (`name`,`price`,`stock`,`summary`,`category_id`,`main_img_url`,`img_id`) VALUES ('青椒 半斤', '0.01', '999', null, '3', '/product-vg@5.png', '67');

-- 产品图片关联表
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img_id` INT UNSIGNED NOT NULL COMMENT '外键，关联图片表',
  `order` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` INT UNSIGNED NOT NULL COMMENT '商品id，外键',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品图片关联表';

INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('4', '19', '1', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('5', '20', '2', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('6', '21', '3', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('7', '22', '4', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('8', '23', '5', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('9', '24', '6', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('10', '25', '7', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('11', '26', '8', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('12', '27', '9', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('13', '28', '11', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('14', '29', '10', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('18', '62', '12', '11');
INSERT INTO `product_image` (`id`,`img_id`,`order`,`product_id`) VALUES ('19', '63', '13', '11');

-- 产品特性关联表
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(64) DEFAULT '' COMMENT '详情属性名称',
  `detail` VARCHAR(256) NOT NULL COMMENT '详情属性',
  `product_id` INT NOT NULL COMMENT '商品id，外键',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品特性关联表';

INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('品名', '杨梅', '11');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('口味', '青梅味 雪梨味 黄桃味 菠萝味', '11');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('产地', '火星', '11');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('保质期', '180天', '11');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('品名', '梨子', '2');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('产地', '金星', '2');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('净含量', '100g', '2');
INSERT INTO `product_property` (`name`,`detail`,`product_id`) VALUES ('保质期', '10天', '2');

-- 主题信息表
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(64) NOT NULL COMMENT '专题名称',
  `description` VARCHAR(256) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` INT NOT NULL COMMENT '主题图，外键',
  `head_img_id` INT NOT NULL COMMENT '专题列表页，头图',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题信息表';

INSERT INTO `theme` (`name`,`description`,`topic_img_id`,`head_img_id`) VALUES ('专题栏位一', '美味水果世界', '16', '49');
INSERT INTO `theme` (`name`,`description`,`topic_img_id`,`head_img_id`) VALUES ('专题栏位二', '新品推荐', '17', '50');
INSERT INTO `theme` (`name`,`description`,`topic_img_id`,`head_img_id`) VALUES ('专题栏位三', '做个干物女', '18', '18');

-- 主题所包含的商品
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` INT UNSIGNED NOT NULL COMMENT '主题外键',
  `product_id` INT UNSIGNED NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- 访问API的各应用账号密码表
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` VARCHAR(64) NOT NULL COMMENT '应用app_id',
  `app_secret` VARCHAR(64) NOT NULL COMMENT '应用secret',
  `app_description` VARCHAR(128) DEFAULT NULL COMMENT '应用程序描述',
  `scope` VARCHAR(32) NOT NULL COMMENT '应用权限',
  `scope_description` VARCHAR(128) DEFAULT NULL COMMENT '权限描述',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='访问API的各应用账号密码表';

INSERT INTO `third_app` (`app_id`,`app_secret`,`app_description`,`scope`,`scope_description`) VALUES ('starcraft', '777*777', 'CMS', '32', 'Super');

-- 用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `openid` VARCHAR(64) NOT NULL COMMENT '微信openid',
  `nickname` VARCHAR(64) NOT NULL COMMENT '昵称',
  `extend` VARCHAR(128) DEFAULT NULL COMMENT '扩展描述',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- 用户信息关联表
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` INT UNSIGNED NOT NULL COMMENT '外键',
  `name` VARCHAR(32) NOT NULL COMMENT '收获人姓名',
  `mobile` VARCHAR(32) NOT NULL COMMENT '手机号',
  `province` VARCHAR(32) DEFAULT NULL COMMENT '省',
  `city` VARCHAR(32) DEFAULT NULL COMMENT '市',
  `country` VARCHAR(32) DEFAULT NULL COMMENT '区',
  `detail` VARCHAR(128) DEFAULT NULL COMMENT '详细地址',
  `time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息关联表';