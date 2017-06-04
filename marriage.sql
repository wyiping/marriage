/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : marriage

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-06-04 16:03:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL COMMENT '发送者ID',
  `receiver` int(11) NOT NULL COMMENT '接收者ID',
  `message` varchar(255) NOT NULL,
  `time` date NOT NULL,
  `status` varchar(255) DEFAULT '',
  PRIMARY KEY (`mid`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `receiver` FOREIGN KEY (`receiver`) REFERENCES `user` (`userid`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` float(5,2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL COMMENT '详细信息',
  `marital_situatio` tinyint(1) unsigned zerofill DEFAULT NULL COMMENT '婚姻状况',
  `role` varchar(10) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`userid`,`username`),
  UNIQUE KEY `username` (`username`),
  KEY `userid` (`userid`),
  KEY `userid_2` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'abc', 'admin', 'male', '178.00', '1990-05-16', 'admin@marriage.com', 'test', '1', 'admin', null);
SET FOREIGN_KEY_CHECKS=1;
