/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : marriage

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-05-27 12:00:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL COMMENT '详细信息',
  `marital_situatio` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '婚姻状况',
  `role` varchar(10) NOT NULL,
  `avatar` varchar(30) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'test', 'male', '178', null, '61780374@1163.com', 'test', '1', 'admin', null);
INSERT INTO `user` VALUES ('2', 'swq', 'swq', 'male', '666', null, '61780374@163.com', 'test', '0', 'user', null);
INSERT INTO `user` VALUES ('3', 'wyp', 'wyp', 'male', '121', '2017-10-10', '6178374@116.com', 'test', '0', 'user', null);
INSERT INTO `user` VALUES ('4', 'abc', 'esse', 'male', '3', '2017-05-17', 'z31@12.com', 'dsfa', '0', 'user', null);
INSERT INTO `user` VALUES ('5', 'ds', '12', 'male', '2', '2017-05-16', '2', '23', '0', 'user', null);
INSERT INTO `user` VALUES ('6', '432', '56', 'male', '56', '2017-05-01', '21', '21', '0', 'admin', null);
SET FOREIGN_KEY_CHECKS=1;
