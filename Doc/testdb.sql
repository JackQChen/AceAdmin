/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : testdb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2018-10-31 10:07:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CName` varchar(256) DEFAULT NULL,
  `EName` varchar(256) DEFAULT NULL,
  `ImageUrl` varchar(1024) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES ('1', '老板电器', '老板电器', null, '\0', '0', null, '0', '2018-08-31 13:56:02');

-- ----------------------------
-- Table structure for pms_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_category`;
CREATE TABLE `pms_category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ParentId` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_category
-- ----------------------------
INSERT INTO `pms_category` VALUES ('1', '0', '1', '电器', '\0', '0', null, '0', '2018-08-29 16:05:35');
INSERT INTO `pms_category` VALUES ('2', '0', '1', '衣服', '\0', '0', null, '0', '2018-08-29 16:06:23');
INSERT INTO `pms_category` VALUES ('3', '1', '2', '生活电器', '\0', '0', '0', '0', '2018-08-29 16:07:30');
INSERT INTO `pms_category` VALUES ('4', '3', '3', '电视', '\0', '0', null, '0', '2018-08-29 16:08:01');

-- ----------------------------
-- Table structure for pms_category_property
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_property`;
CREATE TABLE `pms_category_property` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_category_property
-- ----------------------------

-- ----------------------------
-- Table structure for pms_category_property_option
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_property_option`;
CREATE TABLE `pms_category_property_option` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PropertyId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_category_property_option
-- ----------------------------

-- ----------------------------
-- Table structure for pms_category_specification
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_specification`;
CREATE TABLE `pms_category_specification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_category_specification
-- ----------------------------

-- ----------------------------
-- Table structure for pms_category_specification_option
-- ----------------------------
DROP TABLE IF EXISTS `pms_category_specification_option`;
CREATE TABLE `pms_category_specification_option` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SpecificationId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_category_specification_option
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BrandId` int(11) NOT NULL,
  `Category1Id` int(11) NOT NULL,
  `Category2Id` int(11) NOT NULL,
  `Category3Id` int(11) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Details` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_item
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_item`;
CREATE TABLE `pms_product_item` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `VendorId` int(11) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `UnitName` varchar(16) DEFAULT NULL,
  `SalePrice` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_item
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_item_property_option
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_item_property_option`;
CREATE TABLE `pms_product_item_property_option` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductItemId` int(11) NOT NULL,
  `PropertyId` int(11) NOT NULL,
  `PropertyOptionId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_item_property_option
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_photo
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_photo`;
CREATE TABLE `pms_product_photo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `BigImgUrl` varchar(1024) DEFAULT NULL,
  `MiddleImgUrl` varchar(1024) DEFAULT NULL,
  `SmallImgUrl` varchar(1024) DEFAULT NULL,
  `Sort` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_photo
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_specification_option
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_specification_option`;
CREATE TABLE `pms_product_specification_option` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `SpecificationId` int(11) NOT NULL,
  `SpecificationOptionId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_specification_option
-- ----------------------------

-- ----------------------------
-- Table structure for pms_unit
-- ----------------------------
DROP TABLE IF EXISTS `pms_unit`;
CREATE TABLE `pms_unit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_unit
-- ----------------------------

-- ----------------------------
-- Table structure for pms_vendor
-- ----------------------------
DROP TABLE IF EXISTS `pms_vendor`;
CREATE TABLE `pms_vendor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_vendor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_error_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_error_log`;
CREATE TABLE `sys_error_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `HttpType` varchar(8) DEFAULT NULL,
  `URL` varchar(512) DEFAULT NULL,
  `Parameters` longtext,
  `ControllerName` varchar(64) DEFAULT NULL,
  `ActionName` varchar(128) DEFAULT NULL,
  `Message` longtext,
  `SystemName` varchar(128) DEFAULT NULL,
  `ErrorSource` longtext,
  `IPAddress` varchar(255) DEFAULT NULL,
  `ErrorStack` longtext,
  `LoginID` int(11) NOT NULL,
  `LoginName` varchar(16) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_error_log
-- ----------------------------
INSERT INTO `sys_error_log` VALUES ('1', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:29:52');
INSERT INTO `sys_error_log` VALUES ('2', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:30:10');
INSERT INTO `sys_error_log` VALUES ('3', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:30:21');
INSERT INTO `sys_error_log` VALUES ('4', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:15');
INSERT INTO `sys_error_log` VALUES ('5', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:35');
INSERT INTO `sys_error_log` VALUES ('6', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:15');
INSERT INTO `sys_error_log` VALUES ('7', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:39');
INSERT INTO `sys_error_log` VALUES ('8', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:50');
INSERT INTO `sys_error_log` VALUES ('9', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:53');
INSERT INTO `sys_error_log` VALUES ('10', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:06');
INSERT INTO `sys_error_log` VALUES ('11', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:10');
INSERT INTO `sys_error_log` VALUES ('12', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:23');
INSERT INTO `sys_error_log` VALUES ('13', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:27');
INSERT INTO `sys_error_log` VALUES ('14', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:31');
INSERT INTO `sys_error_log` VALUES ('15', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:12');
INSERT INTO `sys_error_log` VALUES ('16', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:15');
INSERT INTO `sys_error_log` VALUES ('17', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:17');
INSERT INTO `sys_error_log` VALUES ('18', 'GET', 'localhost:61479/SysRole/Edit/0', null, 'SysRole', 'Edit', null, '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:32');
INSERT INTO `sys_error_log` VALUES ('19', 'POST', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=&newPwd1=', 'Account', 'ModifyPassword', 'Column \'LoginPwd\' cannot be null', '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:12:03');
INSERT INTO `sys_error_log` VALUES ('20', 'POST', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=&newPwd1=', 'Account', 'ModifyPassword', 'Column \'LoginPwd\' cannot be null', '客户关系管理系统', null, '::1', null, '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:12:10');

-- ----------------------------
-- Table structure for sys_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_module`;
CREATE TABLE `sys_module` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `IcoPath` varchar(128) DEFAULT NULL,
  `IsMenu` bit(1) NOT NULL,
  `ControllerName` varchar(128) DEFAULT NULL,
  `ActionName` varchar(128) DEFAULT NULL,
  `IsGet` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_module
-- ----------------------------
INSERT INTO `sys_module` VALUES ('1', '0', '系统管理', null, '\0', null, null, '\0', '\0', '0', null, '0', '2018-07-12 00:00:00');
INSERT INTO `sys_module` VALUES ('2', '1', '权限设置', null, '\0', null, null, '\0', '\0', '0', null, '0', '2018-07-12 00:00:00');
INSERT INTO `sys_module` VALUES ('3', '2', '菜单管理', null, '\0', 'SysModule', 'Manager', '\0', '\0', '0', null, '0', '2018-07-12 00:00:00');
INSERT INTO `sys_module` VALUES ('4', '1', '日志管理', null, '\0', null, null, '\0', '\0', '0', null, '0', '2018-08-13 15:26:03');
INSERT INTO `sys_module` VALUES ('5', '4', '操作日志', null, '\0', 'Log', 'ReqeustLogManger', '\0', '\0', '0', null, '0', '2018-08-13 15:26:19');
INSERT INTO `sys_module` VALUES ('6', '4', '异常日志', null, '\0', 'Log', 'ExceptionLogManger', '\0', '\0', '0', null, '0', '2018-08-13 15:26:45');
INSERT INTO `sys_module` VALUES ('7', '2', '角色管理', null, '\0', 'SysRole', 'Manager', '\0', '\0', '0', null, '0', '2018-08-13 15:27:08');
INSERT INTO `sys_module` VALUES ('8', '2', '用户管理', null, '\0', 'SysUser', 'Manager', '\0', '', '0', null, '0', '2018-08-14 10:05:05');
INSERT INTO `sys_module` VALUES ('9', '2', '用户管理', null, '\0', 'SysUser', 'Manager', '\0', '', '0', null, '0', '2018-08-14 10:05:10');
INSERT INTO `sys_module` VALUES ('10', '2', '用户管理', null, '\0', 'SysUser', 'Manager', '\0', '', '0', null, '0', '2018-08-14 10:05:15');
INSERT INTO `sys_module` VALUES ('11', '2', '用户管理', null, '\0', 'SysUser', 'Manager', '\0', '\0', '0', null, '0', '2018-08-14 10:35:13');
INSERT INTO `sys_module` VALUES ('12', '4', 'cc', null, '\0', 'a', null, '\0', '', '0', null, '0', '2018-08-15 10:55:28');
INSERT INTO `sys_module` VALUES ('13', '6', 'aa', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-15 10:59:43');
INSERT INTO `sys_module` VALUES ('14', '6', 'aa', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-15 10:59:45');
INSERT INTO `sys_module` VALUES ('15', '6', 'aaa', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-15 10:59:45');
INSERT INTO `sys_module` VALUES ('16', '6', 'bb', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-15 11:02:54');
INSERT INTO `sys_module` VALUES ('17', '4', 'crm', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-28 11:16:10');
INSERT INTO `sys_module` VALUES ('18', '4', 'crm', null, '\0', null, null, '\0', '', '0', null, '0', '2018-08-28 11:16:17');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SystemName` varchar(64) DEFAULT NULL,
  `URL` longtext,
  `Parameters` longtext,
  `ControllerName` varchar(64) NOT NULL,
  `ActionName` varchar(128) NOT NULL,
  `HttpStatusCode` int(11) NOT NULL,
  `HttpType` varchar(4) DEFAULT NULL,
  `IPAddress` varchar(64) DEFAULT NULL,
  `LoginID` int(11) NOT NULL,
  `LoginName` varchar(16) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('1', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:32:36');
INSERT INTO `sys_operation_log` VALUES ('2', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:32:42');
INSERT INTO `sys_operation_log` VALUES ('3', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:37:46');
INSERT INTO `sys_operation_log` VALUES ('4', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:37:52');
INSERT INTO `sys_operation_log` VALUES ('5', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:39:50');
INSERT INTO `sys_operation_log` VALUES ('6', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:39:58');
INSERT INTO `sys_operation_log` VALUES ('7', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:42:48');
INSERT INTO `sys_operation_log` VALUES ('8', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:54:29');
INSERT INTO `sys_operation_log` VALUES ('9', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-02 17:54:42');
INSERT INTO `sys_operation_log` VALUES ('10', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 14:59:29');
INSERT INTO `sys_operation_log` VALUES ('11', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 14:59:35');
INSERT INTO `sys_operation_log` VALUES ('12', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:07');
INSERT INTO `sys_operation_log` VALUES ('13', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:12');
INSERT INTO `sys_operation_log` VALUES ('14', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:44');
INSERT INTO `sys_operation_log` VALUES ('15', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:48');
INSERT INTO `sys_operation_log` VALUES ('16', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:49');
INSERT INTO `sys_operation_log` VALUES ('17', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:49');
INSERT INTO `sys_operation_log` VALUES ('18', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:04:51');
INSERT INTO `sys_operation_log` VALUES ('19', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:05:06');
INSERT INTO `sys_operation_log` VALUES ('20', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:05:29');
INSERT INTO `sys_operation_log` VALUES ('21', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:05:33');
INSERT INTO `sys_operation_log` VALUES ('22', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=2-10-11&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:10:21');
INSERT INTO `sys_operation_log` VALUES ('23', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-03 15:11:15');
INSERT INTO `sys_operation_log` VALUES ('24', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 09:25:43');
INSERT INTO `sys_operation_log` VALUES ('25', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 09:25:58');
INSERT INTO `sys_operation_log` VALUES ('26', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:31:26');
INSERT INTO `sys_operation_log` VALUES ('27', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:31:42');
INSERT INTO `sys_operation_log` VALUES ('28', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:31:45');
INSERT INTO `sys_operation_log` VALUES ('29', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:32:04');
INSERT INTO `sys_operation_log` VALUES ('30', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:32:10');
INSERT INTO `sys_operation_log` VALUES ('31', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:32:39');
INSERT INTO `sys_operation_log` VALUES ('32', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:34:27');
INSERT INTO `sys_operation_log` VALUES ('33', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:35:02');
INSERT INTO `sys_operation_log` VALUES ('34', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:35:36');
INSERT INTO `sys_operation_log` VALUES ('35', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:36:28');
INSERT INTO `sys_operation_log` VALUES ('36', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:39:19');
INSERT INTO `sys_operation_log` VALUES ('37', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:39:44');
INSERT INTO `sys_operation_log` VALUES ('38', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:39:59');
INSERT INTO `sys_operation_log` VALUES ('39', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:40:38');
INSERT INTO `sys_operation_log` VALUES ('40', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:42:26');
INSERT INTO `sys_operation_log` VALUES ('41', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:43:19');
INSERT INTO `sys_operation_log` VALUES ('42', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:43:30');
INSERT INTO `sys_operation_log` VALUES ('43', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:45:13');
INSERT INTO `sys_operation_log` VALUES ('44', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:45:17');
INSERT INTO `sys_operation_log` VALUES ('45', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:47:06');
INSERT INTO `sys_operation_log` VALUES ('46', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:47:07');
INSERT INTO `sys_operation_log` VALUES ('47', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:49:46');
INSERT INTO `sys_operation_log` VALUES ('48', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:51:12');
INSERT INTO `sys_operation_log` VALUES ('49', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:52:05');
INSERT INTO `sys_operation_log` VALUES ('50', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:55:58');
INSERT INTO `sys_operation_log` VALUES ('51', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:56:16');
INSERT INTO `sys_operation_log` VALUES ('52', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 13:59:11');
INSERT INTO `sys_operation_log` VALUES ('53', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:00:19');
INSERT INTO `sys_operation_log` VALUES ('54', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:00:39');
INSERT INTO `sys_operation_log` VALUES ('55', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:02:28');
INSERT INTO `sys_operation_log` VALUES ('56', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:02:34');
INSERT INTO `sys_operation_log` VALUES ('57', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:07:00');
INSERT INTO `sys_operation_log` VALUES ('58', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:07:09');
INSERT INTO `sys_operation_log` VALUES ('59', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:07:35');
INSERT INTO `sys_operation_log` VALUES ('60', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:07:54');
INSERT INTO `sys_operation_log` VALUES ('61', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:08:11');
INSERT INTO `sys_operation_log` VALUES ('62', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:09:29');
INSERT INTO `sys_operation_log` VALUES ('63', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:10:33');
INSERT INTO `sys_operation_log` VALUES ('64', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:11:01');
INSERT INTO `sys_operation_log` VALUES ('65', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:11:08');
INSERT INTO `sys_operation_log` VALUES ('66', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:11:42');
INSERT INTO `sys_operation_log` VALUES ('67', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:12:06');
INSERT INTO `sys_operation_log` VALUES ('68', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:13:52');
INSERT INTO `sys_operation_log` VALUES ('69', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:14:11');
INSERT INTO `sys_operation_log` VALUES ('70', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:14:46');
INSERT INTO `sys_operation_log` VALUES ('71', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:14:49');
INSERT INTO `sys_operation_log` VALUES ('72', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:15:33');
INSERT INTO `sys_operation_log` VALUES ('73', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:15:36');
INSERT INTO `sys_operation_log` VALUES ('74', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:15:43');
INSERT INTO `sys_operation_log` VALUES ('75', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:15:47');
INSERT INTO `sys_operation_log` VALUES ('76', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:16:04');
INSERT INTO `sys_operation_log` VALUES ('77', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:16:17');
INSERT INTO `sys_operation_log` VALUES ('78', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:16:42');
INSERT INTO `sys_operation_log` VALUES ('79', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:17:57');
INSERT INTO `sys_operation_log` VALUES ('80', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:17:59');
INSERT INTO `sys_operation_log` VALUES ('81', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:19:16');
INSERT INTO `sys_operation_log` VALUES ('82', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:19:18');
INSERT INTO `sys_operation_log` VALUES ('83', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:19:40');
INSERT INTO `sys_operation_log` VALUES ('84', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:21:02');
INSERT INTO `sys_operation_log` VALUES ('85', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:21:14');
INSERT INTO `sys_operation_log` VALUES ('86', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:22:48');
INSERT INTO `sys_operation_log` VALUES ('87', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:23:55');
INSERT INTO `sys_operation_log` VALUES ('88', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:24:15');
INSERT INTO `sys_operation_log` VALUES ('89', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:24:22');
INSERT INTO `sys_operation_log` VALUES ('90', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:24:52');
INSERT INTO `sys_operation_log` VALUES ('91', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:25:07');
INSERT INTO `sys_operation_log` VALUES ('92', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:25:54');
INSERT INTO `sys_operation_log` VALUES ('93', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:27:02');
INSERT INTO `sys_operation_log` VALUES ('94', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:27:24');
INSERT INTO `sys_operation_log` VALUES ('95', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:28:08');
INSERT INTO `sys_operation_log` VALUES ('96', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:28:36');
INSERT INTO `sys_operation_log` VALUES ('97', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:29:34');
INSERT INTO `sys_operation_log` VALUES ('98', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:30:12');
INSERT INTO `sys_operation_log` VALUES ('99', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:30:34');
INSERT INTO `sys_operation_log` VALUES ('100', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:31:41');
INSERT INTO `sys_operation_log` VALUES ('101', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:31:50');
INSERT INTO `sys_operation_log` VALUES ('102', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:32:00');
INSERT INTO `sys_operation_log` VALUES ('103', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:32:27');
INSERT INTO `sys_operation_log` VALUES ('104', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:35:23');
INSERT INTO `sys_operation_log` VALUES ('105', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:36:50');
INSERT INTO `sys_operation_log` VALUES ('106', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:37:10');
INSERT INTO `sys_operation_log` VALUES ('107', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:37:19');
INSERT INTO `sys_operation_log` VALUES ('108', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:37:54');
INSERT INTO `sys_operation_log` VALUES ('109', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:38:31');
INSERT INTO `sys_operation_log` VALUES ('110', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:38:36');
INSERT INTO `sys_operation_log` VALUES ('111', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:40:08');
INSERT INTO `sys_operation_log` VALUES ('112', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:41:47');
INSERT INTO `sys_operation_log` VALUES ('113', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:41:55');
INSERT INTO `sys_operation_log` VALUES ('114', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:42:13');
INSERT INTO `sys_operation_log` VALUES ('115', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:42:33');
INSERT INTO `sys_operation_log` VALUES ('116', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:43:48');
INSERT INTO `sys_operation_log` VALUES ('117', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:44:28');
INSERT INTO `sys_operation_log` VALUES ('118', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:47:30');
INSERT INTO `sys_operation_log` VALUES ('119', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:48:41');
INSERT INTO `sys_operation_log` VALUES ('120', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:49:13');
INSERT INTO `sys_operation_log` VALUES ('121', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:58:08');
INSERT INTO `sys_operation_log` VALUES ('122', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:58:21');
INSERT INTO `sys_operation_log` VALUES ('123', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:58:42');
INSERT INTO `sys_operation_log` VALUES ('124', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:58:56');
INSERT INTO `sys_operation_log` VALUES ('125', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:59:03');
INSERT INTO `sys_operation_log` VALUES ('126', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 14:59:10');
INSERT INTO `sys_operation_log` VALUES ('127', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:00:00');
INSERT INTO `sys_operation_log` VALUES ('128', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:01:02');
INSERT INTO `sys_operation_log` VALUES ('129', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:01:16');
INSERT INTO `sys_operation_log` VALUES ('130', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:01:45');
INSERT INTO `sys_operation_log` VALUES ('131', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:01:48');
INSERT INTO `sys_operation_log` VALUES ('132', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:01:53');
INSERT INTO `sys_operation_log` VALUES ('133', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:04:58');
INSERT INTO `sys_operation_log` VALUES ('134', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:05:17');
INSERT INTO `sys_operation_log` VALUES ('135', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:05:19');
INSERT INTO `sys_operation_log` VALUES ('136', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:05:26');
INSERT INTO `sys_operation_log` VALUES ('137', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:05:27');
INSERT INTO `sys_operation_log` VALUES ('138', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:09:38');
INSERT INTO `sys_operation_log` VALUES ('139', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:01');
INSERT INTO `sys_operation_log` VALUES ('140', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:03');
INSERT INTO `sys_operation_log` VALUES ('141', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:04');
INSERT INTO `sys_operation_log` VALUES ('142', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:18');
INSERT INTO `sys_operation_log` VALUES ('143', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:41');
INSERT INTO `sys_operation_log` VALUES ('144', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:42');
INSERT INTO `sys_operation_log` VALUES ('145', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:11:48');
INSERT INTO `sys_operation_log` VALUES ('146', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:12:41');
INSERT INTO `sys_operation_log` VALUES ('147', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:12:52');
INSERT INTO `sys_operation_log` VALUES ('148', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:13:19');
INSERT INTO `sys_operation_log` VALUES ('149', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:13:28');
INSERT INTO `sys_operation_log` VALUES ('150', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:13:35');
INSERT INTO `sys_operation_log` VALUES ('151', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:13:40');
INSERT INTO `sys_operation_log` VALUES ('152', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:13:54');
INSERT INTO `sys_operation_log` VALUES ('153', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:14:16');
INSERT INTO `sys_operation_log` VALUES ('154', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:15:49');
INSERT INTO `sys_operation_log` VALUES ('155', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:15:51');
INSERT INTO `sys_operation_log` VALUES ('156', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:15:58');
INSERT INTO `sys_operation_log` VALUES ('157', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:16:27');
INSERT INTO `sys_operation_log` VALUES ('158', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:16:40');
INSERT INTO `sys_operation_log` VALUES ('159', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:16:49');
INSERT INTO `sys_operation_log` VALUES ('160', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:16:57');
INSERT INTO `sys_operation_log` VALUES ('161', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:27:15');
INSERT INTO `sys_operation_log` VALUES ('162', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:27:45');
INSERT INTO `sys_operation_log` VALUES ('163', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:28:26');
INSERT INTO `sys_operation_log` VALUES ('164', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:28:31');
INSERT INTO `sys_operation_log` VALUES ('165', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:28:46');
INSERT INTO `sys_operation_log` VALUES ('166', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:29:10');
INSERT INTO `sys_operation_log` VALUES ('167', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:29:17');
INSERT INTO `sys_operation_log` VALUES ('168', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:29:25');
INSERT INTO `sys_operation_log` VALUES ('169', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:29:48');
INSERT INTO `sys_operation_log` VALUES ('170', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:31:34');
INSERT INTO `sys_operation_log` VALUES ('171', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:31:51');
INSERT INTO `sys_operation_log` VALUES ('172', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:32:48');
INSERT INTO `sys_operation_log` VALUES ('173', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:33:11');
INSERT INTO `sys_operation_log` VALUES ('174', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:33:37');
INSERT INTO `sys_operation_log` VALUES ('175', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:34:04');
INSERT INTO `sys_operation_log` VALUES ('176', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:34:14');
INSERT INTO `sys_operation_log` VALUES ('177', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:35:38');
INSERT INTO `sys_operation_log` VALUES ('178', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:35:43');
INSERT INTO `sys_operation_log` VALUES ('179', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:36:07');
INSERT INTO `sys_operation_log` VALUES ('180', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:36:13');
INSERT INTO `sys_operation_log` VALUES ('181', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:41:59');
INSERT INTO `sys_operation_log` VALUES ('182', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:48:32');
INSERT INTO `sys_operation_log` VALUES ('183', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:51:39');
INSERT INTO `sys_operation_log` VALUES ('184', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:52:03');
INSERT INTO `sys_operation_log` VALUES ('185', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:52:19');
INSERT INTO `sys_operation_log` VALUES ('186', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:52:27');
INSERT INTO `sys_operation_log` VALUES ('187', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:53:37');
INSERT INTO `sys_operation_log` VALUES ('188', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:53:49');
INSERT INTO `sys_operation_log` VALUES ('189', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:53:51');
INSERT INTO `sys_operation_log` VALUES ('190', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:55:02');
INSERT INTO `sys_operation_log` VALUES ('191', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:55:04');
INSERT INTO `sys_operation_log` VALUES ('192', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:55:29');
INSERT INTO `sys_operation_log` VALUES ('193', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:55:43');
INSERT INTO `sys_operation_log` VALUES ('194', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:56:40');
INSERT INTO `sys_operation_log` VALUES ('195', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:59:07');
INSERT INTO `sys_operation_log` VALUES ('196', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:59:14');
INSERT INTO `sys_operation_log` VALUES ('197', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:59:19');
INSERT INTO `sys_operation_log` VALUES ('198', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 15:59:34');
INSERT INTO `sys_operation_log` VALUES ('199', '客户关系管理系统', 'localhost:61478/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:00:18');
INSERT INTO `sys_operation_log` VALUES ('200', '客户关系管理系统', 'localhost:61478/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:00:24');
INSERT INTO `sys_operation_log` VALUES ('201', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:01:22');
INSERT INTO `sys_operation_log` VALUES ('202', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:01:55');
INSERT INTO `sys_operation_log` VALUES ('203', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:02:09');
INSERT INTO `sys_operation_log` VALUES ('204', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:02:35');
INSERT INTO `sys_operation_log` VALUES ('205', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:03:45');
INSERT INTO `sys_operation_log` VALUES ('206', '客户关系管理系统', 'localhost:61479/main/AceIndex', '', 'Main', 'AceIndex', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:06:09');
INSERT INTO `sys_operation_log` VALUES ('207', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:07:02');
INSERT INTO `sys_operation_log` VALUES ('208', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:07:07');
INSERT INTO `sys_operation_log` VALUES ('209', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:20:44');
INSERT INTO `sys_operation_log` VALUES ('210', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:20:48');
INSERT INTO `sys_operation_log` VALUES ('211', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:58:24');
INSERT INTO `sys_operation_log` VALUES ('212', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 16:58:27');
INSERT INTO `sys_operation_log` VALUES ('213', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 17:15:35');
INSERT INTO `sys_operation_log` VALUES ('214', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 17:15:42');
INSERT INTO `sys_operation_log` VALUES ('215', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 17:23:41');
INSERT INTO `sys_operation_log` VALUES ('216', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-08 17:23:45');
INSERT INTO `sys_operation_log` VALUES ('217', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 09:39:28');
INSERT INTO `sys_operation_log` VALUES ('218', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 09:39:35');
INSERT INTO `sys_operation_log` VALUES ('219', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 09:47:00');
INSERT INTO `sys_operation_log` VALUES ('220', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 09:55:07');
INSERT INTO `sys_operation_log` VALUES ('221', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 09:55:13');
INSERT INTO `sys_operation_log` VALUES ('222', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 10:01:57');
INSERT INTO `sys_operation_log` VALUES ('223', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 10:02:01');
INSERT INTO `sys_operation_log` VALUES ('224', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 11:46:25');
INSERT INTO `sys_operation_log` VALUES ('225', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 11:46:37');
INSERT INTO `sys_operation_log` VALUES ('226', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:10:22');
INSERT INTO `sys_operation_log` VALUES ('227', '客户关系管理系统', 'localhost:61479/account/login', '?nodeid=undefined&error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:10:37');
INSERT INTO `sys_operation_log` VALUES ('228', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:10:41');
INSERT INTO `sys_operation_log` VALUES ('229', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:29:41');
INSERT INTO `sys_operation_log` VALUES ('230', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:31:42');
INSERT INTO `sys_operation_log` VALUES ('231', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:31:44');
INSERT INTO `sys_operation_log` VALUES ('232', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:42:57');
INSERT INTO `sys_operation_log` VALUES ('233', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:43:02');
INSERT INTO `sys_operation_log` VALUES ('234', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:43:37');
INSERT INTO `sys_operation_log` VALUES ('235', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:43:47');
INSERT INTO `sys_operation_log` VALUES ('236', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:46:56');
INSERT INTO `sys_operation_log` VALUES ('237', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:47:00');
INSERT INTO `sys_operation_log` VALUES ('238', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:47:26');
INSERT INTO `sys_operation_log` VALUES ('239', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 13:47:30');
INSERT INTO `sys_operation_log` VALUES ('240', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:02');
INSERT INTO `sys_operation_log` VALUES ('241', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:06');
INSERT INTO `sys_operation_log` VALUES ('242', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:34');
INSERT INTO `sys_operation_log` VALUES ('243', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:35');
INSERT INTO `sys_operation_log` VALUES ('244', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:55');
INSERT INTO `sys_operation_log` VALUES ('245', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:11:59');
INSERT INTO `sys_operation_log` VALUES ('246', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:12:36');
INSERT INTO `sys_operation_log` VALUES ('247', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:12:48');
INSERT INTO `sys_operation_log` VALUES ('248', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:13:20');
INSERT INTO `sys_operation_log` VALUES ('249', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:18:44');
INSERT INTO `sys_operation_log` VALUES ('250', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:19:06');
INSERT INTO `sys_operation_log` VALUES ('251', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:21:14');
INSERT INTO `sys_operation_log` VALUES ('252', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:21:18');
INSERT INTO `sys_operation_log` VALUES ('253', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:24:43');
INSERT INTO `sys_operation_log` VALUES ('254', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:24:49');
INSERT INTO `sys_operation_log` VALUES ('255', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:28:09');
INSERT INTO `sys_operation_log` VALUES ('256', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:28:27');
INSERT INTO `sys_operation_log` VALUES ('257', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:28:42');
INSERT INTO `sys_operation_log` VALUES ('258', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:29:35');
INSERT INTO `sys_operation_log` VALUES ('259', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:29:37');
INSERT INTO `sys_operation_log` VALUES ('260', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:31:00');
INSERT INTO `sys_operation_log` VALUES ('261', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:31:02');
INSERT INTO `sys_operation_log` VALUES ('262', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:31:06');
INSERT INTO `sys_operation_log` VALUES ('263', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:33:05');
INSERT INTO `sys_operation_log` VALUES ('264', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:35:41');
INSERT INTO `sys_operation_log` VALUES ('265', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:36:27');
INSERT INTO `sys_operation_log` VALUES ('266', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:36:30');
INSERT INTO `sys_operation_log` VALUES ('267', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:36:32');
INSERT INTO `sys_operation_log` VALUES ('268', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:36:36');
INSERT INTO `sys_operation_log` VALUES ('269', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:36:42');
INSERT INTO `sys_operation_log` VALUES ('270', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:37:27');
INSERT INTO `sys_operation_log` VALUES ('271', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:38:10');
INSERT INTO `sys_operation_log` VALUES ('272', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:38:46');
INSERT INTO `sys_operation_log` VALUES ('273', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:39:18');
INSERT INTO `sys_operation_log` VALUES ('274', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:42:22');
INSERT INTO `sys_operation_log` VALUES ('275', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:42:31');
INSERT INTO `sys_operation_log` VALUES ('276', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:42:33');
INSERT INTO `sys_operation_log` VALUES ('277', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:44:14');
INSERT INTO `sys_operation_log` VALUES ('278', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 14:46:46');
INSERT INTO `sys_operation_log` VALUES ('279', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:08:12');
INSERT INTO `sys_operation_log` VALUES ('280', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:08:16');
INSERT INTO `sys_operation_log` VALUES ('281', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:08:29');
INSERT INTO `sys_operation_log` VALUES ('282', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:11:44');
INSERT INTO `sys_operation_log` VALUES ('283', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:11:59');
INSERT INTO `sys_operation_log` VALUES ('284', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:12:17');
INSERT INTO `sys_operation_log` VALUES ('285', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:12:33');
INSERT INTO `sys_operation_log` VALUES ('286', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:13:07');
INSERT INTO `sys_operation_log` VALUES ('287', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:13:29');
INSERT INTO `sys_operation_log` VALUES ('288', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:13:52');
INSERT INTO `sys_operation_log` VALUES ('289', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:14:10');
INSERT INTO `sys_operation_log` VALUES ('290', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:33:39');
INSERT INTO `sys_operation_log` VALUES ('291', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:33:44');
INSERT INTO `sys_operation_log` VALUES ('292', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:37:20');
INSERT INTO `sys_operation_log` VALUES ('293', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:39:45');
INSERT INTO `sys_operation_log` VALUES ('294', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:42:37');
INSERT INTO `sys_operation_log` VALUES ('295', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:42:40');
INSERT INTO `sys_operation_log` VALUES ('296', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:42:40');
INSERT INTO `sys_operation_log` VALUES ('297', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:42:42');
INSERT INTO `sys_operation_log` VALUES ('298', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:42:45');
INSERT INTO `sys_operation_log` VALUES ('299', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:43:57');
INSERT INTO `sys_operation_log` VALUES ('300', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:46:44');
INSERT INTO `sys_operation_log` VALUES ('301', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:46:48');
INSERT INTO `sys_operation_log` VALUES ('302', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:48:56');
INSERT INTO `sys_operation_log` VALUES ('303', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:49:00');
INSERT INTO `sys_operation_log` VALUES ('304', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 15:49:05');
INSERT INTO `sys_operation_log` VALUES ('305', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:49:23');
INSERT INTO `sys_operation_log` VALUES ('306', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:52:14');
INSERT INTO `sys_operation_log` VALUES ('307', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:52:16');
INSERT INTO `sys_operation_log` VALUES ('308', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 15:52:21');
INSERT INTO `sys_operation_log` VALUES ('309', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:56:55');
INSERT INTO `sys_operation_log` VALUES ('310', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:56:59');
INSERT INTO `sys_operation_log` VALUES ('311', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:58:08');
INSERT INTO `sys_operation_log` VALUES ('312', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:58:13');
INSERT INTO `sys_operation_log` VALUES ('313', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:58:29');
INSERT INTO `sys_operation_log` VALUES ('314', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 15:58:33');
INSERT INTO `sys_operation_log` VALUES ('315', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 16:00:30');
INSERT INTO `sys_operation_log` VALUES ('316', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 16:00:39');
INSERT INTO `sys_operation_log` VALUES ('317', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 16:00:45');
INSERT INTO `sys_operation_log` VALUES ('318', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 16:01:23');
INSERT INTO `sys_operation_log` VALUES ('319', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 16:01:52');
INSERT INTO `sys_operation_log` VALUES ('320', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 16:02:30');
INSERT INTO `sys_operation_log` VALUES ('321', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 16:02:37');
INSERT INTO `sys_operation_log` VALUES ('322', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 16:02:55');
INSERT INTO `sys_operation_log` VALUES ('323', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 17:26:10');
INSERT INTO `sys_operation_log` VALUES ('324', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-09 17:26:16');
INSERT INTO `sys_operation_log` VALUES ('325', '客户关系管理系统', 'localhost:61479/Log/RequestLogEdit/0', '', 'Log', 'RequestLogEdit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-09 17:30:20');
INSERT INTO `sys_operation_log` VALUES ('326', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:30:00');
INSERT INTO `sys_operation_log` VALUES ('327', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:30:05');
INSERT INTO `sys_operation_log` VALUES ('328', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:31:26');
INSERT INTO `sys_operation_log` VALUES ('329', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:31:31');
INSERT INTO `sys_operation_log` VALUES ('330', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:31:41');
INSERT INTO `sys_operation_log` VALUES ('331', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:31:58');
INSERT INTO `sys_operation_log` VALUES ('332', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:33:23');
INSERT INTO `sys_operation_log` VALUES ('333', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:33:24');
INSERT INTO `sys_operation_log` VALUES ('334', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:35:37');
INSERT INTO `sys_operation_log` VALUES ('335', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 10:35:41');
INSERT INTO `sys_operation_log` VALUES ('336', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:35:45');
INSERT INTO `sys_operation_log` VALUES ('337', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:35:46');
INSERT INTO `sys_operation_log` VALUES ('338', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:35:50');
INSERT INTO `sys_operation_log` VALUES ('339', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:38:03');
INSERT INTO `sys_operation_log` VALUES ('340', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:38:04');
INSERT INTO `sys_operation_log` VALUES ('341', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:38:05');
INSERT INTO `sys_operation_log` VALUES ('342', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:38:07');
INSERT INTO `sys_operation_log` VALUES ('343', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:38:09');
INSERT INTO `sys_operation_log` VALUES ('344', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:41:30');
INSERT INTO `sys_operation_log` VALUES ('345', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:41:31');
INSERT INTO `sys_operation_log` VALUES ('346', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:41:32');
INSERT INTO `sys_operation_log` VALUES ('347', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:41:35');
INSERT INTO `sys_operation_log` VALUES ('348', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:41:41');
INSERT INTO `sys_operation_log` VALUES ('349', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:43:30');
INSERT INTO `sys_operation_log` VALUES ('350', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:43:32');
INSERT INTO `sys_operation_log` VALUES ('351', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:43:33');
INSERT INTO `sys_operation_log` VALUES ('352', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:43:56');
INSERT INTO `sys_operation_log` VALUES ('353', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:43:58');
INSERT INTO `sys_operation_log` VALUES ('354', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:40');
INSERT INTO `sys_operation_log` VALUES ('355', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:41');
INSERT INTO `sys_operation_log` VALUES ('356', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:42');
INSERT INTO `sys_operation_log` VALUES ('357', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:50');
INSERT INTO `sys_operation_log` VALUES ('358', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:51');
INSERT INTO `sys_operation_log` VALUES ('359', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:51:54');
INSERT INTO `sys_operation_log` VALUES ('360', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=系统管理员', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:52:03');
INSERT INTO `sys_operation_log` VALUES ('361', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:52:03');
INSERT INTO `sys_operation_log` VALUES ('362', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:52:18');
INSERT INTO `sys_operation_log` VALUES ('363', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:52:23');
INSERT INTO `sys_operation_log` VALUES ('364', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:17');
INSERT INTO `sys_operation_log` VALUES ('365', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=test', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:20');
INSERT INTO `sys_operation_log` VALUES ('366', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=ww', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:20');
INSERT INTO `sys_operation_log` VALUES ('367', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:29');
INSERT INTO `sys_operation_log` VALUES ('368', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:32');
INSERT INTO `sys_operation_log` VALUES ('369', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:41');
INSERT INTO `sys_operation_log` VALUES ('370', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=ww', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:53:42');
INSERT INTO `sys_operation_log` VALUES ('371', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:54:02');
INSERT INTO `sys_operation_log` VALUES ('372', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:54:32');
INSERT INTO `sys_operation_log` VALUES ('373', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:59:20');
INSERT INTO `sys_operation_log` VALUES ('374', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:59:22');
INSERT INTO `sys_operation_log` VALUES ('375', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=aaa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:59:26');
INSERT INTO `sys_operation_log` VALUES ('376', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=www', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 10:59:26');
INSERT INTO `sys_operation_log` VALUES ('377', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:00:46');
INSERT INTO `sys_operation_log` VALUES ('378', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:00:48');
INSERT INTO `sys_operation_log` VALUES ('379', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=aaaaaa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:00:51');
INSERT INTO `sys_operation_log` VALUES ('380', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:00:51');
INSERT INTO `sys_operation_log` VALUES ('381', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:00:59');
INSERT INTO `sys_operation_log` VALUES ('382', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:01:46');
INSERT INTO `sys_operation_log` VALUES ('383', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:02:08');
INSERT INTO `sys_operation_log` VALUES ('384', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:20');
INSERT INTO `sys_operation_log` VALUES ('385', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:22');
INSERT INTO `sys_operation_log` VALUES ('386', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:23');
INSERT INTO `sys_operation_log` VALUES ('387', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:39');
INSERT INTO `sys_operation_log` VALUES ('388', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:40');
INSERT INTO `sys_operation_log` VALUES ('389', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:03:42');
INSERT INTO `sys_operation_log` VALUES ('390', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:12:37');
INSERT INTO `sys_operation_log` VALUES ('391', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:17:24');
INSERT INTO `sys_operation_log` VALUES ('392', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:17:25');
INSERT INTO `sys_operation_log` VALUES ('393', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:17:26');
INSERT INTO `sys_operation_log` VALUES ('394', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=wwwwww', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:17:29');
INSERT INTO `sys_operation_log` VALUES ('395', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:17:29');
INSERT INTO `sys_operation_log` VALUES ('396', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:18:51');
INSERT INTO `sys_operation_log` VALUES ('397', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:18:52');
INSERT INTO `sys_operation_log` VALUES ('398', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:18:53');
INSERT INTO `sys_operation_log` VALUES ('399', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=ww', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:18:56');
INSERT INTO `sys_operation_log` VALUES ('400', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:18:56');
INSERT INTO `sys_operation_log` VALUES ('401', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:20:57');
INSERT INTO `sys_operation_log` VALUES ('402', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:20:58');
INSERT INTO `sys_operation_log` VALUES ('403', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:20:59');
INSERT INTO `sys_operation_log` VALUES ('404', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=a', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:21:01');
INSERT INTO `sys_operation_log` VALUES ('405', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:21:01');
INSERT INTO `sys_operation_log` VALUES ('406', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:25:18');
INSERT INTO `sys_operation_log` VALUES ('407', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:25:48');
INSERT INTO `sys_operation_log` VALUES ('408', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:29:54');
INSERT INTO `sys_operation_log` VALUES ('409', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:29:55');
INSERT INTO `sys_operation_log` VALUES ('410', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:29:56');
INSERT INTO `sys_operation_log` VALUES ('411', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=a', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:30:04');
INSERT INTO `sys_operation_log` VALUES ('412', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:30:04');
INSERT INTO `sys_operation_log` VALUES ('413', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:31:06');
INSERT INTO `sys_operation_log` VALUES ('414', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:31:07');
INSERT INTO `sys_operation_log` VALUES ('415', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:31:07');
INSERT INTO `sys_operation_log` VALUES ('416', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=w', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:31:10');
INSERT INTO `sys_operation_log` VALUES ('417', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:31:10');
INSERT INTO `sys_operation_log` VALUES ('418', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:32:34');
INSERT INTO `sys_operation_log` VALUES ('419', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:32:53');
INSERT INTO `sys_operation_log` VALUES ('420', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:33:53');
INSERT INTO `sys_operation_log` VALUES ('421', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:33:54');
INSERT INTO `sys_operation_log` VALUES ('422', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:07');
INSERT INTO `sys_operation_log` VALUES ('423', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', 'RoleId=1&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:13');
INSERT INTO `sys_operation_log` VALUES ('424', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', 'RoleId=1&RoleName=系统管理员1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:15');
INSERT INTO `sys_operation_log` VALUES ('425', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:15');
INSERT INTO `sys_operation_log` VALUES ('426', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:19');
INSERT INTO `sys_operation_log` VALUES ('427', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', 'RoleId=1&RoleName=系统管理员1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:21');
INSERT INTO `sys_operation_log` VALUES ('428', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:21');
INSERT INTO `sys_operation_log` VALUES ('429', '客户关系管理系统', 'localhost:61479/SysRole/Delete/10', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:41');
INSERT INTO `sys_operation_log` VALUES ('430', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:34:41');
INSERT INTO `sys_operation_log` VALUES ('431', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:48');
INSERT INTO `sys_operation_log` VALUES ('432', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:48');
INSERT INTO `sys_operation_log` VALUES ('433', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:48');
INSERT INTO `sys_operation_log` VALUES ('434', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:48');
INSERT INTO `sys_operation_log` VALUES ('435', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:48');
INSERT INTO `sys_operation_log` VALUES ('436', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:53');
INSERT INTO `sys_operation_log` VALUES ('437', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:53');
INSERT INTO `sys_operation_log` VALUES ('438', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:53');
INSERT INTO `sys_operation_log` VALUES ('439', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:53');
INSERT INTO `sys_operation_log` VALUES ('440', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:39:53');
INSERT INTO `sys_operation_log` VALUES ('441', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:40:00');
INSERT INTO `sys_operation_log` VALUES ('442', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:40:03');
INSERT INTO `sys_operation_log` VALUES ('443', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:40:03');
INSERT INTO `sys_operation_log` VALUES ('444', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:40:23');
INSERT INTO `sys_operation_log` VALUES ('445', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:40:24');
INSERT INTO `sys_operation_log` VALUES ('446', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:35');
INSERT INTO `sys_operation_log` VALUES ('447', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:37');
INSERT INTO `sys_operation_log` VALUES ('448', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:39');
INSERT INTO `sys_operation_log` VALUES ('449', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:41');
INSERT INTO `sys_operation_log` VALUES ('450', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:50');
INSERT INTO `sys_operation_log` VALUES ('451', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:52');
INSERT INTO `sys_operation_log` VALUES ('452', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:45:52');
INSERT INTO `sys_operation_log` VALUES ('453', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:03');
INSERT INTO `sys_operation_log` VALUES ('454', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:03');
INSERT INTO `sys_operation_log` VALUES ('455', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:06');
INSERT INTO `sys_operation_log` VALUES ('456', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:07');
INSERT INTO `sys_operation_log` VALUES ('457', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:07');
INSERT INTO `sys_operation_log` VALUES ('458', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:15');
INSERT INTO `sys_operation_log` VALUES ('459', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:15');
INSERT INTO `sys_operation_log` VALUES ('460', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:19');
INSERT INTO `sys_operation_log` VALUES ('461', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:20');
INSERT INTO `sys_operation_log` VALUES ('462', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:20');
INSERT INTO `sys_operation_log` VALUES ('463', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:20');
INSERT INTO `sys_operation_log` VALUES ('464', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:55');
INSERT INTO `sys_operation_log` VALUES ('465', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:55');
INSERT INTO `sys_operation_log` VALUES ('466', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:46:55');
INSERT INTO `sys_operation_log` VALUES ('467', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:35');
INSERT INTO `sys_operation_log` VALUES ('468', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:38');
INSERT INTO `sys_operation_log` VALUES ('469', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:40');
INSERT INTO `sys_operation_log` VALUES ('470', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:42');
INSERT INTO `sys_operation_log` VALUES ('471', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:45');
INSERT INTO `sys_operation_log` VALUES ('472', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:47:46');
INSERT INTO `sys_operation_log` VALUES ('473', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:48:53');
INSERT INTO `sys_operation_log` VALUES ('474', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:48:54');
INSERT INTO `sys_operation_log` VALUES ('475', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:49:11');
INSERT INTO `sys_operation_log` VALUES ('476', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:49:15');
INSERT INTO `sys_operation_log` VALUES ('477', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:49:19');
INSERT INTO `sys_operation_log` VALUES ('478', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:49:22');
INSERT INTO `sys_operation_log` VALUES ('479', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:51:23');
INSERT INTO `sys_operation_log` VALUES ('480', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:52:35');
INSERT INTO `sys_operation_log` VALUES ('481', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 11:54:32');
INSERT INTO `sys_operation_log` VALUES ('482', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:03:42');
INSERT INTO `sys_operation_log` VALUES ('483', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:04:30');
INSERT INTO `sys_operation_log` VALUES ('484', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:35');
INSERT INTO `sys_operation_log` VALUES ('485', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:36');
INSERT INTO `sys_operation_log` VALUES ('486', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:38');
INSERT INTO `sys_operation_log` VALUES ('487', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:41');
INSERT INTO `sys_operation_log` VALUES ('488', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:42');
INSERT INTO `sys_operation_log` VALUES ('489', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:04:45');
INSERT INTO `sys_operation_log` VALUES ('490', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:18');
INSERT INTO `sys_operation_log` VALUES ('491', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:20');
INSERT INTO `sys_operation_log` VALUES ('492', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:22');
INSERT INTO `sys_operation_log` VALUES ('493', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=w', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:25');
INSERT INTO `sys_operation_log` VALUES ('494', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:27');
INSERT INTO `sys_operation_log` VALUES ('495', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:06:28');
INSERT INTO `sys_operation_log` VALUES ('496', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:08:24');
INSERT INTO `sys_operation_log` VALUES ('497', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:08:28');
INSERT INTO `sys_operation_log` VALUES ('498', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:08:31');
INSERT INTO `sys_operation_log` VALUES ('499', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:08:38');
INSERT INTO `sys_operation_log` VALUES ('500', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:08:45');
INSERT INTO `sys_operation_log` VALUES ('501', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:09:16');
INSERT INTO `sys_operation_log` VALUES ('502', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:10:46');
INSERT INTO `sys_operation_log` VALUES ('503', '客户关系管理系统', 'localhost:61479/SysRole/Edit/1', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:10:59');
INSERT INTO `sys_operation_log` VALUES ('504', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:24');
INSERT INTO `sys_operation_log` VALUES ('505', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=问问', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:29');
INSERT INTO `sys_operation_log` VALUES ('506', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:29');
INSERT INTO `sys_operation_log` VALUES ('507', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:30');
INSERT INTO `sys_operation_log` VALUES ('508', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=当地', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:33');
INSERT INTO `sys_operation_log` VALUES ('509', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:33');
INSERT INTO `sys_operation_log` VALUES ('510', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:34');
INSERT INTO `sys_operation_log` VALUES ('511', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=问问啊', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:37');
INSERT INTO `sys_operation_log` VALUES ('512', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:37');
INSERT INTO `sys_operation_log` VALUES ('513', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:42');
INSERT INTO `sys_operation_log` VALUES ('514', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:44');
INSERT INTO `sys_operation_log` VALUES ('515', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:47');
INSERT INTO `sys_operation_log` VALUES ('516', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:47');
INSERT INTO `sys_operation_log` VALUES ('517', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:12:58');
INSERT INTO `sys_operation_log` VALUES ('518', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:13:02');
INSERT INTO `sys_operation_log` VALUES ('519', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:13:04');
INSERT INTO `sys_operation_log` VALUES ('520', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:13:08');
INSERT INTO `sys_operation_log` VALUES ('521', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:13:11');
INSERT INTO `sys_operation_log` VALUES ('522', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:13:11');
INSERT INTO `sys_operation_log` VALUES ('523', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:04');
INSERT INTO `sys_operation_log` VALUES ('524', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:10');
INSERT INTO `sys_operation_log` VALUES ('525', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:15');
INSERT INTO `sys_operation_log` VALUES ('526', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:27');
INSERT INTO `sys_operation_log` VALUES ('527', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:39');
INSERT INTO `sys_operation_log` VALUES ('528', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:15:39');
INSERT INTO `sys_operation_log` VALUES ('529', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:25');
INSERT INTO `sys_operation_log` VALUES ('530', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:28');
INSERT INTO `sys_operation_log` VALUES ('531', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:29');
INSERT INTO `sys_operation_log` VALUES ('532', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:30');
INSERT INTO `sys_operation_log` VALUES ('533', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:30');
INSERT INTO `sys_operation_log` VALUES ('534', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:32');
INSERT INTO `sys_operation_log` VALUES ('535', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:33');
INSERT INTO `sys_operation_log` VALUES ('536', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:33');
INSERT INTO `sys_operation_log` VALUES ('537', '客户关系管理系统', 'localhost:61479/SysRole/Delete/13', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:37');
INSERT INTO `sys_operation_log` VALUES ('538', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:37');
INSERT INTO `sys_operation_log` VALUES ('539', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:23:55');
INSERT INTO `sys_operation_log` VALUES ('540', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:01');
INSERT INTO `sys_operation_log` VALUES ('541', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:08');
INSERT INTO `sys_operation_log` VALUES ('542', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:16');
INSERT INTO `sys_operation_log` VALUES ('543', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:22');
INSERT INTO `sys_operation_log` VALUES ('544', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:22');
INSERT INTO `sys_operation_log` VALUES ('545', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:22');
INSERT INTO `sys_operation_log` VALUES ('546', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:22');
INSERT INTO `sys_operation_log` VALUES ('547', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:24');
INSERT INTO `sys_operation_log` VALUES ('548', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:24');
INSERT INTO `sys_operation_log` VALUES ('549', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:25');
INSERT INTO `sys_operation_log` VALUES ('550', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:25');
INSERT INTO `sys_operation_log` VALUES ('551', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:26');
INSERT INTO `sys_operation_log` VALUES ('552', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:26');
INSERT INTO `sys_operation_log` VALUES ('553', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:26');
INSERT INTO `sys_operation_log` VALUES ('554', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:26');
INSERT INTO `sys_operation_log` VALUES ('555', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:34');
INSERT INTO `sys_operation_log` VALUES ('556', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:34');
INSERT INTO `sys_operation_log` VALUES ('557', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:34');
INSERT INTO `sys_operation_log` VALUES ('558', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:34');
INSERT INTO `sys_operation_log` VALUES ('559', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:34');
INSERT INTO `sys_operation_log` VALUES ('560', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:35');
INSERT INTO `sys_operation_log` VALUES ('561', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:35');
INSERT INTO `sys_operation_log` VALUES ('562', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:35');
INSERT INTO `sys_operation_log` VALUES ('563', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:35');
INSERT INTO `sys_operation_log` VALUES ('564', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:36');
INSERT INTO `sys_operation_log` VALUES ('565', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:36');
INSERT INTO `sys_operation_log` VALUES ('566', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:37');
INSERT INTO `sys_operation_log` VALUES ('567', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:37');
INSERT INTO `sys_operation_log` VALUES ('568', '客户关系管理系统', 'localhost:61479/SysRole/Edit/12', 'RoleId=12&RoleName=当地1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:37');
INSERT INTO `sys_operation_log` VALUES ('569', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:37');
INSERT INTO `sys_operation_log` VALUES ('570', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:41');
INSERT INTO `sys_operation_log` VALUES ('571', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:42');
INSERT INTO `sys_operation_log` VALUES ('572', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:42');
INSERT INTO `sys_operation_log` VALUES ('573', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:42');
INSERT INTO `sys_operation_log` VALUES ('574', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:42');
INSERT INTO `sys_operation_log` VALUES ('575', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:42');
INSERT INTO `sys_operation_log` VALUES ('576', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:43');
INSERT INTO `sys_operation_log` VALUES ('577', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:43');
INSERT INTO `sys_operation_log` VALUES ('578', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:44');
INSERT INTO `sys_operation_log` VALUES ('579', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:44');
INSERT INTO `sys_operation_log` VALUES ('580', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:44');
INSERT INTO `sys_operation_log` VALUES ('581', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:44');
INSERT INTO `sys_operation_log` VALUES ('582', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:45');
INSERT INTO `sys_operation_log` VALUES ('583', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:45');
INSERT INTO `sys_operation_log` VALUES ('584', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:45');
INSERT INTO `sys_operation_log` VALUES ('585', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:45');
INSERT INTO `sys_operation_log` VALUES ('586', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:49');
INSERT INTO `sys_operation_log` VALUES ('587', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:50');
INSERT INTO `sys_operation_log` VALUES ('588', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:51');
INSERT INTO `sys_operation_log` VALUES ('589', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:51');
INSERT INTO `sys_operation_log` VALUES ('590', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:52');
INSERT INTO `sys_operation_log` VALUES ('591', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:55');
INSERT INTO `sys_operation_log` VALUES ('592', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', 'RoleId=2&RoleName=test', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:56');
INSERT INTO `sys_operation_log` VALUES ('593', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:24:56');
INSERT INTO `sys_operation_log` VALUES ('594', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:06');
INSERT INTO `sys_operation_log` VALUES ('595', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:07');
INSERT INTO `sys_operation_log` VALUES ('596', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:07');
INSERT INTO `sys_operation_log` VALUES ('597', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:08');
INSERT INTO `sys_operation_log` VALUES ('598', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:08');
INSERT INTO `sys_operation_log` VALUES ('599', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:10');
INSERT INTO `sys_operation_log` VALUES ('600', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:10');
INSERT INTO `sys_operation_log` VALUES ('601', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:42');
INSERT INTO `sys_operation_log` VALUES ('602', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:44');
INSERT INTO `sys_operation_log` VALUES ('603', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:46');
INSERT INTO `sys_operation_log` VALUES ('604', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', 'RoleId=2&RoleName=test', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:47');
INSERT INTO `sys_operation_log` VALUES ('605', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:47');
INSERT INTO `sys_operation_log` VALUES ('606', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:48');
INSERT INTO `sys_operation_log` VALUES ('607', '客户关系管理系统', 'localhost:61479/SysRole/Edit/2', 'RoleId=2&RoleName=test', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:49');
INSERT INTO `sys_operation_log` VALUES ('608', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:49');
INSERT INTO `sys_operation_log` VALUES ('609', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:50');
INSERT INTO `sys_operation_log` VALUES ('610', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:51');
INSERT INTO `sys_operation_log` VALUES ('611', '客户关系管理系统', 'localhost:61479/SysRole/Edit/3', 'RoleId=3&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:52');
INSERT INTO `sys_operation_log` VALUES ('612', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:52');
INSERT INTO `sys_operation_log` VALUES ('613', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:53');
INSERT INTO `sys_operation_log` VALUES ('614', '客户关系管理系统', 'localhost:61479/SysRole/Delete/12', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:56');
INSERT INTO `sys_operation_log` VALUES ('615', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:57');
INSERT INTO `sys_operation_log` VALUES ('616', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:25:58');
INSERT INTO `sys_operation_log` VALUES ('617', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:04');
INSERT INTO `sys_operation_log` VALUES ('618', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=问问', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:07');
INSERT INTO `sys_operation_log` VALUES ('619', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:07');
INSERT INTO `sys_operation_log` VALUES ('620', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:11');
INSERT INTO `sys_operation_log` VALUES ('621', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:12');
INSERT INTO `sys_operation_log` VALUES ('622', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=aa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:14');
INSERT INTO `sys_operation_log` VALUES ('623', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:14');
INSERT INTO `sys_operation_log` VALUES ('624', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:26:17');
INSERT INTO `sys_operation_log` VALUES ('625', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:27:30');
INSERT INTO `sys_operation_log` VALUES ('626', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:27:35');
INSERT INTO `sys_operation_log` VALUES ('627', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:27:47');
INSERT INTO `sys_operation_log` VALUES ('628', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:29:57');
INSERT INTO `sys_operation_log` VALUES ('629', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-10 13:30:01');
INSERT INTO `sys_operation_log` VALUES ('630', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:30:07');
INSERT INTO `sys_operation_log` VALUES ('631', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:31:39');
INSERT INTO `sys_operation_log` VALUES ('632', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:34:18');
INSERT INTO `sys_operation_log` VALUES ('633', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:34:40');
INSERT INTO `sys_operation_log` VALUES ('634', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:36:26');
INSERT INTO `sys_operation_log` VALUES ('635', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:38:23');
INSERT INTO `sys_operation_log` VALUES ('636', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:38:28');
INSERT INTO `sys_operation_log` VALUES ('637', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:39:05');
INSERT INTO `sys_operation_log` VALUES ('638', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:39:16');
INSERT INTO `sys_operation_log` VALUES ('639', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:39:20');
INSERT INTO `sys_operation_log` VALUES ('640', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:40:35');
INSERT INTO `sys_operation_log` VALUES ('641', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:40:37');
INSERT INTO `sys_operation_log` VALUES ('642', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:41:55');
INSERT INTO `sys_operation_log` VALUES ('643', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:42:13');
INSERT INTO `sys_operation_log` VALUES ('644', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:42:33');
INSERT INTO `sys_operation_log` VALUES ('645', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:42:35');
INSERT INTO `sys_operation_log` VALUES ('646', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:42:36');
INSERT INTO `sys_operation_log` VALUES ('647', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:42:38');
INSERT INTO `sys_operation_log` VALUES ('648', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:43:02');
INSERT INTO `sys_operation_log` VALUES ('649', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:43:12');
INSERT INTO `sys_operation_log` VALUES ('650', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:43:19');
INSERT INTO `sys_operation_log` VALUES ('651', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:43:38');
INSERT INTO `sys_operation_log` VALUES ('652', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:45:46');
INSERT INTO `sys_operation_log` VALUES ('653', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:46:05');
INSERT INTO `sys_operation_log` VALUES ('654', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-10 13:50:23');
INSERT INTO `sys_operation_log` VALUES ('655', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:44:45');
INSERT INTO `sys_operation_log` VALUES ('656', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:44:55');
INSERT INTO `sys_operation_log` VALUES ('657', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:45:02');
INSERT INTO `sys_operation_log` VALUES ('658', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:45:42');
INSERT INTO `sys_operation_log` VALUES ('659', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:45:46');
INSERT INTO `sys_operation_log` VALUES ('660', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:45:52');
INSERT INTO `sys_operation_log` VALUES ('661', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:45:56');
INSERT INTO `sys_operation_log` VALUES ('662', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:45:59');
INSERT INTO `sys_operation_log` VALUES ('663', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:46:22');
INSERT INTO `sys_operation_log` VALUES ('664', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:46:46');
INSERT INTO `sys_operation_log` VALUES ('665', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:46:51');
INSERT INTO `sys_operation_log` VALUES ('666', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:47:09');
INSERT INTO `sys_operation_log` VALUES ('667', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 14:47:50');
INSERT INTO `sys_operation_log` VALUES ('668', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:04');
INSERT INTO `sys_operation_log` VALUES ('669', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:04');
INSERT INTO `sys_operation_log` VALUES ('670', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:04');
INSERT INTO `sys_operation_log` VALUES ('671', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:06');
INSERT INTO `sys_operation_log` VALUES ('672', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:07');
INSERT INTO `sys_operation_log` VALUES ('673', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:08');
INSERT INTO `sys_operation_log` VALUES ('674', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=10&n=权限管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:09');
INSERT INTO `sys_operation_log` VALUES ('675', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=11&n=用户管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:10');
INSERT INTO `sys_operation_log` VALUES ('676', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=3&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:48:10');
INSERT INTO `sys_operation_log` VALUES ('677', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:37');
INSERT INTO `sys_operation_log` VALUES ('678', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:37');
INSERT INTO `sys_operation_log` VALUES ('679', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:37');
INSERT INTO `sys_operation_log` VALUES ('680', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:39');
INSERT INTO `sys_operation_log` VALUES ('681', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:39');
INSERT INTO `sys_operation_log` VALUES ('682', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:39');
INSERT INTO `sys_operation_log` VALUES ('683', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:42');
INSERT INTO `sys_operation_log` VALUES ('684', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:42');
INSERT INTO `sys_operation_log` VALUES ('685', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:42');
INSERT INTO `sys_operation_log` VALUES ('686', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:49:48');
INSERT INTO `sys_operation_log` VALUES ('687', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:02');
INSERT INTO `sys_operation_log` VALUES ('688', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:03');
INSERT INTO `sys_operation_log` VALUES ('689', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:03');
INSERT INTO `sys_operation_log` VALUES ('690', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:06');
INSERT INTO `sys_operation_log` VALUES ('691', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:07');
INSERT INTO `sys_operation_log` VALUES ('692', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=10&n=权限管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:08');
INSERT INTO `sys_operation_log` VALUES ('693', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:09');
INSERT INTO `sys_operation_log` VALUES ('694', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:33');
INSERT INTO `sys_operation_log` VALUES ('695', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:33');
INSERT INTO `sys_operation_log` VALUES ('696', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:33');
INSERT INTO `sys_operation_log` VALUES ('697', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:36');
INSERT INTO `sys_operation_log` VALUES ('698', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:37');
INSERT INTO `sys_operation_log` VALUES ('699', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 14:52:38');
INSERT INTO `sys_operation_log` VALUES ('700', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:08:52');
INSERT INTO `sys_operation_log` VALUES ('701', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:08:56');
INSERT INTO `sys_operation_log` VALUES ('702', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:08:58');
INSERT INTO `sys_operation_log` VALUES ('703', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:08:59');
INSERT INTO `sys_operation_log` VALUES ('704', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:08:59');
INSERT INTO `sys_operation_log` VALUES ('705', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:01');
INSERT INTO `sys_operation_log` VALUES ('706', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:02');
INSERT INTO `sys_operation_log` VALUES ('707', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=10&n=权限管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:03');
INSERT INTO `sys_operation_log` VALUES ('708', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:05');
INSERT INTO `sys_operation_log` VALUES ('709', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:07');
INSERT INTO `sys_operation_log` VALUES ('710', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:11');
INSERT INTO `sys_operation_log` VALUES ('711', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:29');
INSERT INTO `sys_operation_log` VALUES ('712', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:32');
INSERT INTO `sys_operation_log` VALUES ('713', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:34');
INSERT INTO `sys_operation_log` VALUES ('714', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=9', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:09:37');
INSERT INTO `sys_operation_log` VALUES ('715', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:28');
INSERT INTO `sys_operation_log` VALUES ('716', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:28');
INSERT INTO `sys_operation_log` VALUES ('717', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:28');
INSERT INTO `sys_operation_log` VALUES ('718', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:30');
INSERT INTO `sys_operation_log` VALUES ('719', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:40');
INSERT INTO `sys_operation_log` VALUES ('720', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:42');
INSERT INTO `sys_operation_log` VALUES ('721', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=6', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:10:44');
INSERT INTO `sys_operation_log` VALUES ('722', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:11:32');
INSERT INTO `sys_operation_log` VALUES ('723', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:11:33');
INSERT INTO `sys_operation_log` VALUES ('724', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:11:33');
INSERT INTO `sys_operation_log` VALUES ('725', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:11:35');
INSERT INTO `sys_operation_log` VALUES ('726', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:17');
INSERT INTO `sys_operation_log` VALUES ('727', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:17');
INSERT INTO `sys_operation_log` VALUES ('728', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:17');
INSERT INTO `sys_operation_log` VALUES ('729', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:18');
INSERT INTO `sys_operation_log` VALUES ('730', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:32');
INSERT INTO `sys_operation_log` VALUES ('731', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:34');
INSERT INTO `sys_operation_log` VALUES ('732', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:35');
INSERT INTO `sys_operation_log` VALUES ('733', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=8', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:38');
INSERT INTO `sys_operation_log` VALUES ('734', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=8&ParentId=7&ModuleName=用户管理&ControllerName=Sys&ActionName=UserManager&Sort=10', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:41');
INSERT INTO `sys_operation_log` VALUES ('735', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=8&ParentId=7&ModuleName=用户管理&ControllerName=Sys&ActionName=UserManager&Sort=10', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:12:44');
INSERT INTO `sys_operation_log` VALUES ('736', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:12');
INSERT INTO `sys_operation_log` VALUES ('737', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:12');
INSERT INTO `sys_operation_log` VALUES ('738', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:12');
INSERT INTO `sys_operation_log` VALUES ('739', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:15');
INSERT INTO `sys_operation_log` VALUES ('740', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=2&ParentId=0&ModuleName=系统管理&ControllerName=  &ActionName=&Sort=100', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:16');
INSERT INTO `sys_operation_log` VALUES ('741', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=2&ParentId=0&ModuleName=系统管理&ControllerName=  #&ActionName=&Sort=100', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:22');
INSERT INTO `sys_operation_log` VALUES ('742', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:23');
INSERT INTO `sys_operation_log` VALUES ('743', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:23');
INSERT INTO `sys_operation_log` VALUES ('744', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:23');
INSERT INTO `sys_operation_log` VALUES ('745', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:26');
INSERT INTO `sys_operation_log` VALUES ('746', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:28');
INSERT INTO `sys_operation_log` VALUES ('747', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=客户关系&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:29');
INSERT INTO `sys_operation_log` VALUES ('748', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=7&n=权限管理&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:30');
INSERT INTO `sys_operation_log` VALUES ('749', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=7', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:47');
INSERT INTO `sys_operation_log` VALUES ('750', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:50');
INSERT INTO `sys_operation_log` VALUES ('751', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:50');
INSERT INTO `sys_operation_log` VALUES ('752', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:50');
INSERT INTO `sys_operation_log` VALUES ('753', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:51');
INSERT INTO `sys_operation_log` VALUES ('754', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=10&n=权限管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:52');
INSERT INTO `sys_operation_log` VALUES ('755', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=6', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:14:56');
INSERT INTO `sys_operation_log` VALUES ('756', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:03');
INSERT INTO `sys_operation_log` VALUES ('757', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:03');
INSERT INTO `sys_operation_log` VALUES ('758', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:03');
INSERT INTO `sys_operation_log` VALUES ('759', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:15:05');
INSERT INTO `sys_operation_log` VALUES ('760', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:07');
INSERT INTO `sys_operation_log` VALUES ('761', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:07');
INSERT INTO `sys_operation_log` VALUES ('762', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:07');
INSERT INTO `sys_operation_log` VALUES ('763', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:08');
INSERT INTO `sys_operation_log` VALUES ('764', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=10&n=权限管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:09');
INSERT INTO `sys_operation_log` VALUES ('765', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:23');
INSERT INTO `sys_operation_log` VALUES ('766', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:23');
INSERT INTO `sys_operation_log` VALUES ('767', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:23');
INSERT INTO `sys_operation_log` VALUES ('768', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:25');
INSERT INTO `sys_operation_log` VALUES ('769', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:39');
INSERT INTO `sys_operation_log` VALUES ('770', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:44');
INSERT INTO `sys_operation_log` VALUES ('771', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:50');
INSERT INTO `sys_operation_log` VALUES ('772', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:56');
INSERT INTO `sys_operation_log` VALUES ('773', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:56');
INSERT INTO `sys_operation_log` VALUES ('774', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:15:56');
INSERT INTO `sys_operation_log` VALUES ('775', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=13', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:03');
INSERT INTO `sys_operation_log` VALUES ('776', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=14', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:12');
INSERT INTO `sys_operation_log` VALUES ('777', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:14');
INSERT INTO `sys_operation_log` VALUES ('778', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:14');
INSERT INTO `sys_operation_log` VALUES ('779', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:14');
INSERT INTO `sys_operation_log` VALUES ('780', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:15');
INSERT INTO `sys_operation_log` VALUES ('781', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:16:20');
INSERT INTO `sys_operation_log` VALUES ('782', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:17:08');
INSERT INTO `sys_operation_log` VALUES ('783', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:17:13');
INSERT INTO `sys_operation_log` VALUES ('784', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:40');
INSERT INTO `sys_operation_log` VALUES ('785', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:40');
INSERT INTO `sys_operation_log` VALUES ('786', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:40');
INSERT INTO `sys_operation_log` VALUES ('787', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=15', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:44');
INSERT INTO `sys_operation_log` VALUES ('788', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:48');
INSERT INTO `sys_operation_log` VALUES ('789', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=cre&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:51');
INSERT INTO `sys_operation_log` VALUES ('790', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=cre&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:17:55');
INSERT INTO `sys_operation_log` VALUES ('791', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:43');
INSERT INTO `sys_operation_log` VALUES ('792', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:43');
INSERT INTO `sys_operation_log` VALUES ('793', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:43');
INSERT INTO `sys_operation_log` VALUES ('794', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:48');
INSERT INTO `sys_operation_log` VALUES ('795', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:53');
INSERT INTO `sys_operation_log` VALUES ('796', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=0&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:19:59');
INSERT INTO `sys_operation_log` VALUES ('797', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:01');
INSERT INTO `sys_operation_log` VALUES ('798', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:01');
INSERT INTO `sys_operation_log` VALUES ('799', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:01');
INSERT INTO `sys_operation_log` VALUES ('800', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:23');
INSERT INTO `sys_operation_log` VALUES ('801', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=2&ParentId=0&ModuleName=系统管理&ControllerName=  #&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:32');
INSERT INTO `sys_operation_log` VALUES ('802', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:34');
INSERT INTO `sys_operation_log` VALUES ('803', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:34');
INSERT INTO `sys_operation_log` VALUES ('804', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:34');
INSERT INTO `sys_operation_log` VALUES ('805', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=16', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:39');
INSERT INTO `sys_operation_log` VALUES ('806', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=17', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:45');
INSERT INTO `sys_operation_log` VALUES ('807', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=18', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:49');
INSERT INTO `sys_operation_log` VALUES ('808', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=19', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:20:51');
INSERT INTO `sys_operation_log` VALUES ('809', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:25:28');
INSERT INTO `sys_operation_log` VALUES ('810', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:25:32');
INSERT INTO `sys_operation_log` VALUES ('811', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:35');
INSERT INTO `sys_operation_log` VALUES ('812', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:36');
INSERT INTO `sys_operation_log` VALUES ('813', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:36');
INSERT INTO `sys_operation_log` VALUES ('814', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:37');
INSERT INTO `sys_operation_log` VALUES ('815', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:39');
INSERT INTO `sys_operation_log` VALUES ('816', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:25:50');
INSERT INTO `sys_operation_log` VALUES ('817', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=1&ModuleName=日志管理&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:26:03');
INSERT INTO `sys_operation_log` VALUES ('818', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=4', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:26:05');
INSERT INTO `sys_operation_log` VALUES ('819', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=4&ModuleName=操作日志&ControllerName=Log&ActionName=ReqeustLogManger&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:26:19');
INSERT INTO `sys_operation_log` VALUES ('820', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=4&ModuleName=异常日志&ControllerName=Log&ActionName=ExceptionLogManger&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:26:45');
INSERT INTO `sys_operation_log` VALUES ('821', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:26:51');
INSERT INTO `sys_operation_log` VALUES ('822', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=2&ModuleName=角色管理&ControllerName=SysRole&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:27:08');
INSERT INTO `sys_operation_log` VALUES ('823', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:23');
INSERT INTO `sys_operation_log` VALUES ('824', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:24');
INSERT INTO `sys_operation_log` VALUES ('825', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:24');
INSERT INTO `sys_operation_log` VALUES ('826', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:25');
INSERT INTO `sys_operation_log` VALUES ('827', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:27');
INSERT INTO `sys_operation_log` VALUES ('828', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:28');
INSERT INTO `sys_operation_log` VALUES ('829', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:28:32');
INSERT INTO `sys_operation_log` VALUES ('830', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:29:30');
INSERT INTO `sys_operation_log` VALUES ('831', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:29:31');
INSERT INTO `sys_operation_log` VALUES ('832', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:29:31');
INSERT INTO `sys_operation_log` VALUES ('833', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:29:35');
INSERT INTO `sys_operation_log` VALUES ('834', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:30:48');
INSERT INTO `sys_operation_log` VALUES ('835', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:11');
INSERT INTO `sys_operation_log` VALUES ('836', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:11');
INSERT INTO `sys_operation_log` VALUES ('837', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:11');
INSERT INTO `sys_operation_log` VALUES ('838', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:14');
INSERT INTO `sys_operation_log` VALUES ('839', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:31');
INSERT INTO `sys_operation_log` VALUES ('840', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:31');
INSERT INTO `sys_operation_log` VALUES ('841', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:31');
INSERT INTO `sys_operation_log` VALUES ('842', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:33');
INSERT INTO `sys_operation_log` VALUES ('843', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:50');
INSERT INTO `sys_operation_log` VALUES ('844', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:50');
INSERT INTO `sys_operation_log` VALUES ('845', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:50');
INSERT INTO `sys_operation_log` VALUES ('846', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:31:52');
INSERT INTO `sys_operation_log` VALUES ('847', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:32:07');
INSERT INTO `sys_operation_log` VALUES ('848', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:32:07');
INSERT INTO `sys_operation_log` VALUES ('849', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:32:07');
INSERT INTO `sys_operation_log` VALUES ('850', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:32:08');
INSERT INTO `sys_operation_log` VALUES ('851', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:35:43');
INSERT INTO `sys_operation_log` VALUES ('852', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 15:35:53');
INSERT INTO `sys_operation_log` VALUES ('853', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:35:57');
INSERT INTO `sys_operation_log` VALUES ('854', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:35:58');
INSERT INTO `sys_operation_log` VALUES ('855', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:05');
INSERT INTO `sys_operation_log` VALUES ('856', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:06');
INSERT INTO `sys_operation_log` VALUES ('857', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:06');
INSERT INTO `sys_operation_log` VALUES ('858', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:09');
INSERT INTO `sys_operation_log` VALUES ('859', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:12');
INSERT INTO `sys_operation_log` VALUES ('860', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:14');
INSERT INTO `sys_operation_log` VALUES ('861', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=3', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:21');
INSERT INTO `sys_operation_log` VALUES ('862', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=3&ParentId=2&ModuleName=菜单管理&ControllerName=SysModule&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 15:36:49');
INSERT INTO `sys_operation_log` VALUES ('863', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 16:16:28');
INSERT INTO `sys_operation_log` VALUES ('864', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-13 16:16:33');
INSERT INTO `sys_operation_log` VALUES ('865', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:41');
INSERT INTO `sys_operation_log` VALUES ('866', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:41');
INSERT INTO `sys_operation_log` VALUES ('867', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:41');
INSERT INTO `sys_operation_log` VALUES ('868', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:44');
INSERT INTO `sys_operation_log` VALUES ('869', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=1&ParentId=0&ModuleName=系统管理&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:45');
INSERT INTO `sys_operation_log` VALUES ('870', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=1&ParentId=0&ModuleName=&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:50');
INSERT INTO `sys_operation_log` VALUES ('871', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:16:58');
INSERT INTO `sys_operation_log` VALUES ('872', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:00');
INSERT INTO `sys_operation_log` VALUES ('873', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:00');
INSERT INTO `sys_operation_log` VALUES ('874', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:00');
INSERT INTO `sys_operation_log` VALUES ('875', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:02');
INSERT INTO `sys_operation_log` VALUES ('876', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:03');
INSERT INTO `sys_operation_log` VALUES ('877', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-13 16:17:05');
INSERT INTO `sys_operation_log` VALUES ('878', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:04:30');
INSERT INTO `sys_operation_log` VALUES ('879', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:04:36');
INSERT INTO `sys_operation_log` VALUES ('880', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:46');
INSERT INTO `sys_operation_log` VALUES ('881', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:46');
INSERT INTO `sys_operation_log` VALUES ('882', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:46');
INSERT INTO `sys_operation_log` VALUES ('883', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:48');
INSERT INTO `sys_operation_log` VALUES ('884', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:49');
INSERT INTO `sys_operation_log` VALUES ('885', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:04:51');
INSERT INTO `sys_operation_log` VALUES ('886', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=2&ModuleName=用户管理&ControllerName=SysUser&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:05:05');
INSERT INTO `sys_operation_log` VALUES ('887', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=2&ModuleName=用户管理&ControllerName=SysUser&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:05:10');
INSERT INTO `sys_operation_log` VALUES ('888', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=2&ModuleName=用户管理&ControllerName=SysUser&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:05:15');
INSERT INTO `sys_operation_log` VALUES ('889', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:06:49');
INSERT INTO `sys_operation_log` VALUES ('890', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:06:53');
INSERT INTO `sys_operation_log` VALUES ('891', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:06:57');
INSERT INTO `sys_operation_log` VALUES ('892', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:06:57');
INSERT INTO `sys_operation_log` VALUES ('893', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:06:57');
INSERT INTO `sys_operation_log` VALUES ('894', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:06:58');
INSERT INTO `sys_operation_log` VALUES ('895', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:06:59');
INSERT INTO `sys_operation_log` VALUES ('896', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=10', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:02');
INSERT INTO `sys_operation_log` VALUES ('897', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=9', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:07');
INSERT INTO `sys_operation_log` VALUES ('898', '客户关系管理系统', 'localhost:61479/SysModule/Delete', '?id=8', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:09');
INSERT INTO `sys_operation_log` VALUES ('899', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:13');
INSERT INTO `sys_operation_log` VALUES ('900', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:25');
INSERT INTO `sys_operation_log` VALUES ('901', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:40');
INSERT INTO `sys_operation_log` VALUES ('902', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:07:44');
INSERT INTO `sys_operation_log` VALUES ('903', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:06');
INSERT INTO `sys_operation_log` VALUES ('904', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:12');
INSERT INTO `sys_operation_log` VALUES ('905', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:13');
INSERT INTO `sys_operation_log` VALUES ('906', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:21');
INSERT INTO `sys_operation_log` VALUES ('907', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:30');
INSERT INTO `sys_operation_log` VALUES ('908', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:08:46');
INSERT INTO `sys_operation_log` VALUES ('909', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:09:27');
INSERT INTO `sys_operation_log` VALUES ('910', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:09:58');
INSERT INTO `sys_operation_log` VALUES ('911', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:10:25');
INSERT INTO `sys_operation_log` VALUES ('912', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:11:46');
INSERT INTO `sys_operation_log` VALUES ('913', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:11:52');
INSERT INTO `sys_operation_log` VALUES ('914', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:14:31');
INSERT INTO `sys_operation_log` VALUES ('915', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:14:33');
INSERT INTO `sys_operation_log` VALUES ('916', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:14:54');
INSERT INTO `sys_operation_log` VALUES ('917', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:15:08');
INSERT INTO `sys_operation_log` VALUES ('918', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:15:09');
INSERT INTO `sys_operation_log` VALUES ('919', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:16:20');
INSERT INTO `sys_operation_log` VALUES ('920', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:18:22');
INSERT INTO `sys_operation_log` VALUES ('921', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=&LoginPwd=&Phone=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:18:28');
INSERT INTO `sys_operation_log` VALUES ('922', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=a&LoginPwd=&Phone=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:18:30');
INSERT INTO `sys_operation_log` VALUES ('923', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:24:22');
INSERT INTO `sys_operation_log` VALUES ('924', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:24:43');
INSERT INTO `sys_operation_log` VALUES ('925', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:25:27');
INSERT INTO `sys_operation_log` VALUES ('926', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:34:45');
INSERT INTO `sys_operation_log` VALUES ('927', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:34:51');
INSERT INTO `sys_operation_log` VALUES ('928', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:34:58');
INSERT INTO `sys_operation_log` VALUES ('929', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:34:58');
INSERT INTO `sys_operation_log` VALUES ('930', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:34:58');
INSERT INTO `sys_operation_log` VALUES ('931', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:34:59');
INSERT INTO `sys_operation_log` VALUES ('932', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:00');
INSERT INTO `sys_operation_log` VALUES ('933', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=2', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:01');
INSERT INTO `sys_operation_log` VALUES ('934', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=2&ModuleName=SysUser&ControllerName=Manager&ActionName=用户管理&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:13');
INSERT INTO `sys_operation_log` VALUES ('935', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=11', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:20');
INSERT INTO `sys_operation_log` VALUES ('936', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=11&ParentId=2&ModuleName=用户管理&ControllerName=SysUser&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:31');
INSERT INTO `sys_operation_log` VALUES ('937', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:35:39');
INSERT INTO `sys_operation_log` VALUES ('938', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:35:40');
INSERT INTO `sys_operation_log` VALUES ('939', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:43');
INSERT INTO `sys_operation_log` VALUES ('940', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:35:45');
INSERT INTO `sys_operation_log` VALUES ('941', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:36:07');
INSERT INTO `sys_operation_log` VALUES ('942', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:36:23');
INSERT INTO `sys_operation_log` VALUES ('943', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:36:31');
INSERT INTO `sys_operation_log` VALUES ('944', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:36:56');
INSERT INTO `sys_operation_log` VALUES ('945', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:37:11');
INSERT INTO `sys_operation_log` VALUES ('946', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:38:48');
INSERT INTO `sys_operation_log` VALUES ('947', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:39:20');
INSERT INTO `sys_operation_log` VALUES ('948', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:42:43');
INSERT INTO `sys_operation_log` VALUES ('949', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:42:48');
INSERT INTO `sys_operation_log` VALUES ('950', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:42:51');
INSERT INTO `sys_operation_log` VALUES ('951', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:42:59');
INSERT INTO `sys_operation_log` VALUES ('952', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:43:06');
INSERT INTO `sys_operation_log` VALUES ('953', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:43:45');
INSERT INTO `sys_operation_log` VALUES ('954', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:45:35');
INSERT INTO `sys_operation_log` VALUES ('955', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:46:33');
INSERT INTO `sys_operation_log` VALUES ('956', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:49:56');
INSERT INTO `sys_operation_log` VALUES ('957', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:50:17');
INSERT INTO `sys_operation_log` VALUES ('958', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:50:27');
INSERT INTO `sys_operation_log` VALUES ('959', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:51:53');
INSERT INTO `sys_operation_log` VALUES ('960', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=&LoginPwd=&Phone=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:51:55');
INSERT INTO `sys_operation_log` VALUES ('961', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=&Phone=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:52:00');
INSERT INTO `sys_operation_log` VALUES ('962', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:52:06');
INSERT INTO `sys_operation_log` VALUES ('963', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=15236265820&RoleIdList=15,11', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:52:25');
INSERT INTO `sys_operation_log` VALUES ('964', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=15236265820&RoleIdList=15,11', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:52:48');
INSERT INTO `sys_operation_log` VALUES ('965', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:53:45');
INSERT INTO `sys_operation_log` VALUES ('966', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:53:50');
INSERT INTO `sys_operation_log` VALUES ('967', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=15236265820&RoleIdList=15,11', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:53:53');
INSERT INTO `sys_operation_log` VALUES ('968', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=15236265820&RoleIdList=15,11', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:55:27');
INSERT INTO `sys_operation_log` VALUES ('969', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:58:43');
INSERT INTO `sys_operation_log` VALUES ('970', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 10:58:51');
INSERT INTO `sys_operation_log` VALUES ('971', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', 'LoginID=0&LoginName=sa&LoginPwd=123456&Phone=15236265820&RoleIdList=15,11', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:58:53');
INSERT INTO `sys_operation_log` VALUES ('972', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:58:54');
INSERT INTO `sys_operation_log` VALUES ('973', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:59:03');
INSERT INTO `sys_operation_log` VALUES ('974', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:59:12');
INSERT INTO `sys_operation_log` VALUES ('975', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 10:59:35');
INSERT INTO `sys_operation_log` VALUES ('976', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 11:00:11');
INSERT INTO `sys_operation_log` VALUES ('977', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 11:01:08');
INSERT INTO `sys_operation_log` VALUES ('978', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 11:01:11');
INSERT INTO `sys_operation_log` VALUES ('979', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 11:01:37');
INSERT INTO `sys_operation_log` VALUES ('980', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 11:01:41');
INSERT INTO `sys_operation_log` VALUES ('981', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:52:28');
INSERT INTO `sys_operation_log` VALUES ('982', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:33');
INSERT INTO `sys_operation_log` VALUES ('983', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:53:40');
INSERT INTO `sys_operation_log` VALUES ('984', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:53:43');
INSERT INTO `sys_operation_log` VALUES ('985', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:43');
INSERT INTO `sys_operation_log` VALUES ('986', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:45');
INSERT INTO `sys_operation_log` VALUES ('987', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:53:49');
INSERT INTO `sys_operation_log` VALUES ('988', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:49');
INSERT INTO `sys_operation_log` VALUES ('989', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:51');
INSERT INTO `sys_operation_log` VALUES ('990', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:53:53');
INSERT INTO `sys_operation_log` VALUES ('991', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:53:55');
INSERT INTO `sys_operation_log` VALUES ('992', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:54:03');
INSERT INTO `sys_operation_log` VALUES ('993', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:54:06');
INSERT INTO `sys_operation_log` VALUES ('994', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:54:34');
INSERT INTO `sys_operation_log` VALUES ('995', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:55:07');
INSERT INTO `sys_operation_log` VALUES ('996', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:55:13');
INSERT INTO `sys_operation_log` VALUES ('997', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:56:45');
INSERT INTO `sys_operation_log` VALUES ('998', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:56:48');
INSERT INTO `sys_operation_log` VALUES ('999', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:56:51');
INSERT INTO `sys_operation_log` VALUES ('1000', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:56:52');
INSERT INTO `sys_operation_log` VALUES ('1001', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:56:57');
INSERT INTO `sys_operation_log` VALUES ('1002', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:57:38');
INSERT INTO `sys_operation_log` VALUES ('1003', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 14:57:42');
INSERT INTO `sys_operation_log` VALUES ('1004', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:57:45');
INSERT INTO `sys_operation_log` VALUES ('1005', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:57:46');
INSERT INTO `sys_operation_log` VALUES ('1006', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:57:50');
INSERT INTO `sys_operation_log` VALUES ('1007', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:57:50');
INSERT INTO `sys_operation_log` VALUES ('1008', '客户关系管理系统', 'localhost:61479/SysUser/Edit/2', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:57:52');
INSERT INTO `sys_operation_log` VALUES ('1009', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:58:07');
INSERT INTO `sys_operation_log` VALUES ('1010', '客户关系管理系统', 'localhost:61479/SysUser/Delete/2', '', 'SysUser', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:58:11');
INSERT INTO `sys_operation_log` VALUES ('1011', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:58:12');
INSERT INTO `sys_operation_log` VALUES ('1012', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:58:24');
INSERT INTO `sys_operation_log` VALUES ('1013', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 14:58:26');
INSERT INTO `sys_operation_log` VALUES ('1014', '客户关系管理系统', 'localhost:61479/account/login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:00:23');
INSERT INTO `sys_operation_log` VALUES ('1015', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:00:27');
INSERT INTO `sys_operation_log` VALUES ('1016', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:30');
INSERT INTO `sys_operation_log` VALUES ('1017', '客户关系管理系统', 'localhost:61479/SysUser/Delete/2', '', 'SysUser', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:36');
INSERT INTO `sys_operation_log` VALUES ('1018', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:36');
INSERT INTO `sys_operation_log` VALUES ('1019', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:48');
INSERT INTO `sys_operation_log` VALUES ('1020', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:57');
INSERT INTO `sys_operation_log` VALUES ('1021', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:00:57');
INSERT INTO `sys_operation_log` VALUES ('1022', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:01');
INSERT INTO `sys_operation_log` VALUES ('1023', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:10');
INSERT INTO `sys_operation_log` VALUES ('1024', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:17');
INSERT INTO `sys_operation_log` VALUES ('1025', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:21');
INSERT INTO `sys_operation_log` VALUES ('1026', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:21');
INSERT INTO `sys_operation_log` VALUES ('1027', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:23');
INSERT INTO `sys_operation_log` VALUES ('1028', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:25');
INSERT INTO `sys_operation_log` VALUES ('1029', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:25');
INSERT INTO `sys_operation_log` VALUES ('1030', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:27');
INSERT INTO `sys_operation_log` VALUES ('1031', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:30');
INSERT INTO `sys_operation_log` VALUES ('1032', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:30');
INSERT INTO `sys_operation_log` VALUES ('1033', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=admin&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:36');
INSERT INTO `sys_operation_log` VALUES ('1034', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=admin&RelName=3&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:38');
INSERT INTO `sys_operation_log` VALUES ('1035', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=admin&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:40');
INSERT INTO `sys_operation_log` VALUES ('1036', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=admin&RelName=&Phone=d', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:44');
INSERT INTO `sys_operation_log` VALUES ('1037', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=admin&RelName=&Phone=18601703095', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:46');
INSERT INTO `sys_operation_log` VALUES ('1038', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:47');
INSERT INTO `sys_operation_log` VALUES ('1039', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:57');
INSERT INTO `sys_operation_log` VALUES ('1040', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:58');
INSERT INTO `sys_operation_log` VALUES ('1041', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:58');
INSERT INTO `sys_operation_log` VALUES ('1042', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:58');
INSERT INTO `sys_operation_log` VALUES ('1043', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:59');
INSERT INTO `sys_operation_log` VALUES ('1044', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:01:59');
INSERT INTO `sys_operation_log` VALUES ('1045', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:01');
INSERT INTO `sys_operation_log` VALUES ('1046', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:04');
INSERT INTO `sys_operation_log` VALUES ('1047', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:06');
INSERT INTO `sys_operation_log` VALUES ('1048', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:08');
INSERT INTO `sys_operation_log` VALUES ('1049', '客户关系管理系统', 'localhost:61479/SysRole/Edit/15', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:09');
INSERT INTO `sys_operation_log` VALUES ('1050', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:13');
INSERT INTO `sys_operation_log` VALUES ('1051', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:17');
INSERT INTO `sys_operation_log` VALUES ('1052', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:53');
INSERT INTO `sys_operation_log` VALUES ('1053', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:04:54');
INSERT INTO `sys_operation_log` VALUES ('1054', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:05:12');
INSERT INTO `sys_operation_log` VALUES ('1055', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:09');
INSERT INTO `sys_operation_log` VALUES ('1056', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:13');
INSERT INTO `sys_operation_log` VALUES ('1057', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:27');
INSERT INTO `sys_operation_log` VALUES ('1058', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:31');
INSERT INTO `sys_operation_log` VALUES ('1059', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:32');
INSERT INTO `sys_operation_log` VALUES ('1060', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:33');
INSERT INTO `sys_operation_log` VALUES ('1061', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:34');
INSERT INTO `sys_operation_log` VALUES ('1062', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:39');
INSERT INTO `sys_operation_log` VALUES ('1063', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:06:50');
INSERT INTO `sys_operation_log` VALUES ('1064', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:07:09');
INSERT INTO `sys_operation_log` VALUES ('1065', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:07:18');
INSERT INTO `sys_operation_log` VALUES ('1066', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:07:45');
INSERT INTO `sys_operation_log` VALUES ('1067', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:07:58');
INSERT INTO `sys_operation_log` VALUES ('1068', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:08:23');
INSERT INTO `sys_operation_log` VALUES ('1069', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:08:51');
INSERT INTO `sys_operation_log` VALUES ('1070', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:08:52');
INSERT INTO `sys_operation_log` VALUES ('1071', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:08:52');
INSERT INTO `sys_operation_log` VALUES ('1072', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=1', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:08:55');
INSERT INTO `sys_operation_log` VALUES ('1073', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:09:06');
INSERT INTO `sys_operation_log` VALUES ('1074', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:09:14');
INSERT INTO `sys_operation_log` VALUES ('1075', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:09:56');
INSERT INTO `sys_operation_log` VALUES ('1076', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:03');
INSERT INTO `sys_operation_log` VALUES ('1077', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:05');
INSERT INTO `sys_operation_log` VALUES ('1078', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:07');
INSERT INTO `sys_operation_log` VALUES ('1079', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:07');
INSERT INTO `sys_operation_log` VALUES ('1080', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:07');
INSERT INTO `sys_operation_log` VALUES ('1081', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:10:08');
INSERT INTO `sys_operation_log` VALUES ('1082', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:20:50');
INSERT INTO `sys_operation_log` VALUES ('1083', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:20:54');
INSERT INTO `sys_operation_log` VALUES ('1084', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:20:59');
INSERT INTO `sys_operation_log` VALUES ('1085', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:20:59');
INSERT INTO `sys_operation_log` VALUES ('1086', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:21:01');
INSERT INTO `sys_operation_log` VALUES ('1087', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:21:03');
INSERT INTO `sys_operation_log` VALUES ('1088', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:05');
INSERT INTO `sys_operation_log` VALUES ('1089', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:06');
INSERT INTO `sys_operation_log` VALUES ('1090', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:07');
INSERT INTO `sys_operation_log` VALUES ('1091', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:08');
INSERT INTO `sys_operation_log` VALUES ('1092', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:08');
INSERT INTO `sys_operation_log` VALUES ('1093', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:08');
INSERT INTO `sys_operation_log` VALUES ('1094', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:21:09');
INSERT INTO `sys_operation_log` VALUES ('1095', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:53:29');
INSERT INTO `sys_operation_log` VALUES ('1096', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 15:53:33');
INSERT INTO `sys_operation_log` VALUES ('1097', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:53:36');
INSERT INTO `sys_operation_log` VALUES ('1098', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:53:38');
INSERT INTO `sys_operation_log` VALUES ('1099', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:53:38');
INSERT INTO `sys_operation_log` VALUES ('1100', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:53:43');
INSERT INTO `sys_operation_log` VALUES ('1101', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:53:43');
INSERT INTO `sys_operation_log` VALUES ('1102', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:57:05');
INSERT INTO `sys_operation_log` VALUES ('1103', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:57:05');
INSERT INTO `sys_operation_log` VALUES ('1104', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:59:23');
INSERT INTO `sys_operation_log` VALUES ('1105', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 15:59:23');
INSERT INTO `sys_operation_log` VALUES ('1106', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:03:03');
INSERT INTO `sys_operation_log` VALUES ('1107', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:03:03');
INSERT INTO `sys_operation_log` VALUES ('1108', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:04:56');
INSERT INTO `sys_operation_log` VALUES ('1109', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:04:56');
INSERT INTO `sys_operation_log` VALUES ('1110', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/11', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:06:01');
INSERT INTO `sys_operation_log` VALUES ('1111', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:06:01');
INSERT INTO `sys_operation_log` VALUES ('1112', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/11', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:06:12');
INSERT INTO `sys_operation_log` VALUES ('1113', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:06:13');
INSERT INTO `sys_operation_log` VALUES ('1114', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 16:44:02');
INSERT INTO `sys_operation_log` VALUES ('1115', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 16:44:10');
INSERT INTO `sys_operation_log` VALUES ('1116', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:48:41');
INSERT INTO `sys_operation_log` VALUES ('1117', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:48:45');
INSERT INTO `sys_operation_log` VALUES ('1118', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 16:48:50');
INSERT INTO `sys_operation_log` VALUES ('1119', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:27:24');
INSERT INTO `sys_operation_log` VALUES ('1120', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:27:57');
INSERT INTO `sys_operation_log` VALUES ('1121', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:01');
INSERT INTO `sys_operation_log` VALUES ('1122', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:01');
INSERT INTO `sys_operation_log` VALUES ('1123', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:01');
INSERT INTO `sys_operation_log` VALUES ('1124', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:02');
INSERT INTO `sys_operation_log` VALUES ('1125', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:04');
INSERT INTO `sys_operation_log` VALUES ('1126', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:11');
INSERT INTO `sys_operation_log` VALUES ('1127', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:12');
INSERT INTO `sys_operation_log` VALUES ('1128', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:12');
INSERT INTO `sys_operation_log` VALUES ('1129', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:12');
INSERT INTO `sys_operation_log` VALUES ('1130', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:14');
INSERT INTO `sys_operation_log` VALUES ('1131', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:15');
INSERT INTO `sys_operation_log` VALUES ('1132', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:15');
INSERT INTO `sys_operation_log` VALUES ('1133', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:17');
INSERT INTO `sys_operation_log` VALUES ('1134', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:17');
INSERT INTO `sys_operation_log` VALUES ('1135', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationSave', 'roleId=15&moduleIds=,1,2,3,7,11', 'SysRole', 'AuthorizationSave', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:24');
INSERT INTO `sys_operation_log` VALUES ('1136', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:26');
INSERT INTO `sys_operation_log` VALUES ('1137', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:26');
INSERT INTO `sys_operation_log` VALUES ('1138', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:43');
INSERT INTO `sys_operation_log` VALUES ('1139', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:44');
INSERT INTO `sys_operation_log` VALUES ('1140', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:47');
INSERT INTO `sys_operation_log` VALUES ('1141', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:28:47');
INSERT INTO `sys_operation_log` VALUES ('1142', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:29:47');
INSERT INTO `sys_operation_log` VALUES ('1143', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:29:54');
INSERT INTO `sys_operation_log` VALUES ('1144', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:29:56');
INSERT INTO `sys_operation_log` VALUES ('1145', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:29:59');
INSERT INTO `sys_operation_log` VALUES ('1146', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:00');
INSERT INTO `sys_operation_log` VALUES ('1147', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:00');
INSERT INTO `sys_operation_log` VALUES ('1148', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:08');
INSERT INTO `sys_operation_log` VALUES ('1149', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:08');
INSERT INTO `sys_operation_log` VALUES ('1150', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:19');
INSERT INTO `sys_operation_log` VALUES ('1151', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:30:19');
INSERT INTO `sys_operation_log` VALUES ('1152', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:30:57');
INSERT INTO `sys_operation_log` VALUES ('1153', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:31:02');
INSERT INTO `sys_operation_log` VALUES ('1154', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:07');
INSERT INTO `sys_operation_log` VALUES ('1155', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:09');
INSERT INTO `sys_operation_log` VALUES ('1156', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:09');
INSERT INTO `sys_operation_log` VALUES ('1157', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:31:20');
INSERT INTO `sys_operation_log` VALUES ('1158', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:31:24');
INSERT INTO `sys_operation_log` VALUES ('1159', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:31:25');
INSERT INTO `sys_operation_log` VALUES ('1160', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:29');
INSERT INTO `sys_operation_log` VALUES ('1161', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:31');
INSERT INTO `sys_operation_log` VALUES ('1162', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:31');
INSERT INTO `sys_operation_log` VALUES ('1163', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:42');
INSERT INTO `sys_operation_log` VALUES ('1164', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:31:42');
INSERT INTO `sys_operation_log` VALUES ('1165', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:34:18');
INSERT INTO `sys_operation_log` VALUES ('1166', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:34:22');
INSERT INTO `sys_operation_log` VALUES ('1167', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:26');
INSERT INTO `sys_operation_log` VALUES ('1168', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:27');
INSERT INTO `sys_operation_log` VALUES ('1169', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=15', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:27');
INSERT INTO `sys_operation_log` VALUES ('1170', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:36');
INSERT INTO `sys_operation_log` VALUES ('1171', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:37');
INSERT INTO `sys_operation_log` VALUES ('1172', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=15', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:37');
INSERT INTO `sys_operation_log` VALUES ('1173', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationSave', 'roleId=15&moduleIds=,1,4,5,6', 'SysRole', 'AuthorizationSave', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:43');
INSERT INTO `sys_operation_log` VALUES ('1174', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:45');
INSERT INTO `sys_operation_log` VALUES ('1175', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=15', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:45');
INSERT INTO `sys_operation_log` VALUES ('1176', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/15', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:56');
INSERT INTO `sys_operation_log` VALUES ('1177', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=15', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:34:56');
INSERT INTO `sys_operation_log` VALUES ('1178', '客户关系管理系统', 'localhost:61479/SysRole/Delete/15', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:20');
INSERT INTO `sys_operation_log` VALUES ('1179', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:20');
INSERT INTO `sys_operation_log` VALUES ('1180', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:33');
INSERT INTO `sys_operation_log` VALUES ('1181', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=14', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:33');
INSERT INTO `sys_operation_log` VALUES ('1182', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:36');
INSERT INTO `sys_operation_log` VALUES ('1183', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:39');
INSERT INTO `sys_operation_log` VALUES ('1184', '客户关系管理系统', 'localhost:61479/SysUser/Edit/1', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:42');
INSERT INTO `sys_operation_log` VALUES ('1185', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:44');
INSERT INTO `sys_operation_log` VALUES ('1186', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:46');
INSERT INTO `sys_operation_log` VALUES ('1187', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:46');
INSERT INTO `sys_operation_log` VALUES ('1188', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:46');
INSERT INTO `sys_operation_log` VALUES ('1189', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:48');
INSERT INTO `sys_operation_log` VALUES ('1190', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:49');
INSERT INTO `sys_operation_log` VALUES ('1191', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:51');
INSERT INTO `sys_operation_log` VALUES ('1192', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:35:54');
INSERT INTO `sys_operation_log` VALUES ('1193', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=2&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:11');
INSERT INTO `sys_operation_log` VALUES ('1194', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:13');
INSERT INTO `sys_operation_log` VALUES ('1195', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:31');
INSERT INTO `sys_operation_log` VALUES ('1196', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:31');
INSERT INTO `sys_operation_log` VALUES ('1197', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:31');
INSERT INTO `sys_operation_log` VALUES ('1198', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:32');
INSERT INTO `sys_operation_log` VALUES ('1199', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:33');
INSERT INTO `sys_operation_log` VALUES ('1200', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:39');
INSERT INTO `sys_operation_log` VALUES ('1201', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:36:54');
INSERT INTO `sys_operation_log` VALUES ('1202', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:37:04');
INSERT INTO `sys_operation_log` VALUES ('1203', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:37:08');
INSERT INTO `sys_operation_log` VALUES ('1204', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:08');
INSERT INTO `sys_operation_log` VALUES ('1205', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:08');
INSERT INTO `sys_operation_log` VALUES ('1206', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:08');
INSERT INTO `sys_operation_log` VALUES ('1207', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:10');
INSERT INTO `sys_operation_log` VALUES ('1208', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:25');
INSERT INTO `sys_operation_log` VALUES ('1209', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:25');
INSERT INTO `sys_operation_log` VALUES ('1210', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:25');
INSERT INTO `sys_operation_log` VALUES ('1211', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:26');
INSERT INTO `sys_operation_log` VALUES ('1212', '客户关系管理系统', 'localhost:61479/SysRole/Edit/14', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:30');
INSERT INTO `sys_operation_log` VALUES ('1213', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:36');
INSERT INTO `sys_operation_log` VALUES ('1214', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree', '?id=14', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:36');
INSERT INTO `sys_operation_log` VALUES ('1215', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationSave', 'roleId=14&moduleIds=,1,2,3,7,11', 'SysRole', 'AuthorizationSave', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:38');
INSERT INTO `sys_operation_log` VALUES ('1216', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:40');
INSERT INTO `sys_operation_log` VALUES ('1217', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:42');
INSERT INTO `sys_operation_log` VALUES ('1218', '客户关系管理系统', 'localhost:61479/SysUser/Edit/3', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:49');
INSERT INTO `sys_operation_log` VALUES ('1219', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:49');
INSERT INTO `sys_operation_log` VALUES ('1220', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:44:52');
INSERT INTO `sys_operation_log` VALUES ('1221', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:44:52');
INSERT INTO `sys_operation_log` VALUES ('1222', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:44:55');
INSERT INTO `sys_operation_log` VALUES ('1223', '客户关系管理系统', 'localhost:61479/account/login', '?error=菜单【/Main/Index】没有权限，请联系管理员', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:44:55');
INSERT INTO `sys_operation_log` VALUES ('1224', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:47:47');
INSERT INTO `sys_operation_log` VALUES ('1225', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 17:47:53');
INSERT INTO `sys_operation_log` VALUES ('1226', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:47:53');
INSERT INTO `sys_operation_log` VALUES ('1227', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 17:47:56');
INSERT INTO `sys_operation_log` VALUES ('1228', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:48:03');
INSERT INTO `sys_operation_log` VALUES ('1229', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:48:11');
INSERT INTO `sys_operation_log` VALUES ('1230', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:48:16');
INSERT INTO `sys_operation_log` VALUES ('1231', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:49:32');
INSERT INTO `sys_operation_log` VALUES ('1232', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:52:48');
INSERT INTO `sys_operation_log` VALUES ('1233', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:52:54');
INSERT INTO `sys_operation_log` VALUES ('1234', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:55:41');
INSERT INTO `sys_operation_log` VALUES ('1235', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:56:25');
INSERT INTO `sys_operation_log` VALUES ('1236', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:56:46');
INSERT INTO `sys_operation_log` VALUES ('1237', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:57:28');
INSERT INTO `sys_operation_log` VALUES ('1238', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:57:47');
INSERT INTO `sys_operation_log` VALUES ('1239', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:58:05');
INSERT INTO `sys_operation_log` VALUES ('1240', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 17:59:26');
INSERT INTO `sys_operation_log` VALUES ('1241', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 18:00:24');
INSERT INTO `sys_operation_log` VALUES ('1242', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 18:01:22');
INSERT INTO `sys_operation_log` VALUES ('1243', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 18:02:37');
INSERT INTO `sys_operation_log` VALUES ('1244', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 18:03:30');
INSERT INTO `sys_operation_log` VALUES ('1245', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-14 18:09:28');
INSERT INTO `sys_operation_log` VALUES ('1246', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 18:09:28');
INSERT INTO `sys_operation_log` VALUES ('1247', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-14 18:09:30');
INSERT INTO `sys_operation_log` VALUES ('1248', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 18:09:32');
INSERT INTO `sys_operation_log` VALUES ('1249', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-14 18:09:33');
INSERT INTO `sys_operation_log` VALUES ('1250', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 09:55:02');
INSERT INTO `sys_operation_log` VALUES ('1251', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 09:55:07');
INSERT INTO `sys_operation_log` VALUES ('1252', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 09:55:12');
INSERT INTO `sys_operation_log` VALUES ('1253', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 09:55:13');
INSERT INTO `sys_operation_log` VALUES ('1254', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 09:55:15');
INSERT INTO `sys_operation_log` VALUES ('1255', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 09:56:52');
INSERT INTO `sys_operation_log` VALUES ('1256', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 09:56:55');
INSERT INTO `sys_operation_log` VALUES ('1257', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 09:56:59');
INSERT INTO `sys_operation_log` VALUES ('1258', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 09:57:00');
INSERT INTO `sys_operation_log` VALUES ('1259', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:00:06');
INSERT INTO `sys_operation_log` VALUES ('1260', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:00:07');
INSERT INTO `sys_operation_log` VALUES ('1261', '客户关系管理系统', 'localhost:61479/account/login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 10:04:10');
INSERT INTO `sys_operation_log` VALUES ('1262', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 10:04:14');
INSERT INTO `sys_operation_log` VALUES ('1263', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:04:17');
INSERT INTO `sys_operation_log` VALUES ('1264', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:04:20');
INSERT INTO `sys_operation_log` VALUES ('1265', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 10:04:47');
INSERT INTO `sys_operation_log` VALUES ('1266', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 10:04:55');
INSERT INTO `sys_operation_log` VALUES ('1267', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:04:58');
INSERT INTO `sys_operation_log` VALUES ('1268', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:04:59');
INSERT INTO `sys_operation_log` VALUES ('1269', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:10:11');
INSERT INTO `sys_operation_log` VALUES ('1270', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:10:13');
INSERT INTO `sys_operation_log` VALUES ('1271', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:10:19');
INSERT INTO `sys_operation_log` VALUES ('1272', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=wwwwww', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:10:21');
INSERT INTO `sys_operation_log` VALUES ('1273', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:10:21');
INSERT INTO `sys_operation_log` VALUES ('1274', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:12:27');
INSERT INTO `sys_operation_log` VALUES ('1275', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:13:15');
INSERT INTO `sys_operation_log` VALUES ('1276', '客户关系管理系统', 'localhost:61479/SysRole/Delete/16', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:13:17');
INSERT INTO `sys_operation_log` VALUES ('1277', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:13:17');
INSERT INTO `sys_operation_log` VALUES ('1278', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:31:02');
INSERT INTO `sys_operation_log` VALUES ('1279', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:31:03');
INSERT INTO `sys_operation_log` VALUES ('1280', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:31:03');
INSERT INTO `sys_operation_log` VALUES ('1281', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:31:04');
INSERT INTO `sys_operation_log` VALUES ('1282', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:36:36');
INSERT INTO `sys_operation_log` VALUES ('1283', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:36:37');
INSERT INTO `sys_operation_log` VALUES ('1284', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:36:37');
INSERT INTO `sys_operation_log` VALUES ('1285', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:36:37');
INSERT INTO `sys_operation_log` VALUES ('1286', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:37:53');
INSERT INTO `sys_operation_log` VALUES ('1287', '客户关系管理系统', 'localhost:61479/SysRole/Delete/2', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:37:59');
INSERT INTO `sys_operation_log` VALUES ('1288', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:37:59');
INSERT INTO `sys_operation_log` VALUES ('1289', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:38:08');
INSERT INTO `sys_operation_log` VALUES ('1290', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:43');
INSERT INTO `sys_operation_log` VALUES ('1291', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:44');
INSERT INTO `sys_operation_log` VALUES ('1292', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:45');
INSERT INTO `sys_operation_log` VALUES ('1293', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=saw', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:48');
INSERT INTO `sys_operation_log` VALUES ('1294', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:48');
INSERT INTO `sys_operation_log` VALUES ('1295', '客户关系管理系统', 'localhost:61479/SysRole/Edit/17', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:51');
INSERT INTO `sys_operation_log` VALUES ('1296', '客户关系管理系统', 'localhost:61479/SysRole/Edit/17', 'RoleId=17&RoleName=saw', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:53');
INSERT INTO `sys_operation_log` VALUES ('1297', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:41:53');
INSERT INTO `sys_operation_log` VALUES ('1298', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:43:17');
INSERT INTO `sys_operation_log` VALUES ('1299', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:43:18');
INSERT INTO `sys_operation_log` VALUES ('1300', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:28');
INSERT INTO `sys_operation_log` VALUES ('1301', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:30');
INSERT INTO `sys_operation_log` VALUES ('1302', '客户关系管理系统', 'localhost:61479/SysRole/Edit/17', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:32');
INSERT INTO `sys_operation_log` VALUES ('1303', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:34');
INSERT INTO `sys_operation_log` VALUES ('1304', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=a', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:37');
INSERT INTO `sys_operation_log` VALUES ('1305', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:37');
INSERT INTO `sys_operation_log` VALUES ('1306', '客户关系管理系统', 'localhost:61479/SysRole/Delete/18', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:39');
INSERT INTO `sys_operation_log` VALUES ('1307', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:39');
INSERT INTO `sys_operation_log` VALUES ('1308', '客户关系管理系统', 'localhost:61479/SysRole/Edit/17', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:40');
INSERT INTO `sys_operation_log` VALUES ('1309', '客户关系管理系统', 'localhost:61479/SysRole/Edit/17', 'RoleId=17&RoleName=saw', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:42');
INSERT INTO `sys_operation_log` VALUES ('1310', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:47:42');
INSERT INTO `sys_operation_log` VALUES ('1311', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:52:33');
INSERT INTO `sys_operation_log` VALUES ('1312', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/14', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:52:34');
INSERT INTO `sys_operation_log` VALUES ('1313', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/14', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:52:34');
INSERT INTO `sys_operation_log` VALUES ('1314', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/8', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:52:37');
INSERT INTO `sys_operation_log` VALUES ('1315', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/8', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:52:37');
INSERT INTO `sys_operation_log` VALUES ('1316', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:17');
INSERT INTO `sys_operation_log` VALUES ('1317', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:17');
INSERT INTO `sys_operation_log` VALUES ('1318', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:17');
INSERT INTO `sys_operation_log` VALUES ('1319', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:18');
INSERT INTO `sys_operation_log` VALUES ('1320', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:19');
INSERT INTO `sys_operation_log` VALUES ('1321', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:21');
INSERT INTO `sys_operation_log` VALUES ('1322', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=4', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:23');
INSERT INTO `sys_operation_log` VALUES ('1323', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=4&ModuleName=cc&ControllerName=a&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:28');
INSERT INTO `sys_operation_log` VALUES ('1324', '客户关系管理系统', 'localhost:61479/SysModule/Delete/12', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:35');
INSERT INTO `sys_operation_log` VALUES ('1325', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:36');
INSERT INTO `sys_operation_log` VALUES ('1326', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:37');
INSERT INTO `sys_operation_log` VALUES ('1327', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:37');
INSERT INTO `sys_operation_log` VALUES ('1328', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:37');
INSERT INTO `sys_operation_log` VALUES ('1329', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:55:38');
INSERT INTO `sys_operation_log` VALUES ('1330', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:33');
INSERT INTO `sys_operation_log` VALUES ('1331', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:33');
INSERT INTO `sys_operation_log` VALUES ('1332', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:33');
INSERT INTO `sys_operation_log` VALUES ('1333', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:34');
INSERT INTO `sys_operation_log` VALUES ('1334', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:35');
INSERT INTO `sys_operation_log` VALUES ('1335', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=6', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:36');
INSERT INTO `sys_operation_log` VALUES ('1336', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=6&ParentId=4&ModuleName=异常日志&ControllerName=Log&ActionName=ExceptionLogManger&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:37');
INSERT INTO `sys_operation_log` VALUES ('1337', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=6', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:41');
INSERT INTO `sys_operation_log` VALUES ('1338', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=6&ModuleName=aa&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:43');
INSERT INTO `sys_operation_log` VALUES ('1339', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=6&ModuleName=aa&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:45');
INSERT INTO `sys_operation_log` VALUES ('1340', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=6&ModuleName=aa&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 10:59:45');
INSERT INTO `sys_operation_log` VALUES ('1341', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:18');
INSERT INTO `sys_operation_log` VALUES ('1342', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:18');
INSERT INTO `sys_operation_log` VALUES ('1343', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:18');
INSERT INTO `sys_operation_log` VALUES ('1344', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:19');
INSERT INTO `sys_operation_log` VALUES ('1345', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:20');
INSERT INTO `sys_operation_log` VALUES ('1346', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=异常日志&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:00:21');
INSERT INTO `sys_operation_log` VALUES ('1347', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:31');
INSERT INTO `sys_operation_log` VALUES ('1348', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:31');
INSERT INTO `sys_operation_log` VALUES ('1349', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:31');
INSERT INTO `sys_operation_log` VALUES ('1350', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:32');
INSERT INTO `sys_operation_log` VALUES ('1351', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:34');
INSERT INTO `sys_operation_log` VALUES ('1352', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=异常日志&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:35');
INSERT INTO `sys_operation_log` VALUES ('1353', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=15', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:37');
INSERT INTO `sys_operation_log` VALUES ('1354', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=15&ParentId=6&ModuleName=aa&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:01:40');
INSERT INTO `sys_operation_log` VALUES ('1355', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:37');
INSERT INTO `sys_operation_log` VALUES ('1356', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:39');
INSERT INTO `sys_operation_log` VALUES ('1357', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:39');
INSERT INTO `sys_operation_log` VALUES ('1358', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:39');
INSERT INTO `sys_operation_log` VALUES ('1359', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:40');
INSERT INTO `sys_operation_log` VALUES ('1360', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:41');
INSERT INTO `sys_operation_log` VALUES ('1361', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=6&n=异常日志&lv=3&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:41');
INSERT INTO `sys_operation_log` VALUES ('1362', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=15', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:43');
INSERT INTO `sys_operation_log` VALUES ('1363', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=15&ParentId=6&ModuleName=aaa&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:45');
INSERT INTO `sys_operation_log` VALUES ('1364', '客户关系管理系统', 'localhost:61479/SysModule/Delete/15', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:49');
INSERT INTO `sys_operation_log` VALUES ('1365', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=6', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:52');
INSERT INTO `sys_operation_log` VALUES ('1366', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=6&ModuleName=bb&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:02:54');
INSERT INTO `sys_operation_log` VALUES ('1367', '客户关系管理系统', 'localhost:61479/SysModule/Delete/13', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:03:07');
INSERT INTO `sys_operation_log` VALUES ('1368', '客户关系管理系统', 'localhost:61479/SysModule/Delete/14', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:03:10');
INSERT INTO `sys_operation_log` VALUES ('1369', '客户关系管理系统', 'localhost:61479/SysModule/Delete/16', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:03:12');
INSERT INTO `sys_operation_log` VALUES ('1370', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:13:42');
INSERT INTO `sys_operation_log` VALUES ('1371', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:13:46');
INSERT INTO `sys_operation_log` VALUES ('1372', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:13:50');
INSERT INTO `sys_operation_log` VALUES ('1373', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:13:54');
INSERT INTO `sys_operation_log` VALUES ('1374', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:17:00');
INSERT INTO `sys_operation_log` VALUES ('1375', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:17:05');
INSERT INTO `sys_operation_log` VALUES ('1376', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:17:07');
INSERT INTO `sys_operation_log` VALUES ('1377', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:19:04');
INSERT INTO `sys_operation_log` VALUES ('1378', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:19:09');
INSERT INTO `sys_operation_log` VALUES ('1379', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:19:12');
INSERT INTO `sys_operation_log` VALUES ('1380', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:19:12');
INSERT INTO `sys_operation_log` VALUES ('1381', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:19:20');
INSERT INTO `sys_operation_log` VALUES ('1382', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:19:50');
INSERT INTO `sys_operation_log` VALUES ('1383', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:19:54');
INSERT INTO `sys_operation_log` VALUES ('1384', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:19:57');
INSERT INTO `sys_operation_log` VALUES ('1385', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:19:58');
INSERT INTO `sys_operation_log` VALUES ('1386', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:20:51');
INSERT INTO `sys_operation_log` VALUES ('1387', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:20:56');
INSERT INTO `sys_operation_log` VALUES ('1388', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:21:01');
INSERT INTO `sys_operation_log` VALUES ('1389', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:22:05');
INSERT INTO `sys_operation_log` VALUES ('1390', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:22:10');
INSERT INTO `sys_operation_log` VALUES ('1391', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:22:13');
INSERT INTO `sys_operation_log` VALUES ('1392', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:24:00');
INSERT INTO `sys_operation_log` VALUES ('1393', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:24:51');
INSERT INTO `sys_operation_log` VALUES ('1394', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:26:55');
INSERT INTO `sys_operation_log` VALUES ('1395', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:29:43');
INSERT INTO `sys_operation_log` VALUES ('1396', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:29:48');
INSERT INTO `sys_operation_log` VALUES ('1397', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:29:51');
INSERT INTO `sys_operation_log` VALUES ('1398', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:29:52');
INSERT INTO `sys_operation_log` VALUES ('1399', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:30:10');
INSERT INTO `sys_operation_log` VALUES ('1400', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:30:21');
INSERT INTO `sys_operation_log` VALUES ('1401', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:31:24');
INSERT INTO `sys_operation_log` VALUES ('1402', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:33:32');
INSERT INTO `sys_operation_log` VALUES ('1403', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:33:33');
INSERT INTO `sys_operation_log` VALUES ('1404', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:33:38');
INSERT INTO `sys_operation_log` VALUES ('1405', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:35:49');
INSERT INTO `sys_operation_log` VALUES ('1406', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:35:53');
INSERT INTO `sys_operation_log` VALUES ('1407', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:35:56');
INSERT INTO `sys_operation_log` VALUES ('1408', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:36:16');
INSERT INTO `sys_operation_log` VALUES ('1409', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:36:20');
INSERT INTO `sys_operation_log` VALUES ('1410', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:14');
INSERT INTO `sys_operation_log` VALUES ('1411', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:14');
INSERT INTO `sys_operation_log` VALUES ('1412', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:14');
INSERT INTO `sys_operation_log` VALUES ('1413', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:16');
INSERT INTO `sys_operation_log` VALUES ('1414', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:17');
INSERT INTO `sys_operation_log` VALUES ('1415', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:18');
INSERT INTO `sys_operation_log` VALUES ('1416', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:19');
INSERT INTO `sys_operation_log` VALUES ('1417', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:37:22');
INSERT INTO `sys_operation_log` VALUES ('1418', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:37:22');
INSERT INTO `sys_operation_log` VALUES ('1419', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:37:24');
INSERT INTO `sys_operation_log` VALUES ('1420', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:37:26');
INSERT INTO `sys_operation_log` VALUES ('1421', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:37:48');
INSERT INTO `sys_operation_log` VALUES ('1422', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:40:08');
INSERT INTO `sys_operation_log` VALUES ('1423', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:40:08');
INSERT INTO `sys_operation_log` VALUES ('1424', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:40:09');
INSERT INTO `sys_operation_log` VALUES ('1425', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:40:11');
INSERT INTO `sys_operation_log` VALUES ('1426', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:40:13');
INSERT INTO `sys_operation_log` VALUES ('1427', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:40:13');
INSERT INTO `sys_operation_log` VALUES ('1428', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:40:15');
INSERT INTO `sys_operation_log` VALUES ('1429', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:40:18');
INSERT INTO `sys_operation_log` VALUES ('1430', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:41:49');
INSERT INTO `sys_operation_log` VALUES ('1431', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:41:52');
INSERT INTO `sys_operation_log` VALUES ('1432', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:43:02');
INSERT INTO `sys_operation_log` VALUES ('1433', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:43:43');
INSERT INTO `sys_operation_log` VALUES ('1434', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:43:53');
INSERT INTO `sys_operation_log` VALUES ('1435', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '3', 'sa', '\0', '0', null, '3', '2018-08-15 11:44:01');
INSERT INTO `sys_operation_log` VALUES ('1436', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:44:01');
INSERT INTO `sys_operation_log` VALUES ('1437', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 11:44:02');
INSERT INTO `sys_operation_log` VALUES ('1438', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:44:03');
INSERT INTO `sys_operation_log` VALUES ('1439', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:44:03');
INSERT INTO `sys_operation_log` VALUES ('1440', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:44:03');
INSERT INTO `sys_operation_log` VALUES ('1441', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 11:44:05');
INSERT INTO `sys_operation_log` VALUES ('1442', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:14:47');
INSERT INTO `sys_operation_log` VALUES ('1443', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:15:02');
INSERT INTO `sys_operation_log` VALUES ('1444', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:08');
INSERT INTO `sys_operation_log` VALUES ('1445', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:10');
INSERT INTO `sys_operation_log` VALUES ('1446', '客户关系管理系统', 'localhost:61479/SysRole/Delete/3', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:23');
INSERT INTO `sys_operation_log` VALUES ('1447', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:23');
INSERT INTO `sys_operation_log` VALUES ('1448', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:30');
INSERT INTO `sys_operation_log` VALUES ('1449', '客户关系管理系统', 'localhost:61479/SysRole/Delete/4', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:47');
INSERT INTO `sys_operation_log` VALUES ('1450', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:15:47');
INSERT INTO `sys_operation_log` VALUES ('1451', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:16:06');
INSERT INTO `sys_operation_log` VALUES ('1452', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:16:10');
INSERT INTO `sys_operation_log` VALUES ('1453', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:13');
INSERT INTO `sys_operation_log` VALUES ('1454', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:15');
INSERT INTO `sys_operation_log` VALUES ('1455', '客户关系管理系统', 'localhost:61479/SysRole/Delete/1', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:25');
INSERT INTO `sys_operation_log` VALUES ('1456', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:25');
INSERT INTO `sys_operation_log` VALUES ('1457', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:39');
INSERT INTO `sys_operation_log` VALUES ('1458', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:48');
INSERT INTO `sys_operation_log` VALUES ('1459', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:50');
INSERT INTO `sys_operation_log` VALUES ('1460', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:16:53');
INSERT INTO `sys_operation_log` VALUES ('1461', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:04');
INSERT INTO `sys_operation_log` VALUES ('1462', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:06');
INSERT INTO `sys_operation_log` VALUES ('1463', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:10');
INSERT INTO `sys_operation_log` VALUES ('1464', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:22');
INSERT INTO `sys_operation_log` VALUES ('1465', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:23');
INSERT INTO `sys_operation_log` VALUES ('1466', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:27');
INSERT INTO `sys_operation_log` VALUES ('1467', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:17:31');
INSERT INTO `sys_operation_log` VALUES ('1468', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:12');
INSERT INTO `sys_operation_log` VALUES ('1469', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:15');
INSERT INTO `sys_operation_log` VALUES ('1470', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:17');
INSERT INTO `sys_operation_log` VALUES ('1471', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:18:32');
INSERT INTO `sys_operation_log` VALUES ('1472', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:19:43');
INSERT INTO `sys_operation_log` VALUES ('1473', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:19:49');
INSERT INTO `sys_operation_log` VALUES ('1474', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:19:53');
INSERT INTO `sys_operation_log` VALUES ('1475', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:19:54');
INSERT INTO `sys_operation_log` VALUES ('1476', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:19:54');
INSERT INTO `sys_operation_log` VALUES ('1477', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:19:54');
INSERT INTO `sys_operation_log` VALUES ('1478', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:19:56');
INSERT INTO `sys_operation_log` VALUES ('1479', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:25:18');
INSERT INTO `sys_operation_log` VALUES ('1480', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:25:22');
INSERT INTO `sys_operation_log` VALUES ('1481', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:30:58');
INSERT INTO `sys_operation_log` VALUES ('1482', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:30:58');
INSERT INTO `sys_operation_log` VALUES ('1483', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:30:58');
INSERT INTO `sys_operation_log` VALUES ('1484', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:31:00');
INSERT INTO `sys_operation_log` VALUES ('1485', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:31:02');
INSERT INTO `sys_operation_log` VALUES ('1486', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:33:57');
INSERT INTO `sys_operation_log` VALUES ('1487', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:34:01');
INSERT INTO `sys_operation_log` VALUES ('1488', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:05');
INSERT INTO `sys_operation_log` VALUES ('1489', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:05');
INSERT INTO `sys_operation_log` VALUES ('1490', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:05');
INSERT INTO `sys_operation_log` VALUES ('1491', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:06');
INSERT INTO `sys_operation_log` VALUES ('1492', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:07');
INSERT INTO `sys_operation_log` VALUES ('1493', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=aa&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:10');
INSERT INTO `sys_operation_log` VALUES ('1494', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:34:12');
INSERT INTO `sys_operation_log` VALUES ('1495', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:45');
INSERT INTO `sys_operation_log` VALUES ('1496', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:45');
INSERT INTO `sys_operation_log` VALUES ('1497', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:45');
INSERT INTO `sys_operation_log` VALUES ('1498', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:46');
INSERT INTO `sys_operation_log` VALUES ('1499', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:47');
INSERT INTO `sys_operation_log` VALUES ('1500', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:56');
INSERT INTO `sys_operation_log` VALUES ('1501', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:56');
INSERT INTO `sys_operation_log` VALUES ('1502', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:56');
INSERT INTO `sys_operation_log` VALUES ('1503', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:57');
INSERT INTO `sys_operation_log` VALUES ('1504', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:57');
INSERT INTO `sys_operation_log` VALUES ('1505', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=6', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 13:44:59');
INSERT INTO `sys_operation_log` VALUES ('1506', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 13:45:53');
INSERT INTO `sys_operation_log` VALUES ('1507', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:04:36');
INSERT INTO `sys_operation_log` VALUES ('1508', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:04:41');
INSERT INTO `sys_operation_log` VALUES ('1509', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:05:08');
INSERT INTO `sys_operation_log` VALUES ('1510', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:05:08');
INSERT INTO `sys_operation_log` VALUES ('1511', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:05:08');
INSERT INTO `sys_operation_log` VALUES ('1512', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:07:17');
INSERT INTO `sys_operation_log` VALUES ('1513', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:07:18');
INSERT INTO `sys_operation_log` VALUES ('1514', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:07:24');
INSERT INTO `sys_operation_log` VALUES ('1515', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:07:24');
INSERT INTO `sys_operation_log` VALUES ('1516', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:07:24');
INSERT INTO `sys_operation_log` VALUES ('1517', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:07:25');
INSERT INTO `sys_operation_log` VALUES ('1518', '客户关系管理系统', 'localhost:7072/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:07:26');
INSERT INTO `sys_operation_log` VALUES ('1519', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:15:24');
INSERT INTO `sys_operation_log` VALUES ('1520', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:17:25');
INSERT INTO `sys_operation_log` VALUES ('1521', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:17:34');
INSERT INTO `sys_operation_log` VALUES ('1522', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:24:14');
INSERT INTO `sys_operation_log` VALUES ('1523', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 14:24:16');
INSERT INTO `sys_operation_log` VALUES ('1524', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1525', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1526', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1527', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:25');
INSERT INTO `sys_operation_log` VALUES ('1528', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:25');
INSERT INTO `sys_operation_log` VALUES ('1529', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:25');
INSERT INTO `sys_operation_log` VALUES ('1530', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:32');
INSERT INTO `sys_operation_log` VALUES ('1531', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 14:24:33');
INSERT INTO `sys_operation_log` VALUES ('1532', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:19:28');
INSERT INTO `sys_operation_log` VALUES ('1533', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:19:29');
INSERT INTO `sys_operation_log` VALUES ('1534', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:33');
INSERT INTO `sys_operation_log` VALUES ('1535', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:34');
INSERT INTO `sys_operation_log` VALUES ('1536', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:34');
INSERT INTO `sys_operation_log` VALUES ('1537', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:35');
INSERT INTO `sys_operation_log` VALUES ('1538', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:37');
INSERT INTO `sys_operation_log` VALUES ('1539', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:39');
INSERT INTO `sys_operation_log` VALUES ('1540', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:19:57');
INSERT INTO `sys_operation_log` VALUES ('1541', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:20:02');
INSERT INTO `sys_operation_log` VALUES ('1542', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:20:30');
INSERT INTO `sys_operation_log` VALUES ('1543', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:20:31');
INSERT INTO `sys_operation_log` VALUES ('1544', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:49:13');
INSERT INTO `sys_operation_log` VALUES ('1545', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:49:16');
INSERT INTO `sys_operation_log` VALUES ('1546', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:49:29');
INSERT INTO `sys_operation_log` VALUES ('1547', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:49:29');
INSERT INTO `sys_operation_log` VALUES ('1548', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:49:29');
INSERT INTO `sys_operation_log` VALUES ('1549', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:49:30');
INSERT INTO `sys_operation_log` VALUES ('1550', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:49:34');
INSERT INTO `sys_operation_log` VALUES ('1551', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:00');
INSERT INTO `sys_operation_log` VALUES ('1552', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:00');
INSERT INTO `sys_operation_log` VALUES ('1553', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:00');
INSERT INTO `sys_operation_log` VALUES ('1554', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:01');
INSERT INTO `sys_operation_log` VALUES ('1555', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:01');
INSERT INTO `sys_operation_log` VALUES ('1556', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:51:01');
INSERT INTO `sys_operation_log` VALUES ('1557', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:52:16');
INSERT INTO `sys_operation_log` VALUES ('1558', '客户关系管理系统', 'localhost:7072/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:52:21');
INSERT INTO `sys_operation_log` VALUES ('1559', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:52:22');
INSERT INTO `sys_operation_log` VALUES ('1560', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:57:14');
INSERT INTO `sys_operation_log` VALUES ('1561', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 15:57:21');
INSERT INTO `sys_operation_log` VALUES ('1562', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:51');
INSERT INTO `sys_operation_log` VALUES ('1563', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:51');
INSERT INTO `sys_operation_log` VALUES ('1564', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:52');
INSERT INTO `sys_operation_log` VALUES ('1565', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:53');
INSERT INTO `sys_operation_log` VALUES ('1566', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:55');
INSERT INTO `sys_operation_log` VALUES ('1567', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 15:57:57');
INSERT INTO `sys_operation_log` VALUES ('1568', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 16:03:09');
INSERT INTO `sys_operation_log` VALUES ('1569', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 16:03:09');
INSERT INTO `sys_operation_log` VALUES ('1570', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 16:03:10');
INSERT INTO `sys_operation_log` VALUES ('1571', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-15 16:03:10');
INSERT INTO `sys_operation_log` VALUES ('1572', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 16:12:11');
INSERT INTO `sys_operation_log` VALUES ('1573', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-15 16:12:15');
INSERT INTO `sys_operation_log` VALUES ('1574', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 09:38:27');
INSERT INTO `sys_operation_log` VALUES ('1575', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:32:56');
INSERT INTO `sys_operation_log` VALUES ('1576', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:33:09');
INSERT INTO `sys_operation_log` VALUES ('1577', '客户关系管理系统', 'localhost:7072/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:33:17');
INSERT INTO `sys_operation_log` VALUES ('1578', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:33:17');
INSERT INTO `sys_operation_log` VALUES ('1579', '客户关系管理系统', 'localhost:7072/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:33:17');
INSERT INTO `sys_operation_log` VALUES ('1580', '客户关系管理系统', 'localhost:7072/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:33:18');
INSERT INTO `sys_operation_log` VALUES ('1581', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:37:06');
INSERT INTO `sys_operation_log` VALUES ('1582', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:37:20');
INSERT INTO `sys_operation_log` VALUES ('1583', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:46:27');
INSERT INTO `sys_operation_log` VALUES ('1584', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 13:46:38');
INSERT INTO `sys_operation_log` VALUES ('1585', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:46:42');
INSERT INTO `sys_operation_log` VALUES ('1586', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:46:42');
INSERT INTO `sys_operation_log` VALUES ('1587', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:46:42');
INSERT INTO `sys_operation_log` VALUES ('1588', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 13:46:44');
INSERT INTO `sys_operation_log` VALUES ('1589', '客户关系管理系统', 'localhost:7072/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:03:33');
INSERT INTO `sys_operation_log` VALUES ('1590', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:03:35');
INSERT INTO `sys_operation_log` VALUES ('1591', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:06:13');
INSERT INTO `sys_operation_log` VALUES ('1592', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:06:14');
INSERT INTO `sys_operation_log` VALUES ('1593', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:21:41');
INSERT INTO `sys_operation_log` VALUES ('1594', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:21:55');
INSERT INTO `sys_operation_log` VALUES ('1595', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:21:57');
INSERT INTO `sys_operation_log` VALUES ('1596', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:22:18');
INSERT INTO `sys_operation_log` VALUES ('1597', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:22:18');
INSERT INTO `sys_operation_log` VALUES ('1598', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:22:19');
INSERT INTO `sys_operation_log` VALUES ('1599', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:22:20');
INSERT INTO `sys_operation_log` VALUES ('1600', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:22:21');
INSERT INTO `sys_operation_log` VALUES ('1601', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:23:40');
INSERT INTO `sys_operation_log` VALUES ('1602', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:23:44');
INSERT INTO `sys_operation_log` VALUES ('1603', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:23:48');
INSERT INTO `sys_operation_log` VALUES ('1604', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:23:57');
INSERT INTO `sys_operation_log` VALUES ('1605', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:24:12');
INSERT INTO `sys_operation_log` VALUES ('1606', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:24:15');
INSERT INTO `sys_operation_log` VALUES ('1607', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1608', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1609', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:24:24');
INSERT INTO `sys_operation_log` VALUES ('1610', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:24:26');
INSERT INTO `sys_operation_log` VALUES ('1611', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:24:27');
INSERT INTO `sys_operation_log` VALUES ('1612', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:28:16');
INSERT INTO `sys_operation_log` VALUES ('1613', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 14:28:20');
INSERT INTO `sys_operation_log` VALUES ('1614', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:30:46');
INSERT INTO `sys_operation_log` VALUES ('1615', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:30:46');
INSERT INTO `sys_operation_log` VALUES ('1616', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:30:47');
INSERT INTO `sys_operation_log` VALUES ('1617', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:30:47');
INSERT INTO `sys_operation_log` VALUES ('1618', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 14:30:48');
INSERT INTO `sys_operation_log` VALUES ('1619', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 15:50:10');
INSERT INTO `sys_operation_log` VALUES ('1620', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 15:50:29');
INSERT INTO `sys_operation_log` VALUES ('1621', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:33');
INSERT INTO `sys_operation_log` VALUES ('1622', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:33');
INSERT INTO `sys_operation_log` VALUES ('1623', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:33');
INSERT INTO `sys_operation_log` VALUES ('1624', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:34');
INSERT INTO `sys_operation_log` VALUES ('1625', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:35');
INSERT INTO `sys_operation_log` VALUES ('1626', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=t', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:39');
INSERT INTO `sys_operation_log` VALUES ('1627', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:50:39');
INSERT INTO `sys_operation_log` VALUES ('1628', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:51:02');
INSERT INTO `sys_operation_log` VALUES ('1629', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', 'RoleId=19&RoleName=t', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:51:04');
INSERT INTO `sys_operation_log` VALUES ('1630', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:51:04');
INSERT INTO `sys_operation_log` VALUES ('1631', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:51:39');
INSERT INTO `sys_operation_log` VALUES ('1632', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 15:56:26');
INSERT INTO `sys_operation_log` VALUES ('1633', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 15:56:30');
INSERT INTO `sys_operation_log` VALUES ('1634', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:56:33');
INSERT INTO `sys_operation_log` VALUES ('1635', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 15:57:41');
INSERT INTO `sys_operation_log` VALUES ('1636', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:00:49');
INSERT INTO `sys_operation_log` VALUES ('1637', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:01:20');
INSERT INTO `sys_operation_log` VALUES ('1638', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:02:34');
INSERT INTO `sys_operation_log` VALUES ('1639', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:10:07');
INSERT INTO `sys_operation_log` VALUES ('1640', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:10:11');
INSERT INTO `sys_operation_log` VALUES ('1641', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:10:14');
INSERT INTO `sys_operation_log` VALUES ('1642', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:11:09');
INSERT INTO `sys_operation_log` VALUES ('1643', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:11:10');
INSERT INTO `sys_operation_log` VALUES ('1644', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:16:04');
INSERT INTO `sys_operation_log` VALUES ('1645', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:16:08');
INSERT INTO `sys_operation_log` VALUES ('1646', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:16:11');
INSERT INTO `sys_operation_log` VALUES ('1647', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:16:15');
INSERT INTO `sys_operation_log` VALUES ('1648', '客户关系管理系统', 'localhost:61479/SysUser/Detail/3', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:16:44');
INSERT INTO `sys_operation_log` VALUES ('1649', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:19:51');
INSERT INTO `sys_operation_log` VALUES ('1650', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:19:53');
INSERT INTO `sys_operation_log` VALUES ('1651', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:20:02');
INSERT INTO `sys_operation_log` VALUES ('1652', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:20:27');
INSERT INTO `sys_operation_log` VALUES ('1653', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:20:29');
INSERT INTO `sys_operation_log` VALUES ('1654', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:33:49');
INSERT INTO `sys_operation_log` VALUES ('1655', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-17 16:33:54');
INSERT INTO `sys_operation_log` VALUES ('1656', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:37:38');
INSERT INTO `sys_operation_log` VALUES ('1657', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:38:50');
INSERT INTO `sys_operation_log` VALUES ('1658', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:01');
INSERT INTO `sys_operation_log` VALUES ('1659', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:09');
INSERT INTO `sys_operation_log` VALUES ('1660', '客户关系管理系统', 'localhost:61479/SysUser/Detail/3', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:10');
INSERT INTO `sys_operation_log` VALUES ('1661', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:12');
INSERT INTO `sys_operation_log` VALUES ('1662', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=sa&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:30');
INSERT INTO `sys_operation_log` VALUES ('1663', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=sa&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:34');
INSERT INTO `sys_operation_log` VALUES ('1664', '客户关系管理系统', 'localhost:61479/SysUser/Detail/3', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:35');
INSERT INTO `sys_operation_log` VALUES ('1665', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=sa&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:40:36');
INSERT INTO `sys_operation_log` VALUES ('1666', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:12');
INSERT INTO `sys_operation_log` VALUES ('1667', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:16');
INSERT INTO `sys_operation_log` VALUES ('1668', '客户关系管理系统', 'localhost:61479/SysUser/Detail/3', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:18');
INSERT INTO `sys_operation_log` VALUES ('1669', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=15236265820', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:22');
INSERT INTO `sys_operation_log` VALUES ('1670', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:24');
INSERT INTO `sys_operation_log` VALUES ('1671', '客户关系管理系统', 'localhost:61479/SysUser/Detail/3', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:27');
INSERT INTO `sys_operation_log` VALUES ('1672', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:29');
INSERT INTO `sys_operation_log` VALUES ('1673', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:41:35');
INSERT INTO `sys_operation_log` VALUES ('1674', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:19');
INSERT INTO `sys_operation_log` VALUES ('1675', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:20');
INSERT INTO `sys_operation_log` VALUES ('1676', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:22');
INSERT INTO `sys_operation_log` VALUES ('1677', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:23');
INSERT INTO `sys_operation_log` VALUES ('1678', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:24');
INSERT INTO `sys_operation_log` VALUES ('1679', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:25');
INSERT INTO `sys_operation_log` VALUES ('1680', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:34');
INSERT INTO `sys_operation_log` VALUES ('1681', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:34');
INSERT INTO `sys_operation_log` VALUES ('1682', '客户关系管理系统', 'localhost:61479/SysUser/Edit/4', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:37');
INSERT INTO `sys_operation_log` VALUES ('1683', '客户关系管理系统', 'localhost:61479/SysUser/Edit/4', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:39');
INSERT INTO `sys_operation_log` VALUES ('1684', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:39');
INSERT INTO `sys_operation_log` VALUES ('1685', '客户关系管理系统', 'localhost:61479/SysUser/Detail/4', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:41');
INSERT INTO `sys_operation_log` VALUES ('1686', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:42');
INSERT INTO `sys_operation_log` VALUES ('1687', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:47');
INSERT INTO `sys_operation_log` VALUES ('1688', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:49');
INSERT INTO `sys_operation_log` VALUES ('1689', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:52');
INSERT INTO `sys_operation_log` VALUES ('1690', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:57');
INSERT INTO `sys_operation_log` VALUES ('1691', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:57');
INSERT INTO `sys_operation_log` VALUES ('1692', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:43:58');
INSERT INTO `sys_operation_log` VALUES ('1693', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:06');
INSERT INTO `sys_operation_log` VALUES ('1694', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:06');
INSERT INTO `sys_operation_log` VALUES ('1695', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:07');
INSERT INTO `sys_operation_log` VALUES ('1696', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:13');
INSERT INTO `sys_operation_log` VALUES ('1697', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:13');
INSERT INTO `sys_operation_log` VALUES ('1698', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:14');
INSERT INTO `sys_operation_log` VALUES ('1699', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:18');
INSERT INTO `sys_operation_log` VALUES ('1700', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:18');
INSERT INTO `sys_operation_log` VALUES ('1701', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:19');
INSERT INTO `sys_operation_log` VALUES ('1702', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:24');
INSERT INTO `sys_operation_log` VALUES ('1703', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:24');
INSERT INTO `sys_operation_log` VALUES ('1704', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:25');
INSERT INTO `sys_operation_log` VALUES ('1705', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:29');
INSERT INTO `sys_operation_log` VALUES ('1706', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:29');
INSERT INTO `sys_operation_log` VALUES ('1707', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:30');
INSERT INTO `sys_operation_log` VALUES ('1708', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:34');
INSERT INTO `sys_operation_log` VALUES ('1709', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:34');
INSERT INTO `sys_operation_log` VALUES ('1710', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:35');
INSERT INTO `sys_operation_log` VALUES ('1711', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:42');
INSERT INTO `sys_operation_log` VALUES ('1712', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:42');
INSERT INTO `sys_operation_log` VALUES ('1713', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=2&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:44');
INSERT INTO `sys_operation_log` VALUES ('1714', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:46');
INSERT INTO `sys_operation_log` VALUES ('1715', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=2&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:44:47');
INSERT INTO `sys_operation_log` VALUES ('1716', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:51:26');
INSERT INTO `sys_operation_log` VALUES ('1717', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=2&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:51:27');
INSERT INTO `sys_operation_log` VALUES ('1718', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:51:28');
INSERT INTO `sys_operation_log` VALUES ('1719', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=2&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:51:30');
INSERT INTO `sys_operation_log` VALUES ('1720', '客户关系管理系统', 'localhost:61479/SysUser/Detail/1', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-17 16:51:34');
INSERT INTO `sys_operation_log` VALUES ('1721', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-20 09:20:35');
INSERT INTO `sys_operation_log` VALUES ('1722', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-20 09:20:39');
INSERT INTO `sys_operation_log` VALUES ('1723', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-20 09:21:11');
INSERT INTO `sys_operation_log` VALUES ('1724', '客户关系管理系统', 'localhost:7072/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-20 09:26:05');
INSERT INTO `sys_operation_log` VALUES ('1725', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 13:26:08');
INSERT INTO `sys_operation_log` VALUES ('1726', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 13:26:16');
INSERT INTO `sys_operation_log` VALUES ('1727', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 13:29:48');
INSERT INTO `sys_operation_log` VALUES ('1728', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 13:29:52');
INSERT INTO `sys_operation_log` VALUES ('1729', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:01:36');
INSERT INTO `sys_operation_log` VALUES ('1730', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:01:40');
INSERT INTO `sys_operation_log` VALUES ('1731', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:02:26');
INSERT INTO `sys_operation_log` VALUES ('1732', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:02:29');
INSERT INTO `sys_operation_log` VALUES ('1733', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:03:05');
INSERT INTO `sys_operation_log` VALUES ('1734', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:03:26');
INSERT INTO `sys_operation_log` VALUES ('1735', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:04:02');
INSERT INTO `sys_operation_log` VALUES ('1736', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:04:50');
INSERT INTO `sys_operation_log` VALUES ('1737', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:07:24');
INSERT INTO `sys_operation_log` VALUES ('1738', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:08:17');
INSERT INTO `sys_operation_log` VALUES ('1739', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:09:49');
INSERT INTO `sys_operation_log` VALUES ('1740', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:11:02');
INSERT INTO `sys_operation_log` VALUES ('1741', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:11:50');
INSERT INTO `sys_operation_log` VALUES ('1742', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:11:51');
INSERT INTO `sys_operation_log` VALUES ('1743', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:11:54');
INSERT INTO `sys_operation_log` VALUES ('1744', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=1&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:11:58');
INSERT INTO `sys_operation_log` VALUES ('1745', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:12:03');
INSERT INTO `sys_operation_log` VALUES ('1746', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:12:10');
INSERT INTO `sys_operation_log` VALUES ('1747', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:17:12');
INSERT INTO `sys_operation_log` VALUES ('1748', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:17:16');
INSERT INTO `sys_operation_log` VALUES ('1749', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:17:20');
INSERT INTO `sys_operation_log` VALUES ('1750', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:17:21');
INSERT INTO `sys_operation_log` VALUES ('1751', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=&newPwd1=', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:17:25');
INSERT INTO `sys_operation_log` VALUES ('1752', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=123&newPwd1=123', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:17:31');
INSERT INTO `sys_operation_log` VALUES ('1753', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:18:19');
INSERT INTO `sys_operation_log` VALUES ('1754', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:18:19');
INSERT INTO `sys_operation_log` VALUES ('1755', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:18:21');
INSERT INTO `sys_operation_log` VALUES ('1756', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:18:25');
INSERT INTO `sys_operation_log` VALUES ('1757', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:18:28');
INSERT INTO `sys_operation_log` VALUES ('1758', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:18:30');
INSERT INTO `sys_operation_log` VALUES ('1759', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123&newPwd=123456&newPwd1=123456', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:18:43');
INSERT INTO `sys_operation_log` VALUES ('1760', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:19:53');
INSERT INTO `sys_operation_log` VALUES ('1761', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123&newPwd=1&newPwd1=1', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:19:58');
INSERT INTO `sys_operation_log` VALUES ('1762', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=1&newPwd1=1', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:20:02');
INSERT INTO `sys_operation_log` VALUES ('1763', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:20:02');
INSERT INTO `sys_operation_log` VALUES ('1764', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:20:02');
INSERT INTO `sys_operation_log` VALUES ('1765', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:20:13');
INSERT INTO `sys_operation_log` VALUES ('1766', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:20:15');
INSERT INTO `sys_operation_log` VALUES ('1767', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=1&newPwd=123456&newPwd1=123456', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:20:34');
INSERT INTO `sys_operation_log` VALUES ('1768', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:20:34');
INSERT INTO `sys_operation_log` VALUES ('1769', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:20:34');
INSERT INTO `sys_operation_log` VALUES ('1770', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:21:22');
INSERT INTO `sys_operation_log` VALUES ('1771', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:21:24');
INSERT INTO `sys_operation_log` VALUES ('1772', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:21:26');
INSERT INTO `sys_operation_log` VALUES ('1773', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=1&newPwd1=1', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:21:31');
INSERT INTO `sys_operation_log` VALUES ('1774', '客户关系管理系统', 'localhost:61479/Account/Logout', '?error=密码已修改，请重新登录', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:21:31');
INSERT INTO `sys_operation_log` VALUES ('1775', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:21:31');
INSERT INTO `sys_operation_log` VALUES ('1776', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:22:39');
INSERT INTO `sys_operation_log` VALUES ('1777', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:22:40');
INSERT INTO `sys_operation_log` VALUES ('1778', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:22:42');
INSERT INTO `sys_operation_log` VALUES ('1779', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:22:47');
INSERT INTO `sys_operation_log` VALUES ('1780', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=1&newPwd=123456&newPwd1=123456', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:22:53');
INSERT INTO `sys_operation_log` VALUES ('1781', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:22:53');
INSERT INTO `sys_operation_log` VALUES ('1782', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:22:53');
INSERT INTO `sys_operation_log` VALUES ('1783', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:22:55');
INSERT INTO `sys_operation_log` VALUES ('1784', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:24:32');
INSERT INTO `sys_operation_log` VALUES ('1785', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:30:23');
INSERT INTO `sys_operation_log` VALUES ('1786', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:30:24');
INSERT INTO `sys_operation_log` VALUES ('1787', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:43:00');
INSERT INTO `sys_operation_log` VALUES ('1788', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:48:14');
INSERT INTO `sys_operation_log` VALUES ('1789', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 14:48:59');
INSERT INTO `sys_operation_log` VALUES ('1790', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:19');
INSERT INTO `sys_operation_log` VALUES ('1791', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:19');
INSERT INTO `sys_operation_log` VALUES ('1792', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:19');
INSERT INTO `sys_operation_log` VALUES ('1793', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:20');
INSERT INTO `sys_operation_log` VALUES ('1794', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:20');
INSERT INTO `sys_operation_log` VALUES ('1795', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=aa&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 14:49:23');
INSERT INTO `sys_operation_log` VALUES ('1796', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:18:57');
INSERT INTO `sys_operation_log` VALUES ('1797', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:19:31');
INSERT INTO `sys_operation_log` VALUES ('1798', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:19:51');
INSERT INTO `sys_operation_log` VALUES ('1799', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:20:36');
INSERT INTO `sys_operation_log` VALUES ('1800', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:20:50');
INSERT INTO `sys_operation_log` VALUES ('1801', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 15:21:02');
INSERT INTO `sys_operation_log` VALUES ('1802', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=123456&newPwd=1&newPwd1=1', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 15:21:07');
INSERT INTO `sys_operation_log` VALUES ('1803', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:28');
INSERT INTO `sys_operation_log` VALUES ('1804', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '127.0.0.1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:28');
INSERT INTO `sys_operation_log` VALUES ('1805', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:34');
INSERT INTO `sys_operation_log` VALUES ('1806', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:38');
INSERT INTO `sys_operation_log` VALUES ('1807', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 15:25:41');
INSERT INTO `sys_operation_log` VALUES ('1808', '客户关系管理系统', 'localhost:61479/Account/ModifyPassword', 'oldPwd=1&newPwd=123456&newPwd1=123456', 'Account', 'ModifyPassword', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 15:25:51');
INSERT INTO `sys_operation_log` VALUES ('1809', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-22 15:25:51');
INSERT INTO `sys_operation_log` VALUES ('1810', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:51');
INSERT INTO `sys_operation_log` VALUES ('1811', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-22 15:25:53');
INSERT INTO `sys_operation_log` VALUES ('1812', '客户关系管理系统', 'localhost:7072/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-23 10:09:15');
INSERT INTO `sys_operation_log` VALUES ('1813', '客户关系管理系统', 'localhost:7072/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-23 10:09:24');
INSERT INTO `sys_operation_log` VALUES ('1814', '客户关系管理系统', 'localhost:7072/Account/ModifyPassword', '', 'Account', 'ModifyPassword', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-23 10:09:38');
INSERT INTO `sys_operation_log` VALUES ('1815', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:04:17');
INSERT INTO `sys_operation_log` VALUES ('1816', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:04:45');
INSERT INTO `sys_operation_log` VALUES ('1817', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:22:54');
INSERT INTO `sys_operation_log` VALUES ('1818', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:22:56');
INSERT INTO `sys_operation_log` VALUES ('1819', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:23:09');
INSERT INTO `sys_operation_log` VALUES ('1820', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:29:23');
INSERT INTO `sys_operation_log` VALUES ('1821', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-24 15:29:36');
INSERT INTO `sys_operation_log` VALUES ('1822', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-24 15:29:46');
INSERT INTO `sys_operation_log` VALUES ('1823', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-24 15:30:27');
INSERT INTO `sys_operation_log` VALUES ('1824', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-24 15:30:51');
INSERT INTO `sys_operation_log` VALUES ('1825', '客户关系管理系统', 'localhost:61479/SysUser/Edit/12', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-24 15:33:16');
INSERT INTO `sys_operation_log` VALUES ('1826', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-24 15:33:47');
INSERT INTO `sys_operation_log` VALUES ('1827', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-28 11:10:38');
INSERT INTO `sys_operation_log` VALUES ('1828', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-28 11:10:54');
INSERT INTO `sys_operation_log` VALUES ('1829', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:11:47');
INSERT INTO `sys_operation_log` VALUES ('1830', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:12:50');
INSERT INTO `sys_operation_log` VALUES ('1831', '客户关系管理系统', 'localhost:61479/SysUser/Edit/12', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:14:34');
INSERT INTO `sys_operation_log` VALUES ('1832', '客户关系管理系统', 'localhost:61479/SysUser/Edit/11', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:15:46');
INSERT INTO `sys_operation_log` VALUES ('1833', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:02');
INSERT INTO `sys_operation_log` VALUES ('1834', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:02');
INSERT INTO `sys_operation_log` VALUES ('1835', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:02');
INSERT INTO `sys_operation_log` VALUES ('1836', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:04');
INSERT INTO `sys_operation_log` VALUES ('1837', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=4', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:07');
INSERT INTO `sys_operation_log` VALUES ('1838', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=4&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:10');
INSERT INTO `sys_operation_log` VALUES ('1839', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:10');
INSERT INTO `sys_operation_log` VALUES ('1840', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=0&ParentId=4&ModuleName=crm&ControllerName=&ActionName=&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:17');
INSERT INTO `sys_operation_log` VALUES ('1841', '客户关系管理系统', 'localhost:61479/SysModule/Delete/17', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:20');
INSERT INTO `sys_operation_log` VALUES ('1842', '客户关系管理系统', 'localhost:61479/SysModule/Delete/17', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:23');
INSERT INTO `sys_operation_log` VALUES ('1843', '客户关系管理系统', 'localhost:61479/SysModule/Delete/18', '', 'SysModule', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:27');
INSERT INTO `sys_operation_log` VALUES ('1844', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:30');
INSERT INTO `sys_operation_log` VALUES ('1845', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:30');
INSERT INTO `sys_operation_log` VALUES ('1846', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:30');
INSERT INTO `sys_operation_log` VALUES ('1847', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:32');
INSERT INTO `sys_operation_log` VALUES ('1848', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:33');
INSERT INTO `sys_operation_log` VALUES ('1849', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:35');
INSERT INTO `sys_operation_log` VALUES ('1850', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:38');
INSERT INTO `sys_operation_log` VALUES ('1851', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=w', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:41');
INSERT INTO `sys_operation_log` VALUES ('1852', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:41');
INSERT INTO `sys_operation_log` VALUES ('1853', '客户关系管理系统', 'localhost:61479/SysRole/Delete/20', '', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:44');
INSERT INTO `sys_operation_log` VALUES ('1854', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:44');
INSERT INTO `sys_operation_log` VALUES ('1855', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:48');
INSERT INTO `sys_operation_log` VALUES ('1856', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:51');
INSERT INTO `sys_operation_log` VALUES ('1857', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:53');
INSERT INTO `sys_operation_log` VALUES ('1858', '客户关系管理系统', 'localhost:61479/SysUser/Edit/0', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:57');
INSERT INTO `sys_operation_log` VALUES ('1859', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:16:58');
INSERT INTO `sys_operation_log` VALUES ('1860', '客户关系管理系统', 'localhost:61479/SysUser/Detail/13', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:17:00');
INSERT INTO `sys_operation_log` VALUES ('1861', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:17:03');
INSERT INTO `sys_operation_log` VALUES ('1862', '客户关系管理系统', 'localhost:61479/SysUser/Delete/13', '', 'SysUser', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:17:05');
INSERT INTO `sys_operation_log` VALUES ('1863', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:17:06');
INSERT INTO `sys_operation_log` VALUES ('1864', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-28 11:41:35');
INSERT INTO `sys_operation_log` VALUES ('1865', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-28 11:41:41');
INSERT INTO `sys_operation_log` VALUES ('1866', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-28 11:41:46');
INSERT INTO `sys_operation_log` VALUES ('1867', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 11:08:13');
INSERT INTO `sys_operation_log` VALUES ('1868', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 11:08:40');
INSERT INTO `sys_operation_log` VALUES ('1869', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 11:08:54');
INSERT INTO `sys_operation_log` VALUES ('1870', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 15:30:43');
INSERT INTO `sys_operation_log` VALUES ('1871', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 15:30:51');
INSERT INTO `sys_operation_log` VALUES ('1872', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:30:57');
INSERT INTO `sys_operation_log` VALUES ('1873', '客户关系管理系统', 'localhost:61479/SysUser/Detail/12', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:30:59');
INSERT INTO `sys_operation_log` VALUES ('1874', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:31:13');
INSERT INTO `sys_operation_log` VALUES ('1875', '客户关系管理系统', 'localhost:61479/SysUser/Detail/10', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:31:16');
INSERT INTO `sys_operation_log` VALUES ('1876', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:31:19');
INSERT INTO `sys_operation_log` VALUES ('1877', '客户关系管理系统', 'localhost:61479/SysUser/Edit/11', '', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:31:21');
INSERT INTO `sys_operation_log` VALUES ('1878', '客户关系管理系统', 'localhost:61479/SysUser/Detail/10', '', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:31:24');
INSERT INTO `sys_operation_log` VALUES ('1879', '客户关系管理系统', 'localhost:61479/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 15:33:34');
INSERT INTO `sys_operation_log` VALUES ('1880', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-08-30 15:33:39');
INSERT INTO `sys_operation_log` VALUES ('1881', '客户关系管理系统', 'localhost:61479/SysModule/Manager', '', 'SysModule', 'Manager', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:42');
INSERT INTO `sys_operation_log` VALUES ('1882', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:42');
INSERT INTO `sys_operation_log` VALUES ('1883', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=0&n=菜单树&lv=0&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:42');
INSERT INTO `sys_operation_log` VALUES ('1884', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=1&n=系统管理&lv=1&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:43');
INSERT INTO `sys_operation_log` VALUES ('1885', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=2&n=权限设置&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:44');
INSERT INTO `sys_operation_log` VALUES ('1886', '客户关系管理系统', 'localhost:61479/SysModule/GetMenuTree', 'id=4&n=日志管理&lv=2&otherParam=zTreeAsyncTest', 'SysModule', 'GetMenuTree', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:46');
INSERT INTO `sys_operation_log` VALUES ('1887', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:48');
INSERT INTO `sys_operation_log` VALUES ('1888', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/17', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:51');
INSERT INTO `sys_operation_log` VALUES ('1889', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/17', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:34:51');
INSERT INTO `sys_operation_log` VALUES ('1890', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/17', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:01');
INSERT INTO `sys_operation_log` VALUES ('1891', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/17', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:01');
INSERT INTO `sys_operation_log` VALUES ('1892', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/5', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:07');
INSERT INTO `sys_operation_log` VALUES ('1893', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/5', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:07');
INSERT INTO `sys_operation_log` VALUES ('1894', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/19', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:10');
INSERT INTO `sys_operation_log` VALUES ('1895', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/19', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:10');
INSERT INTO `sys_operation_log` VALUES ('1896', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/11', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:20');
INSERT INTO `sys_operation_log` VALUES ('1897', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/11', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:20');
INSERT INTO `sys_operation_log` VALUES ('1898', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/11', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:25');
INSERT INTO `sys_operation_log` VALUES ('1899', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/11', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:25');
INSERT INTO `sys_operation_log` VALUES ('1900', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationView/17', '', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:40');
INSERT INTO `sys_operation_log` VALUES ('1901', '客户关系管理系统', 'localhost:61479/SysRole/AuthorizationTree/17', '', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:40');
INSERT INTO `sys_operation_log` VALUES ('1902', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:55');
INSERT INTO `sys_operation_log` VALUES ('1903', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:56');
INSERT INTO `sys_operation_log` VALUES ('1904', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:57');
INSERT INTO `sys_operation_log` VALUES ('1905', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:58');
INSERT INTO `sys_operation_log` VALUES ('1906', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:59');
INSERT INTO `sys_operation_log` VALUES ('1907', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:35:59');
INSERT INTO `sys_operation_log` VALUES ('1908', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:03');
INSERT INTO `sys_operation_log` VALUES ('1909', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=3', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:21');
INSERT INTO `sys_operation_log` VALUES ('1910', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=3', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:24');
INSERT INTO `sys_operation_log` VALUES ('1911', '客户关系管理系统', 'localhost:61479/SysModule/Edit', '?parentId=0&id=3', 'SysModule', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:25');
INSERT INTO `sys_operation_log` VALUES ('1912', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=3&ParentId=2&ModuleName=菜单管理&ControllerName=SysModule&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:35');
INSERT INTO `sys_operation_log` VALUES ('1913', '客户关系管理系统', 'localhost:61479/SysModule/Edit', 'ModuleId=3&ParentId=2&ModuleName=菜单管理&ControllerName=SysModule&ActionName=Manager&Sort=0', 'SysModule', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-08-30 15:36:38');
INSERT INTO `sys_operation_log` VALUES ('1914', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-13 09:56:41');
INSERT INTO `sys_operation_log` VALUES ('1915', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-13 09:56:50');
INSERT INTO `sys_operation_log` VALUES ('1916', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-09-13 09:57:01');
INSERT INTO `sys_operation_log` VALUES ('1917', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-09-13 09:57:34');
INSERT INTO `sys_operation_log` VALUES ('1918', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:31:16');
INSERT INTO `sys_operation_log` VALUES ('1919', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:32:15');
INSERT INTO `sys_operation_log` VALUES ('1920', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:32:25');
INSERT INTO `sys_operation_log` VALUES ('1921', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:38:27');
INSERT INTO `sys_operation_log` VALUES ('1922', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:38:34');
INSERT INTO `sys_operation_log` VALUES ('1923', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:39:45');
INSERT INTO `sys_operation_log` VALUES ('1924', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:39:50');
INSERT INTO `sys_operation_log` VALUES ('1925', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:42:46');
INSERT INTO `sys_operation_log` VALUES ('1926', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:42:51');
INSERT INTO `sys_operation_log` VALUES ('1927', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:45:36');
INSERT INTO `sys_operation_log` VALUES ('1928', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:45:42');
INSERT INTO `sys_operation_log` VALUES ('1929', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:47:33');
INSERT INTO `sys_operation_log` VALUES ('1930', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-09-28 15:47:37');
INSERT INTO `sys_operation_log` VALUES ('1931', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:23:14');
INSERT INTO `sys_operation_log` VALUES ('1932', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:23:19');
INSERT INTO `sys_operation_log` VALUES ('1933', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:23:24');
INSERT INTO `sys_operation_log` VALUES ('1934', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:23:45');
INSERT INTO `sys_operation_log` VALUES ('1935', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', '', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:24:34');
INSERT INTO `sys_operation_log` VALUES ('1936', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', 'RoleId=19&RoleName=t1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:24:38');
INSERT INTO `sys_operation_log` VALUES ('1937', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962292936', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:31:39');
INSERT INTO `sys_operation_log` VALUES ('1938', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', '?_=1538962292937', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:31:49');
INSERT INTO `sys_operation_log` VALUES ('1939', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', 'RoleId=19&RoleName=t', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:31:51');
INSERT INTO `sys_operation_log` VALUES ('1940', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962292938', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:31:52');
INSERT INTO `sys_operation_log` VALUES ('1941', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962292940', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:31:55');
INSERT INTO `sys_operation_log` VALUES ('1942', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:39:59');
INSERT INTO `sys_operation_log` VALUES ('1943', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:40:05');
INSERT INTO `sys_operation_log` VALUES ('1944', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806458', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:08');
INSERT INTO `sys_operation_log` VALUES ('1945', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', '?_=1538962806459', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:10');
INSERT INTO `sys_operation_log` VALUES ('1946', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', 'RoleId=19&RoleName=t1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:13');
INSERT INTO `sys_operation_log` VALUES ('1947', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806460', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:13');
INSERT INTO `sys_operation_log` VALUES ('1948', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1538962806462', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:15');
INSERT INTO `sys_operation_log` VALUES ('1949', '客户关系管理系统', 'localhost:61479/SysUser/Edit/12', '?_=1538962806463', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:19');
INSERT INTO `sys_operation_log` VALUES ('1950', '客户关系管理系统', 'localhost:61479/SysUser/Edit/12', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:22');
INSERT INTO `sys_operation_log` VALUES ('1951', '客户关系管理系统', 'localhost:61479/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1538962806464', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:22');
INSERT INTO `sys_operation_log` VALUES ('1952', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806466', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:24');
INSERT INTO `sys_operation_log` VALUES ('1953', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', '?_=1538962806467', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:27');
INSERT INTO `sys_operation_log` VALUES ('1954', '客户关系管理系统', 'localhost:61479/SysRole/Edit/0', 'RoleId=0&RoleName=sa', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:29');
INSERT INTO `sys_operation_log` VALUES ('1955', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806469', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:29');
INSERT INTO `sys_operation_log` VALUES ('1956', '客户关系管理系统', 'localhost:61479/SysRole/Edit/21', '?_=1538962806470', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:31');
INSERT INTO `sys_operation_log` VALUES ('1957', '客户关系管理系统', 'localhost:61479/SysRole/Edit/21', 'RoleId=21&RoleName=sa1', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:32');
INSERT INTO `sys_operation_log` VALUES ('1958', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806471', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:32');
INSERT INTO `sys_operation_log` VALUES ('1959', '客户关系管理系统', 'localhost:61479/SysRole/Delete/21', '?_=1538962806472', 'SysRole', 'Delete', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:35');
INSERT INTO `sys_operation_log` VALUES ('1960', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962806473', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:40:35');
INSERT INTO `sys_operation_log` VALUES ('1961', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:40:46');
INSERT INTO `sys_operation_log` VALUES ('1962', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:40:48');
INSERT INTO `sys_operation_log` VALUES ('1963', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:41:02');
INSERT INTO `sys_operation_log` VALUES ('1964', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:41:02');
INSERT INTO `sys_operation_log` VALUES ('1965', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:41:13');
INSERT INTO `sys_operation_log` VALUES ('1966', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962874116', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:41:17');
INSERT INTO `sys_operation_log` VALUES ('1967', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', '?_=1538962874117', 'SysRole', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:41:18');
INSERT INTO `sys_operation_log` VALUES ('1968', '客户关系管理系统', 'localhost:61479/SysRole/Edit/19', 'RoleId=19&RoleName=t12', 'SysRole', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:41:20');
INSERT INTO `sys_operation_log` VALUES ('1969', '客户关系管理系统', 'localhost:61479/SysRole/PagedList', '?pageIndex=1&roleName=&_=1538962874118', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:41:20');
INSERT INTO `sys_operation_log` VALUES ('1970', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-08 09:45:21');
INSERT INTO `sys_operation_log` VALUES ('1971', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-08 09:45:21');
INSERT INTO `sys_operation_log` VALUES ('1972', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-10 10:02:16');
INSERT INTO `sys_operation_log` VALUES ('1973', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-23 17:26:11');
INSERT INTO `sys_operation_log` VALUES ('1974', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-23 17:30:45');
INSERT INTO `sys_operation_log` VALUES ('1975', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-23 17:30:47');
INSERT INTO `sys_operation_log` VALUES ('1976', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-23 17:30:49');
INSERT INTO `sys_operation_log` VALUES ('1977', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:17:30');
INSERT INTO `sys_operation_log` VALUES ('1978', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:17:48');
INSERT INTO `sys_operation_log` VALUES ('1979', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 09:18:52');
INSERT INTO `sys_operation_log` VALUES ('1980', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:18:53');
INSERT INTO `sys_operation_log` VALUES ('1981', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:18:54');
INSERT INTO `sys_operation_log` VALUES ('1982', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 09:19:00');
INSERT INTO `sys_operation_log` VALUES ('1983', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:19:00');
INSERT INTO `sys_operation_log` VALUES ('1984', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:20:29');
INSERT INTO `sys_operation_log` VALUES ('1985', '客户关系管理系统', 'localhost:61479/Account/Logout', '', 'Account', 'Logout', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 09:21:23');
INSERT INTO `sys_operation_log` VALUES ('1986', '客户关系管理系统', 'localhost:61479/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:21:23');
INSERT INTO `sys_operation_log` VALUES ('1987', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:21:24');
INSERT INTO `sys_operation_log` VALUES ('1988', '客户关系管理系统', 'localhost:61479/Account/Login', '?error=你没有登录或者登录状态失效，请重新登录', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:23:32');
INSERT INTO `sys_operation_log` VALUES ('1989', '客户关系管理系统', 'localhost:61479/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:23:36');
INSERT INTO `sys_operation_log` VALUES ('1990', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:24:56');
INSERT INTO `sys_operation_log` VALUES ('1991', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:25:01');
INSERT INTO `sys_operation_log` VALUES ('1992', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:49:26');
INSERT INTO `sys_operation_log` VALUES ('1993', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:49:51');
INSERT INTO `sys_operation_log` VALUES ('1994', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:58:24');
INSERT INTO `sys_operation_log` VALUES ('1995', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 09:58:33');
INSERT INTO `sys_operation_log` VALUES ('1996', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 10:21:15');
INSERT INTO `sys_operation_log` VALUES ('1997', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 10:21:25');
INSERT INTO `sys_operation_log` VALUES ('1998', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 16:10:49');
INSERT INTO `sys_operation_log` VALUES ('1999', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-24 16:11:02');
INSERT INTO `sys_operation_log` VALUES ('2000', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1540368664154', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:09');
INSERT INTO `sys_operation_log` VALUES ('2001', '客户关系管理系统', 'localhost:61480/SysUser/Edit/12', '?_=1540368664155', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:12');
INSERT INTO `sys_operation_log` VALUES ('2002', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=2&LoginName=&RelName=&Phone=&_=1540368664156', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:18');
INSERT INTO `sys_operation_log` VALUES ('2003', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1540368664157', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:21');
INSERT INTO `sys_operation_log` VALUES ('2004', '客户关系管理系统', 'localhost:61480/SysUser/Edit/12', '?_=1540368664158', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:25');
INSERT INTO `sys_operation_log` VALUES ('2005', '客户关系管理系统', 'localhost:61480/SysUser/Edit/12', '敏感参数不记录', 'SysUser', 'Edit', '200', 'POST', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:11:28');
INSERT INTO `sys_operation_log` VALUES ('2006', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1540368664159', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-24 16:12:47');
INSERT INTO `sys_operation_log` VALUES ('2007', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:41:06');
INSERT INTO `sys_operation_log` VALUES ('2008', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:41:21');
INSERT INTO `sys_operation_log` VALUES ('2009', '客户关系管理系统', 'localhost:61480/', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:46:23');
INSERT INTO `sys_operation_log` VALUES ('2010', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:46:32');
INSERT INTO `sys_operation_log` VALUES ('2011', '客户关系管理系统', 'localhost:61480/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:55:09');
INSERT INTO `sys_operation_log` VALUES ('2012', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:55:14');
INSERT INTO `sys_operation_log` VALUES ('2013', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1540446915801', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 13:55:18');
INSERT INTO `sys_operation_log` VALUES ('2014', '客户关系管理系统', 'localhost:61480/SysUser/Detail/11', '?_=1540446915802', 'SysUser', 'Detail', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 13:55:19');
INSERT INTO `sys_operation_log` VALUES ('2015', '客户关系管理系统', 'localhost:61480/Account/Login', '', 'Account', 'Login', '200', 'GET', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:59:37');
INSERT INTO `sys_operation_log` VALUES ('2016', '客户关系管理系统', 'localhost:61480/account/login', '敏感参数不记录', 'Account', 'Login', '200', 'POST', '::1', '0', null, '\0', '0', null, '0', '2018-10-25 13:59:39');
INSERT INTO `sys_operation_log` VALUES ('2017', '客户关系管理系统', 'localhost:61480/SysUser/PagedList', '?pageIndex=1&LoginName=&RelName=&Phone=&_=1540447179212', 'SysUser', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 14:04:58');
INSERT INTO `sys_operation_log` VALUES ('2018', '客户关系管理系统', 'localhost:61480/SysUser/Edit/0', '?_=1540447179213', 'SysUser', 'Edit', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 14:05:00');
INSERT INTO `sys_operation_log` VALUES ('2019', '客户关系管理系统', 'localhost:61480/SysRole/PagedList', '?pageIndex=1&roleName=&_=1540447179215', 'SysRole', 'PagedList', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 14:06:01');
INSERT INTO `sys_operation_log` VALUES ('2020', '客户关系管理系统', 'localhost:61480/SysRole/AuthorizationView/17', '?_=1540447179216', 'SysRole', 'AuthorizationView', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 14:06:03');
INSERT INTO `sys_operation_log` VALUES ('2021', '客户关系管理系统', 'localhost:61480/SysRole/AuthorizationTree/17', '?_=1540447179217', 'SysRole', 'AuthorizationTree', '200', 'GET', '::1', '1', 'admin', '\0', '0', null, '1', '2018-10-25 14:06:03');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('10', '14', '1');
INSERT INTO `sys_permission` VALUES ('11', '14', '2');
INSERT INTO `sys_permission` VALUES ('12', '14', '3');
INSERT INTO `sys_permission` VALUES ('13', '14', '7');
INSERT INTO `sys_permission` VALUES ('14', '14', '11');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员1', '', '0', null, '0', '2018-08-10 10:52:03');
INSERT INTO `sys_role` VALUES ('2', 'test', '', '0', null, '0', '2018-08-10 10:53:20');
INSERT INTO `sys_role` VALUES ('3', 'aa', '', '0', null, '0', '2018-08-10 10:53:41');
INSERT INTO `sys_role` VALUES ('4', 'aaa', '', '0', null, '0', '2018-08-10 10:59:26');
INSERT INTO `sys_role` VALUES ('5', 'aaaaaa', '\0', '0', null, '0', '2018-08-10 11:00:51');
INSERT INTO `sys_role` VALUES ('6', 'wwwwww', '\0', '0', null, '0', '2018-08-10 11:17:29');
INSERT INTO `sys_role` VALUES ('7', 'ww', '\0', '0', null, '0', '2018-08-10 11:18:56');
INSERT INTO `sys_role` VALUES ('8', 'a', '\0', '0', null, '0', '2018-08-10 11:21:01');
INSERT INTO `sys_role` VALUES ('9', 'a', '\0', '0', null, '0', '2018-08-10 11:30:04');
INSERT INTO `sys_role` VALUES ('10', 'w', '', '0', null, '0', '2018-08-10 11:31:10');
INSERT INTO `sys_role` VALUES ('11', '问问', '\0', '0', null, '0', '2018-08-10 13:12:29');
INSERT INTO `sys_role` VALUES ('12', '当地1', '', '0', null, '0', '2018-08-10 13:12:33');
INSERT INTO `sys_role` VALUES ('13', '问问啊', '', '0', null, '0', '2018-08-10 13:12:37');
INSERT INTO `sys_role` VALUES ('14', '问问', '\0', '0', null, '0', '2018-08-10 13:26:07');
INSERT INTO `sys_role` VALUES ('15', 'aa', '', '0', null, '0', '2018-08-10 13:26:14');
INSERT INTO `sys_role` VALUES ('16', 'wwwwww', '', '0', null, '0', '2018-08-15 10:10:21');
INSERT INTO `sys_role` VALUES ('17', 'saw', '\0', '0', null, '0', '2018-08-15 10:41:48');
INSERT INTO `sys_role` VALUES ('18', 'a', '', '0', null, '0', '2018-08-15 10:47:37');
INSERT INTO `sys_role` VALUES ('19', 't12', '\0', '0', null, '0', '2018-08-17 15:50:39');
INSERT INTO `sys_role` VALUES ('20', 'w', '', '0', null, '0', '2018-08-28 11:16:41');
INSERT INTO `sys_role` VALUES ('21', 'sa1', '', '0', null, '0', '2018-10-08 09:40:29');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('3', '14', '3', '\0', '0', null, '1', '2018-08-14 17:44:49');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(32) NOT NULL,
  `SaltKey` varchar(8) DEFAULT NULL,
  `LoginPwd` varchar(32) NOT NULL,
  `Sex` int(11) NOT NULL,
  `RelName` varchar(32) DEFAULT NULL,
  `NickName` varchar(32) DEFAULT NULL,
  `Email` varchar(32) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `IsDimission` bit(1) NOT NULL,
  `DimissionReaSON` varchar(128) DEFAULT NULL,
  `IsAdmin` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Sort` int(11) NOT NULL,
  `Remark` longtext,
  `CreateId` int(11) NOT NULL,
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '69522143', 'D42AA0408B161A10', '1', null, '管理员', null, '18601703095', '\0', null, '', '\0', '0', null, '0', '2017-07-11 00:00:00');
INSERT INTO `sys_user` VALUES ('2', 'sa', '69522143', 'D42AA0408B161A10', '0', null, null, null, '15236265820', '\0', null, '\0', '', '0', null, '1', '2018-08-14 10:58:53');
INSERT INTO `sys_user` VALUES ('3', 'sa', '81111940', '2F83F3FDAE85EEED', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-14 15:01:21');
INSERT INTO `sys_user` VALUES ('4', 'saw', '90206645', 'C9FBA85BA5C05D7F', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:43:34');
INSERT INTO `sys_user` VALUES ('5', 'wwww', '98993212', '09FB689D3619573D', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:43:57');
INSERT INTO `sys_user` VALUES ('6', '445', '26543850', 'CA399ABC647C243A', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:06');
INSERT INTO `sys_user` VALUES ('7', 'wwwww', '39280588', '45C593D44A8EE1FE', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:13');
INSERT INTO `sys_user` VALUES ('8', 'asdga', '67086103', '8170EAD12E6D61D1', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:18');
INSERT INTO `sys_user` VALUES ('9', 'sasss', '81766360', '45AFE9F2F22D9E7A', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:24');
INSERT INTO `sys_user` VALUES ('10', 'agsd', '24340304', '81C28A422BA54DBD', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:29');
INSERT INTO `sys_user` VALUES ('11', 'hdf', '33033037', '2621F6543E86E833', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:34');
INSERT INTO `sys_user` VALUES ('12', 'agsffddd', '13494862', 'E81DE7C8D1DE783C', '0', null, null, null, '15236265820', '\0', null, '\0', '\0', '0', null, '1', '2018-08-17 16:44:42');
INSERT INTO `sys_user` VALUES ('13', 'a', '58452390', '61059B974D77F833', '0', null, null, null, '15236265820', '\0', null, '\0', '', '0', null, '1', '2018-08-28 11:16:57');
