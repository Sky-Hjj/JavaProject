/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : skybooks
Target Host     : localhost:3306
Target Database : skybooks
Date: 2020-09-18 10:04:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` varchar(11) NOT NULL,
  `adminpsw` varchar(18) NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bid` varchar(50) NOT NULL,
  `bname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` double(10,2) NOT NULL,
  `image` varchar(50) NOT NULL,
  `bdate` date NOT NULL,
  `is_hot` int(11) NOT NULL,
  `bdesc` varchar(200) NOT NULL,
  `del` tinyint(1) NOT NULL,
  `cid` char(32) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `books_001` (`cid`),
  CONSTRAINT `books_001` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1001', '看见', '柴静', '39.80', 'KJ.jpg', '2018-08-22', '1', '央视知名记者、主持人柴静，首度出书讲述十年央视生涯　　个人成长的告白书，中国社会十年变迁的备忘录', '0', '1');
INSERT INTO `books` VALUES ('1002', '你是人间四月天', '林徽因', '28.00', 'NSRJSYT.jpg', '2018-08-22', '1', '林徽因诗歌、散文、小说代表作完整收录。用灵魂书写爱与希望，见证绚丽的生命传奇。', '0', '1');
INSERT INTO `books` VALUES ('1003', '摆渡人', '克莱儿·麦克福尔', '36.00', 'BDR.jpg', '2018-08-22', '0', '畅销欧美33个国家，荣获多项图书大奖。如果命运是一条孤独的河流，谁会是你灵魂的摆渡人？如果我真的存在', '0', '1');
INSERT INTO `books` VALUES ('1004', '百年孤独', '加西亚·马尔克斯', '55.00', 'BNGU.jpg', '2017-07-11', '1', '50周年纪念版！全新典藏内封，限量赠50周年精美魔幻明信片1套。马尔克斯代表作，全球惟一正式授权中文', '0', '1');
INSERT INTO `books` VALUES ('1005', '白说', '白岩松', '39.80', 'BS.jpg', '2018-08-06', '1', '年岁渐长，已有权保持沉默，更何况，众生喧哗的时代，我用嘴活着，也活在别人嘴里。\r\n\r\n今天为你点赞，', '0', '1');
INSERT INTO `books` VALUES ('1006', '岛上书店', '加·泽文', '35.00', 'DSSD.jpg', '2018-07-30', '1', '现象级全球畅销书！一年之内畅销美英德法日等30国！感动全球千万读者的阳光治愈小说！美国独立书商推荐阅', '0', '1');
INSERT INTO `books` VALUES ('1007', '浮生六记', '沈复', '45.00', 'FSLJ.jpg', '2018-01-16', '0', '2017当当云阅读文学榜首！靠口碑半年狂卖40册！纠正其他版本160处误讹，新增1306条注释，当当', '0', '2');
INSERT INTO `books` VALUES ('1008', '给孩子的诗', '北岛', '30.00', 'GHZDS.jpg', '2015-01-02', '1', '《给孩子的诗》是著名诗人北岛**的心血之作。北岛亲自甄别、挑选57位不同国别的诗人、101首不同风格', '0', '1');
INSERT INTO `books` VALUES ('1009', '红玫瑰与白玫瑰', '张爱玲', '28.00', 'HMGYBMG.jpg', '2010-06-22', '1', '《红玫瑰与白玫瑰》中男主角是我母亲的朋友，事情是他自己讲给母亲和姑姑听的，那时我还小，他以为我不懂，', '0', '1');
INSERT INTO `books` VALUES ('1010', '活着', '余华', '28.00', 'HZ.jpg', '2018-08-09', '1', '中国作家之一，他的作品成了当代中国的典范。世界华文“冰心文学奖”，入选香港《亚洲周刊》评选的“20世', '0', '1');
INSERT INTO `books` VALUES ('1011', '解忧杂货店', '东野圭吾', '39.50', 'JYZHD.jpg', '2018-08-08', '1', '人与人真诚相对时产生的小小奇迹，不是推理小说，却更扣人心弦，中国影响力图书年度读者推荐大奖，800万', '0', '1');
INSERT INTO `books` VALUES ('1012', '偶遇', '陈鲁豫', '39.00', 'OY.jpg', '2018-09-11', '1', '鲁豫时隔十五年全新作品集，回答当下年轻人普遍关注、普遍困惑的人生问题！', '0', '2');
INSERT INTO `books` VALUES ('1013', '倾城之恋', '张爱玲', '29.80', 'QCZL.jpg', '2018-08-22', '1', '张爱玲是当代重要的作家，也是五四以来优秀的作家。别的作家……在文字上，在意象的运用上，在人生观察和透', '0', '1');
INSERT INTO `books` VALUES ('1014', '人性的弱点', '戴尔·卡耐基', '32.00', 'RXDRD.jpg', '2018-08-07', '1', '（译自美国西蒙与舒斯特出版公司1937年初版，还原卡耐基38篇原始手稿，当当五星畅销书，销量仅次于《', '0', '3');
INSERT INTO `books` VALUES ('243736014A7E4E3EB05CBC9503148899', 'Sky', 'Hjj', '888.00', 'FFB98B45DA06463788A86CAAEB809636_1438585041336.jpg', '2020-03-27', '1', '儁傑Sky', '0', '1');
INSERT INTO `books` VALUES ('4F2A4C6379284D21BAC047BB05EEC28E', '222', '222', '222.00', '2A9A1599F69F441B964544312410C655_KJ.jpg', '2018-09-04', '0', '222', '1', '3');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '文学');
INSERT INTO `category` VALUES ('2', '文艺');
INSERT INTO `category` VALUES ('3', '诗歌');
INSERT INTO `category` VALUES ('4', '小说');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `iid` char(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `oid` (`oid`),
  KEY `bid` (`bid`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('4582277B954E4892880DEA17CFAA56C2', '1', '29.80', '6749A3B9618E484A9EF0B05401DE1853', '1013');
INSERT INTO `orderitem` VALUES ('46746F41182C48A2BE7AA7C6B76A136B', '1', '28.00', 'CBE22C3025A847168CC8A0872B98A95A', '1009');
INSERT INTO `orderitem` VALUES ('59DF7BD0E6F94CED8445459FD0ACF5BF', '1', '30.00', '38067E061CAB4D2BB5BEA8ECDB05A5AA', '1008');
INSERT INTO `orderitem` VALUES ('7D1E69622D9148A0BE6CDD581637C3A1', '1', '28.00', 'FF94A2845B1E4F678ECDAEA7503A3131', '1009');
INSERT INTO `orderitem` VALUES ('90FA105F7C454B56A1FD11DB3C0AA7C4', '1', '39.80', '0B735C214D274FFCA1DD7D04C9C94C9E', '1001');
INSERT INTO `orderitem` VALUES ('9B8C642B1A8242CBB281E53265792335', '1', '29.80', '306B7CFC0CE8451191B0887E856F99F0', '1013');
INSERT INTO `orderitem` VALUES ('9E88DEE9AEF44E54A8DFE3E1875AEC8C', '1', '28.00', '1D59C10E17974EBE93709DCC00D83582', '1010');
INSERT INTO `orderitem` VALUES ('B8E7609C263A412B873907A2997612C7', '1', '30.00', 'CBE22C3025A847168CC8A0872B98A95A', '1008');
INSERT INTO `orderitem` VALUES ('C2580B33BB3543B5A0A825C8FFB9C4E3', '1', '39.80', '306B7CFC0CE8451191B0887E856F99F0', '1001');
INSERT INTO `orderitem` VALUES ('D2B1428EFEC444F5BB4C7BE70DD71F75', '1', '30.00', '8A9AC764086D48C095DCF3794DC2C327', '1008');
INSERT INTO `orderitem` VALUES ('EC9496F0A1F14DC6BD129B0479E9C951', '1', '28.00', '6D41ACE96CEA4EE68821C99D60B0FDF2', '1002');
INSERT INTO `orderitem` VALUES ('FCB6559BA8744629919D5CF49A472417', '1', '30.00', '4AA8457BB7FC491DBD165650B4D7A9E7', '1008');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` char(32) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `state` smallint(1) DEFAULT NULL,
  `uid` char(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `uid` (`uid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0B735C214D274FFCA1DD7D04C9C94C9E', '2018-08-29 08:59:23', '39.80', '4', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('1D59C10E17974EBE93709DCC00D83582', '2018-08-29 09:02:13', '28.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('306B7CFC0CE8451191B0887E856F99F0', '2018-08-29 18:02:46', '69.60', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('38067E061CAB4D2BB5BEA8ECDB05A5AA', '2018-09-13 14:43:28', '30.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('4AA8457BB7FC491DBD165650B4D7A9E7', '2018-09-10 16:16:57', '30.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('6749A3B9618E484A9EF0B05401DE1853', '2018-08-29 09:03:08', '29.80', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('6D41ACE96CEA4EE68821C99D60B0FDF2', '2020-04-17 14:39:54', '28.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('8A9AC764086D48C095DCF3794DC2C327', '2018-09-10 16:19:46', '30.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('CBE22C3025A847168CC8A0872B98A95A', '2018-09-10 16:17:38', '58.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);
INSERT INTO `orders` VALUES ('FF94A2845B1E4F678ECDAEA7503A3131', '2018-09-10 16:13:37', '28.00', '1', '489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('02989e39-a870-4008-93cf-76d817b3fd83', '123', '123123', '123', '2223813478@qq.com', '13017165448', '2018-08-21', 'female', '0', 'f2351f97-0813-4d42-a54f-07f9493f227e');
INSERT INTO `user` VALUES ('489cb4a6-b0c9-44d3-a21e-435e5d7d7d9f', 'sky', 'skysky', 'sky', 'hejunjiesky@126.com', '18273430783', '1998-02-01', 'male', '1', '8708d618-6d70-474f-9e90-8cf28f7ee218');
INSERT INTO `user` VALUES ('acf82a91-5059-4b5e-82f9-e7541b7d2ac4', '1', '123456', '1111', '1281422515@qq.com', '11111111111', '2018-09-06', 'male', '1', '4e59771b-c772-4dbd-af3a-d37b35c81667');
