
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;

create table `users`(
`id` int(11) not null auto_increment COMMENT '主键',
`tel` varchar(18) not null default '' COMMENT '电话号码',
`nickname` varchar(20) not null COMMENT '昵称',
`password` varchar(200) not null COMMENT '密码', 
`sex` enum('秀吉','男','女') not null default '秀吉' COMMENT '性别',
`address` varchar(200) not null default '' COMMENT '详细地址',
`country` varchar(40) not null default '' COMMENT '国家', 
`province` varchar(40) not null default '' COMMENT '省',
`city` varchar(40) not null default '' COMMENT '市',
`area` varchar(40) not null default '' COMMENT '区',
`email` varchar(100) not null default '' COMMENT '邮箱',
`regData` datetime not null default '' COMMENT '注册时间', 
`birth` datetime not null default '' COMMENT '出生日期',
`power` int not null  default '0' COMMENT '用户权限',
`del` int not null default '1' COMMENT '是否删除 1=存在（显示） 0=删除（不显示） 后台能恢复',
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (
    '1', '15284752021', '我好方', '123456', '秀吉',
    '戛纳湾','中国','四川省','成都市','双流区',
    '1443361015@qq.com','1970-01-01','1996-10-11',
    '5','1'
);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;