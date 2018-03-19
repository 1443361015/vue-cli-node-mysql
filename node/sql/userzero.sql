/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Version : 50621
 Source Host           : localhost
 Source Database       : RUNOOB

 Target Server Version : 50621
 File Encoding         : utf-8

 Date: 05/18/2016 11:44:07 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `tel` varchar(255) NOT NULL DEFAULT '电话号码',
  `username` varchar(40) NOT NULL DEFAULT '0' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` enum('秀吉','男','女') not null default '秀吉' COMMENT '性别',
  `email` varchar(255) not null DEFAULT '' comment '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Records of `websites`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1','张三','18012345678','123456','123456','秀吉','18012345678@163.com');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


