-- 建立数据库
CREATE DATABASE `lalala` DEFAULT charset=utf8;
USE `lalala`;

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

INSERT INTO `test` (`id`, `title`, `time`, `updata_time`, `status`) VALUES (NULL, '测试', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1');

-- 轮播图数据表
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` VARCHAR(128) NOT NULL COMMENT 'Banner名称，通常作为标识',
  `description` VARCHAR(255) DEFAULT NULL COMMENT 'Banner描述',
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

  


  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图子类数据表';