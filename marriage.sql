/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : marriage

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-05-29 02:03:47
*/

SET FOREIGN_KEY_CHECKS=0;

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
  PRIMARY KEY (`mid`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `receiver` FOREIGN KEY (`receiver`) REFERENCES `user` (`userid`),
  CONSTRAINT `sender` FOREIGN KEY (`sender`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '2', '啊啊啊', '2017-05-29');
INSERT INTO `message` VALUES ('2', '1', '3', '！！！！！', '2017-05-29');
INSERT INTO `message` VALUES ('3', '1', '4', '535353', '2017-05-29');
INSERT INTO `message` VALUES ('4', '1', '6', '从v现代风格', '2017-05-29');
INSERT INTO `message` VALUES ('5', '1', '5', '擦速度擦', '2017-05-29');

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
INSERT INTO `user` VALUES ('1', 'admin', 'abc', 'admin', 'male', '178.00', '1990-05-16', 'test@163.com', 'test', '1', 'admin', null);
INSERT INTO `user` VALUES ('2', 'test', 'test', 'test', 'female', '158.00', '1992-09-18', 'test@163.com', 'test', '0', 'admin', 'ca48f8e7-4593-4dc1-909c-25eb8b46e493.jpg');
INSERT INTO `user` VALUES ('3', 'wyp', 'abcd', 'wyp', 'male', '178.00', '1993-11-29', 'test@163.com', 'test', '0', 'user', null);
INSERT INTO `user` VALUES ('4', 'abc', 'abcde', 'esse', 'male', '165.00', '2010-05-11', 'test@163.com', 'dsfa', '0', 'user', null);
INSERT INTO `user` VALUES ('5', 'ds', 'efg', '12', 'male', '168.00', '1992-05-14', 'test@163.com', '23', '1', 'user', null);
INSERT INTO `user` VALUES ('6', '432', 'bcd', '56', 'male', '156.00', '1985-12-19', 'test@163.com', '21', '0', 'admin', null);
