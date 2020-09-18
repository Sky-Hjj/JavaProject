/*
Navicat MySQL Data Transfer

Source Server         : Sky
Source Server Version : 50508
Source Host           : localhost:3306
Source Database       : cec

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2018-12-20 09:30:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cec_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cec_admin`;
CREATE TABLE `cec_admin` (
  `admin_id` varchar(20) NOT NULL DEFAULT '0',
  `admin_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cec_admin
-- ----------------------------
INSERT INTO `cec_admin` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for `cec_announcement`
-- ----------------------------
DROP TABLE IF EXISTS `cec_announcement`;
CREATE TABLE `cec_announcement` (
  `announcement_id` int(20) NOT NULL AUTO_INCREMENT,
  `announcement_title` varchar(100) DEFAULT NULL,
  `announcement_content` varchar(10000) DEFAULT NULL,
  `announcement_time` datetime DEFAULT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cec_announcement
-- ----------------------------
INSERT INTO `cec_announcement` VALUES ('5', '大佬大佬', '你是大佬', '2018-12-04 11:22:20');

-- ----------------------------
-- Table structure for `cec_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cec_comment`;
CREATE TABLE `cec_comment` (
  `comment_id` int(20) NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `posts_id` int(20) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_fk_posts_id` (`posts_id`) USING BTREE,
  KEY `comment_fk_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `comment_fk_posts_id` FOREIGN KEY (`posts_id`) REFERENCES `cec_posts` (`posts_id`),
  CONSTRAINT `comment_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `cec_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cec_comment
-- ----------------------------
INSERT INTO `cec_comment` VALUES ('1', '你好', '2018-12-09 16:35:24', '1006', '1001');
INSERT INTO `cec_comment` VALUES ('2', '欢迎您', '2018-12-09 17:11:11', '1006', '1001');
INSERT INTO `cec_comment` VALUES ('5', '我是这曾海祥', '2018-12-10 10:10:38', '1006', '1001');

-- ----------------------------
-- Table structure for `cec_posts`
-- ----------------------------
DROP TABLE IF EXISTS `cec_posts`;
CREATE TABLE `cec_posts` (
  `posts_id` int(20) NOT NULL AUTO_INCREMENT,
  `posts_title` varchar(100) DEFAULT NULL,
  `posts_content` varchar(10000) DEFAULT NULL,
  `posts_time` datetime DEFAULT NULL,
  `posts_status` int(6) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`posts_id`),
  KEY `posts_user_id` (`user_id`),
  CONSTRAINT `posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `cec_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cec_posts
-- ----------------------------
INSERT INTO `cec_posts` VALUES ('1005', 'sky', 'hello！sky！', '2018-12-09 16:08:54', '1', '1001');
INSERT INTO `cec_posts` VALUES ('1006', '我是sky', '大家好，我是sky', '2018-12-09 16:11:58', '1', '1001');
INSERT INTO `cec_posts` VALUES ('1007', '曾海祥', '我是曾海祥', '2018-12-10 10:15:38', '1', '1001');

-- ----------------------------
-- Table structure for `cec_user`
-- ----------------------------
DROP TABLE IF EXISTS `cec_user`;
CREATE TABLE `cec_user` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_password` varchar(20) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_head` varchar(200) DEFAULT NULL,
  `user_sex` varchar(6) DEFAULT NULL,
  `user_age` int(6) DEFAULT NULL,
  `user_idcard` varchar(20) DEFAULT NULL,
  `user_phone` varchar(30) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_status` int(6) DEFAULT NULL,
  `user_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95435863 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cec_user
-- ----------------------------
INSERT INTO `cec_user` VALUES ('1001', '1001', 'Sky', '1001.jpg', '0', '20', '430421199802018888', '18273430783', '2223813478@qq.com', '湖南科技职院', '1', '2018-12-02 19:42:19');
