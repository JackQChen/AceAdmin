/*
Navicat MySQL Data Transfer

Source Server         : pi
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : ace

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-29 15:25:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_unit
-- ----------------------------
INSERT INTO `t_unit` VALUES ('1', '信息科', '1', '1');
INSERT INTO `t_unit` VALUES ('2', '内科', '2', '2');
INSERT INTO `t_unit` VALUES ('3', '外科', '3', '3');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Birth` datetime DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Photo` longblob,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '管理员', 'M', null, '3', '5', null, null);
INSERT INTO `t_user` VALUES ('5', 'f', 'M', null, '3', '5', null, null);
INSERT INTO `t_user` VALUES ('6', 'kkkk', 'M', null, '3', '6', null, null);
INSERT INTO `t_user` VALUES ('7', 'dfs', null, null, '2', null, null, null);
INSERT INTO `t_user` VALUES ('8', 'df', 'M', null, '2', '8', null, null);
INSERT INTO `t_user` VALUES ('9', 'sd', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('10', 'fsd', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('11', 'f', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('12', 'sdf', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('13', 'sd', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('14', 'f', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('15', 'ds', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('16', 'fds', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('17', 'f', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('18', 'ds', null, null, '3', null, null, null);
INSERT INTO `t_user` VALUES ('19', 'f', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('20', 'sdf', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('21', 'ds', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('22', 'f', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('23', 'dsf', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('24', 'sd', null, null, null, null, null, null);
INSERT INTO `t_user` VALUES ('25', 'f', null, null, null, null, null, null);
