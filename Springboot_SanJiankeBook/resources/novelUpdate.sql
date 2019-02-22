/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : novel

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2019-02-19 22:24:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adid` int(11) NOT NULL auto_increment,
  `adnumber` varchar(30) default NULL,
  `adpassword` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`adid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'a', 'a', null, null, null);

-- ----------------------------
-- Table structure for `author`
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `aid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `aname` varchar(30) default NULL,
  `pan_name` varchar(30) default NULL,
  `aage` int(11) default NULL,
  `agrade` varchar(20) default NULL,
  `acard` varchar(30) default NULL,
  `atel` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `author_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', '1', '真实姓名', '笔名测试', '22', null, '430421199609294171', null, null, null, null);

-- ----------------------------
-- Table structure for `novel`
-- ----------------------------
DROP TABLE IF EXISTS `novel`;
CREATE TABLE `novel` (
  `nid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `nname` varchar(30) default NULL,
  `npicture` varchar(100) default NULL,
  `ndescription` varchar(500) default NULL,
  `nstatus` varchar(15) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`nid`),
  KEY `tid` (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `novel_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `novel_type` (`tid`),
  CONSTRAINT `novel_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `author` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel
-- ----------------------------
INSERT INTO `novel` VALUES ('1', '1', '1', 'javaä»å¥é¨å°æ¾å¼', 'http://localhost:8080/uploadPdfs\\2019\\2\\18\\540349e70c65457194dc7f56f9db4e3e.jpg', 'è¿æ¯ä¸æ¬ç¸å½å®ç¾çä¹¦ç±', '更新', '通过', null, null);
INSERT INTO `novel` VALUES ('2', '1', '1', '坑逼的ejava', 'http://localhost:8080/uploadPdfs\\2019\\2\\18\\d943c8ca53334e85b38df372c6e7cfee.jpg', 'java是一本很好的数据集', '更新', '通过', null, null);

-- ----------------------------
-- Table structure for `novel_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `novel_chapter`;
CREATE TABLE `novel_chapter` (
  `cid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `cname` varchar(100) default NULL,
  `caddress` varchar(300) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `nid` (`nid`),
  CONSTRAINT `novel_chapter_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_chapter
-- ----------------------------
INSERT INTO `novel_chapter` VALUES ('1', '2', '机器识别测试', 'http://localhost:8080/Novel\\2019\\2\\18\\8db7fc5e0763492db80ebbc9684ad85b.html', '通过', '1', '[]');
INSERT INTO `novel_chapter` VALUES ('2', '2', '机器识别测试2', 'http://localhost:8080/Novel\\2019\\2\\18\\70c7079cd8674947967cfa30cb9edbd7.html', '通过', '2', '[饲养基地, 红客联盟]');
INSERT INTO `novel_chapter` VALUES ('3', '2', '机器识别测试3', 'http://localhost:8080/Novel\\2019\\2\\18\\0348f504e55f4c3788773e209e4d087b.html', '通过', '3', '[饲养基地, 红客联盟]');
INSERT INTO `novel_chapter` VALUES ('4', '2', '机器识别测试4', 'http://localhost:8080/Novel\\2019\\2\\18\\150ab877c86641e291d093592e213284.html', '通过', '4', '[饲养基地, 红客联盟, 总共出现2次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('5', '2', '机器识别测试5', 'http://localhost:8080/Novel\\2019\\2\\18\\0a1bc2241bee48e787ebf6df4306c114.html', '通过', '5', null);
INSERT INTO `novel_chapter` VALUES ('6', '2', '机器识别测试5', 'http://localhost:8080/Novel\\2019\\2\\18\\877cf5ec512b4ad9a8855df7e43d0f64.html', '通过', '6', null);
INSERT INTO `novel_chapter` VALUES ('7', '2', '机器识别7', 'http://localhost:8080/Novel\\2019\\2\\18\\cb57d0d013e240fb91184195461b5cac.html', '通过', '7', '[饲养基地, 红客联盟, 总共出现2次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('8', '2', '机器识别8', 'http://localhost:8080/Novel\\2019\\2\\18\\72f16d2ab4804e4ca190d7da5b71f27e.html', '通过', '8', null);
INSERT INTO `novel_chapter` VALUES ('9', '2', '机器识别9', 'http://localhost:8080/Novel\\2019\\2\\18\\46a5c69ac2444d5585d51f02d2f19922.html', '通过', '9', '[饲养基地, 红客联盟, 总共出现2次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('10', '2', '机器识别10', 'http://localhost:8080/Novel\\2019\\2\\18\\53bebdf4648c47edb0c3d91258f20b4c.html', '通过', '1', '[饲养基地, 红客联盟, 总共出现2次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('11', '2', '机器识别11', 'http://localhost:8080/Novel\\2019\\2\\18\\504cb1fc4a5e4e129a5f04ba734168a6.html', '待审核', '1', '[总共出现0次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('12', '2', '机器识别12', 'http://localhost:8080/Novel\\2019\\2\\18\\b938932e063446f18ff70dd1d1a86a88.html', '待审核', '1', '[饲养基地, 红客联盟, 总共出现10次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('13', '2', '敏感词测试20190219', 'http://localhost:8080/Novel\\2019\\2\\19\\dd50a2200e6641c6935d0a4c64a111b7.html', '待审核', '1', '[总共出现0次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('14', '2', '敏感词测试20190220', 'http://localhost:8080/Novel\\2019\\2\\19\\506c1061656f4bc3b9fe3b3ddb10e356.html', '待审核', '1', '[总共出现0次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('15', '2', '敏感词测试20190220', 'http://localhost:8080/Novel\\2019\\2\\19\\ae09e2d0fa464c608d159dacd6699f4c.html', '待审核', '1', '[总共出现0次敏感词汇]');
INSERT INTO `novel_chapter` VALUES ('16', '2', '敏感词测试20190220', 'http://localhost:8080/Novel\\2019\\2\\19\\5fce78d8485f4a70b27565b3a1e79eba.html', '待审核', '1', '[总共出现6次敏感词汇, 饲养基地, 杀手, 毛泽东, 三级片, 确实]');
INSERT INTO `novel_chapter` VALUES ('17', '2', '敏感词测试201902211111', 'http://localhost:8080/Novel\\2019\\2\\19\\c895385b7aeb4371b57c49897c1e72c6.html', '待审核', '1', '[总共出现0次敏感词汇]');

-- ----------------------------
-- Table structure for `novel_type`
-- ----------------------------
DROP TABLE IF EXISTS `novel_type`;
CREATE TABLE `novel_type` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(15) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of novel_type
-- ----------------------------
INSERT INTO `novel_type` VALUES ('1', 'java', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('2', 'c++', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('3', 'c', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('4', 'c#', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('5', 'web', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('6', 'PHP', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('7', ' Python ', '1', '1', '1');
INSERT INTO `novel_type` VALUES ('8', '其他', '1', '1', '1');

-- ----------------------------
-- Table structure for `sensitive_word`
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensitive_word
-- ----------------------------
INSERT INTO `sensitive_word` VALUES ('1', '毛泽东同学');
INSERT INTO `sensitive_word` VALUES ('2', '三级片');
INSERT INTO `sensitive_word` VALUES ('3', '杀手');
INSERT INTO `sensitive_word` VALUES ('4', '饲养基地');
INSERT INTO `sensitive_word` VALUES ('5', '确实');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(30) default NULL,
  `u_number` varchar(30) default NULL,
  `upassword` varchar(30) default NULL,
  `usex` varchar(10) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '用户名测试', 'a', 'a', '男', null, null, null);

-- ----------------------------
-- Table structure for `user_book`
-- ----------------------------
DROP TABLE IF EXISTS `user_book`;
CREATE TABLE `user_book` (
  `ubid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ubdate` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` int(11) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`ubid`),
  KEY `uid` (`uid`),
  KEY `nid` (`nid`),
  CONSTRAINT `user_book_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `user_book_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_book
-- ----------------------------

-- ----------------------------
-- Table structure for `user_talk`
-- ----------------------------
DROP TABLE IF EXISTS `user_talk`;
CREATE TABLE `user_talk` (
  `utid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `utdate` varchar(30) default NULL,
  `utcontent` varchar(500) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`utid`),
  KEY `uid` (`uid`),
  KEY `nid` (`nid`),
  CONSTRAINT `user_talk_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `user_talk_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_talk
-- ----------------------------
