/*
Navicat MySQL Data Transfer

Source Server         : pi
Source Server Version : 50505
Source Host           : cysoft.uicp.net:3306
Source Database       : ace

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-04-15 17:43:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_asset`
-- ----------------------------
DROP TABLE IF EXISTS `sys_asset`;
CREATE TABLE `sys_asset` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` longblob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_asset
-- ----------------------------
INSERT INTO `sys_asset` VALUES ('52', 0x89504E470D0A1A0A0000000D4948445200000030000000300802000000D8606ED0000000097048597300000EC400000EC401952B0E1B00000BD74944415478DAAD595B6C5CD775DDFB9C73EF9D7BE74D0E1FC3212592222DD97AD096253FEB384EED24EE470DB840919FA0707F5AF4E1F42F70D1FF02FD2BD2162D2224488AC6AD03A43512A74DD1208DEA38A991268D65CB926549D4D37C0F399CE19D7B1E7BF7E3CE90A317352A743120889933E7ACB3F75A7BAF73064F7FFC3F70B7E76727DFF9DA57BE1A45D9308A008089D2F79DB5CCC40002050020220A818800E09C23675148CFF3ACB5009CCDE7FEE8B52F196D961696E68E3D7CA7B57077404CFCAD13DFFCCF1FFC686070305D090088C8590B00522921C42E5F2722E7AC521E303373754F2D1306BFF5C5DF0EA3285FC8DFF62BBB4DC7CC5FFBEBAFBEFDC3FF2A97CBDB6F3A6B99D9F37DCFF76F42C344E49CB3E963884808E1793E11A11080B870F593CD46F3C24717EE840600D42E80BEF7ED37DF3DF9B37CA1B09D082292EA8E5F4121B0373CCE59638494524A604ED1C7CDAD62A9B8CBA2778CD0B9331FFDCBEBDF29140AA28B0600764FD0CD534BA93CAFC339C434E4EDB8FDF5AF9CF8E15BFF7E6F80AC3127FEF2EF06060701715710CC44CE5A67AD738E8898F9E60584C0EE0C694A95E77FF78D377FFECEBBF700E8A73FFEC9E6FA260048296F2596354627894E12A38D234221A45252CADE58DECA6E261242A45B0882CCEB27FEDE68DD172022FAD77F7EAB582ADD141BE79CD13AA5851F047E1078BEAF6E111A33A7D1EA9D909C2366446466678DF2FDFAEADAD90FCEF405E8FA956BAB2B6B4CB4BDDD342A88D82B2E66EE68CA186BF4F65F264AA3C5CC448E99B5D628C476F5626681E8FBC1D9D367FB52D9FBBF3C95CBE57B770C00293D6FD01422DE92D06DF40C2C85145222F0BEF1F12B8B4B94D20B111818400AB1B6BCD25784AECC5F523DDA46C43B31A33729D6E8A4DD4EDA6D6BB4540A51244972FCD0437FF1DA973FFFDCB33BB30160570EFDD6A1782B4E1963ADF13C3F0D3E13313333317762D611143320A010522A4FC8388EDB713C3339F9EC138F7FFE339FCEE77200F0F1C579EBAC404C6B153003B37394CDE7FA021486A1B336656B1CC7D6182242443F0894524AC954C6E49CB1561B93B4DBCEDAB16AF5C1D999A3478E3CFEE8D1523E8FC04CC40008303DB977ABD9CC170A69ED6622223246D7266A7D01DA333D79EA17A704A290324ABB29F3E1D999A3870E9EBB7071796D6DB3D99442140A85815269CF9E89E9A9E999997D51944526768E9D6372D0538F462A9528130829AD31C2F7D356A8B5DE3335D917A0FD070F7CFB1BAF876148CE092989C818F3D94F3DF3E8DC91CF3DF7E974D388020482104248484B1F11330133A7587A00799EB77F7AFAECA5CB6955232697247E1054C7AB7D917A6CA21664026676CE323300A3730F1F3AD8652503000373CA262620EA44651B53171676711D39F8507BAB25A4202260363AD9B36F2A13867D45C80FFCE907F65D9BBFC6CC44C44C136363BFFAF08C23EA6E1C33815FCC172A8383D96CC4C8D811330373ABD95A5E5DDDD8DC4CB4DE1E0F8871DCCE1688899938DEDA7AF8F823F7D0EDE78E1FFDF8C373994CE8AC25724F3CFAC87065F0C373E72F5EB9726D717165AD1EB7DBDA985C36FAB32FFDF144B5CA5D2D5FB87CE5CFFFEA6FB6E2D8F7BC3093191A28D74647A7F64C1C9B9B3B21FEC1688D88D69AB8DD3EFEF4E3FD026263E7862B6F2409FB012324717B6672727C74747C749489C85A93B49BAD56632B8EAD1D1DAC0031608737132323AFFECE17B39ECA67B3F95C56F981F0BCB463CC4E4D5D5D5C94523A6B47070686740244704BE7BE0D207BF6DCDE4CEED0830F7E343F8F4268AD872B9553A74FFFF77BA7CAC542B2B192512A9309F3B9E2237373129999B6292C10AAA5FCFB1F9E595F5FB5D638A130935B5E597EE985178ECD1D997FEBFB00A0B57EF9A5DFCC6D6CB52ECC7B33D37727B520226B5F78EA499D24642D39571D1999DDB7EFB1E75F7CF90FFE64A375F1CD9FBE6DB366EAC597979B2D672D036CBF9CD1CB9A1F7CE90BABF1A5EFFCE46450A2977EFFD55FFBEC6F8C8C8C7CE69967DAEDC459D76E27BFFEC4E3C880C6F4D7ED73592F9B7DEAD8D1523E4744830365294526080E0D159B4B8B0F1C3E3E5172E5C1910068A450105261A7BB20020AA9C6078A8A69E6E0B1E90A164A837A65E170754849B9A736B66F722F00EF9FDA5B1D1D91410085425F8054AD6A74922D149F7FF42800CC4E4F758632ABE5EBFB278FFDEE2B7F5A2B4F89F9B39928924A01025B8B882850FA7EE47BE6ECAF26861E78E595D7666B87338D3A767BE2E79EFD9473EED8EC3E2F136A767274B82F526310B4140C38FBD8C8C0BF2979607A27CD61148D87614A60140251A45DCD5923FC2015B9CC842363B5D4B662DADEBBCF0B4F3FF9CD7FFCA763C365AB753BF4D5EDCC82FCC3577FEF364213E86FB46C632308C303070ED4C6C7773E4AB393A2414421C8187224339934750C8088291ABEC92718BB7FA83C988D6426A36BC3788BA5B9631D92E572FDDA99F1C79E7ABE58CED72698B7674E3B0720E03632DB8EBD30EABA3682B4A7323032706A07B06B256D6DA03CF4D0E16BD72ECA68E25E4E1D883439D1AAAF8685824464677B0D0D20020202220A00349B0D1565514A100251208AF4E34EB670E754C4CC99626963E1BA989DBEE76390C8E736F5567678546F36C8BA9B0C1677FE45B3D90000E17920647A1A4C87F0CD860CD839BDD9C894069A603008EE191000D862DE5963DA3193EB2518F450B5B5F489D3896BC788E8B46EAFD7BB08106E6CFAE46CB2D9703A81A1C15D16DDEDE4AAC6AA8B972E7B2661EAB59BD8358A08002ACCB616AFAF9D3D8D42EA66231AAE069DEAD26DAB5D4CEC485BDDF259552AFF4F4080A826F752A3C5CEED44279551C78250BE361E0D8FA2406666E7A41FA49DA40B843B326026675D3654E3B5DDEDB9BAEB89D8FA8A9C65E750CA941C987A6A64642062A154AA4196AA639280B1EBBDD3DC92734E6B978BEE7A14BFFB595DD6AA5BAB2B4E27702335D85A266267C9592247E4D839B6868C69AFAD3A637A14064E27ADD56555ADDE75B9BB4748E4F32D7B3197242A137673054054BF708E99102508D1653DA24064F0A228C8E5791B3D914B922DC93213DC074000E0C6C7B696576410A830EA10157160DF0390D61B66B3B5C5CC42499509538BCB3DE1B171DC5C5E84BD137DDD99F433480D55D66D5B379B642DF48827F5AC00E08C76492CA44C09D48B868CD1CDCD8607B258B86F8000401E3CB0B278556F36B615873BB0202896320315541EF7964200722ED96C2C2F5FF7F6CFF67BABD4E73894120E1D58BA3ADF5EAF6FC7691B56EF6BA7125AD3AEAF2D5DBF2C8E1C84BE6FBAB09F5BD81D32B5133873BEE86772A35595C9A09077B82A251BC7CDC5EB0D6B68664A4541FF4B28B89707C18BE61E59F8F9BBF9F73EC99406A2A1613F9B4329113BAD9E9DD3ADD6D6CA52BCB6BA1104A34F3E5DAE54AF2E5C109EB8FF804CAC67A60E2D2D5C96F942E879CEE8FAF98F985848D9C908119143442F8CA272B9150452798562B9EAF65E5F99974ADE4F40BA9D4C8CCD44D95C2613F9A5524445D36CFAD99B6E773BFD4B28E9E5F2BEC04C1821E2C0E050B3D568EAF5BB5EEBF405889949536D78BA5CAE0040BE38B0E05DF6A35C581E745A93D1E42C74EE3A119592BE2F3DDF31BB5623CA76A43E3E3E75FEFC0716CD7D001479F989A9692995B356EB24CAE6CA43231BABAB03612494927770368D38CE15CB6194D5492CA452CA9B9A3A70E5EA85B66D01DEBBEC1DD1627DE347BF3CF3B7DF3BD98CB5942AFD21C1F3BCFAEA72A532DA64020077BB8355EA55B6D815CB03F5D56547A49407004A79A5C260BDD14CB4B9F5F6F8F6116AC5C92FCECD7F7069E1DC27AB0BEB9B441C46D18BCB6B870E74477B7EA1585E5ABCEAE5F2AD76E2590310DC587D80AC05A59CEFC75BCDE1D13D6198DD9185D15FFEFA7793242E67C35AA53431547A68B2B67FA21AF8DE0D8098F9BDF3577EFCFEF90F2E2F9290C4C0CC41265C5B5BCD84E1C585C51B76E0F995A131A32FAE3636AA289CD6D20F6EF8B9C39A86B341213F58A98651F6069D6A6D855CD968CA3017AF6D5DACB7FFE3D43C5B3339547CE6C8ECD347F67B52AAF3D796DE78FB7FAFACB58C730E04D04E300B85E27ABDBE585FBFE5BE265319AE2549B2515FCF1BD30BC8B49AA8648C30582CE70AA55B33525F5B2B95CB0060AC33E0404815FACB1ABF75F2BD6FFCE09D2F3CF7D8FF01BD52817F25DF117F0000000049454E44AE426082);

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `ParentID` int(11) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Sort` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '行政部', '0', '1', '1');
INSERT INTO `sys_dept` VALUES ('2', '市场部', '0', '2', '2');
INSERT INTO `sys_dept` VALUES ('3', '财务部', '0', '3', '3');
INSERT INTO `sys_dept` VALUES ('4', '技术部', '0', '4', '4');
INSERT INTO `sys_dept` VALUES ('5', '采购部', '0', '5', '5');
INSERT INTO `sys_dept` VALUES ('6', '生产部', '0', '6', '6');
INSERT INTO `sys_dept` VALUES ('7', '人事部', '0', '7', '7');
INSERT INTO `sys_dept` VALUES ('8', '营销部', '0', '8', '8');
INSERT INTO `sys_dept` VALUES ('9', '研发部', '4', '9', '0');
INSERT INTO `sys_dept` VALUES ('10', '测试部', '4', '10', '0');

-- ----------------------------
-- Table structure for `sys_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_error_log`;
CREATE TABLE `sys_error_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` longtext,
  `Parameters` longtext,
  `ControllerName` longtext,
  `ActionName` longtext,
  `HttpType` longtext,
  `Message` longtext,
  `SystemName` longtext,
  `ErrorSource` longtext,
  `ErrorStack` longtext,
  `UserID` int(11) NOT NULL,
  `LoginName` longtext,
  `IPAddress` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_error_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_info_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_info_log`;
CREATE TABLE `sys_info_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SystemName` varchar(512) DEFAULT NULL,
  `URL` longtext,
  `Parameters` longtext,
  `ControllerName` varchar(64) NOT NULL,
  `ActionName` varchar(128) NOT NULL,
  `HttpType` varchar(4) DEFAULT NULL,
  `HttpStatusCode` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `LoginName` varchar(16) DEFAULT NULL,
  `IPAddress` varchar(16) DEFAULT NULL,
  `OperateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_info_log
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `ParentID` int(11) NOT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `Sort` int(11) NOT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '基础信息', '0', '', '0', 'cogs');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '1', 'SystemManage/SysUser', '2', null);
INSERT INTO `sys_menu` VALUES ('3', '角色管理', '1', 'SystemManage/SysRole', '3', null);
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', 'SystemManage/SysMenu', '4', null);
INSERT INTO `sys_menu` VALUES ('5', '权限管理', '1', null, '5', null);
INSERT INTO `sys_menu` VALUES ('6', '日志信息', '0', null, '0', 'pencil-square-o');
INSERT INTO `sys_menu` VALUES ('7', '操作日志', '6', 'SystemManage/SysInfoLog', '0', null);
INSERT INTO `sys_menu` VALUES ('8', '错误日志', '6', 'SystemManage/SysErrorLog', '0', null);
INSERT INTO `sys_menu` VALUES ('9', '部门管理', '1', 'SystemManage/SysDept', '1', null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理', 'test');
INSERT INTO `sys_role` VALUES ('2', '人事管理', null);
INSERT INTO `sys_role` VALUES ('6', '行政管理', '行政管理角色');
INSERT INTO `sys_role` VALUES ('7', '财务管理', null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `RoleID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');

-- ----------------------------
-- Table structure for `sys_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '1');
INSERT INTO `sys_role_user` VALUES ('2', '1');
INSERT INTO `sys_role_user` VALUES ('7', '7');
INSERT INTO `sys_role_user` VALUES ('8', '7');
INSERT INTO `sys_role_user` VALUES ('10', '7');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DeptID` int(11) NOT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Birth` datetime DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Photo` int(11) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '管理员', '9', '男', null, '1', '1002', '52', '测试备注');
INSERT INTO `sys_user` VALUES ('2', 'cgx', '', '陈国祥', '6', null, null, '1', '2', null, null);
INSERT INTO `sys_user` VALUES ('3', 'cyh', 'c4ca4238a0b923820dcc509a6f75849b', '陈艳华', '1', null, null, '1', '3', null, null);
INSERT INTO `sys_user` VALUES ('4', 'dhy', 'c4ca4238a0b923820dcc509a6f75849b', '邓海燕', '2', null, null, '1', '4', null, null);
INSERT INTO `sys_user` VALUES ('5', 'jhy', 'c4ca4238a0b923820dcc509a6f75849b', '纪海燕', '10', null, null, '3', '5', null, null);
INSERT INTO `sys_user` VALUES ('6', 'mhq', 'c4ca4238a0b923820dcc509a6f75849b', '明汉琴', '10', null, null, '3', '6', null, null);
INSERT INTO `sys_user` VALUES ('7', 'syj', 'e10adc3949ba59abbe56e057f20f883e', '沈亚杰', '3', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('8', 'tll', 'c4ca4238a0b923820dcc509a6f75849b', '汤丽丽', '3', '女', null, '2', '8', null, null);
INSERT INTO `sys_user` VALUES ('9', '', '', '吴凤祥', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('10', '', '', '肖丽丽', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('11', '', '', '徐丽云', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('12', '', '', '张珊珊', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('13', '', '', '郑永军', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('14', '', '', '周荣锋', '0', null, null, '3', '14', null, null);
INSERT INTO `sys_user` VALUES ('15', '', '', '邹丽丽', '0', null, null, '3', '15', null, null);
INSERT INTO `sys_user` VALUES ('16', '', '', '陈翠梅', '0', null, null, '3', '16', null, null);
INSERT INTO `sys_user` VALUES ('17', '', '', '陈晓静', '0', null, null, '3', '17', null, null);
INSERT INTO `sys_user` VALUES ('18', '', '', '邓正同', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('19', '', '', '顾爱华', '0', null, null, '4', '19', null, null);
INSERT INTO `sys_user` VALUES ('20', '', '', '郭荣兰', '0', null, null, '4', '20', null, null);
INSERT INTO `sys_user` VALUES ('21', '', '', '胡泽夫', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('22', '', '', '李海燕', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('23', '', '', '李云', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('24', '', '', '刘梅', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('25', '', '', '刘玮', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('26', '', '', '罗建东', '0', null, null, '4', null, null, null);
INSERT INTO `sys_user` VALUES ('27', '', '', '欧勇华', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('28', '', '', '戚容容', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('29', '', '', '沙海东', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('30', '', '', '施跃', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('31', '', '', '孙永萍', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('32', '', '', '汪渠渠', '0', null, null, '5', null, null, null);
INSERT INTO `sys_user` VALUES ('33', '', '', '王琳琳', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('34', '', '', '王婷婷', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('35', '', '', '吴莉莉', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('36', '', '', '夏燕芬', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('37', '', '', '徐清', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('38', '', '', '徐志海', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('39', '', '', '严晨', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('40', '', '', '杨俊', '0', null, null, '6', null, null, null);
INSERT INTO `sys_user` VALUES ('41', '', '', '尤正岗', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('42', '', '', '张军燕', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('43', '', '', '张雪莲', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('44', '', '', '赵亮', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('45', '', '', '征磊', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('46', '', '', '周鹏', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('47', '', '', '朱骏', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('48', '', '', '朱勇军', '0', null, null, '7', null, null, null);
INSERT INTO `sys_user` VALUES ('49', '', '', '蒯红梅', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('50', '', '', '宋艾清', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('51', '', '', '黄青春', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('52', '', '', '鲍殷隽', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('53', '', '', '蔡晓艳', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('54', '', '', '陈莉', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('55', '', '', '陈小春', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('56', '', '', '成殳璟', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('57', '', '', '杜春香', '0', null, null, '8', null, null, null);
INSERT INTO `sys_user` VALUES ('58', '', '', '葛海静', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('59', '', '', '顾鹏程', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('60', '', '', '江朝琴', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('61', '', '', '李进洋', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('62', '', '', '李育芹', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('63', '', '', '糜金萍', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('64', '', '', '彭燕飞', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('65', '', '', '沈海云', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('66', '', '', '孙琴芳', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('67', '', '', '童立新', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('68', '', '', '王粉兰', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('69', '', '', '王娟', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('70', '', '', '王素霞', '0', null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('71', '', '', '王颖姝', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('72', '', '', '韦红玲', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('73', '', '', '吴昊', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('74', '', '', '徐建平', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('75', '', '', '许黎辉', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('76', '', '', '杨素娟', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('77', '', '', '殷鹏', '0', null, null, '2', null, null, null);
INSERT INTO `sys_user` VALUES ('78', '', '', '袁洁', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('79', '', '', '张雪蕾', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('80', '', '', '周海红', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('81', '', '', '周立萍', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('82', '', '', '周勇', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('83', '', '', '朱兵', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('84', '', '', '朱如兄', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('85', '', '', '朱永慧', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('86', '', '', '乐丽萍', '0', null, null, '3', null, null, null);
INSERT INTO `sys_user` VALUES ('87', '', '', '黄晓华', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('88', '', '', '张园园', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('89', '', '', '陈雯', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('90', '', '', '朱慧蕙', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('91', '', '', '马亚军', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('92', '', '', '时燕杰', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('93', '', '', '吴亚敏', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('94', '', '', '邱艳芬', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('95', '', '', '张海峰', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('96', '', '', '何雪峰', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('97', '', '', '王晓芳', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('98', '', '', '缪崔云', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('99', '', '', '卞宏群', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('100', '', '', '单玉华', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('101', '', '', '杜德红', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('102', '', '', '冯素梅', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('103', '', '', '高士勤', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('104', '', '', '韩坚强', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('105', '', '', '胡新红', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('106', '', '', '季明兰', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('107', '', '', '茅建安', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('108', '', '', '潘国霞', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('109', '', '', '颜洪强', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('110', '', '', '杨素华', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('111', '', '', '阴定坤', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('112', '', '', '袁广伟', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('113', '', '', '赵海燕', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('114', '', '', '周小燕', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('115', '', '', '朱红梅', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('116', '', '', '晏登峰', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('117', '', '', '季冬梅', '0', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('118', '', '', '白玉芬', '0', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `UserID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
